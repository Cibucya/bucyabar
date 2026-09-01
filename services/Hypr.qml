pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.utils

Singleton {
	id: root

	readonly property var toplevels: Hyprland.toplevels
	readonly property var workspaces: Hyprland.workspaces
	readonly property var monitors: Hyprland.monitors
	readonly property HyprlandWorkspace focusedWorkspace: Hyprland.focusedWorkspace
	readonly property HyprlandMonitor focusedMonitor: Hyprland.focusedMonitor

	readonly property HyprlandToplevel activeToplevel: {
		const t = Hyprland.activeToplevel;
		return t?.workspace?.name.startsWith("special:") || Hyprland.focusedWorkspace?.toplevels.values.length > 0 ? t : null;
	}

	readonly property string activeToplevelClass: {
		let t = activeToplevel;
		if (!t) return "";
		return t.class || t.lastIpcObject?.class || "";
	}

	readonly property string activeToplevelTitle: {
		let t = activeToplevel;
		if (!t) return "";
		return t.title || t.lastIpcObject?.title || "";
	}

	readonly property string activeToplevelInitialTitle: {
		let t = activeToplevel;
		if (!t) return "";
		return t.lastIpcObject?.initialTitle || "";
	}

	readonly property string activeToplevelAppId: {
		let t = activeToplevel;
		if (!t) return "";

		return t.appId
			?? t.class
			?? t.lastIpcObject?.app_id
			?? t.lastIpcObject?.class
			?? "";
	}

	Connections {
		function onRawEvent(event: HyprlandEvent): void {
			const n = event.name;
			if (n.endsWith("v2"))
				return;

			if (["workspace", "moveworkspace", "activespecial", "focusedmon"].includes(n)) {
				Hyprland.refreshWorkspaces();
				Hyprland.refreshMonitors();
			} else if (["openwindow", "closewindow", "movewindow"].includes(n)) {
				Hyprland.refreshToplevels();
				Hyprland.refreshWorkspaces();
			} else if (n.includes("mon")) {
				Hyprland.refreshMonitors();
			} else if (n.includes("workspace")) {
				Hyprland.refreshWorkspaces();
			} else if (n.includes("window") || n.includes("group") || ["pin", "fullscreen", "changefloatingmode", "minimize"].includes(n)) {
				Hyprland.refreshToplevels();
			}
		}

		target: Hyprland
	}
}
