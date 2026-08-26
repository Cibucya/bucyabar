import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services

Item {
	id: root

	implicitWidth: activeToplevelIcon.implicitWidth
	implicitHeight: activeToplevelIcon.implicitHeight

	IconImage {
		id: activeToplevelIcon

		anchors.centerIn: parent;
		source: {
			const appId = Hypr.activeToplevelAppId;
			if (!appId) return "";
			return Quickshell.iconPath(appId, "application-x-executable")
		}

		implicitSize: source == "" ? 0 : IslandConf.activeToplevelIconSize
		mipmap: true
	}
}
