import QtQuick 2.15
import QtQuick.Controls
import QtWebEngine
import QtQuick.LocalStorage
import "Icons"

Rectangle{
    id:musicapp
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
        height: parent.height * 9 / 10
        anchors{
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            top: musictopbar.bottom
            bottomMargin: 10
            leftMargin: 10
            rightMargin: 10
        }

        WebEngineView {
            id: webview
            url: "https://open.spotify.com/"

            Component.onCompleted: {
                // Load cookies from LocalStorage
                var cookieKeys = localStorage.getKeys();
                var cookieString = "";

                for (var i = 0; i < cookieKeys.length; i++) {
                    var key = cookieKeys[i];
                    var value = localStorage.getItem(key);
                    if (cookieString !== "") {
                        cookieString += "; ";
                    }
                    cookieString += key + "=" + value;
                }

                // Set cookies for the web page
                webview.setHttpHeader("Cookie", cookieString);
            }
            anchors.fill: parent
            profile.httpUserAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36"
            onLoadingChanged: {
                if (url === "https://open.spotify.com/"){
                    webView.runJavaScript(`
                        var elementToRemove = document.evaluate(
                            "//*[@id=\"main\"]/div/div[2]/div[1]/header/a",
                            document,
                            null,
                            XPathResult.FIRST_ORDERED_NODE_TYPE,
                            null
                        ).singleNodeValue;

                        if (elementToRemove) {
                            elementToRemove.remove();
                        }
                    `);
                }
                if (url === "https://tunein.com/radio/home/"){
                    webView.runJavaScript(`
                        var elementToRemove = document.evaluate(
                            "//*[@id="macDesktopLinkContainer"]/a",
                            document,
                            null,
                            XPathResult.FIRST_ORDERED_NODE_TYPE,
                            null
                        ).singleNodeValue;

                        if (elementToRemove) {
                            elementToRemove.remove();
                        }
                    `);
                }

            }
            settings{
                accelerated2dCanvasEnabled: true
                webGLEnabled: true
            }

        }
    }

    Rectangle{
        id: musictopbar
        height: parent.height / 20
        color: "transparent"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 20
            topMargin: 10
        }

        Rectangle {
            id: combobox
            color: "#121212"
            width: 200
            height: parent.height
            radius: 5

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                hoverEnabled: true
                onClicked: comboboxcontent.visible = !comboboxcontent.visible
            }

            Image{
                id: musicservicelogo
                source: "Icons/spotify.svg"
                height: parent.height * 2 / 3
                width: height
                anchors{
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    margins: 7
                }
                verticalAlignment: Image.AlignVCenter
            }

            Text {
                id: selectedservice
                text: "Spotify"
                color: "white"
                font.pixelSize: parent.height / 2
                verticalAlignment: Text.AlignVCenter
                anchors{
                    top: parent.top
                    bottom: parent.bottom
                    left: musicservicelogo.right
                    margins: 10
                }
            }
        }

        Rectangle{
            id: comboboxcontent
            width: 200
            height: parent.height * 3 + 5
            color: "#121212"
            radius: 5
            visible: false
            anchors{
                top: combobox.bottom
                topMargin: -5
            }
            Rectangle{
                id: tidalcontainer
                height: parent.height / 3
                color: "transparent"
                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                Image{
                    id: tidallogo
                    source: "Icons/tidal.png"
                    height: parent.height * 2 / 3
                    width: height
                    anchors{
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                        margins: 7
                    }
                    verticalAlignment: Image.AlignVCenter
                }

                Text {
                    id: tidallabel
                    text: "Tidal"
                    color: "white"
                    font.pixelSize: parent.height / 2
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        top: parent.top
                        bottom: parent.bottom
                        left: tidallogo.right
                        margins: 10
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        comboboxcontent.visible = false
                        if(tidallabel.text == "Tidal"){
                        webview.url = "https://listen.tidal.com/"
                        tidallabel.text = selectedservice.text
                        tidallogo.source = musicservicelogo.source
                        selectedservice.text = "Tidal"
                        musicservicelogo.source = "Icons/tidal.png"
                        }
                        else if(tidallabel.text == "Spotify"){
                        webview.url = "https://open.spotify.com/"
                        tidallabel.text = selectedservice.text
                        tidallogo.source = musicservicelogo.source
                        selectedservice.text = "Spotify"
                        musicservicelogo.source = "Icons/spotify.svg"
                        }
                        else if(tidallabel.text == "Apple Music"){
                        webview.url = "https://music.apple.com/us/browse"
                        tidallabel.text = selectedservice.text
                        tidallogo.source = musicservicelogo.source
                        selectedservice.text = "Apple Music"
                        musicservicelogo.source = "Icons/applemusic.svg"
                        }
                        else if(tidallabel.text == "TuneIn"){
                        webview.url = "https://tunein.com/radio/home"
                        tidallabel.text = selectedservice.text
                        tidallogo.source = musicservicelogo.source
                        selectedservice.text = "TuneIn"
                        musicservicelogo.source = "Icons/tunein.svg"
                        }
                    }
                }

            }
            Rectangle{
                id: applemusiccontainer
                height: parent.height / 3
                color: "transparent"
                anchors{
                    top: tidalcontainer.bottom
                    left: parent.left
                    right: parent.right
                }

                Image{
                    id: applemusiclogo
                    source: "Icons/applemusic.svg"
                    height: parent.height * 2 / 3
                    width: height
                    anchors{
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                        margins: 10
                    }
                    verticalAlignment: Image.AlignVCenter
                }

                Text {
                    id: applemusiclabel
                    text: "Apple Music"
                    color: "white"
                    font.pixelSize: parent.height / 2
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        top: parent.top
                        bottom: parent.bottom
                        left: applemusiclogo.right
                        margins: 10
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        comboboxcontent.visible = false
                        if(applemusiclabel.text == "Tidal"){
                        webview.url = "https://listen.tidal.com/"
                        applemusiclabel.text = selectedservice.text
                        applemusiclogo.source = musicservicelogo.source
                        selectedservice.text = "Tidal"
                        musicservicelogo.source = "Icons/tidal.png"
                        }
                        else if(applemusiclabel.text == "Spotify"){
                        webview.url = "https://open.spotify.com/"
                        applemusiclabel.text = selectedservice.text
                        applemusiclogo.source = musicservicelogo.source
                        selectedservice.text = "Spotify"
                        musicservicelogo.source = "Icons/spotify.svg"
                        }
                        else if(applemusiclabel.text == "Apple Music"){
                        webview.url = "https://music.apple.com/us/browse"
                        applemusiclabel.text = selectedservice.text
                        applemusiclogo.source = musicservicelogo.source
                        selectedservice.text = "Apple Music"
                        musicservicelogo.source = "Icons/applemusic.svg"
                        }
                        else if(applemusiclabel.text == "TuneIn"){
                        webview.url = "https://tunein.com/radio/home"
                        applemusiclabel.text = selectedservice.text
                        applemusiclogo.source = musicservicelogo.source
                        selectedservice.text = "TuneIn"
                        musicservicelogo.source = "Icons/tunein.svg"
                        }
                    }
                }
            }
            Rectangle{
                id: tuneincontainer
                color: "transparent"
                height: parent.height / 3
                anchors{
                    top: applemusiccontainer.bottom
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                Image{
                    id: tuneinlogo
                    source: "Icons/tunein.svg"
                    height: parent.height
                    width: height
                    anchors{
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                    verticalAlignment: Image.AlignVCenter
                }

                Text {
                    id:tuneinlabel
                    text: "TuneIn"
                    color: "white"
                    font.pixelSize: parent.height / 2
                    verticalAlignment: Text.AlignVCenter
                    anchors{
                        top: parent.top
                        bottom: parent.bottom
                        left: tuneinlogo.right
                        margins: 10
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        comboboxcontent.visible = false
                        if(tuneinlabel.text == "Tidal"){
                        webview.url = "https://listen.tidal.com/"
                        tuneinlabel.text = selectedservice.text
                        tuneinlogo.source = musicservicelogo.source
                        selectedservice.text = "Tidal"
                        musicservicelogo.source = "Icons/tidal.png"
                        }
                        else if(tuneinlabel.text == "Spotify"){
                        webview.url = "https://open.spotify.com/"
                        tuneinlabel.text = selectedservice.text
                        tuneinlogo.source = musicservicelogo.source
                        selectedservice.text = "Spotify"
                        musicservicelogo.source = "Icons/spotify.svg"
                        }
                        else if(tuneinlabel.text == "Apple Music"){
                        webview.url = "https://music.apple.com/us/browse"
                        tuneinlabel.text = selectedservice.text
                        tuneinlogo.source = musicservicelogo.source
                        selectedservice.text = "Apple Music"
                        musicservicelogo.source = "Icons/applemusic.svg"
                        }
                        else if(tuneinlabel.text == "TuneIn"){
                        webview.url = "https://tunein.com/radio/home"
                        tuneinlabel.text = selectedservice.text
                        tuneinlogo.source = musicservicelogo.source
                        selectedservice.text = "TuneIn"
                        musicservicelogo.source = "Icons/tunein.svg"
                        }
                    }
                }
            }
        }
    }
    FeaturePermissionBar {
        id: permBar
        view: webEngineView
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        z: 3
    }
}
