pragma Singleton

import QtQuick 2.15
import Quickshell

Singleton {
    id: root

    readonly property bool isDark: true

    readonly property color bg: isDark ? colors.dark : colors.light
    readonly property color text: isDark ? colors.light : colors.dark

    // Helper for applying alpha declaratively without manual RGB math
    function alpha(c: color, a: real): color {
        return Qt.color(c, a)
    }

    // --- Design Tokens ---
    readonly property Padding padding: Padding {}
    readonly property Rounding rounding: Rounding {}
    readonly property FontProps font: FontProps {}
    readonly property Colors colors: Colors {}
    readonly property Animation anim: Animation {}
    readonly property int defaultAnimDuration: anim.duration.faster

    component Padding: QtObject {
        readonly property int smallest: 4
        readonly property int small: 5
        readonly property int smaller: 8
        readonly property int def: 10
        readonly property int larger: 12
        readonly property int large: 14
        readonly property int largest: 16
    }

    component Rounding: QtObject {
        readonly property int small: 8
        readonly property int def: 17
        readonly property int large: 25
        readonly property int full: 1000
    }

    component FontFamily: QtObject {
        readonly property string sans: "AnonymicePro Nerd Font Mono"
        readonly property string mono: "AnonymicePro Nerd Font Mono"
        readonly property string nerd: "AnonymicePro Nerd Font"
        readonly property string material: "Material Symbols Rounded"
        readonly property string clock: "Inter 18pt"
    }

    component FontSize: QtObject {
        readonly property int small: 12
        readonly property int smaller: 13
        readonly property int def: 14
        readonly property int larger: 16
        readonly property int large: 18
    }

    component FontProps: QtObject {
        readonly property FontFamily family: FontFamily {}
        readonly property FontSize size: FontSize {}
    }

    component Colors: QtObject {
        readonly property color bright: "#ffffff"
        readonly property color dark: "#343f3e"
    }

    component AnimCurves: QtObject {
        readonly property var emphasized: [0.05, 0, 2 / 15, 0.06, 1 / 6, 0.4, 5 / 24, 0.82, 0.25, 1, 1, 1]
        readonly property var emphasizedAccel: [0.3, 0, 0.8, 0.15, 1, 1]
        readonly property var emphasizedDecel: [0.05, 0.7, 0.1, 1, 1, 1]
        readonly property var standart: [0.2, 0, 0, 1, 1, 1]
        readonly property var standartAccel: [0.3, 0, 1, 1, 1, 1]
        readonly property var standartDecel: [0, 0, 0, 1, 1, 1]
        readonly property var expressiveFastSpatial: [0.42, 1.67, 0.21, 0.9, 1, 1]
        readonly property var expressiveDefaultSpatial: [0.38, 1.21, 0.22, 1, 1, 1]
        readonly property var expressiveEffects: [0.34, 0.8, 0.34, 1, 1, 1]
    }

    component AnimDurations: QtObject {
        readonly property int fastest: 40
        readonly property int fast: 50
        readonly property int faster: 100
        readonly property int def: 150
        readonly property int longer: 250
        readonly property int longest: 400
    }

    component Animation: QtObject {
        readonly property AnimCurves curves: AnimCurves {}
        readonly property AnimDurations duration: AnimDurations {}
    }
}
