local gears = require("gears")

local blue = "#586982"
local mint_green = "#daffed"
local indigo = "#4a0d67"
local black = "#242c2e"
local white = "#dddddd"


local theme = {}

theme.default_bg = white
theme.selected_bg = blue
theme.large_widget_bg = white

theme.font = "Inter 10"
theme.useless_gap = 5
theme.bg_normal = white
theme.bg_focus = blue
theme.bg_subtle = mint_green
theme.bg_urgent = indigo
theme.bg_minimize = blue
theme.bg_dark = blue
theme.bg_systray = mint_green

theme.fg_normal = black
theme.fg_focus = white
theme.fg_urgent = white
theme.fg_minimize = white

theme.useless_gap = 5
theme.border_width = 3
theme.border_focus = mint_green
theme.border_normal = indigo
theme.border_marked = indigo

theme.wibar_bg = black

theme.taglist_bg_focus = blue
theme.taglist_bg_urgent = indigo
theme.taglist_bg_empty = white
theme.taglist_bg_occupied = white
theme.taglist_spacing = 2
theme.taglist_shape = gears.shape.rounded_rect

return theme
