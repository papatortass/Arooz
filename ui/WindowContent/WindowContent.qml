import QtQuick 2.15
import "Apps/MusicApp"
import "Apps/SettingsApp"
import "Apps/Maps"
import "Apps/DiagnosticsApp"
import "Wallpapers"

Rectangle {
    id: windowcontent
    anchors {
        top: parent.top
        right: parent.right
        bottom: parent.bottom
    }
    width: parent.width * 24/ 25 - 20
    height: parent.height
    color:"transparent"

    property int openApps: 0

    property alias threeappslayout: threeappslayout
    property alias twoappslayout: twoappslayout
    property alias oneapplayout: oneapplayout

    ThreeAppsLayout{
        id:threeappslayout
        visible: false
    }

    TwoAppsLayout{
        id:twoappslayout
        visible: false
    }

    OneAppLayout{
        id:oneapplayout
        visible: false
    }

    property alias settingsapp: settingsapp

    SettingsApp {
        id:settingsapp
        visible: false
        property int spaceRequirement: 1

        property real initialY: windowcontent.height
        property real finalY: windowcontent.height - settingsapp.height

        NumberAnimation {
            id: slideAnimation
            target: settingsapp
            property: "y"
            duration: 300
            easing.type: Easing.InOutQuad
        }

        onVisibleChanged: {
            if (!visible) {
            } else {
                slideAnimation.from = initialY;
                slideAnimation.to = finalY;
            }
            slideAnimation.start();
        }
    }
}
