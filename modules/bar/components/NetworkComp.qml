import Quickshell
import QtQuick
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

		implicitHeight: networkIcon.implicitHeight + Appearance.padding.def
		implicitWidth: implicitHeight
		anchors.centerIn: parent

		PulseButton {
			anchors.centerIn: parent
			shrinkTarget: networkIcon

			StyledRect {
				id: button

				animate: true
				animBorderDuration: Appearance.anim.duration.faster

				color: "transparent"

				// Square
				implicitHeight: networkIcon.implicitHeight + Appearance.padding.smallest
				implicitWidth: implicitHeight

				//anchors.centerIn: parent

				MaterialIcon {
					id: networkIcon
					visible: BarConf.status.showNetwork
					anchors.centerIn: parent
					text: Network.active ? Icons.getNetworkIcon(Network.active.strength ?? 0) : "signal_wifi_off"
					color: Appearance.text
					transformOrigin: Item.Center
				}
			}

			MouseArea {
				//anchors.fill: button
				hoverEnabled: true

				onClicked: menuVisibility = !menuVisibility;
				onEntered: button.border.width = 2;
				onExited: button.border.width = 0;
			}
		}
	}
}
