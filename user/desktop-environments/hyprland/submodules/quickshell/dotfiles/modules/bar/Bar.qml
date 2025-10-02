pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import "components/workspaces"
import Quickshell.Hyprland
import QtQuick.Controls

Variants {
    id: root
    model: Quickshell.screens

    PanelWindow {
        id: mainWindow
        required property var modelData
        screen: modelData
        visible: true // root.instances.length > 1 ? (modelData.name == "HDMI-A-1" ? true : false) : true
        anchors {
            top: true
            left: true
            right: true
            //bottom: true
        }
        implicitHeight: 40

        Item {
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: ColorsConfig.palette.bar_background
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onWheel: wheelEvent => {
                    console.log(JSON.stringify(wheelEvent, null, 4))

                    if (wheelEvent.angleDelta.y > 0) {
                        Hyprland.dispatch("workspace m-1")
                    } else {
                        Hyprland.dispatch("workspace m+1")
                    }


                }
            }

            GridLayout { //grid 3 partes iguales
                id: grid
                anchors.fill: parent
                columns: 3
                rows: 1
                columnSpacing: 0

                // Start part
                Item {
                    Layout.preferredWidth: parent.width / 3
                    Layout.preferredHeight: parent.height
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft


                    RowLayout {
                        spacing: 12
                        anchors.fill: parent

                        // Nested RowLayout
                        RowLayout {
                            id: workspaces
                            readonly property HyprlandMonitor currentScreen: Hyprland.monitorFor(workspaces.QsWindow.window?.screen)
                            Layout.leftMargin: 10
                            Layout.rightMargin: 10
                            spacing: 5

                            Repeater {
                                model: Hyprland.workspaces

                                Item {
                                    id: workspacewidget
                                    required property HyprlandWorkspace modelData

                                    width: childrenRect.width
                                    height: childrenRect.height
                                    visible: modelData.monitor?.id === workspaces.currentScreen?.id

                                    Rectangle {
                                        id: workspacewidgetbox
                                        width: 30
                                        height: 30
                                        color: workspacewidget.modelData.active ? ColorsConfig.palette.active_ws : ColorsConfig.palette.occupied_ws
                                        radius: workspacewidget.modelData.active ? 10 : 15


                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: event => {
                                                if (Hyprland.focusedWorkspace.id !== workspacewidget.modelData.id) {
                                                    workspacewidget.modelData.activate()
                                                }
                                            }
                                        }

                                        RowLayout {
                                            anchors.fill: parent

                                            Text {
                                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                                                color: ColorsConfig.palette.text

                                                font.pointSize: 12
                                                text: workspacewidget.modelData.name

                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // Middle part
                Item {
                    Layout.preferredWidth: parent.width / 3
                    Layout.preferredHeight: parent.height
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                    }
                }
                // End part
                Item {
                    Layout.preferredWidth: parent.width / 3
                    Layout.preferredHeight: parent.height
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                    }
                }
            }
        }
    }
}
