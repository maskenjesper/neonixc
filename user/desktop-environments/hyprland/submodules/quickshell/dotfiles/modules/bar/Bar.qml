import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.config
import "components/workspaces"
import "components"

Variants {
    id: root
    model: Quickshell.screens

    PanelWindow {
        id: mainWindow

        required property ShellScreen modelData

        screen: modelData
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 40

        Rectangle {
            id: bg
            anchors.fill: parent
            color: ColorsConfig.palette.bar_background

            WorkspaceScroll {}

            RowLayout {
                id: bar
                anchors.fill: parent
                spacing: 1
                Item {
                    id: left
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Workspaces {
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            left: parent.left
                            margins: 3
                        }
                        showBackground: false
                    }
                }

                Item {
                    id: middle
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Rectangle {
                        anchors.fill: parent
                        color: "red"
                        visible: false
                    }

                    TimeButton {
                        anchors {
                            centerIn: parent
                        }
                    }
                }

                Item {
                    id: right
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Rectangle {
                        anchors.fill: parent
                        color: "red"
                        visible: false
                    }
                }
            }
        }
    }
}
