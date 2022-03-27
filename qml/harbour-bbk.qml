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
            }
        }
    }

    allowedOrientations: defaultAllowedOrientations
}
