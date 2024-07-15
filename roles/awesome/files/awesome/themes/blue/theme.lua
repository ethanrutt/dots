local gears = require("gears")

local celestial_blue = "#1e91d6"
local french_blue = "#0072bb"
local mint_green = "#daffed"
local ice_blue = "#9bf3f0"
local indigo = "#4a0d67"
local black = "#242c2e"

local theme = {}

theme.font = "AgaveNerdFont 10"
theme.useless_gap = 5
theme.bg_normal = celestial_blue
theme.bg_focus = french_blue
theme.bg_subtle = mint_green
theme.bg_urgent = indigo
theme.bg_minimize = french_blue
theme.bg_dark = french_blue
theme.bg_systray = celestial_blue

theme.fg_normal = black
theme.fg_focus = black
theme.fg_urgent = black
theme.fg_minimize = black

theme.useless_gap = 5
theme.border_width = 3
theme.border_focus = mint_green
theme.border_normal = ice_blue
theme.border_marked = indigo

theme.wibar_bg = "transparent"

theme.taglist_bg_focus = mint_green
theme.taglist_bg_urgent = indigo
theme.taglist_bg_empty = celestial_blue
theme.taglist_bg_occupied = celestial_blue
theme.taglist_spacing = 8
theme.taglist_shape = gears.shape.circle

return theme
