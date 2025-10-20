pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config

Item {
    id: root

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
    property alias showBackground: background.visible
    property double containerOpacity

    implicitHeight: 30
    implicitWidth: row.implicitWidth + 2 * row.anchors.margins

    Rectangle {
        id: background

        anchors.fill: parent
        color: ColorsConfig.palette.primary_container
        radius: height / 2
        visible: false
    }

    RowLayout {
        id: row

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 2
        }

        spacing: 7

        Repeater {
            model: Hyprland.workspaces

            WorkspaceButton {
                required property HyprlandWorkspace modelData

                visible: root.monitor?.id === modelData?.monitor?.id

                Layout.fillHeight: true

                workspace: modelData
                showBackground: true
                containerOpacity: root.containerOpacity
            }
        }
    }
}
