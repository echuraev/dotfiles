-- https://coolors.co/1b4965-f0f0f0-dbdbdb-6d8b9d-ff5c5c

theme = {}

theme.font          = "LiterationMonoPowerline Nerd Font 9"

theme.bg_normal     = "#F0F0F0"
theme.bg_focus      = "#6D8B9D"
theme.bg_urgent     = "#FF5C5C"
theme.bg_minimize   = "#DBDBDB"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#1B4965"
theme.fg_focus      = "#F0F0F0"
theme.fg_urgent     = "#F0F0F0"
theme.fg_minimize   = "#1B4965"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
theme.taglist_bg_focus = "#1B4965"

-- Keyboard layouts icons
-- I take icons from here: https://habrahabr.ru/post/155271/
-- https://www.gosquared.com/resources/flag-icons/
theme.de_layout   = "~/.config/awesome/themes/icons/flags/de.png"
theme.en_layout   = "~/.config/awesome/themes/icons/flags/en.png"
theme.ru_layout   = "~/.config/awesome/themes/icons/flags/ru.png"

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/themes/taglist/active2.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/taglist/inactive2.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 20
theme.menu_width  = 150

-- Variables set for theming the menu:
theme.wibar_height = 25

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
local background_img = "~/Pictures/awesome/background.jpg"
theme.wallpaper = background_img
--end

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/themes/layouts/fairh.png"
theme.layout_fairv = "~/.config/awesome/themes/layouts/fairv.png"
theme.layout_floating  = "~/.config/awesome/themes/layouts/floating.png"
theme.layout_magnifier = "~/.config/awesome/themes/layouts/magnifier.png"
theme.layout_max = "~/.config/awesome/themes/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/layouts/fullscreen.png"
theme.layout_tilebottom = "~/.config/awesome/themes/layouts/tilebottom.png"
theme.layout_tileleft   = "~/.config/awesome/themes/layouts/tileleft.png"
theme.layout_tile = "~/.config/awesome/themes/layouts/tile.png"
theme.layout_tiletop = "~/.config/awesome/themes/layouts/tiletop.png"
theme.layout_spiral  = "~/.config/awesome/themes/layouts/spiral.png"
theme.layout_dwindle = "~/.config/awesome/themes/layouts/dwindle.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"
theme.tux_icon = "~/.config/awesome/themes/icons/tux.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
