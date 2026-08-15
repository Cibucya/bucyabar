import Quickshell
import Quickshell.Io
import QtQuick 2.15

import qs.config
import qs.widgets
import qs.components

Item {
	id: root

	implicitWidth: wrapper.implicitWidth
	implicitHeight: wrapper.implicitHeight

	Item {
		id: wrapper

		implicitHeight: button.implicitHeight
		implicitWidth: button.implicitWidth
		anchors.centerIn: parent

		PulseButton {
			anchors.centerIn: parent
			shrinkTarget: buttonIcon

			StyledRect {
				id: button

				animate: true
				animBorderDuration: AppearanceConf.anim.duration.faster

				// Square
				implicitHeight: buttonIcon.implicitHeight + AppearanceConf.padding.smallest
				implicitWidth: implicitHeight

				anchors.centerIn: parent

				MaterialIcon {
					id: buttonIcon
					visible: BarConf.status.showBluetooth
					anchors.centerIn: parent
					text: "bluetooth"
					color: AppearanceConf.text
					transformOrigin: Item.Center
				}
			}

			onClicked: {
				connectProcess.running = true;
			}
		}
	}

	Process {
		id: connectProcess
		command: ["/home/bucya/scripts/bluetooth_preferences.sh"]
		stdout: StdioCollector {
			onStreamFinished: console.log(`line read: ${this.text}`)
		}
	}
}
