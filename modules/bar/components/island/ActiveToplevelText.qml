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
		font.family: Appearance.font.family.sans
		font.pixelSize: Appearance.font.size.larger
		color: Appearance.colours.light

		// TODO: fix text for an empty special workspace
		text: {
			const t = Hypr.activeToplevelInitialTitle;
			const capitalize = IslandConf.capitalizeActiveToplevelText
			if (t) return (capitalize ? t.charAt(0).toUpperCase() + t.slice(1) : t);

			const specialName = Hypr.focusedMonitor?.lastIpcObject.specialWorkspace.name;
			const isSpecial = specialName && specialName.startsWith("special:");
			if (capitalize) return isSpecial ? "Special" : "Desktop";
			else			return isSpecial ? "special" : "desktop";
		}

		font.italic:{
			const t = text.toLowerCase();
			return t == "desktop" || t == "special"
		}
	}
}
