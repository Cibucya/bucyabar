pragma Singelton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
	id: root

	readonly property alias volume: Pipewire.defaultAudioSink?.audio.volume

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink]
	}
}
