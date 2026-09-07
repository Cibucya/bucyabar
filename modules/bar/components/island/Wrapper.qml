import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import qs.components

Item {
	id: root

	implicitWidth: wrapper.implicitWidth
	implicitHeight: wrapper.implicitHeight

	Rectangle {
		id: wrapper

		anchors.centerIn: parent

		implicitHeight: layout.implicitHeight
		implicitWidth: layout.implicitWidth
		color: "transparent"

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
	}
}
