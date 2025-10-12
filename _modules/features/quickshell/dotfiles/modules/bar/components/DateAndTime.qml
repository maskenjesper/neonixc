import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.services
import qs.config

Item {
    id: root

    implicitWidth: content.implicitWidth + 20
    implicitHeight: content.implicitHeight + 20

    Rectangle {
        anchors.fill: parent
        color: ColorsConfig.palette.occupied_ws
        radius: root.height / 2
        visible: mouseArea.containsMouse

    }

    MouseArea {
        id: mouseArea
        anchors {
            fill: parent
        }
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

    }

    Item {
        id: content

        implicitHeight: childrenRect.height
        implicitWidth: childrenRect.width

        anchors {
            centerIn: parent
            margins: 20
        }

        Text {
            id: time
            color: ColorsConfig.palette.text
            font {
                pointSize: 16
            }
            text: Time.time
        }

        Text {
            id: date
            anchors {
                left: time.right
                margins: 10
            }
            color: ColorsConfig.palette.text
            font {
                pointSize: 16
            }
            text: Date.date
        }
    }
}
