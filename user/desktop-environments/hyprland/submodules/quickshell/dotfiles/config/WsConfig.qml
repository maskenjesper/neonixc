pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property Workspaces config: Workspaces {}

    component Workspaces: QtObject {
        property int totalWs: 5
        property string label: "Circle"
        property color active: ColorsConfig.palette.active_ws
        property color occupied: ColorsConfig.palette.occupied_ws
        property color empty: ColorsConfig.palette.empty_ws
    }
}
