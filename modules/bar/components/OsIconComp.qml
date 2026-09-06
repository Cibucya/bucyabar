import QtQuick
import Quickshell
import qs.config
import qs.widgets

Item {
	id: root
	implicitWidth: icon.implicitWidth
	implicitHeight: icon.implicitHeight
	Text {
		id: icon
		text: Icons.osIcons.hyprland
		anchors.centerIn: parent
		color: Appearance.text
		font.family: Appearance.font.family.nerd
		font.pixelSize: Appearance.font.size.largest
	}
}

