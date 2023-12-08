import QtQuick 2.15
import "Apps/MusicApp"
import "Apps/SettingsApp"
import "Apps/Maps"
import "Apps/DiagnosticsApp"

Rectangle {
    id: threeappslayout
    anchors {
        top: parent.top
        right: parent.right
        left: parent.left
        bottom: parent.bottom
    }
    color: "transparent"

    property alias righttopapp: righttopapp

    Rectangle {
        id: leftapp
        anchors {
            top: parent.top
            left: parent.left
            right: righttopapp.left
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
        id: righttopapp
        anchors {
            top: parent.top
            left: leftapp.right
            right: parent.right
        }
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"

        property alias musicapp: musicapp

        MusicApp {
            id: musicapp
            visible: false
            anchors.margins: 10
        }
    }

    Rectangle {
        id: rightbottomapp
        anchors {
            left: leftapp.right
            right: parent.right
            bottom: parent.bottom
        }
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"

        DiagnosticsApp {
            visible: false
            anchors.margins: 10
        }
    }
}
