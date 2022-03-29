# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-bbk

CONFIG += sailfishapp

SOURCES += src/harbour-bbk.cpp \
           upstream/src/cli/utils.cpp \
           upstream/src/measurement/defs.cpp \
           upstream/src/framework/logger.cpp \
           upstream/src/framework/socket.cpp \
           upstream/src/framework/engine.cpp \
           upstream/src/framework/task.cpp \
           upstream/src/framework/taskconfig.cpp \
           upstream/src/framework/bridgetask.cpp \
           upstream/src/framework/socketconnection.cpp \
           upstream/src/framework/serversocket.cpp \
           upstream/src/framework/socketreceiver.cpp \
           upstream/src/framework/eventloop.cpp \
           upstream/src/http/httptask.cpp \
           upstream/src/http/httpconnection.cpp \
           upstream/src/http/cookiemanager.cpp \
           upstream/src/http/cookiefile.cpp \
           upstream/src/http/websocketbridge.cpp \
           upstream/src/http/sha1.cpp \
           upstream/src/http/httpclienttask.cpp \
           upstream/src/http/webservertask.cpp \
           upstream/src/http/http_common.cpp \
           upstream/src/http/httpclientconnection.cpp \
           upstream/src/http/httpserverconnection.cpp \
           upstream/src/json11/json11.cpp \
           upstream/src/measurement/measurementtask.cpp \
           upstream/src/measurement/singlerequesttask.cpp \
           upstream/src/measurement/infotask.cpp \
           upstream/src/measurement/latencytask.cpp \
           upstream/src/measurement/rpingtask.cpp \
           upstream/src/measurement/pingsweeptask.cpp \
           upstream/src/measurement/warmuptask.cpp \
           upstream/src/measurement/tickettask.cpp \
           upstream/src/measurement/progresstask.cpp \
           upstream/src/measurement/downloadtask.cpp \
           upstream/src/measurement/uploadtask.cpp \
           upstream/src/measurement/measurementagent.cpp \
           upstream/src/measurement/speedtest.cpp \
           upstream/src/measurement/uploadinfotask.cpp

HEADERS +=upstream/src/cli/utils.h \
          upstream/src/measurement/defs.h \
          upstream/src/framework/logger.h \
          upstream/src/framework/socket.h \
          upstream/src/framework/engine.h \
          upstream/src/framework/task.h \
          upstream/src/framework/taskconfig.h \
          upstream/src/framework/bridgetask.h \
          upstream/src/framework/socketconnection.h \
          upstream/src/framework/serversocket.h \
          upstream/src/framework/eventloop.h \
          upstream/src/http/httptask.h \
          upstream/src/http/httpconnection.h \
          upstream/src/http/cookiemanager.h \
          upstream/src/http/cookiefile.h \
          upstream/src/http/websocketbridge.h \
          upstream/src/http/sha1.h \
          upstream/src/http/httpclienttask.h \
          upstream/src/http/webservertask.h \
          upstream/src/http/http_common.h \
          upstream/src/http/httpclientconnection.h \
          upstream/src/http/httpserverconnection.h \
          upstream/src/json11/json11.hpp \
          upstream/src/measurement/measurementtask.h \
          upstream/src/measurement/singlerequesttask.h \
          upstream/src/measurement/infotask.h \
          upstream/src/measurement/latencytask.h \
          upstream/src/measurement/pingsweeptask.h \
          upstream/src/measurement/rpingtask.h \
          upstream/src/measurement/warmuptask.h \
          upstream/src/measurement/tickettask.h \
          upstream/src/measurement/progresstask.h \
          upstream/src/measurement/downloadtask.h \
          upstream/src/measurement/uploadtask.h \
          upstream/src/measurement/measurementagent.h \
          upstream/src/measurement/speedtest.h \
          upstream/src/measurement/uploadinfotask.h


DISTFILES += qml/harbour-bbk.qml \
    rpm/harbour-bbk.changes.in \
    rpm/harbour-bbk.changes.run.in \
    rpm/harbour-bbk.spec \
    rpm/harbour-bbk.yaml \
    translations/*.ts \
    harbour-bbk.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-bbk-de.ts
