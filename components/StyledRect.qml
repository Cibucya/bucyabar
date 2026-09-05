import Quickshell
import QtQuick

import qs.config

Rectangle {
	id: root

	property bool animate: true
	property int animBorderDuration: Appearance.defaultAnimDuration
	property int animWidthDuration: Appearance.defaultAnimDuration

	radius: Appearance.rounding.small
	border.color: Appearance.alpha(Appearance.colours.light, 0.5)
	border.width: 0

	Behavior on border.width {
		id: borderAnimation
		enabled: animate
		NumberAnimation {
			duration: animBorderDuration
			easing.type: Easing.BezierSpline
			easing.bezierCurve: Appearance.anim.curves.standartAccel
		}
	}

	Behavior on implicitWidth {
		id: implicitWidthAnimation
		enabled: animate
		NumberAnimation {
			duration: animWidthDuration
			easing.type: Easing.BezierSpline
			easing.bezierCurve: Appearance.anim.curves.emphasizedDecel
		}
	}
}
