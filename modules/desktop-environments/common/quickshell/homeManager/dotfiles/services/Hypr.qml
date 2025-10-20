pragma Singleton

import qs.services
import Quickshell
import Quickshell.Hyprland
import QtQuick

Singleton {
    id: root

    readonly property HyprlandToplevel activeToplevel: Hyprland.activeToplevel?.wayland?.activated ? Hyprland.activeToplevel : null

    function nrOfToplevelsOn(ws: HyprlandWorkspace): int {
        var len = ws.toplevels.values.filter(tl => {
            if (tl.wayland == null)
                return false;
            if (tl.wayland.parent == null)
                return true;
        }).length;

        return len;
    }

    function monitorFor(screen: ShellScreen): HyprlandMonitor {
        return Hyprland.monitorFor(screen);
    }
}
