import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config
import qs.services
import qs.components
import qs.widgets

import "components"

Scope {
	Variants {
		model: Quickshell.screens
		PanelWindow {
			id: mainWindow
			required property var modelData
			screen: modelData

			color: Appearance.alpha(Appearance.colours.light, 0.0)
			anchors { top: true; left: true; right: true }
			implicitHeight: {
				let height = BarConf.barHeight
				let padding = Appearance.padding.smallest
				let sep = BarConf.screenSeparator.height
				let sepShow = BarConf.screenSeparator.show

				return height + padding + (sepShow ? sep : 0)
			}

			Rectangle {
				id: screenSeparatorRect
				visible: BarConf.screenSeparator.show

				color: BarConf.screenSeparator.color
				implicitHeight: BarConf.screenSeparator.height

				anchors {
					bottom: parent.bottom
					left: parent.left
					right: parent.right
				}
			}

			// Left section
			Rectangle {
				id: leftSectionWrapper

				visible: leftLayout.implicitWidth > 0 && leftLayout.implicitHeight > 0

				color: Appearance.colours.black
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0

				implicitHeight: BarConf.barHeight
				implicitWidth: leftLayout.implicitWidth + Appearance.padding.def * 2
				radius: (implicitHeight / 2) - 1

				anchors {
					left: parent.left
					bottom: parent.bottom
					leftMargin: Appearance.padding.largest
				}

				RowLayout {
					id: leftLayout
					spacing: BarConf.spacing.def
					anchors.centerIn: parent

					OsIconComp {}
				}
			}

			// Center section
			StyledRect {
				id: centerSectionWrapper

				visible: centerLayout.implicitWidth > 0 && centerLayout.implicitHeight > 0

				color: Appearance.colours.black
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0

				implicitWidth: centerLayout.implicitWidth + Appearance.padding.def * 2
				implicitHeight: BarConf.barHeight
				radius: (implicitHeight / 2) - 1
				clip: true
				animate: true

				anchors {
					bottom: parent.bottom
					horizontalCenter: parent.horizontalCenter
				}

				RowLayout {
					id: centerLayout
					spacing: BarConf.spacing.def
					anchors.centerIn: parent

					IslandWrapper {
						visible: BarConf.status.showIsland
					}
				}
			}

			// Right section
			Rectangle {
				id: rightSectionWrapper

				visible: rightLayout.implicitWidth > 0 && rightLayout.implicitHeight > 0

				color: Appearance.colours.black
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0

				implicitWidth: rightLayout.implicitWidth + Appearance.padding.def * 2
				implicitHeight: BarConf.barHeight
				radius: (implicitHeight / 2) - 1

				anchors {
					right: parent.right
					bottom: parent.bottom
					rightMargin: Appearance.padding.largest
				}

				RowLayout {
					id: rightLayout
					spacing: BarConf.spacing.def
					anchors.centerIn: parent

					VolumeComp { visible: BarConf.status.showVolume }
					NetworkComp { visible: BarConf.status.showNetwork }
					BluetoothComp { visible: BarConf.status.showBluetooth }
					ClockComp { visible: BarConf.status.showClock }
				}
			}
		}
	}
}
