import QtQuick 2.15
import QtQuick.Controls
import ".."
import "../Icons"


    Rectangle{
        id: softwaremodule
        color: "transparent"
        border.color: "#242424"
        border.width: 2
        anchors{
            top:parent.top
            bottom: parent.bottom
            left:parent.left
            right: parent.right
            topMargin: parent.height / 20
            bottomMargin: parent.height / 40
            leftMargin: parent.height / 40
            rightMargin: parent.height / 40
        }
        radius: 5

        Rectangle{
            id:softwareinfobackground
            color:"#121212"
            height: parent.height * 2 / 9
            width: parent.width //- 10
            anchors {
                top: parent.top
                left: parent.left
                //leftMargin: 10
            }
            radius: 5
            opacity: 0.5
            border.color: "#242424"
        }

        Rectangle{
            id:softwareinfo
            color:"transparent"
            height: parent.height * 2 / 9
            width: parent.width
            anchors {
                top: parent.top
                left: parent.top
            }

            Rectangle{
                id:logocontainer
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                anchors{
                    top:parent.top
                    left: parent.left
                    bottom: parent.bottom
                    right: logocontainer.left
                }

                Image {
                    id: logo
                    source: "../Icons/Logo.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        top:parent.top
                        bottom: parent.bottom
                        left:parent.left
                        right: parent.right
                        topMargin: parent.height / 20
                        leftMargin: parent.height / 20
                    }
                }
            }

            Rectangle{
                id:infocontainer
                height: parent.height
                width: parent.width / 3
                color: "transparent"
                anchors{
                    left: logocontainer.right
                    top: parent.top
                    bottom: parent.bottom
                }

                Rectangle{
                    id: namecontainer
                    width: parent.width
                    height: parent.height * 2 / 15
                    color:"transparent"
                    anchors{
                        right: parent.right
                        left: parent.left
                        top: parent.top
                        topMargin: height
                    }

                    Text {
                        id: name
                        text: "AROOZ UI"
                        color: "white"
                        font.bold: true
                        font.pixelSize: parent.height * 4 / 3
                        font.family: "Fantasy"
                        anchors{
                            top: parent.top
                            left: parent.left
                        }
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Text {
                    id: version
                    text: "Version: 1.0"
                    color: "white"
                    font.pixelSize: name.font.pixelSize * 2/ 5
                    font.family: "Fantasy"
                    anchors{
                        right: parent.right
                        left: parent.left
                        top: namecontainer.bottom
                        bottom: parent.bottom
                        topMargin: 10 + font.pixelSize
                    }
                    horizontalAlignment: Text.AlignHLeft
                }

                Text {
                    id: releasedate
                    text: "Release Date: 15/08/2023"
                    color: "white"
                    font.pixelSize: name.font.pixelSize * 2/ 5
                    font.family: "Fantasy"
                    anchors{
                        right: parent.right
                        left: parent.left
                        top: namecontainer.bottom
                        topMargin: 15 + 2 * font.pixelSize
                    }
                    horizontalAlignment: Text.AlignHLeft
                }

                Text {
                    id: creator
                    text: "Created By: Rafael \"papatortas\" Costa"
                    color: "white"
                    font.pixelSize: name.font.pixelSize * 2/ 5
                    font.family: "Fantasy"
                    anchors{
                        right: parent.right
                        left: parent.left
                        top: namecontainer.bottom
                        topMargin: 20 + 3 * font.pixelSize
                    }
                    horizontalAlignment: Text.AlignHLeft
                }

                Text {
                    id: githubpage
                    text: "Github Page: github.com/papatortass/AroozUI"
                    color: "white"
                    font.pixelSize: name.font.pixelSize * 2/ 5
                    font.family: "Fantasy"
                    anchors{
                        right: parent.right
                        left: parent.left
                        top: namecontainer.bottom
                        topMargin: 25 + 4 * font.pixelSize
                    }
                    horizontalAlignment: Text.AlignHLeft
                }
            }
            Rectangle{
                id:updatercontainer
                height: parent.height
                width: parent.width / 3
                color: "transparent"
                anchors{
                    top: parent.top
                    right: parent.right
                    left: infocontainer.right
                }

                Rectangle{
                    id: updateinfocontainer
                    height: parent.height / 2
                    width: parent.width
                    color: "transparent"
                    anchors{
                        left: parent.left
                        top: parent.top
                    }

                    Rectangle{
                        id: uptodatecontainer
                        height: parent.height
                        width: parent.width
                        color: "transparent"
                    }

                    Text{
                        id:uptodate
                        text: "You're Up to Date!"
                        font.family: "Fantasy"
                        font.pixelSize: parent.height / 3
                        font.bold: true
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors{
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            bottom: versionuptodate.top
                            topMargin: parent.height / 3
                            rightMargin: parent.width / 7
                        }
                    }
                    Text{
                        id:versionuptodate
                        text: "You're currently in the the most recent version"
                        font.family: "Fantasy"
                        font.pixelSize: parent.height / 6
                        font.bold: true
                        color: "white"
                        horizontalAlignment: Text.AlignHLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors{
                            left: parent.left
                            right: parent.right
                            top: uptodate.top
                            bottom: parent.bottom
                            topMargin: parent.height / 6
                            leftMargin: 5
                        }
                    }
                }

                Rectangle{
                    width: parent.width / 3
                    anchors{
                        bottom: parent.bottom
                        right: parent.right
                        left: parent.left
                        top: updateinfocontainer.bottom
                        bottomMargin: height / 2
                        rightMargin: 55
                    }
                    color:"#121212"
                    radius: 5

                    Button{
                        id:updatebutton
                        anchors{
                            bottom: parent.bottom
                            right: parent.right
                            left: parent.left
                            top: parent.top
                        }
                        text: "Check For Updates"
                        font.family: "Fantasy"
                        font.pixelSize: height / 3
                        font.bold: true
                    }
                }
            }
        }

        Rectangle{
            id: donate
            height: parent.height / 3
            width: parent.width
            color: "#212224"
            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                top: softwareinfo.bottom
            }
            Rectangle {
                id: cardSlider
                height: parent.height / 3
                width: height * 3
                color: "transparent"
                anchors{
                    bottom: parent.bottom
                    rightMargin: parent.width / 3 - parent.width / 6
                    right: parent.right
                }

                ListModel {
                    id: cardDataModel
                    ListElement { imagePath: "" }
                    ListElement { imagePath: "../Icons/bitcoin.png" }
                    ListElement { imagePath: "../Icons/ethereum.png" }
                    ListElement { imagePath: "../Icons/bitcoincash.png" }
                    ListElement { imagePath: "" }
                }

                Component {
                    id: cardDelegate
                    Item {
                        width: cardSlider.width / 3
                        height: cardSlider.height
                        Rectangle {
                            width: parent.width - 20
                            height: parent.height - 20
                            color: "transparent"
                            anchors.centerIn: parent

                            Image {
                                anchors.fill: parent
                                source: model.imagePath
                            }

                            Text {
                                anchors.centerIn: parent
                                text: model.text
                            }
                            anchors.horizontalCenter: parent.horizontalcenter
                        }
                    }
                }

                ListView {
                    id: cardListView
                    width: cardSlider.width
                    height: cardSlider.height
                    model: cardDataModel
                    delegate: cardDelegate
                    orientation: ListView.Horizontal
                    clip: true
                    snapMode: ListView.SnapToItem
                    highlightFollowsCurrentItem: true
                    boundsBehavior: Flickable.StopAtBounds
                    Component.onCompleted: {
                    currentIndex: 2
                    }
                    Rectangle {
                        width: parent.width / 2
                        height: parent.height
                        anchors{
                            left: parent.left
                        }

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: "#212224" }
                            GradientStop { position: 1.0; color: "transparent" }
                        }
                    }
                    Rectangle {
                        width: parent.width / 2
                        height: parent.height
                        anchors{
                            right: parent.right
                        }

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 1.0; color: "#212224" }
                            GradientStop { position: 0.0; color: "transparent" }
                        }
                    }
                }
            }
        }
    }
