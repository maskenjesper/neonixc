import QtQuick
import Quickshell.Hyprland

MouseArea {
    anchors.fill: parent
    hoverEnabled: true

    onWheel: wheelEvent => {
        if (wheelEvent.angleDelta.y > 0) {
            Hyprland.dispatch("workspace m-1");
        } else {
            Hyprland.dispatch("workspace m+1");
        }
    }
}
