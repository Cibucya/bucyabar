import QtQuick
import Quickshell
import qs.components
import qs.config

Scope {
	PanelWindow {
		id: mainWindow

		anchors: { top: true; bottom: true; left: true; right: true; }

		implicitHeight: content.implicitHeight
		implicitWidth: content.implicitWidth
		color: "transparent"

		StyledRect {
			id: content

			implicitHeight: 500
			implicitWidth: 800
			anchors {
				top: parent.top
				left: parent.left
				topMargin: 40
				leftMargin: 40
			}

			animate: true
			color: AppearanceConf.colors.light
		}
	}
}
