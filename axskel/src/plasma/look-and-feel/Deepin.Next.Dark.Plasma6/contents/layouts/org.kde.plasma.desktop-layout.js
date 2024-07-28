var panel = new Panel
panel.location = "bottom"
panel.hiding = "none"
panel.height = 52
panel.alignment = "center"
panel.floating = 1
panel.lengthMode = "custom"
const width = screenGeometry(panel.screen).width
panel.maximumLength = Number(width)*(.88)
panel.minimumLength  = panel.maximumLength

panel_start = panel.addWidget("org.kde.plasma.kickoff")
panel_start.currentConfigGroup = ["General"]
panel_start.writeConfig("icon", "deepin-launcher")

panel_showd = panel.addWidget("org.kde.plasma.showdesktop")
panel_showd.currentConfigGroup = ["General"]
panel_showd.writeConfig("icon", "deepin-show-desktop")

panel.addWidget("zayron.simple.separator")
panel.addWidget("org.kde.plasma.panelspacer")
panel.addWidget("org.kde.plasma.icontasks")

panel.addWidget("org.kde.plasma.panelspacer")
panel.addWidget("zayron.simple.separator")
/*systemtray*/
var systraprev = panel.addWidget("org.kde.plasma.systemtray")
var SystrayContainmentId = systraprev.readConfig("SystrayContainmentId")
const systray = desktopById(SystrayContainmentId)
systray.currentConfigGroup = ["General"]
let ListTrays = systray.readConfig("extraItems")
systray.writeConfig("iconSpacing", 1)
systray.writeConfig("hiddenItems", "Notificador de Discover_org.kde.DiscoverNotifier")
panel.addWidget("Plasma.Control.Hub")

panel_clock = panel.addWidget("org.kde.plasma.digitalclock")
panel_clock.currentConfigGroup = ["Appearance"]
panel_clock.writeConfig("fontSize", "14")
panel_clock.writeConfig("autoFontAndSize", "false")

panel.addWidget("org.kde.plasma.trash")
/*Buttons of aurorae*/
Buttons = ConfigFile("kwinrc")
Buttons.group = "org.kde.kdecoration2"
Buttons.writeEntry("ButtonsOnRight", "0")
Buttons.writeEntry("ButtonsOnLeft", "XAI")

/*Clock, Weather and Music Widget*/
let desktopsArray = desktopsForActivity(currentActivity());
for( var j = 0; j < desktopsArray.length; j++) {
var desktopByClock = desktopsArray[j]
}
const NumX = Number(((screenGeometry(desktopByClock).width)-315)/2)
const NumY = Number((screenGeometry(desktopByClock).height)*.17)
desktopByClock.addWidget("CircleClock", NumX, NumY, 315, 315)

/* accent color config*/
ColorAccetFile = ConfigFile("kdeglobals")
ColorAccetFile.group = "General"
ColorAccetFile.writeEntry("accentColorFromWallpaper", "false")
ColorAccetFile.deleteEntry("AccentColor")
ColorAccetFile.deleteEntry("LastUsedCustomAccentColor")
