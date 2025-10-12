pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property var dump: (obj, depth = 0, seen = new WeakSet()) => {
        const indent = "  ".repeat(depth)

        if (obj === null)
            return indent + "null\n"
        if (typeof obj !== "object")
            return indent + obj + "\n"
        if (seen.has(obj))
            return indent + "[Circular]\n"
        seen.add(obj)

        let output = indent + "{\n"
        for (let key in obj) {
            try {
                const value = obj[key]
                if (typeof value === "object")
                    output += indent + "  " + key + ": " + dump(value, depth + 1, seen)
                else
                    output += indent + "  " + key + ": " + value + "\n"
            } catch (e) {
                output += indent + "  " + key + ": [Error: " + e + "]\n"
            }
        }
        output += indent + "}\n"
        return output
    }
}
