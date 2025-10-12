import Quickshell
import Quickshell.Services.SystemTray
import QtQuick.Layouts
import QtQuick
import qs.services
import qs.config
import qs.components

Item {
    id: root


    implicitHeight: 30
    implicitWidth: row.implicitWidth + 2 * row.anchors.margins

    RowLayout {
        id: row

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 5
        }

        spacing: 5

        Repeater {
            id: repeater
            model: SystemTray.items

            SystemTrayButton {
                required property SystemTrayItem modelData

                item: modelData
            }
        }
    }
}
