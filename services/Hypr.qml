pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
	id: root

	readonly property var toplevels: Hyprland.toplevels
	readonly property var workspaces: Hyprland.workspaces
	readonly property var monitors: Hyprland.monitors

	// Helper to resolve activeToplevel
	readonly property var _activeToplevel: {
		let dummy = updateToplevelsTrigger;
		
		let monitor = Hyprland.focusedMonitor;
		if (monitor && monitor.activeWorkspace && monitor.activeWorkspace.lastIpcObject) {
			if (monitor.activeWorkspace.lastIpcObject.windows === 0) {
				return null
			}
		}
	
		return Hyprland.activeToplevel;
	}

	readonly property string activeToplevelClass: {
		let top = _activeToplevel;
		if (!top) return "";
		return top.class || top.lastIpcObject?.class || "";
	}

	readonly property string activeToplevelTitle: {
		let top = _activeToplevel;
		if (!top) return "";
		return top.title || top.lastIpcObject?.title || "";
	}

	readonly property string activeToplevelAppId: {
		let top = _activeToplevel;
		if (!top) return "";

		return top.appId
			?? top.class
			?? top.lastIpcObject?.app_id
			?? top.lastIpcObject?.class
			?? "";
	}

   property bool updateToplevelsTrigger: false

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
				root.updateToplevelsTrigger = !root.updateToplevelsTrigger
			} else if (n.includes("mon")) {
				Hyprland.refreshMonitors();
			} else if (n.includes("workspace")) {
				Hyprland.refreshWorkspaces();
			} else if (n.includes("window") || n.includes("group") || ["pin", "fullscreen", "changefloatingmode", "minimize"].includes(n)) {
				Hyprland.refreshToplevels();
				root.updateToplevelsTrigger = !root.updateToplevelsTrigger
			}
		}

		target: Hyprland
	}
}
