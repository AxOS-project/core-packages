/*
    SPDX-FileCopyrightText: zayronxio
    SPDX-License-Identifier: GPL-3.0-or-later
*/
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: root

    property var textC: plasmoid.configuration.textinC

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.ConfigurableBackground

    FontLoader {
    id: milk
    source: "../fonts/Milkshake.ttf"
    }
    FontLoader {
    id: metro
    source: "../fonts/Metropolis-Black.ttf"
    }

          Plasmoid.fullRepresentation: RowLayout {
              Layout.minimumWidth: 150
              Layout.minimumHeight: 150
              Layout.preferredWidth: Layout.minimumWidth
              Layout.preferredHeight: Layout.minimumHeight
    Rectangle {
        id: base
        Layout.preferredWidth: (parent.height < parent.width) ? parent.height : parent.width
        Layout.preferredHeight: (parent.height < parent.width) ? parent.height : parent.width
        color: "white"
        radius: parent.height/2
        anchors.centerIn: parent
        layer.enabled: true
             layer.effect: OpacityMask {
             maskSource: mask
             invert: true
             }
    }
    Column {
        id: mask
        width: base.width
        height: base.height
        anchors.centerIn: parent
        visible: false
            Text {
                text:  textC
                color: "blue"
                font.pixelSize: hora.font.pixelSize /1.7
                font.family: milk.name
                anchors.bottom: parent.bottom
                anchors.bottomMargin: mask.height/2 + hora.height/3
                anchors.left: parent.left
                anchors.leftMargin: mask.width-hora.width*1
            }
            Text {
                id: hora
                color: "blue"
                text: Qt.formatDateTime(new Date(), "h:mm")
                font.pixelSize: Math.min(mask.width, mask.height) * 0.32
                anchors.centerIn: parent
                font.family: metro.name
            }
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    hora.text = Qt.formatDateTime(new Date(), "h:mm")
                }
            }
        }
    }
}



