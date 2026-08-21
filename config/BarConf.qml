pragma Singleton

import QtQuick
import Quickshell
import qs.config

Singleton {
	id: root

	readonly property Spacing spacing: Spacing {}
	readonly property int barHeight: 30
	readonly property real barOpacity: 0.4
	readonly property int networkMenuWidth: 250
	readonly property int volumeBarWidth: 125
	readonly property int volumeBarHeight: 3
	readonly property Status status: Status {}
	readonly property ScreenSeparator screenSeparator: ScreenSeparator {}


	component Spacing: QtObject {
		readonly property int small: 15
		readonly property int def:   20
		readonly property int large: 25
	}

	component Status: QtObject {
		readonly property bool showNetwork: true
		readonly property bool showBluetooth: true
		readonly property bool showIsland: true
		readonly property bool showActiveWindowTitle: true
		readonly property bool showVolume: true
	}

	component ScreenSeparator: QtObject {
		readonly property int height: 1
		readonly property string color: AppearanceConf.alpha(AppearanceConf.colors.bright, 0.1);
	}
}
