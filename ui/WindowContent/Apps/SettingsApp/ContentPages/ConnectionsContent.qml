import QtQuick 2.15
import QtQuick.Controls
import ".."

Rectangle{
    id: connectionsarea
    width: parent.width
    height: parent.height
    color: "transparent"

    Rectangle{
        id: wifiarea
        width: parent.width / 2
        height: parent.height
        color: "transparent"
        Rectangle{
            id: wifistatus
            width: parent.width * 4 / 5
            height: parent.height / 18
            color: "#121212"
            border.color: "#242424"
            border.width: 2
            anchors{
                top:parent.top
                left:parent.left
                topMargin: parent.height / 20
                leftMargin: parent.height / 40
                rightMargin: parent.height / 40
            }
            radius: 5

            Text{
                id:wifistatuslabel
                text: "Wi-Fi"
                color: "white"
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                anchors{
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom
                    leftMargin: parent.width / 40
                }
                font.pixelSize: categories.width / 15
            }

            CustomSwitch{
                anchors{
                    top:parent.top
                    bottom:parent.bottom
                    right: parent.right
                    topMargin: (parent.height / 2) - (parent.height / 4)
                }
            }
        }
    }

    Rectangle{
        id: bluetootharea
        width: parent.width / 2
        height: parent.height
        color: "transparent"
        anchors{
            left: wifiarea.right
            right: parent.right

        }

        Rectangle{
            id: bluetoothstatus
            width: parent.width * 4 / 5
            height: parent.height / 18
            color: "#121212"
            border.color: "#242424"
            border.width: 2
            anchors{
                top:parent.top
                right: parent.right
                left: parent.left
                topMargin: parent.height / 20
                leftMargin: parent.height / 40
                rightMargin: parent.height / 40
            }
            radius: 5

            Text{
                id:bluetoothlabel
                text: "Bluetooth"
                color: "white"
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                anchors{
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom
                    leftMargin: parent.width / 40
                }
                font.pixelSize: categories.width / 15
            }

            CustomSwitch{
                anchors{
                    top:parent.top
                    bottom:parent.bottom
                    right: parent.right
                    topMargin: (parent.height / 2) - (parent.height / 4)
                }
            }
        }
    }
}
