import Quickshell
import QtQuick

import "modules/bar"
import "modules/tests"

ShellRoot {
	Bar {}
	//RectTest {}

	/*
	PanelWindow {
		id: panel
		anchors: { top: true; left: true; }
		color: "transparent"

		implicitWidth: glass.Width
		implicitHeight: glass.Height

		mask: Region {
			item: glass
		}

		GlassTest {
			id: glass
			anchors.centerIn: parent
			//anchors: {top: parent.top; left: parent.left}
		}
	}
	*/
}
