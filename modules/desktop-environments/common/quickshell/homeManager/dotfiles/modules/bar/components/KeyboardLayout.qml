pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io
import QtQuick
import qs.services
import qs.config

Item {
    id: root
    property string time

    Text {
        id: timeText
        anchors.centerIn: parent

        color: "ffddaa"

        font.pointSize: 1 + root.height * 0.5
        text: root.time
    }

    Process {
        id: dateProc
        command: ["setxkbmap -query | grep layout | awk '{print $2}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
