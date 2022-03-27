#include <sailfishapp.h>
#include <QDebug>

#include <fstream>
#include <thread>
#include <chrono>

#include "upstream/src/measurement/measurementagent.h"
#include "upstream/src/cli/utils.h"
#include "upstream/src/http/websocketbridge.h"

namespace {

    void runAgent(BridgeTask *bridge, const TaskConfig &cfg) {
        CookieFile cf(cfg.value("config_file"));
        HttpHost webserver(cfg.value("Measure.Webserver"), 80, "", 0, &cf);
        EventLoop loop;
        bridge->setAgent(new MeasurementAgent(cfg, webserver));
        loop.addTask(bridge);
        loop.runUntilComplete();
    }
}


int main(int argc, char *argv[])
{
    TaskConfig agent_cfg, config;
    if (!parseArgs(argc, argv, config, agent_cfg))
        return 1;
    agent_cfg.set("Measure.AutoSaveReport", "true");
    std::ofstream log_file;
    if (config.value("logfile") != "-") {
        log_file.open(config.value("logfile"));
        Logger::setLogFile(log_file);
    }

    config.set("listen_pw", MeasurementAgent::createHashKey(12));
    config.set("listen", "0");
    config.set("listen_addr", "127.0.0.1");
    config.set("browser",  "2");
    agent_cfg.set("config_file", config.value("config_file"));

    WebsocketBridge *bridge = new WebsocketBridge(nullptr, config);
    std::thread agent_thread(runAgent, bridge, agent_cfg);

    // Wait for a few seconds for the agent to start listening on a port
    for (unsigned int i = 0; bridge->url().empty() && i < 400; ++i)
        std::this_thread::sleep_for(std::chrono::milliseconds(1+i/10));

    qDebug() << bridge->url().c_str();

    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    app->setOrganizationName(QStringLiteral("net.attah"));
    app->setApplicationName(QStringLiteral("bbk"));

    QScopedPointer<QQuickView> view(SailfishApp::createView());

    view->setSource(SailfishApp::pathTo(QString("qml/harbour-bbk.qml")));
    view->engine()->rootContext()->setContextProperty("bbk_url", bridge->url().c_str());

    view->show();

    int ret;
    ret =  app->exec();

    bridge->die();
    agent_thread.join();
    return ret;
}
