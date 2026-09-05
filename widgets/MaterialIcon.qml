import QtQuick

import qs.services
import qs.config

Text {
    property real fill
    property int grade: 0

    font.family: Appearance.font.family.material
    font.pointSize: Appearance.font.size.small
    font.variableAxes: ({
		FILL: fill.toFixed(1),
		GRAD: grade,
		opsz: fontInfo.pixelSize,
		wght: fontInfo.weight
	})
}
