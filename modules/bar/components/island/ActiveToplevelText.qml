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

		// TODO: fix text for an empty special workspace
		text: {
			if (Hypr.activeToplevelClass) return Hypr.activeToplevelClass;

			const specialName = Hypr.focusedMonitor?.lastIpcObject.specialWorkspace.name;
			const isSpecial = specialName && specialName.startsWith("special:");
			return isSpecial ? "special" : "desktop";
		}

		font.italic: text === "desktop" || text === "special"
	}
}
