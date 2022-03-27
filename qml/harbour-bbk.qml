import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import Sailfish.WebEngine 1.0

ApplicationWindow {
    initialPage: Component {
        WebViewPage {
            WebView {
                id: webView
                anchors.fill: parent
                url: bbk_url

                Component.onCompleted: {
                    WebEngineSettings.pixelRatio = 3;
                }

            }
            Timer {
                id: timer
                interval: 100; running: true; repeat: true
                onTriggered: {
                    if(webView.loaded)
                    {
                        webView.runJavaScript('var metaTag=document.createElement("meta");' +
                                              'metaTag.name = "viewport";' +
                                              'metaTag.content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0";' +
                                              'document.getElementsByTagName("head")[0].appendChild(metaTag);');
                        timer.stop();
                    }
                }
            }


        }
    }

    allowedOrientations: defaultAllowedOrientations
}
