require('keybinds')

---------------------
---- VARIABLES ------
---------------------
local terminal = "kitty"
local menu = "pkill rofi || ~/.config/rofi/launchers/mythemes/launcher.sh"
local fileManager = "nemo"
local M1 = "DP-1"
local M2 = "HDMI-A-1"
local mainMod = "SUPER"
local browser = "firefox"

local colors = require('themes.catppuccin-frappe')
local lavender = colors.lavender
local base = colors.base
local red = colors.red
-------------------------------
---- VARIABLES DE ENTORNO ----
-------------------------------
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("XCURSOR_SIZE", "26")
hl.env("HYPRCURSOR_SIZE", "26")
hl.env("XCURSOR_THEME", "Nordzy-catppuccin-mocha-teal")
hl.env("HYPRCURSOR_THEME", "Nordzy-catppuccin-mocha-teal")

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()

    -- 1. Registrar entorno en DBus/Systemd (Fundaciones para VS Code / Electron)
    
    hl.exec_cmd(
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPsLAY XDG_CURRENT_DESKTOP")

    -- Daemon de Configuración de Monitores (Hyprmoncfg) --
    hl.exec_cmd("systemctl --user enable --now hyprmoncfgd")

    hl.exec_cmd("xrandr --output DP-1 --primary")
    hl.exec_cmd("sleep 1 && hyprctl dispatch workspace 1")

    hl.exec_cmd("hyprctl setcursor Nordzy-catppuccin-mocha-teal 24")
    hl.exec_cmd("swaync")
    hl.exec_cmd("blueman-applet")


    hl.exec_cmd("awww-daemon & disown")
    hl.exec_cmd("waypaper --restore")


    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprlock")

    
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.80")
    hl.exec_cmd("sleep 3 && tutanota-desktop & disown")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("quickshell")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11,ssh")
    hl.exec_cmd("ollama serve")
end)


-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 3,
        col = {
            active_border = {
                colors = {lavender, red},
                angle = 45
            },
            inactive_border = base
        },
        layout = "dwindle"
    },

    decoration = {
        rounding = 5,
        active_opacity = 1.0,
        inactive_opacity = 1.0
    },

    input = {
        kb_layout = "es",
        numlock_by_default = true,
        follow_mouse = 1,
        sensitivity = 0
    },

    misc = {
        font_family = "Agave Nerd Font, Sans"
    },

    render = {
        cm_auto_hdr = 0
    }
})

--------------------------------
---- REGLAS DE CAPAS Y VENTANAS -
--------------------------------
hl.layer_rule({
    match = {
        namespace = "^waybar$"
    },
    blur = true,
    ignore_alpha = 0
})
hl.layer_rule({
    match = {
        namespace = "^rofi$"
    },
    blur = true,
    ignore_alpha = 0
})
hl.layer_rule({
    match = {
        namespace = "^swaync-control-center$"
    },
    blur = true
})
hl.layer_rule({
    match = {
        namespace = "^swaync-notification-window$"
    },
    blur = true
})

-- Regla para ventana PiP de MPV
hl.window_rule({
    name = "mpv-pip",
    match = {
        class = "^mpv$"
    },
    float = true,
    size = "400 225",
    move = "monitor_w-410 monitor_h-1400",
    pin = true
})

do
    local path = os.getenv("HOME") .. "/.config/hypr/hyprmoncfg-monitors.lua";
    local file = io.open(path, "r");
    if file then
        file:close();
        dofile(path)
    end
end

-- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
do local path = os.getenv("HOME") .. "/.config/hypr/hyprmoncfg-monitors.lua"; local file = io.open(path, "r"); if file then file:close(); dofile(path) end end
