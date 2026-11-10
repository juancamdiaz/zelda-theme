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


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- Lanzadores y Control de Sesión
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("ferdium"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.window.float({
    action = "toggle"
}))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({
    action = "toggle"
}))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("pkill wlogout || wlogout -C ~/.config/wlogout/zelda.css"))

-- Streaming Cámara RTSP
hl.bind(mainMod .. " + masculine", hl.dsp.exec_cmd(terminal ..
                                                       ' mpv --hwdec=auto --profile=low-latency --rtsp-transport=tcp --demuxer-lavf-o=probesize=32,analyzeduration=0 "rtsp://admin:KellyLadyKLCats@192.168.1.3:554/ch1/main"'))

-- Screenshots y Utilidades
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("XF86Calculator", hl.dsp.exec_cmd(terminal .. " nasc"))

-- Controles de Audio
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
    locked = true,
    repeating = true
})
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), {
    locked = true,
    repeating = true
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
    locked = true
})

-- Conmutación de Monitores (SUPER + SHIFT + F1..F3)
hl.bind(mainMod .. " + SHIFT + F1", hl.dsp.exec_cmd('hyprmoncfg apply 1 --confirm-timeout 0'))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.exec_cmd('hyprmoncfg apply 2 --confirm-timeout 0'))
hl.bind(mainMod .. " + SHIFT + F3", hl.dsp.exec_cmd('hyprmoncfg apply 3 --confirm-timeout 0'))

-- NAVEGACIÓN Y MOVIMIENTO DE WORKSPACES (FILA SUPERIOR + NUMPAD KEYCODES)
-- Workspace 1
hl.bind(mainMod .. " + 1", hl.dsp.focus({
    workspace = 1
}))
hl.bind(mainMod .. " + code:87", hl.dsp.focus({
    workspace = 1
}))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({
    workspace = 1
}))

-- Workspace 2
hl.bind(mainMod .. " + 2", hl.dsp.focus({
    workspace = 2
}))
hl.bind(mainMod .. " + code:88", hl.dsp.focus({
    workspace = 2
}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({
    workspace = 2
}))

-- Workspace 3
hl.bind(mainMod .. " + 3", hl.dsp.focus({
    workspace = 3
}))
hl.bind(mainMod .. " + code:89", hl.dsp.focus({
    workspace = 3
}))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({
    workspace = 3
}))

-- Workspace 4
hl.bind(mainMod .. " + 4", hl.dsp.focus({
    workspace = 4
}))
hl.bind(mainMod .. " + code:83", hl.dsp.focus({
    workspace = 4
}))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({
    workspace = 4
}))

-- Workspace 5
hl.bind(mainMod .. " + 5", hl.dsp.focus({
    workspace = 5
}))
hl.bind(mainMod .. " + code:84", hl.dsp.focus({
    workspace = 5
}))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({
    workspace = 5
}))

-- Workspace 6
hl.bind(mainMod .. " + 6", hl.dsp.focus({
    workspace = 6
}))
hl.bind(mainMod .. " + code:85", hl.dsp.focus({
    workspace = 6
}))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({
    workspace = 6
}))

-- Foco y Movimiento de Ventanas (Flechas)
hl.bind(mainMod .. " + left", hl.dsp.focus({
    direction = "left"
}))
hl.bind(mainMod .. " + right", hl.dsp.focus({
    direction = "right"
}))
hl.bind(mainMod .. " + up", hl.dsp.focus({
    direction = "up"
}))
hl.bind(mainMod .. " + down", hl.dsp.focus({
    direction = "down"
}))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({
    direction = "left"
}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({
    direction = "right"
}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({
    direction = "up"
}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({
    direction = "down"
}))

-- Controles de Ratón
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true
})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true
})
