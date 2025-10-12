import "modules/bar"
import Quickshell
import QtQuick

ShellRoot {
    id: shellroot

    Loader {
        active: true
        sourceComponent: Bar {}
    }
}
