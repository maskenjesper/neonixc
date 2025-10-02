pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root
    readonly property HyprlandMonitor currentScreen: Hyprland.monitorFor(root.QsWindow.window?.screen)

    spacing: 10

    Repeater {
        model: Hyprland.workspaces

        Item {
            id: widget
            required property HyprlandWorkspace modelData

            visible: widget.modelData.monitor?.id === root.currentScreen?.id
            width: 30
            Layout.fillHeight: true

            WorkspaceWidget {
                workspace: widget.modelData
            }
        }
    }
}
