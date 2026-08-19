import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

import qs.config
import qs.components
import qs.widgets

// Use Item or RowLayout as the root so the parent layout can see its size
RowLayout {
	id: root

	// Move logic inside
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	// Use property aliases or local properties for config if needed
	spacing: 5
	implicitWidth: volumeIcon.implicitWidth + volumeBackground.implicitWidth + spacing
	implicitHeight: BarConf.barHeight

	MaterialIcon {
		id: volumeIcon

		readonly property var audio: Pipewire.defaultAudioSink?.audio
		readonly property bool isMuted: audio?.muted ?? false
		readonly property real vol: audio?.volume ?? 0

		text: {
			if (isMuted || vol < 0.001) return "volume_off"
			if (vol < 0.5) return "volume_down"
			return "volume_up"
		}

		color: {
			if (isMuted || vol < 0.001) return AppearanceConf.colors.mute
			return AppearanceConf.text
		}

		anchors.verticalCenter: parent.verticalCenter
		font.pointSize: AppearanceConf.font.size.larger
	}

	Rectangle {
		id: volumeBackground
		Layout.fillWidth: true
		// Ensure this has a fixed or implicit width
		implicitWidth: BarConf.volumeBarWidth || 125
		implicitHeight: BarConf.volumeBarHeight || 4
		radius: height/2
		color: AppearanceConf.bg
		//color: "#50ffffff"

		StyledRect {
			id: volumeStatus

			animate: true
			animWidthDuration: AppearanceConf.anim.duration.longest

			implicitHeight: parent.implicitHeight
			color: "white"
			anchors {
				left: parent.left
				top: parent.top
				bottom: parent.bottom
			}

			implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
			radius: height/2
		}
	}
}
