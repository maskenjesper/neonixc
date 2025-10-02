import qs.components
import qs.config
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts

Item {
    id: root
    required property HyprlandWorkspace workspace

    Rectangle {

        implicitWidth: 100
        height: 25
        radius: 10

        color: workspace.active ? ColorsConfig.palette.active_ws : ColorsConfig.palette.occupied_ws

        RowLayout {
            anchors.centerIn: parent

            Text {
                color: ColorsConfig.palette.text

                text: root.workspace.name
                font.pointSize: 12
            }
            Text {
                color: ColorsConfig.palette.text

                text: root.workspace.name
                font.pointSize: 12
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: event => {
                if (Hyprland.focusedWorkspace.id !== root.workspace.id) {
                    root.workspace.activate()
                }
            }
        }
    }

}
