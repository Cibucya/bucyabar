import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config

Item {
	id: root

	signal clicked()
	property Item shrinkTarget: null

	implicitWidth: container.implicitWidth
	implicitHeight: container.implicitHeight

	default property alias content: container.data
	property int childrenSpacing: AppearanceConf.padding.smaller

	StyledRect {
		id: bg
		anchors.fill: parent

		Rectangle {
			id: flashOverlay
			anchors.fill: parent
			radius: bg.radius
			color: AppearanceConf.alpha("#ffffff", 0.3)
			opacity: 0
		}
	}

	// TODO: RowLayout fixes binding loop but creates another issue when
	// children can't set their own implicit dimensions
	RowLayout {
		id: container
		anchors.centerIn: parent
		spacing: childrenSpacing
	}

	SequentialAnimation {
		id: clickAnim

		ParallelAnimation {
			// Flash in
			NumberAnimation {
				target: flashOverlay
				property: "opacity"
				to: 0.8
				duration: AppearanceConf.anim.duration.fast
			}
			// Shrink in
			NumberAnimation {
				target: root.shrinkTarget ? root.shrinkTarget : container
				property: "scale"
				to: 0.75
				duration: AppearanceConf.anim.duration.fast
				easing.type: Easing.OutQuad
			}
		}

		ParallelAnimation {
			// Flash out
			NumberAnimation {
				target: flashOverlay
				property: "opacity"
				to: 0
				duration: AppearanceConf.defaultAnimDuration
			}
			// Grow back
			NumberAnimation {
				target: root.shrinkTarget ? root.shrinkTarget : container
				property: "scale"
				to: 1.0
				duration: AppearanceConf.defaultAnimDuration
				easing.type: Easing.OutBack
			}
		}
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onPressed: {
			clickAnim.restart()
			root.clicked()
		}

		onEntered: bg.border.width = 2
		onExited: bg.border.width = 0
	}
}
