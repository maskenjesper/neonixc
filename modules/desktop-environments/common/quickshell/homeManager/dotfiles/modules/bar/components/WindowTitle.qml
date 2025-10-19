import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.services
import qs.config
import qs.components

Item {
    id: root

    readonly property var activeAppId: Hypr.activeToplevel == undefined ? null : Hypr.activeToplevel.wayland.appId
    readonly property var activeTitle: Hypr.activeToplevel == undefined ? null : Hypr.activeToplevel.wayland.title

    implicitHeight: 30
    implicitWidth: row.width

    Item {
        id: item

        height: root.height
        width: childrenRect.width

        // NumberAnimation on text.text {
        //     target: opacity
        //     from: 0
        //     to: 1
        //     duration: 500
        //     easing.type: Easing.Linear
        // }

        RowLayout {
            id: row

            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                margins: 2
            }

            spacing: 10

            visible: activeAppId != null

            AppIcon {
                Layout.fillHeight: true
                Layout.preferredWidth: height

                appId: activeAppId
            }

            Item {
                Layout.fillHeight: true
                Layout.preferredWidth: text.width

                Loader {
                    anchors.fill: parent
                    active: item.height > 0
                    Text {
                        id: text
                        anchors.centerIn: parent

                        color: ColorsConfig.palette.text

                        font.pointSize: 1 + item.height * 0.5
                        text: activeTitle
                    }
                }
            }
        }
    }
}
