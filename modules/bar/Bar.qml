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
			color: Appearance.alpha(Appearance.colours.light, 0.0)

			Rectangle {
				id: screenSeparatorRect
				visible: BarConf.screenSeparator.show
				height: BarConf.screenSeparator.height
				color: BarConf.screenSeparator.color

				anchors {
					bottom: parent.bottom
					left: parent.left
					right: parent.right
				}
			}

			// Left section
			Rectangle {
				id: leftSectionWrapper
				color: Appearance.colours.black
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0

				/*
				implicitWidth: leftLayout.implicitWidth + Appearance.padding.smaller * 2
				implicitHeight: leftLayout.implicitHeight + Appearance.padding.smallest * 2
				radius: Appearance.rounding.round
				*/
				implicitHeight: leftLayout.implicitHeight + Appearance.padding.small * 2
				implicitWidth: implicitHeight
				radius: (implicitHeight / 2) - 1

				anchors {
					left: parent.left
					bottom: parent.bottom
					leftMargin: Appearance.padding.largest
					//verticalCenter: parent.verticalCenter
				}

				RowLayout {
					id: leftLayout
					spacing: BarConf.spacing.def
					anchors.centerIn: parent

					OsIconComp {}
				}
			}
			
			// Center section
			Rectangle {
				id: centerSectionWrapper
				// Island manages it's own background
				// TODO: this is probably a bad design decision since now its
				// hard to take out the "bar background" into the
				// configuration", consider moving the island background into
				// this file or take a look at other ways of handling the island
				// background
				color: "transparent"
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0
				radius: Appearance.rounding.round

				implicitWidth: centerLayout.implicitWidth + Appearance.padding.largest * 2
				implicitHeight: centerLayout.implicitHeight

				anchors {
					bottom: parent.bottom
					horizontalCenter: parent.horizontalCenter
				}

				RowLayout {
					id: centerLayout
					spacing: BarConf.spacing.def
					anchors.centerIn: parent

					IslandWrapper {}
				}
			}

			// Right section
			Rectangle {
				id: rightSectionWrapper
				color: Appearance.colours.black
				border.color: Appearance.alpha(Appearance.colours.light, 0.1)
				border.width: 0

				implicitWidth: rightLayout.implicitWidth + Appearance.padding.def * 2
				implicitHeight: rightLayout.implicitHeight
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

					VolumeComp {}
					NetworkComp {}
					BluetoothComp {}
					ClockComp {}
				}
			}
		}
	}
}
