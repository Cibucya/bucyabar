import QtQuick
import Quickshell
import qs.config
import qs.widgets

Item {
	id: root
	Text {
		id: icon
		text: Icons.osIcons.hyprland
		color: Appearance.text
		font.family: Appearance.font.family.nerd
		font.pixelSize: Appearance.font.size.largest
	}
}

