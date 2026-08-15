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
			anchors { top: true; left: true; right: true }
			implicitHeight: BarConf.barHeight + BarConf.screenSeparator.height
			//color: AppearanceConf.alpha(AppearanceConf.bg, 0.0)
			color: AppearanceConf.alpha(AppearanceConf.bg, 0.9)

			Rectangle {
				height: BarConf.screenSeparator.height
				color: BarConf.screenSeparator.color

				anchors.bottom: parent.bottom
				anchors.left: parent.left
				anchors.right: parent.right
			}
			//color: "#FF000050"
			
			// Left section
			RowLayout {
				anchors {
					left: parent.left
					leftMargin: AppearanceConf.padding.large
					verticalCenter: parent.verticalCenter
				}
				spacing: BarConf.spacing.def
				
				// Arch logo
				Text {
					text: ""
					color: AppearanceConf.text
					font.family: AppearanceConf.font.family.nerd
					font.pixelSize: AppearanceConf.font.size.large
				}
			}
			
			// Center section (absolutely positioned)
			RowLayout {
				anchors.centerIn: parent
				spacing: BarConf.spacing.def
				SearchWrapper {}
			}
			
			// Right section
			RowLayout {
				anchors {
					right: parent.right
					rightMargin: AppearanceConf.padding.large
					verticalCenter: parent.verticalCenter
				}
				spacing: BarConf.spacing.def
				/*
				PulseButton {
					StyledRect {
						color: "transparent"
						implicitWidth: text.implicitWidth + 10
						implicitHeight: text.implicitHeight
						Text {
							id: text
							text: "test"
							color: "white"
							anchors.centerIn: parent
							font.pointSize: 14
						}
					}
				}
				*/
				VolumeComp {}
				NetworkComp {}
				BluetoothComp {}
				Clock {}
			}
		}
	}
}
