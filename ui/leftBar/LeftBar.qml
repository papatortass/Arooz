import QtQuick 2.15
import QtQml 2.0
import "../WindowContent/Apps/SettingsApp"
import "../WindowContent/Apps/SettingsApp/ContentPages"
import "../WindowContent"
import "../assets"


Rectangle {
    id: leftbar
    anchors {
        top: parent.top
        left: parent.left
        bottom: parent.bottom
    }
    width: parent.width / 25 + 20
    height: parent.height
    color: "transparent"

    Rectangle{
        width: parent.width
        height: parent.height
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }
        color: "#121212"
        opacity: 0.95
    }

    property bool settingsAppVisible: false

    Text {
        id: currenttime
        text: new Date().toLocaleTimeString(Qt.locale.ShortFormat,Qt.locale("pt_PT"))
        color: "white"
        anchors{
            top: parent.top
            left: parent.top
            right: parent.right
            horizontalCenter: parent.horizontalCenter
            topMargin: parent.height / 70
        }
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width / 4
    }

    Image {
        id: musicicon
        source: "../assets/music.svg"
        fillMode: Image.PreserveAspectFit
        height: parent.height / 20
        width:  parent.width / 30
        anchors{
            left: parent.left
            right: parent.right
            bottom: catmenuicon.top
            bottomMargin: 20
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            hoverEnabled: true
            onClicked: {
                if (windowcontent.oneapplayout.musicapp.visible || windowcontent.twoappslayout.rightapp.musicapp.visible || windowcontent.threeappslayout.righttopapp.musicapp.visible){
                windowcontent.openApps -= 1;
                }
                else{
                    windowcontent.openApps += 1;
                }

                windowcontent.oneapplayout.visible = windowcontent.openApps === 1;
                windowcontent.oneapplayout.musicapp.visible = windowcontent.openApps === 1;
                windowcontent.twoappslayout.rightapp.musicapp.visible = windowcontent.openApps === 2;
                windowcontent.twoappslayout.rightapp.musicapp.visible = windowcontent.openApps === 2;
                windowcontent.threeappslayout.righttopapp.musicapp.visible = windowcontent.openApps === 3;
                windowcontent.threeappslayout.righttopapp.musicapp.visible = windowcontent.openApps === 3;
            }
        }
    }

    Timer {
        id: closetimer
        interval: 300
        onTriggered: {
            windowcontent.settingsapp.visible = false
        }
    }

    Image {
        id: catmenuicon
        source: "Icons/menu.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height / 20
        width:  parent.width / 30
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 20
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        NumberAnimation {
            id: slideAnimation
            target: windowcontent.settingsapp
            property: "y"
            from: windowcontent.height - windowcontent.settingsapp.height;
            to: windowcontent.height;
            duration: 300
            easing.type: Easing.InOutQuad
        }

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            hoverEnabled: true
            onClicked: {
                if (windowcontent.settingsapp.visible) {
                    catmenuicon.source = "Icons/menu.png"
                    slideAnimation.start()
                    closetimer.start()
                } else {
                    catmenuicon.source= "Icons/menuopen.png"
                    windowcontent.settingsapp.visible = true;
                }
            }
        }
    }

}
