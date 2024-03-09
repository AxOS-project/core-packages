var plasma = getApiVersion(1);
/*General*/
panelbottom = new Panel
panelbottom.location = "bottom"
panelbottom.height = 52
panelbottom.hiding = "none"
/*spacer*/
panelbottom.addWidget("org.kde.plasma.panelspacer")
/*App Launcher*/
menu = panelbottom.addWidget("AndromedaLauncher")
menu.currentConfigGroup = ["General"]
menu.writeConfig("activationIndicator", "false")
menu.writeConfig("customButtonImage", "utilities-launcher")
menu.writeConfig("floating", "true")
menu.writeConfig("launcherPosition", "1")
menu.writeConfig("useCustomButtonImage", "true")
/*Desktops button*/
panelbottom_desktops = panelbottom.addWidget("com.github.zren.presentwindows")
panelbottom_desktops.currentConfigGroup = ["General"]
panelbottom_desktops.writeConfig("icon", "awn-window-fallback")
/*apps bottons*/
panelbottom.addWidget("org.kde.plasma.icontasks")
panelbottom.addWidget("org.kde.plasma.panelspacer")
/*systemtray*/
var systraprev = panelbottom.addWidget("org.kde.plasma.systemtray")
var SystrayContainmentId = systraprev.readConfig("SystrayContainmentId")
const systray = desktopById(SystrayContainmentId)
systray.currentConfigGroup = ["General"]
let ListTrays = systray.readConfig("extraItems")
let ListTrays2 = ListTrays.replace(",org.kde.plasma.notifications", "")
systray.writeConfig("extraItems", ListTrays2)
systray.writeConfig("iconSpacing", 1)
systray.writeConfig("shownItems", "org.kde.plasma.mediacontroller,org.kde.plasma.volume,org.kde.plasma.networkmanagement,org.kde.plasma.weather,org.kde.plasma.battery")

/*Cambiando configuracion Dolphin*/
const IconsStatic_dolphin = ConfigFile('dolphinrc')
IconsStatic_dolphin.group = 'KFileDialog Settings'
IconsStatic_dolphin.writeEntry('Places Icons Static Size', 16)
const PlacesPanel = ConfigFile('dolphinrc')
PlacesPanel.group = 'PlacesPanel'
PlacesPanel.writeEntry('IconSize', 16)
/******************************/
/*Clock*/
panelbottom_clock = panelbottom.addWidget("org.kde.plasma.digitalclock")
panelbottom_clock.currentConfigGroup = ["Appearance"]
panelbottom_clock.writeConfig("fontSize", "11")
panelbottom_clock.writeConfig("autoFontAndSize", "false")
/*Notification*/
panelbottom.addWidget("org.kde.plasma.notifications")

/*Clock, Weather and Music Widget*/
let desktopsArray = desktopsForActivity(currentActivity());
for( var j = 0; j < desktopsArray.length; j++) {
var desktopByClock = desktopsArray[j]
}
const NumX = Number(((screenGeometry(desktopByClock).width)-620)/2)
const NumY = Number(((screenGeometry(desktopByClock).height)-240)/2)-panelbottom.height
Clock = desktopByClock.addWidget("org.kde.plasma.Deskclock", NumX, NumY, 620, 240)

if (knownWidgetTypes.includes('org.kde.plasma.weather')) {
    const NumX2 = Number(((screenGeometry(desktopByClock).width)-256)/2)
    const NumY2 = Number(((screenGeometry(desktopByClock).height)-160)/2)+120+panelbottom.height
    weatherWidget = desktopByClock.addWidget("com.github.Widget.Weather.asymmetric.weather", NumX2, NumY2, 256, 160)
    weatherWidget.currentConfigGroup = ["General"]
    weatherWidget.writeConfig("source", "wettercom|weather|Mexico City, , MX|MX3530597;Mexico City")
} else {
   }

/* accent color config*/
ColorAccetFile = ConfigFile("kdeglobals")
ColorAccetFile.group = "General"
ColorAccetFile.writeEntry("accentColorFromWallpaper", "true")
/*Buttons of aurorae*/
Buttons = ConfigFile("kwinrc")
Buttons.group = "org.kde.kdecoration2"
Buttons.writeEntry("ButtonsOnRight", "")
Buttons.writeEntry("ButtonsOnLeft", "XIA")
plasma.loadSerializedLayout(layout);
