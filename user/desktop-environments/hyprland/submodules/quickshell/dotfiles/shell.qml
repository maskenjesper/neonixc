import "modules/bar"
import "modules/dashboard"
import Quickshell
import Quickshell.Hyprland
import QtQuick

ShellRoot {
    id: shellroot

    Loader {
        active: true
        sourceComponent: Bar {}
    }
}
