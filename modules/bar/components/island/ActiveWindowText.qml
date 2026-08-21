import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.config
import qs.components
import qs.services

Item {
	id: root

	implicitWidth: activeWindowTitle.implicitWidth
	implicitHeight: activeWindowTitle.implicitHeight

	Text {
		id: activeWindowTitle
		visible: BarConf.status.showActiveWindowTitle
		font.family: AppearanceConf.font.family.sans
		font.pixelSize: AppearanceConf.font.size.larger
		color: AppearanceConf.text

		text: (Hypr.activeToplevelClass == "" ? "desktop" : Hypr.activeToplevelClass)
		font.italic: text === "desktop"
	}
}
