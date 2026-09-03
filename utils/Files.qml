pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.utils

Singleton {
	// Calls callback funciton when the process is done
	function getDotDesktop(pid: string, callback: var) {
		findDotDesktopProcess.currentCallback = callback
		findDotDesktopProcess.command = [
			"sh",
			"-c",
			`PID=${pid};`+
			`EXE=$(basename $(readlink -f /proc/$PID/exe));` +
			`grep -rlE "^Exec=([^ ]*/)?$EXE( |$)" /usr/share/applications/ ~/.local/share/applications/`
		]
		findDotDesktopProcess.running = true
	}

	property Process findDotDesktopProcess: Process {
		id: proc
		property var currentCallback: null

		stdout: SplitParser {
			onRead: data => {
				if (proc.currentCallback) {
					proc.currentCallback(data.trim())
				}
			}
		}

		onExited: {
			proc.currentCallback = null
		}
	}
}
