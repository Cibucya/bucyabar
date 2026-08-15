import Quickshell
import QtQuick

import qs.config

Rectangle {
	id: root

	property bool animate: true
	property int animBorderDuration: AppearanceConf.defaultAnimDuration
	property int animWidthDuration: AppearanceConf.defaultAnimDuration

	color: "transparent"
	radius: AppearanceConf.rounding.small
	border.color: AppearanceConf.getColor("bg", 0.5)
	border.width: 0

	Behavior on border.width {
		id: borderAnimation
		enabled: animate
		NumberAnimation {
			duration: animBorderDuration
			easing.type: Easing.BezierSpline
			easing.bezierCurve: AppearanceConf.anim.curves.standartAccel
		}
	}

	Behavior on implicitWidth {
		id: implicitWidthAnimation
		enabled: animate
		NumberAnimation {
			duration: animWidthDuration
			easing.type: Easing.BezierSpline
			easing.bezierCurve: AppearanceConf.anim.curves.emphasizedDecel
		}
	}
}
