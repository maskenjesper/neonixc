import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config

Item {
    id: root
    property string appId: ""
    property int size: 24

    width: size
    height: size

    Rectangle {
        id: placeholder
        anchors.fill: parent
        color: ColorsConfig.palette.primary_container
        radius: root.size / 2
        visible: false
    }

    ClippingWrapperRectangle {
        radius: height/3
        anchors.fill: parent
        color: ColorsConfig.palette.secondary_container
        Image {
            id: img

            anchors.fill: parent
            anchors.margins: -1
            fillMode: Image.PreserveAspectFit
            smooth: true

            
            source: {
                let rawId = root.appId
                let normalizedId = root.appId.split(".").pop()
                
                let entry = DesktopEntries.byId(rawId)
                if (entry === null) entry = DesktopEntries.byId(normalizedId)
                if (entry === null) entry = DesktopEntries.heuristicLookup(rawId)
                if (entry === null) entry = DesktopEntries.heuristicLookup(normalizedId)
                if (entry === null) {
                    placeholder.visible = true
                    return ""
                }

                let iconPath = Quickshell.iconPath(entry.icon, true)

                if (iconPath === "") {
                    placeholder.visible = true
                    return ""
                }

                return iconPath
            }
        }
    }
}
