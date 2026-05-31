import "../../core"
import "../../widgets"
import "../../services"
import "../../core/functions"
import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
    id: root
    property color color: Appearance.colors.colStatusBarText
    visible: Battery.available
    
    readonly property var chargeState: Battery.chargeState
    readonly property bool isCharging: Battery.isCharging
    readonly property bool isPluggedIn: Battery.isPluggedIn
    readonly property real percentage: Battery.percentage
    readonly property bool isLow: percentage <= (Config.options.battery?.low ?? 20) / 100
    property real chargingPulse: 0
    readonly property color chargingCyan: Qt.rgba(0.22, 0.94, 1.0, 1.0)

    onIsChargingChanged: chargingPulse = isCharging ? 0.35 : 0

    SequentialAnimation on chargingPulse {
        running: root.isCharging
        loops: Animation.Infinite
        NumberAnimation { to: 1.0; duration: 560; easing.type: Easing.InOutSine }
        NumberAnimation { to: 0.35; duration: 560; easing.type: Easing.InOutSine }
    }

    implicitWidth: batteryProgress.implicitWidth + (4 * Appearance.effectiveScale)
    implicitHeight: 24 * Appearance.effectiveScale

    RowLayout {
        anchors.centerIn: parent
        spacing: 1 * Appearance.effectiveScale

        ClippedProgressBar {
            id: batteryProgress
            valueBarWidth: 26 * Appearance.effectiveScale
            valueBarHeight: 14 * Appearance.effectiveScale
            Layout.alignment: Qt.AlignVCenter
            
            radius: 4.5 * Appearance.effectiveScale // Soft squircle shape from reference
            
            value: percentage
            highlightColor: {
                 if (isCharging) return Qt.rgba(0.22, 0.94, 1.0, 0.70 + (root.chargingPulse * 0.30))
                 if (isLow && !isCharging) return Appearance.m3colors.m3error
                 return root.color
            }
            trackColor: {
                if (isCharging) return Qt.rgba(0.22, 0.94, 1.0, 0.16 + (root.chargingPulse * 0.18))
                if (isLow && !isCharging) return Appearance.m3colors.m3errorContainer
                return ColorUtils.applyAlpha(highlightColor, 0.2) 
            }
            
            // Custom text mask to include the bolt icon
            textMask: Item {
                width: batteryProgress.valueBarWidth
                height: batteryProgress.valueBarHeight

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 0

                    MaterialSymbol {
                        id: boltIcon
                        Layout.alignment: Qt.AlignVCenter
                        Layout.leftMargin: -2 * Appearance.effectiveScale
                        Layout.rightMargin: -2 * Appearance.effectiveScale
                        fill: 1
                        text: "electric_bolt"
                        iconSize: 9 * Appearance.effectiveScale
                        visible: isCharging
                        opacity: isCharging ? (0.35 + (root.chargingPulse * 0.65)) : 0
                        scale: isCharging ? (0.92 + (root.chargingPulse * 0.16)) : 1
                        color: root.chargingCyan
                    }
                    StyledText {
                        Layout.alignment: Qt.AlignVCenter
                        font.pixelSize: 10 * Appearance.effectiveScale
                        font.weight: Font.DemiBold
                        text: batteryProgress.text
                        color: isCharging ? Qt.rgba(0.22, 0.94, 1.0, 0.78 + (root.chargingPulse * 0.22)) : ((isLow && !isCharging) ? Appearance.m3colors.m3onError : root.color)
                    }
                }
            }
        }

        // Battery Tip
        Rectangle {
            Layout.preferredWidth: 2 * Appearance.effectiveScale
            Layout.preferredHeight: 6 * Appearance.effectiveScale
            Layout.alignment: Qt.AlignVCenter
            radius: 1 * Appearance.effectiveScale
            color: isCharging ? batteryProgress.highlightColor : ((percentage >= 0.98) ? batteryProgress.highlightColor : batteryProgress.trackColor)
            opacity: isCharging ? (0.45 + root.chargingPulse * 0.55) : 1
        }
    }
}
