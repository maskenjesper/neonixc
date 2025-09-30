import qs.components
import qs.services
import qs.config
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Row {
    id: wsRow
    readonly property var currentScreen: Hyprland.monitorFor(wsRow.QsWindow.window?.screen)

    spacing: 0
    anchors {
        leftMargin: 10
        rightMargin: 10
    }
    Repeater {
        model: Hyprland.workspaces

        Item {
            id: wsContainer
            required property HyprlandWorkspace modelData

            property int fontSize: 18

            height: wsRow.height
            width: 30
            Layout.fillHeight: true
            visible: modelData.monitor?.id === wsRow.currentScreen?.id 

            MaterialIcon {
                id: icon
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: modelData.active ? ColorsConfig.palette.active_ws
                    : modelData.urgent ? ColorsConfig.palette.occupied_ws
                    : WsConfig.config.empty
                   
                font.pixelSize: modelData.active ? 21 : wsContainer.fontSize
                fill: modelData.active ? 1 : 0

                text: modelData.name
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: event => {
                    if (Hyprland.focusedWorkspace.id !== modelData.id) {
                        modelData.activate()
                    }
                }
                onEntered: event => {
                    wsContainer.fontSize = modelData.active ? wsContainer.fontSize : 21;
                }
                onExited: event => {
                    wsContainer.fontSize = modelData.active ? wsContainer.fontSize : 18;
                }
            }

        }
    }
}
