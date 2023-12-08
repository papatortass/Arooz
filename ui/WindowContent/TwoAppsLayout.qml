import QtQuick 2.15
import "Apps/MusicApp"
import "Apps/SettingsApp"
import "Apps/Maps"
import "Apps/DiagnosticsApp"

Rectangle {
    id: twoappslayout
    anchors {
        top: parent.top
        right: parent.right
        left: parent.left
        bottom: parent.bottom
    }
    color: "transparent"

    property alias rightapp: rightapp

    Rectangle {
        id: leftapp
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
        width: parent.width / 2
        color: "transparent"

        Maps {
            visible: false
            anchors.margins: 10
        }
    }

    Rectangle {
        id: rightapp
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        width: parent.width / 2
        color: "transparent"

        property alias musicapp: musicapp

        MusicApp {
            id: musicapp
            visible: false
            anchors.margins: 10
        }
    }
}
