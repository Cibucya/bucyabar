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
			color: Appearance.alpha(Appearance.colors.light, 0.0)

			Rectangle {
				visible: BarConf.screenSeparator.show
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
					leftMargin: Appearance.padding.largest
					verticalCenter: parent.verticalCenter
				}
				spacing: BarConf.spacing.def

				Text {
					text: Icons.osIcons.hyprland
					color: Appearance.text
					font.family: Appearance.font.family.nerd
					font.pixelSize: Appearance.font.size.largest
				}
			}
			
			// Center section (absolutely positioned)
			RowLayout {
				anchors.centerIn: parent
				spacing: BarConf.spacing.def
				IslandWrapper {}
			}
			
			// Right section
			RowLayout {
				anchors {
					right: parent.right
					rightMargin: Appearance.padding.largest
					verticalCenter: parent.verticalCenter
				}
				spacing: BarConf.spacing.def
				Rectangle {
					id: rightSectionBackground
					color: Appearance.colors.black
					radius: Appearance.rounding.round

					Layout.alignment: Qt.AlignVCenter
					Layout.preferredWidth: innerLayout.width + Appearance.padding.largest * 2
					Layout.preferredHeight: innerLayout.height

					RowLayout {
						id: innerLayout
						spacing: BarConf.spacing.def
						anchors.centerIn: parent
						//Layout.alignment: Qt.AlignVCenter

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
						ClockComp {}
					}
				}
			}
		}
	}
}
