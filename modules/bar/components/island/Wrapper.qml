import Quickshell
import QtQuick 2.15

import qs.config
import qs.components

Item {
	id: root

	StyledRect {
		id: background

		visible: BarConf.status.showIsland

		anchors.centerIn: parent

		implicitHeight: BarConf.barHeight - AppearanceConf.padding.small
		implicitWidth: activeWindow.implicitWidth + AppearanceConf.padding.smaller * 2
		clip: true

		animate: true

		color: "transparent"
		border.color: AppearanceConf.alpha(AppearanceConf.text, 0.3)
		border.width: 2

		Item {
			id: activeWindowContainer
			anchors.centerIn: parent
			implicitWidth: activeWindow.width
			implicitHeight: activeWindow.height

			ActiveWindowText {
				id: activeWindow

				anchors.centerIn: parent
			}
		}

		MouseArea {
			anchors.fill: background
			hoverEnabled: true

			onEntered: {
				background.border.width = 3
			}

			onExited: {
				background.border.width = 2
			}
		}
	}
}
