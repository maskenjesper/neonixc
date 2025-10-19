import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick
import QtQuick.Controls
import qs.config
import qs.services
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

        property HyprlandMonitor monitor: Hypr.monitorFor(screen)
        property bool floating: Hypr.nrOfToplevelsOn(monitor.activeWorkspace) > 1 || Hypr.nrOfToplevelsOn(monitor.activeWorkspace) == 0

        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 32

        margins {
            top: floating ? 10 : 0
            left: floating ? 10 : 0
            right: floating ? 10 : 0
        }

        Rectangle {
            id: bg
            anchors.fill: parent
            color: ColorsConfig.palette.bar_background

            WorkspaceScroll {}

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(Hypr.nrOfToplevelsOn(mainWindow.monitor.activeWorkspace));
                }
            }

            RowLayout {
                id: bar
                anchors {
                    fill: parent
                    leftMargin: 10
                }
                spacing: 1
                Item {
                    id: left
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Row {
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            left: parent.left
                        }

                        spacing: 20

                        Workspaces {
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                                margins: 3
                            }
                            showBackground: false
                        }

                        WindowTitle {
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                                margins: 3
                            }
                        }
                    }
                }

                Item {
                    id: middle
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    visible: mainWindow.screen.name === MonitorConfig.mainMonitor

                    DateAndTime {
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            centerIn: parent
                        }
                    }
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
