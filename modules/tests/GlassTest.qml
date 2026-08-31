import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Item {
    id: root
    width: 400
    height: 300

    // 1. The Glass Panel Container
    Rectangle {
        id: glassPanel
        anchors.centerIn: parent
        width: 300
        height: 200
        radius: 16

        // Semi-transparent frosted fill
        color: Qt.rgba(1.0, 1.0, 1.0, 0.15)

        // 2. The Glass Edge Highlight (Border)
        // We overlay a 1px rounded border with a diagonal gradient highlight
        Rectangle {
            id: edgeHighlight
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.width: 1
            
            // Standard border properties don't support gradients directly on 'border.color',
            // so we mask a Gradient inside a border or use a custom Canvas/Shader.
            // Alternatively, a clean pure-QML technique uses a Gradient border overlay:
            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                color: "transparent"
                border.width: 1
                border.color: "white"
                opacity: 0.4
                
                // Subtle diagonal gradient mask via layer
                layer.enabled: true
                layer.effect: MultiEffect {
                    // Optional extra refinements
                }
            }
        }

        // 3. Simple & Direct Rim-Light Overlay Technique
        // A common industry approach: a top-left to bottom-right diagonal border
        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
            border.width: 1.5

            // Gradient rim simulating directional light
            border.color: Qt.rgba(1, 1, 1, 0.6)

            // Inner gloss highlight line along the top edge
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                radius: parent.radius
                color: Qt.rgba(1, 1, 1, 0.5)
            }
        }
    }

    // 4. Background Blur & Drop Shadow via MultiEffect
    MultiEffect {
        source: glassPanel
        anchors.fill: glassPanel
        
        // Soft backdrop drop shadow
        shadowEnabled: true
        shadowColor: "#40000000"
        shadowBlur: 0.6
        shadowVerticalOffset: 8
        shadowHorizontalOffset: 0
        
        // Blur background content (if referencing a background source)
        blurEnabled: true
        blur: 0.4
    }
}
