import QtQuick
import QtQuick.Controls
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu
import Quickshell
import qs.components

Item {
    id: root
    property SystemTrayItem item

    width: 24
    height: 24

    // The icon
    Image {
        id: iconImg
        anchors.fill: parent
        source: Quickshell.iconPath(root.item.icon, true)
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    // Tooltip (if supported)
    // ToolTip {
    //     visible: hovered
    //     text: root.item.tooltipTitle + "\n" + root.item.tooltipDescription
    // }

    // MouseArea {
    //     anchors.fill: parent
    //     hoverEnabled: true
    //     onClicked: {
    //         if (!root.item.onlyMenu) {
    //             root.item.activate()
    //         } else {
    //             // Show menu if onlyMenu is true
    //             trayMenu.popup()
    //         }
    //     }
    // }

    // The DBus menu model for this tray item
    // Menu {
    //     id: trayMenu
    //     Quickshell.DBusMenu.MenuModel {
    //         source: root.item   // binds to its menu
    //     }
    //     // You may need to customize how the menu is shown (popup, positioning)
    // }
}
