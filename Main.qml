import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "ui/leftBar"
import "ui/WindowContent"
import "ui/WindowContent/Wallpapers"

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Arroz")
    color: "transparent"

    Image{
        source: "ui/WindowContent/Wallpapers/wallpapergrey.webp"
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            left:parent.left
        }
        width: parent.width
        height: parent.height
    }

    LeftBar{
        id: leftbar
    }

    WindowContent{
        id: windowcontent
    }

}
