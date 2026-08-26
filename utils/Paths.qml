import QtQuick
import Quickshell

Singleton {
	id: root

	readonly property string home: Quickshell.env("HOME")
	readonly property string xdgDataHome: Quickshell.env("XDG_DATA_HOME") || `${home}/.local/share`

	readonly property string state: `${Quickshell.env("XDG_STATE_HOME") || `${home}/.local/state`}/bucyabar`
	readonly property var desktopDirs: [
		`${xdgDataHome}/applications`,
		"/usr/local/share/applications",
		"/usr/share/applications",
		`${home}/.local/share/flatpak/exports/share/applications`,
		"/var/lib/flatpak/exports/share/applications"
	]
}
