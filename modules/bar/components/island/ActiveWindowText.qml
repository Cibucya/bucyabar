import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.config
import qs.components
import qs.services

Item {
	id: root

	implicitWidth: activeToplevelTitle.implicitWidth
	implicitHeight: activeToplevelTitle.implicitHeight

	Text {
		id: activeToplevelTitle
		visible: BarConf.status.showActiveToplevelTitle
		font.family: AppearanceConf.font.family.sans
		font.pixelSize: AppearanceConf.font.size.larger
		color: AppearanceConf.text

		text: (Hypr.activeToplevelClass == "" ? "desktop" : Hypr.activeToplevelAppId)
		font.italic: text === "desktop"
	}
}
