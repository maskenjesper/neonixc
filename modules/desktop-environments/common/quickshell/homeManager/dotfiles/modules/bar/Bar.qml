import Quickshell
import QtQuick.Layouts
import QtQuick
import qs.config
import "components/workspaces"
import "components/system-tray"
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
        implicitHeight: 32

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

                    visible: mainWindow.screen.name === MonitorConfig.mainMonitor

                }

                Item {
                    id: right
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    visible: mainWindow.screen.name === MonitorConfig.mainMonitor

                    Row {
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            right: parent.right
                        }
                        layoutDirection: Qt.RightToLeft

                        DateAndTime {
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                            }
                        }

                        SystemTray {
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                            }
                        }
                    }
                }
            }
        }
    }
}
