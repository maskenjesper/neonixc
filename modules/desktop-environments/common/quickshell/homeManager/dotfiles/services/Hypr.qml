pragma Singleton

import qs.services
import Quickshell
import Quickshell.Hyprland
import QtQuick

Singleton {
    id: root

    readonly property HyprlandToplevel activeToplevel: Hyprland.activeToplevel?.wayland?.activated ? Hyprland.activeToplevel : null

    function nrOfToplevelsOn(ws: HyprlandWorkspace): int {
        console.log("nrOf " + ws.id);
        var len = ws.toplevels.values.filter(tl => {
            console.log("toplevel " + tl);
            console.log("wayland " + tl.wayland);

            console.log("parent " + tl.wayland.parent);
            if (tl.wayland == null)
                return false;
            if (tl.wayland.parent == null)
                return true;
        }).length;

        console.log(len);

        return len;
    }

    function monitorFor(screen: ShellScreen): HyprlandMonitor {
        return Hyprland.monitorFor(screen);
    }
}
