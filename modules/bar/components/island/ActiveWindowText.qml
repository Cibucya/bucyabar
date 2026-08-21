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

	Connections {
		target: Hyprland

		function onActiveToplevelChanged() {
			Hyprland.refreshToplevels()
		}

		function onToplevelsChanged() {
			activeWindowTitle.updateTrigger = !activeWindowTitle.updateTrigger
		}

		function onFocusedWorkspaceChanged() {
			Hyprland.refreshToplevels()
			activeWindowTitle.updateTrigger = !activeWindowTitle.updateTrigger
		}
	}

	Text {
		id: activeWindowTitle
		visible: BarConf.status.showActiveWindowTitle
		font.family: AppearanceConf.font.family.sans
		font.pixelSize: AppearanceConf.font.size.larger
		color: AppearanceConf.alpha(AppearanceConf.text, 1.0)
		property bool updateTrigger: false

		text: {
			let dummy = updateTrigger;
			let monitor = Hyprland.focusedMonitor;
			if (monitor && monitor.activeWorkspace && monitor.activeWorkspace.lastIpcObject) {
				if (monitor.activeWorkspace.lastIpcObject.windows === 0) {
					return "desktop"
				}
			}

			let toplevel = Hyprland.activeToplevel;
			if (!toplevel) return "desktop";

			if (toplevel.class) return toplevel.class;
			if (toplevel.lastIpcObject && toplevel.lastIpcObject.class) {
				return toplevel.lastIpcObject.class;
			}

			return "Unknown application";
		}
		font.italic: text === "desktop"
	}
}
