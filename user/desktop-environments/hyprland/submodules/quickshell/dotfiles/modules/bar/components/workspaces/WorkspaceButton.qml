pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.components

Item {
    id: root

    Component.onCompleted: {
        console.log("Buttons\twidth: " + width + "\n\t\t\theight: " + height)
    }

    required property HyprlandWorkspace workspace
    property alias showBackground: background.visible
    property color color: root.workspace.active && root.workspace.monitor === root.workspace.monitor ? ColorsConfig.palette.active_ws : ColorsConfig.palette.occupied_ws 

    implicitHeight: 30
    implicitWidth: row.implicitWidth + 2 * row.anchors.margins

    Rectangle {
        id: background

        anchors.fill: parent
        color: mouseArea.containsMouse ? Qt.darker(root.color) : root.color
        // bottomRightRadius: root.workspace.active ? root.height / 4 : root.height / 2 
        // bottomLeftRadius: root.workspace.active ? root.height / 4 : root.height / 2 
        radius: root.workspace.active ? root.height / 4 : root.height / 2 
        visible: false
        // gradient: Gradient {
        //     GradientStop {
        //         position: 0.0; color: "#ff000000"
        //     }
        //     GradientStop {
        //         position: 0.8; color: background.color
        //     }
        // }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: event => {
            if (Hyprland.focusedWorkspace.id !== root.workspace.id) {
                root.workspace.activate()
            }
            console.log(root.workspace.toplevels.values.map(e => e.wayland.appId))
        }
    }

    RowLayout {
        id: row

        Component.onCompleted: {
            console.log("Inner Rows\twidth: " + width + "\n\t\t\theight: " + height)
        }

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 5
        }

        spacing: 5

        Item {
            id: wsNameText
            Layout.fillHeight: true
            Layout.preferredWidth: height

            Text {
                id: workspaceText

                anchors.centerIn: parent

                color: ColorsConfig.palette.text

                font.pointSize: wsNameText.height * 0.6
                text: root.workspace.name

            }
        }

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: height
            
            visible: repeater.count === 0

            color: ColorsConfig.palette.occupied_ws

            radius: height / 2
        }

        Repeater {
            id: repeater
            model: { 
                Hyprland.refreshToplevels()
                root.workspace.toplevels.values.map(e => e.wayland?.appId)
            }

            AppIcon {
                required property string modelData

                Layout.fillHeight: true
                    Layout.preferredWidth: height

                    appId: modelData
            }
        }
    }
}
