import Quickshell
import QtQuick 2.15

import qs.config
import qs.components

Item {
	id: root

	StyledRect {
		id: background

		visible: BarConf.status.showSearch

		anchors.centerIn: parent

		implicitHeight: BarConf.barHeight - AppearanceConf.padding.small
		implicitWidth: activeWindow.implicitWidth + AppearanceConf.padding.large * 2
		clip: true

		animate: true

		color: "transparent"
		border.color: AppearanceConf.getColor("text", 0.3)
		border.width: 1

		Item {
			id: activeWindowContainer
			anchors.centerIn: parent
			implicitWidth: activeWindow.width
			implicitHeight: activeWindow.height

			property real animationProgress: 0

			ActiveWindow {
				id: activeWindow

				anchors.centerIn: parent
				anchors.verticalCenterOffset: titleHeight * (1 - activeWindowContainer.animationProgress)

				opacity: activeWindowContainer.animationProgress
			}

			NumberAnimation {
				id: scrollUpAnimation
				target: activeWindowContainer
				property: "animationProgress"
				from: 0
				to: 1
				duration: background.implicitWidthAnimation.duration
				easing.type: Easing.OutCubic
			}
		}

		MouseArea {
			anchors.fill: background
			hoverEnabled: true

			onEntered: {
				background.border.width = 4
			}

			onExited: {
				background.border.width = 1
			}
		}

		Component.onCompleted: {
			if (visible) {
				scrollUpAnimation.start()
			}
		}

		onVisibleChanged: {
			if (visible) {
				activeWindowContainer.animationProgress = 0;
				scrollUpAnimation.start()
			}
		}
	}
}
