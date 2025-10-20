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

        color: "transparent"

        property HyprlandMonitor monitor: Hypr.monitorFor(screen)
        property bool dynamicPos: false
        property bool dynamicOpacity: true
        property bool singleWindow: Hypr.nrOfToplevelsOn(monitor.activeWorkspace) == 1
        property double floating: {
            if (!dynamicPos)
                return false;

            var edgeTouched = monitor.activeWorkspace.toplevels.values.every(tl => {
                return !panelEdgeTouched(tl, monitor);
            });

            return edgeTouched;
        }
        property double floatingMargin: 10
        property double opacity: {
            if (!dynamicOpacity)
                return 1;

            var edgeTouched = monitor.activeWorkspace.toplevels.values.every(tl => {
                return !panelEdgeTouched(tl, monitor);
            });

            return edgeTouched ? 0.5 : 1;
        }

        // TODO: Edge detection seems to work but making a window floating doesn't
        // trigger a update it seems
        function panelEdgeTouched(toplevel: HyprlandToplevel, monitor: HyprlandMonitor): bool {
            Hyprland.refreshToplevels();
            if (toplevel.wayland == null)
                return false;

            var y = toplevel.lastIpcObject.at[1];

            if (toplevel.wayland.parent == null) {
                return y <= mainWindow.height + monitor.y;
            }
        }

        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 32

        margins {
            left: floating ? floatingMargin : 0
            right: floating ? floatingMargin : 0
            top: floating ? floatingMargin : 0
        }

        Item {
            id: bg
            anchors {
                fill: parent
            }

            Rectangle {
                id: box
                anchors.fill: parent
                color: ColorsConfig.palette.bar_background
                border.color: mainWindow.floating ? Qt.rgba(1, 1, 1, 0.05) : ColorsConfig.palette.bar_background
                opacity: mainWindow.opacity
                radius: mainWindow.floating ? 15 : 0
                Behavior on radius {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                    }
                }
                Behavior on opacity {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                    }
                }
                Behavior on width {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                    }
                }
            }

            WorkspaceScroll {}

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainWindow.panelEdgeTouched(mainWindow.monitor.activeWorkspace.toplevels.values[0]);
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
                            containerOpacity: mainWindow.opacity
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
