import QtQuick 2.15
import "Apps/MusicApp"
import "Apps/SettingsApp"
import "Apps/Maps"

Rectangle {
    id:oneapplayout
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        bottom: parent.bottom
        margins: 10
    }
    color:"transparent"

    Maps{
        visible: false
    }

    property alias musicapp: musicapp

    MusicApp{
        id:musicapp
        visible: false
    }

}
