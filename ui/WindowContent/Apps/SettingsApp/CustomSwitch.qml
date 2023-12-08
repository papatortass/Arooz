import QtQuick 2.15
import QtQuick.Controls 2.15

Switch {
    id:root
    property  color checkedcolor: "#0ACF97"
    checked: true

    indicator: Rectangle{
        height: parent.height * 2/3
        width: height * 2
        radius: height/2
        color: root.checked ? checkedcolor : "#404040"
        border.width: 2
        border.color:  root.checked ? checkedcolor : "#666666"
        Rectangle{
            x: root.checked ? parent.width - width - 2 : 1
            width: root.checked ? parent.height - 4 : parent.height - 2
            height: width
            radius: width / 2
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            border.color: "#D5D5D5"

            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
