import Quickshell
import QtQuick 2.15
import qs.config
import qs.widgets
import qs.services
import qs.components

Item {
	id: root

	property bool menuVisibility: false

	implicitWidth: networkIcon.implicitWidth
	implicitHeight: networkIcon.implicitHeight

	Item {
		id: wrapper

		implicitHeight: networkIcon.implicitHeight + AppearanceConf.padding.def
		implicitWidth: implicitHeight
		anchors.centerIn: parent

		PulseButton {
			anchors.centerIn: parent
			shrinkTarget: networkIcon

			StyledRect {
				id: button

				animate: true
				animBorderDuration: AppearanceConf.anim.duration.faster

				// Square
				implicitHeight: networkIcon.implicitHeight + AppearanceConf.padding.smallest
				implicitWidth: implicitHeight

				anchors.centerIn: parent

				MaterialIcon {
					id: networkIcon
					visible: BarConf.status.showNetwork
					anchors.centerIn: parent
					text: Network.active ? Icons.getNetworkIcon(Network.active.strength ?? 0) : "signal_wifi_off"
					color: AppearanceConf.text
					transformOrigin: Item.Center
				}
			}

			MouseArea {
				anchors.fill: button
				hoverEnabled: true

				onClicked: menuVisibility = !menuVisibility;
				onEntered: button.border.width = 2;
				onExited: button.border.width = 0;
			}
		}
	}
}
