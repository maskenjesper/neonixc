pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property MyPalette debug: MyPalette {
        bar_background: "#000000"
        primary_container: "#ff0000"
        secondary_container: "#00ff00"
        text: "#ffffff"
        slider: "#0000ff"

        
        active_ws: "#DFD0B8"
        occupied_ws: "#948979"
        empty_ws: "#948979"
    }

    readonly property MyPalette sand: MyPalette {
        bar_background: "#0f0f0f"
        primary_container: "#ff0000"
        secondary_container: "#00ff00"
        text: "#DFD0B8"
        slider: "#DFD0B8"

        
        active_ws: "#DFD0B8"
        occupied_ws: "#948979"
        empty_ws: "#948979"
    }

    readonly property MyPalette blackWhite: MyPalette {
        bar_background: "#000000"
        primary_container: "#e6e6e6"
        secondary_container: "#b5b5b5"
        text: "#1b1b1b"
        slider: "#7a7a7a"

        active_ws: "#1b1b1b"
        occupied_ws: "#7a7a7a"
        empty_ws: "#c2c2c2"
    }

}
