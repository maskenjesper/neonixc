import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.services
import qs.config

Item {
    id: root

    implicitHeight: 30
    implicitWidth: row.implicitWidth + 2 * row.anchors.margins

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

    RowLayout {
        id: row

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 2
        }

        spacing: 5

        Item {
            id: time
            Layout.fillHeight: true
            Layout.preferredWidth: timeText.width

            Loader {
                anchors.fill: parent
                active: time.height > 0
                Text {
                    id: timeText
                    anchors.centerIn: parent

                    color: ColorsConfig.palette.text

                    font.pointSize: 1 + time.height * 0.5
                    text: Time.time
                }
            }
        }
        Item {
            id: date
            Layout.fillHeight: true
            Layout.preferredWidth: dateText.width

            Loader {
                anchors.fill: parent
                active: date.height > 0
                Text {
                    id: dateText
                    anchors.centerIn: parent

                    color: ColorsConfig.palette.text

                    font.pointSize: 1 + date.height * 0.5
                    text: Date.date
                }
            }
        }
    }
}
