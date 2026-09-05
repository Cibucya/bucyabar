import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.components

Item {
	id: root

	implicitWidth: background.implicitWidth
	implicitHeight: background.implicitHeight

	StyledRect {
		id: background

		visible: BarConf.status.showIsland

		anchors.centerIn: parent

		// Use layout's implicit size plus padding
		implicitHeight: BarConf.barHeight - Appearance.padding.small
		implicitWidth: layout.implicitWidth + (Appearance.padding.def * 2)
		color: Appearance.alpha(Appearance.colours.black, 1.0)
		radius: Appearance.rounding.round
		clip: true

		animate: true

		border.color: Appearance.alpha(Appearance.text, 0.3)
		border.width: 0

		RowLayout {
			id: layout

			anchors.centerIn: parent
			anchors.leftMargin : Appearance.padding.smaller
			anchors.rightMargin : Appearance.padding.smaller
			spacing: Appearance.padding.small

			ActiveToplevelIcon {
				id: activeToplevelIcon
				visible: implicitWidth > 0 && implicitHeight > 0
				Layout.preferredWidth: activeToplevelIcon.implicitWidth
				Layout.preferredHeight: activeToplevelIcon.implicitHeight
				Layout.alignment: Qt.AlignVCenter
			}

			ActiveToplevelText {
				id: activeToplevelText
				visible: implicitWidth > 0 && implicitHeight > 0
				Layout.alignment: Qt.AlignVCenter
			}
		}

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true

			onEntered: background.border.width = 2
			onExited: background.border.width = 0
		}
	}
}
