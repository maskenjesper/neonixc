import qs.config
import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Variants {
    id: root
    model: Quickshell.screens

    PanelWindow {
        id: mainWindow
        required property var modelData
        screen: modelData
        visible: true //root.instances.length > 1 ? (modelData.name == "HDMI-A-1" ? true : false) : true
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 32

        Rectangle { 
            color: ColorsConfig.palette.bar_background 
            anchors.fill: parent

            GridLayout { //grid 3 partes iguales
                id: grid
                anchors.fill: parent
                columns: 3
                rows: 1
                columnSpacing: 0
                Item {
                    id: start
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Workspaces {}
                }
                Item {
                    id: middle
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Text {
                        anchors.centerIn: parent
                        text: "hello world"
                    }
                }
                Item {
                    id: end
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Text {
                        anchors.centerIn: parent
                        text: "hello world"
                    }
                }
            }
        }
    }
}
