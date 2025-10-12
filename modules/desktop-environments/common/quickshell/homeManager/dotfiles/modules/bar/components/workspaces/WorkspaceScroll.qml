import QtQuick
import Quickshell.Hyprland

MouseArea {
    anchors.fill: parent
    hoverEnabled: true

    onWheel: wheelEvent => {
 //       console.log(JSON.stringify(wheelEvent, null, 4))


        if (wheelEvent.angleDelta.y > 0) {
            Hyprland.dispatch("workspace m-1")
        } else {
            Hyprland.dispatch("workspace m+1")
        }


    }
}
