import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.services
import qs.config

Item {
    id: root

    implicitWidth: text.implicitWidth
    implicitHeight: text.implicitHeight

    Rectangle {
        anchors.fill: parent
        color: "red"
        visible: false
    }

    Text {
        id: text
        anchors {
            centerIn: parent
        }
        color: ColorsConfig.palette.text
        font {
            pointSize: 16
        }
        text: Time.time
    }
}
