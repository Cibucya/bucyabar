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
		implicitHeight: BarConf.barHeight - AppearanceConf.padding.small
		implicitWidth: layout.implicitWidth + (AppearanceConf.padding.def * 2)
		color: AppearanceConf.colors.darker
		radius: AppearanceConf.rounding.round
		clip: true

		animate: true

		border.color: AppearanceConf.alpha(AppearanceConf.text, 0.3)
		border.width: 2

		RowLayout {
			id: layout

			anchors.centerIn: parent
			anchors.leftMargin : AppearanceConf.padding.smaller
			anchors.rightMargin : AppearanceConf.padding.smaller
			spacing: AppearanceConf.padding.small

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

			onEntered: background.border.width = 3
			onExited: background.border.width = 2
		}
	}
}
