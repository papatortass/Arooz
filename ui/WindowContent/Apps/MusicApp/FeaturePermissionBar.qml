import QtQuick
import QtQuick.Controls
import QtWebEngine
import QtQuick.Layouts

Rectangle {
    property var requestedFeature;
    property url securityOrigin;
    property WebEngineView view;

    id: permissionBar
    color: "black"
    visible: false
    height: acceptButton.height + 4


    function textForFeature(feature) {
        switch (feature) {
            case WebEngineView.Geolocation:              return 'Allow %1 to access your location information?'
            case WebEngineView.MediaAudioCapture:        return 'Allow %1 to access your microphone?'
            case WebEngineView.MediaVideoCapture:        return 'Allow %1 to access your webcam?'
            case WebEngineView.MediaAudioVideoCapture:   return 'Allow %1 to access your microphone and webcam?'
            case WebEngineView.DesktopVideoCapture:      return 'Allow %1 to capture video of your desktop?'
            case WebEngineView.DesktopAudioVideoCapture: return 'Allow %1 to capture audio and video of your desktop?'
            case WebEngineView.Notifications:            return 'Allow %1 to show notification on your desktop?'
            default: break
        }
        return 'Grant permission for %1 to unknown or unsupported feature [' + feature + ']?'
    }

    onRequestedFeatureChanged: {
        message.text = textForFeature(requestedFeature).arg(securityOrigin);
    }

    RowLayout {
        anchors {
            fill: permissionBar
            leftMargin: 5
            rightMargin: 5
        }
        Label {
            id: message
            Layout.fillWidth: true
        }

        Button {
            id: acceptButton
            text: "Accept"
            Layout.alignment: Qt.AlignRight
            onClicked: {
                view.grantFeaturePermission(securityOrigin, requestedFeature, true);
                permissionBar.visible = false;
            }
        }

        Button {
            text: "Deny"
            Layout.alignment: Qt.AlignRight
            onClicked: {
                view.grantFeaturePermission(securityOrigin, requestedFeature, false);
                permissionBar.visible = false
            }
        }
    }
}
