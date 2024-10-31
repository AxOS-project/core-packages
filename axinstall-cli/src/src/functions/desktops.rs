use crate::args::DesktopSetup;
use crate::internal::exec::*;
use crate::internal::*;

pub fn install_desktop_setup(desktop_setup: DesktopSetup) {
    log::debug!("Installing {:?}", desktop_setup);
    match desktop_setup {
        DesktopSetup::Kde => install_kde(),
        DesktopSetup::Awesome => install_awesome(),
        DesktopSetup::Hyprland => install_hyprland(),
        DesktopSetup::None => log::debug!("No desktop setup selected"),
    }
    install_networkmanager();
}

fn install_networkmanager() {
    install(vec!["networkmanager"]);
    exec_eval(
        exec_chroot(
            "systemctl",
            vec![String::from("enable"), String::from("NetworkManager")],
        ),
        "Enable network manager",
    );
}

fn install_awesome() {
    install(vec![
        "xorg",
        "awesome-git",
        "axskel-awesome",
        "sddm",
        "sddm-theme-chili",
        "xdg-user-dirs",
        "pipewire",
        "pipewire-pulse",
        "brightnessctl",
        "picom",
        "maim",
        "alacritty",
        "networkmanager",
        "nemo",
        "polkit-gnome",
        "cbatticon",
        "blueman",
        "ttf-roboto",
        "noto-fonts",
        "noto-fonts-cjk",
        "noto-fonts-emoji-fontconfig",
        "noto-fonts-extra",
        "papirus-icon-theme",
        "ttf-material-design-icons-extended",
        "ttf-material-design-icons-git",
        "playerctl",
        "redshift",
        "xsettingsd",
        "firefox",
        "acpi",
        "galculator",
        "baobab",
        "gnome-characters",
        "mousepad",
        "gparted",
        "xterm",
        "wmctrl",
        "libinput-gestures",
        "wireplumber",
        "bash-completion",

    ]);
    enable_dm("sddm");
}


fn install_kde() {
    install(vec![
        "xorg",
        "plasma-desktop",
        "kde-utilities",
        "kde-system",
        "axskel",
        "pipewire",
        "pipewire-pulse",
        "pipewire-alsa",
        "pipewire-jack",
        "wireplumber",
        "sddm",
        "okular",
        "kate",
        "dolphin",
        "konsole",
        "ark",
        "kdeconnect",
        "plasma-systemmonitor",
        "discover",
        "filelight",
        "kcalc",
        "partitionmanager",
        "kwrite",
        "plasma-pa",
        "networkmanager",
        "kscreen",
        "kdialog",
        "print-manager",
        "kde-gtk-config",
        "xdg-user-dirs",
        "kinfocenter",
        "libreoffice-fresh",
        "sddm-theme-chili",
        "packagekit-qt5",
        "power-profiles-daemon",
        "bluez",
        "bluez-qt",
    ]);
    enable_dm("sddm");
}


fn install_hyprland() {
    install(vec![
        // Base
        "hyprland-git",
        "hyprlock-git",
        "hyprutils-git",
        "hyprlang-git",
        "hyprcursor-git",
        "hypride-git",
        "hyprpicker-git",
        // Illogical Impulse
        "illogical-impulse-ags",
        "illogical-impulse-audio",
        "illogical-impulse-backlight",
        "illogical-impulse-basic",
        "illogical-impulse-bibata-modern-classic-bin",
        "illogical-impulse-fonts-themes",
        "illogical-impulse-gnome",
        "illogical-impulse-gtk",
        "illogical-impulse-microtex-git",
        "illogical-impulse-oneui4-icons-git",
        "illogical-impulse-portal",
        "illogical-impulse-pymyc-aur",
        "illogical-impulse-python",
        "illogical-impulse-screencapture",
        "illogical-impulse-widgets",
        // The other stuff
        "hyprwayland-scanner-git",
        "axel",
        "bc",
        "coreutils",
        "cliphist",
        "cmake",
        "curl",
        "fuzzel",
        "wget",
        "ripgrep",
        "gojq",
        "npm",
        "meson",
        "typescript",
        "gjs",
        "tinyxml2",
        "gtkmm3",
        "gtksourceviewmm",
        "cairomm",
        "python-build",
        "python-pillow",
        "python-pywal",
        "python-setuptools-scm",
        "python-wheel",
        "xdg-desktop-portal",
        "xdg-desktop-portal-gtk",
        "xdg-desktop-portal-hyprland-git",
        "pavucontrol",
        "wireplumber",
        "libdbusmenu-gtk3",
        "playerctl",
        "swww",
        "webp-pixbuf-loader",
        "gtk-layer-shell",
        "gtk3",
        "gtksourceview3",
        "gobject-introspection",
        "upower",
        "yad",
        "ydotool",
        "xdg-user-dirs-gtk",
        "polkit-gnome",
        "blueberry",
        "gammastep",
        "brightnessctl",
        "ddcutil",
        "dart-sass",
        "python-pywayland",
        "python-psutil",
        "wlogout",
        "wl-clipboard",
        "anyrun-git",
        "qt5ct",
        "qt5-wayland",
        "fontconfig",
        "ttf-readex-pro",
        "ttf-jetbrains-mono-nerd",
        "ttf-material-symbols-variable-git",
        "ttf-space-mono-nerd",
        "fish",
        "foot",
        "starship",
        "swappy",
        "wf-recorder",
        "grim",
        "tesseract",
        "tesseract-data-eng",
        "slurp",
        "lm_sensors",
        // System utilities
        "xdg-user-dirs",
        "neofetch",
        "firefox",
        "python",
        "sddm",
        "bash-completion",
        "networkmanager",
        "pipewire-pulse",
        "papirus-icon-theme",
        "make",
        "inxi",
        "power-profiles-daemon",
        "fwupd",
        "sddm-theme-chili",
        "git",
        "archlinux-keyring",
        // Gnome packages
        "gnome-autoar",
        "gnome-bluetooth",
        "gnome-bluetooth-3.0",
        "gnome-chess",
        "gnome-color-manager",
        "gnome-control-center",
        "gnome-desktop",
        "gnome-desktop-4",
        "gnome-desktop-common",
        "gnome-disk-utility",
        "gnome-keybindings",
        "gnome-keyring",
        "gnome-online-accounts",
        "gnome-power-manager",
        "gnome-session",
        "gnome-settings-daemon",
        "gnome-shell",
        "gnome-system-monitor",
        "gnome-themes-extra",
        "gnome-tweaks",
        "baobab",
        "gparted",
        "gnome-calculator",
        "xdg-desktop-portal-gnome",
        "plasma-browser-integration",
        "nautilus",
        // The rest
        "axskel-hypr",
    ]);
    enable_dm("sddm");
}

fn enable_dm(dm: &str) {
    log::debug!("Enabling {}", dm);
    exec_eval(
        exec_chroot("systemctl", vec![String::from("enable"), String::from(dm)]),
        format!("Enable {}", dm).as_str(),
    );
}
