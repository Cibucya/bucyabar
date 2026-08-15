import Quickshell
import Quickshell.Hyprland
import QtQuick 2.15

import qs.config
import qs.components

Item {
	id: root
	
	// Bind implicitWidth and implicitHeight to the text dimensions
	implicitWidth: activeWindowTitle.implicitWidth
	implicitHeight: activeWindowTitle.implicitHeight
	
	// Expose the text property for external access
	property alias title: activeWindowTitle.text
	property alias titleHeight: activeWindowTitle.height
	
	Text {
		id: activeWindowTitle
		visible: BarConf.status.showActiveWindowTitle
		font.family: AppearanceConf.font.family.mono
		font.pixelSize: AppearanceConf.font.size.larger
		color: AppearanceConf.getColor("text", 1.0)
		text: Hyprland.activeToplevel?.wayland?.activated ? Hyprland.activeToplevel.title || "" : "desktop"
		font.italic: text === "desktop"
	}
}
