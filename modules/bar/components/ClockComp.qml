import QtQuick

import qs.config
import qs.services

Item {
	id: wrapper
	implicitWidth: widestMeasurement.width
	implicitHeight: clock.implicitHeight

	TextMetrics {
		id: widestMeasurement
		font: clock.font
		// "8" is a standard 'torture test' for width.
		text: "88:88:88 AM"
	}

	Text {
		visible: true
		id: clock
		font.family: Appearance.font.family.sans
		font.pixelSize: Appearance.font.size.def
		color: Appearance.text

		font.features: { "tnum": 1 }

		text: Time.time
	}
}
