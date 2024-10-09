import QtQuick 2.12
import org.kde.plasma.plasmoid
import "components" as Components
import org.kde.plasma.core as PlasmaCore


PlasmoidItem {
    id: root
    width: 300
    height: 150
    preferredRepresentation: fullRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.ConfigurableBackground

    FontLoader {
      id: lorenzoSans
      source: "../fonts/Lorenzo Sans Regular.ttf"
    }

    Components.WeatherData {
      id: weatherData
    }
    property string temperatureUnit: Plasmoid.configuration.temperatureUnit
    property int dateOfUbi:  Plasmoid.configuration.locOrMaxMin

    property string temcurrent: temperatureUnit == 0 ? Math.round(weatherData.temperaturaActual) + "°" : Math.round((weatherData.temperaturaActual * 9 / 5) + 32) + "°"

    property string maxcurrent: temperatureUnit == 0 ? Math.round(weatherData.maxweatherCurrent) + "°" : Math.round((weatherData.maxweatherCurrent * 9 / 5) + 32) + "°"

     property string mincurrent: temperatureUnit == 0 ? Math.round(weatherData.minweatherCurrent) + "°" : Math.round((weatherData.minweatherCurrent * 9 / 5) + 32) + "°"

    property string dateAndMaxAndMin: (Qt.formatDateTime(new Date(), "dddd")) + " " + (Qt.formatDateTime(new Date(), "dd")) +  " | "+maxcurrent + " "+mincurrent

    property string textByFirstPanel: weatherData.weatherShottext + ", " + temcurrent
    fullRepresentation: Item {
      width: root.width
      height: root.height
        Column {
          width: (parent.height*2) < parent.width ? parent.height*2 : parent.width
          height: width/2
          anchors.verticalCenter: parent.verticalCenter
          anchors.horizontalCenter: parent.horizontalCenter
          Row {
            id: fistMed
            width: parent.width
            height: parent.height/2
            Rectangle {
              width: parent.width*.73
              height: parent.height*.8
              radius: height/2
              anchors.verticalCenter: parent.verticalCenter
              Text {
                width: parent.width
                height: parent.height
                text: textByFirstPanel
                font.pixelSize: parent.height*.25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: lorenzoSans.name
                color: "black"
              }

            }
            Rectangle {
              height: parent.height*.8
              width: height
              radius: 100
              anchors.right: parent.right
              anchors.verticalCenter: parent.verticalCenter
              Image {
                width: parent.height*.55
                height: width
                source: "../icons/"+weatherData.iconWeatherCurrent+".svg"
                sourceSize: Qt.size(width, width)
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
              }
            }
          }
          Item {
            width: parent.width
            height: parent.height/2

            Rectangle {
              id: lastBar
              width: parent.width
              height: parent.height*.8
              radius: height/2
              anchors.verticalCenter: parent.verticalCenter
              Row {
                id: contentTextSecondBar
                width: city.width + geo.width + drop.width + spacingOf.width + porcentProbability.width
                height: parent.height
                anchors.centerIn: parent
                Image {
                  id: geo
                  width: visible ? lastBar.height*.35 : 0
                  height: width
                  source: "../icons/geo.svg"
                  sourceSize: Qt.size(width, width)
                  fillMode: Image.PreserveAspectFit
                  anchors.verticalCenter: parent.verticalCenter
                  visible: dateOfUbi === 1 ? true : false
                }
                Text {
                  id: city
                  height: lastBar.height
                  width: implicitWidth
                  text: dateOfUbi === 1 ? weatherData.city : dateAndMaxAndMin
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  font.pixelSize: parent.height*.25
                  font.family: lorenzoSans.name
                  font.capitalization: Font.Capitalize
                  color: "black"
                  anchors.left: parent.left
                  anchors.leftMargin: geo.width
                }

                  Text {
                    id: spacingOf
                    height: lastBar.height
                    width: implicitWidth
                    text: " |"
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.height*.25
                    font.family: lorenzoSans.name
                    font.capitalization: Font.Capitalize
                    color: "black"
                    anchors.left: parent.left
                    anchors.leftMargin: geo.width + city.width
                  }
                  Image {
                    id: drop
                    width: parent.height*.25
                    height: width
                    source: "../icons/drops.svg"
                    sourceSize: Qt.size(width, width)
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: geo.width + city.width + spacingOf.width
                  }
                  Text {
                    id: porcentProbability
                    height: lastBar.height
                    width: implicitWidth
                    text: weatherData.probabilidadDeLLuvia + "%"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.height*.25
                    font.family: lorenzoSans.name
                    font.capitalization: Font.Capitalize
                    color: "black"
                    anchors.left: parent.left
                    anchors.leftMargin: drop.anchors.leftMargin + drop.width
                  }

              }

            }
          }
        }
    }
    Timer {
      interval: 8.64e+7-((new Date().getHours()*60*60*1000)+(new Date().getMinutes()*60*1000)+(new Date().getSeconds()*1000)+new Date().getMilliseconds())
      running: true
      repeat: true
      onTriggered: {
        dateAndMaxAndMin = (Qt.formatDateTime(new Date(), "dddd")) + " " + (Qt.formatDateTime(new Date(), "dd")) +  " | "+maxcurrent + " "+mincurrent
      }
    }
          }
