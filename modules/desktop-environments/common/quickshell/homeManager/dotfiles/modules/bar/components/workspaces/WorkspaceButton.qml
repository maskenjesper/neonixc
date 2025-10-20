pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.components
import qs.services

Item {
    id: root

    required property HyprlandWorkspace workspace
    property alias showBackground: background.visible
    property color color: root.workspace.active && root.workspace.monitor === root.workspace.monitor ? ColorsConfig.palette.active_ws : ColorsConfig.palette.occupied_ws
    property color textColor: root.workspace.active && root.workspace.monitor === root.workspace.monitor ? Qt.lighter(ColorsConfig.palette.text) : ColorsConfig.palette.text
    property double containerOpacity: 1

    implicitHeight: 30
    implicitWidth: row.implicitWidth + 2 * row.anchors.margins

    NumberAnimation on opacity {
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.OutQuad
    }

    Rectangle {
        id: background

        anchors {
            fill: parent
            margins: root.workspace.active || mouseArea.containsMouse ? -1 : 0
        }
        color: {
            if (!root.workspace.active) {
                mouseArea.containsMouse ? Qt.lighter(root.color) : root.color;
            } else {
                root.color;
            }
        }
        radius: root.workspace.active ? root.height / 4 : root.height / 2
        visible: false
        opacity: root.containerOpacity

        Behavior on radius {
            SpringAnimation {
                spring: 2
                damping: 0.2
            }
        }
        Behavior on width {
            SpringAnimation {
                spring: 2
                damping: 0.2
            }
        }
        Behavior on height {
            SpringAnimation {
                spring: 2
                damping: 0.2
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: event => {
            if (Hyprland.focusedWorkspace.id !== root.workspace.id) {
                root.workspace.activate();
            }
        }
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
            id: wsNameText
            Layout.fillHeight: true
            Layout.preferredWidth: height

            Loader {
                anchors.fill: parent
                active: wsNameText.height > 0
                Text {
                    id: workspaceText

                    anchors.centerIn: parent

                    color: root.textColor

                    font.pointSize: 1 + wsNameText.height * 0.7
                    text: root.workspace.name
                }
            }
        }

        // Rectangle {
        //
        //     Layout.fillHeight: true
        //     Layout.preferredWidth: height
        //
        //     visible: repeater.count === 0
        //
        //     color: ColorsConfig.palette.occupied_ws
        //
        //     radius: height / 2
        // }

        Repeater {
            id: repeater
            model: {
                Hyprland.refreshWorkspaces();
                root.workspace.toplevels.values.map(e => {
                    e.wayland?.appId;
                });
            }

            // AppIcon {
            //     required property string modelData
            //
            //     Layout.fillHeight: true
            //     Layout.preferredWidth: height
            //
            //     appId: modelData
            // }
        }
    }
}
