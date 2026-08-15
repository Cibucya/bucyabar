import QtQuick
import Quickshell
import qs.config

Item {
	id: root
	
	// Allow the user to click and define what happens
	signal clicked()

	// Let the user choose which item shrinks (Icon? Label? Both?)
	property Item shrinkTarget: null

	implicitWidth: container.implicitWidth
	implicitHeight: container.implicitHeight

	default property alias content: container.data

	StyledRect {
		id: bg
		anchors.fill: parent

		// The white flash overlay
		// This sits on top of background but below the content
		Rectangle {
			id: flashOverlay
			anchors.fill: parent
			radius: bg.radius
			color: "white"
			opacity: 0 // Invisible by default
		}
	}

	// The container for Icon/Text
	Item {
		id: container
		anchors.centerIn: parent
		implicitWidth: childrenRect.width
		implicitHeight: childrenRect.height
	}

	// Animation Logic
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
				to: 0.85
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

		// default hover animations
		onEntered: {
			button.border.width = 2;
		}
		onExited: {
			button.border.width = 0;
		}
	}
}
