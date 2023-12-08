import QtQuick 2.15
import QtQuick.Controls
import QtWebEngine
import QtQuick.LocalStorage
import QtPositioning

Rectangle{
    id:mapsborder
    width: parent.width
    height: parent.height
    color:"black"
    radius: 10
    anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left
        right: parent.right
    }
    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
        onClicked: {
            comboboxcontent.visible = false
        }
    }
    ScrollView {
        id: musicscrollview
        width: parent.width
        height: parent.height - 20
        anchors{
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            top: musictopbar.bottom
            margins: 10
        }

        WebEngineView {
            id: webview
            url: "https://teslawaze.azurewebsites.net"
            anchors.fill: parent
            onFeaturePermissionRequested: {
                permBar.securityOrigin = securityOrigin;
                permBar.requestedFeature = feature;
                permBar.visible = true;
            }
        }
//        FeaturePermissionBar {
//            id: permBar
//            view: webEngineView
//            anchors {
//                left: parent.left
//                right: parent.right
//                top: parent.top
//            }
//            z: 3
//        }
        Button{
            width: 100
            anchors.left: parent.left
            anchors.top: permbar.bottom
            onClicked: webview.url = "https://www.google.com/maps"
        }
    }
}
