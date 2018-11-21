# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Also looked at the following config file: https://github.com/LukeSmithxyz/voidrice/blob/master/.config/qutebrowser/config.py

import os

os.environ["PATH"] = os.environ["HOME"] + "/.bin:/usr/local/bin:" + os.environ["PATH"]

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

## The backend to use to display websites. qutebrowser supports two
## different web rendering engines / backends, QtWebKit and QtWebEngine.
## QtWebKit was discontinued by the Qt project with Qt 5.6, but picked up
## as a well maintained fork: https://github.com/annulen/webkit/wiki -
## qutebrowser only supports the fork. QtWebEngine is Qt's official
## successor to QtWebKit. It's slightly more resource hungry that
## QtWebKit and has a couple of missing features in qutebrowser, but is
## generally the preferred choice. This setting requires a restart.
## Type: String
## Valid values:
##   - webengine: Use QtWebEngine (based on Chromium)
##   - webkit: Use QtWebKit (based on WebKit, similar to Safari)
c.backend = 'webengine'

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Enable plugins in Web pages.
# Type: Bool
c.content.plugins = True

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['/Applications/MacVim.app/Contents/MacOS/Vim', '-g', '-f', '{file}', '-c', 'normal {line}G{column0}l']

## This setting can be used to map keys to other keys. When the key used
## as dictionary-key is pressed, the binding for the key used as
## dictionary-value is invoked instead. This is useful for global
## remappings of keys, for example to map Ctrl-[ to Escape. Note that
## when a key is bound (via `bindings.default` or `bindings.commands`),
## the mapping is ignored.
## Type: Dict
c.bindings.key_mappings = {
    '<й>': '<q>',
    '<ц>': '<w>',
    '<у>': '<e>',
    '<к>': '<r>',
    '<е>': '<t>',
    '<н>': '<y>',
    '<г>': '<u>',
    '<ш>': '<i>',
    '<щ>': '<o>',
    '<з>': '<p>',
    '<х>': '<[>',
    '<ъ>': '<]>',
    '<ф>': '<a>',
    '<ы>': '<s>',
    '<в>': '<d>',
    '<а>': '<f>',
    '<п>': '<g>',
    '<р>': '<h>',
    '<о>': '<j>',
    '<л>': '<k>',
    '<д>': '<l>',
    '<ж>': '<;>',
    '<я>': '<z>',
    '<ч>': '<x>',
    '<с>': '<c>',
    '<м>': '<v>',
    '<и>': '<b>',
    '<т>': '<n>',
    '<ь>': '<m>',
    '<б>': '<,>',
    '<ю>': '<.>',
    '<.>': '</>',
    '<Ctrl-й>': '<Ctrl-q>',
    '<Ctrl-ц>': '<Ctrl-w>',
    '<Ctrl-у>': '<Ctrl-e>',
    '<Ctrl-к>': '<Ctrl-r>',
    '<Ctrl-е>': '<Ctrl-t>',
    '<Ctrl-н>': '<Ctrl-y>',
    '<Ctrl-г>': '<Ctrl-u>',
    '<Ctrl-ш>': '<Ctrl-i>',
    '<Ctrl-щ>': '<Ctrl-o>',
    '<Ctrl-з>': '<Ctrl-p>',
    '<Ctrl-х>': '<Ctrl-[>',
    '<Ctrl-ъ>': '<Ctrl-]>',
    '<Ctrl-ф>': '<Ctrl-a>',
    '<Ctrl-ы>': '<Ctrl-s>',
    '<Ctrl-в>': '<Ctrl-d>',
    '<Ctrl-а>': '<Ctrl-f>',
    '<Ctrl-п>': '<Ctrl-g>',
    '<Ctrl-р>': '<Ctrl-h>',
    '<Ctrl-о>': '<Ctrl-j>',
    '<Ctrl-л>': '<Ctrl-k>',
    '<Ctrl-д>': '<Ctrl-l>',
    '<Ctrl-ж>': '<Ctrl-;>',
    '<Ctrl-я>': '<Ctrl-z>',
    '<Ctrl-ч>': '<Ctrl-x>',
    '<Ctrl-с>': '<Ctrl-c>',
    '<Ctrl-м>': '<Ctrl-v>',
    '<Ctrl-и>': '<Ctrl-b>',
    '<Ctrl-т>': '<Ctrl-n>',
    '<Ctrl-ь>': '<Ctrl-m>',
    '<Ctrl-б>': '<Ctrl-,>',
    '<Ctrl-ю>': '<Ctrl-.>',
    '<Ctrl-.>': '<Ctrl-/>',
    '<Shift-й>': '<Shift-q>',
    '<Shift-ц>': '<Shift-w>',
    '<Shift-у>': '<Shift-e>',
    '<Shift-к>': '<Shift-r>',
    '<Shift-е>': '<Shift-t>',
    '<Shift-н>': '<Shift-y>',
    '<Shift-г>': '<Shift-u>',
    '<Shift-ш>': '<Shift-i>',
    '<Shift-щ>': '<Shift-o>',
    '<Shift-з>': '<Shift-p>',
    '<Shift-х>': '<Shift-[>',
    '<Shift-ъ>': '<Shift-]>',
    '<Shift-ф>': '<Shift-a>',
    '<Shift-ы>': '<Shift-s>',
    '<Shift-в>': '<Shift-d>',
    '<Shift-а>': '<Shift-f>',
    '<Shift-п>': '<Shift-g>',
    '<Shift-р>': '<Shift-h>',
    '<Shift-о>': '<Shift-j>',
    '<Shift-л>': '<Shift-k>',
    '<Shift-д>': '<Shift-l>',
    '<Shift-ж>': '<Shift-;>',
    '<Shift-я>': '<Shift-z>',
    '<Shift-ч>': '<Shift-x>',
    '<Shift-с>': '<Shift-c>',
    '<Shift-м>': '<Shift-v>',
    '<Shift-и>': '<Shift-b>',
    '<Shift-т>': '<Shift-n>',
    '<Shift-ь>': '<Shift-m>',
    '<Shift-б>': '<Shift-,>',
    '<Shift-ю>': '<Shift-.>',
    '<Shift-.>': '<Shift-/>',
}

## Behavior when the last tab is closed.
## Type: String
## Valid values:
##   - ignore: Don't do anything.
##   - blank: Load a blank page.
##   - startpage: Load the start page.
##   - default-page: Load the default page.
##   - close: Close the window.
c.tabs.last_close = 'close'

## Switch between tabs using the mouse wheel.
## Type: Bool
c.tabs.mousewheel_switching = True

## How new tabs opened from another tab are positioned.
## Type: NewTabPosition
## Valid values:
##   - prev: Before the current tab.
##   - next: After the current tab.
##   - first: At the beginning.
##   - last: At the end.
c.tabs.new_position.related = 'next'

## How new tabs which aren't opened from another tab are positioned.
## Type: NewTabPosition
## Valid values:
##   - prev: Before the current tab.
##   - next: After the current tab.
##   - first: At the beginning.
##   - last: At the end.
c.tabs.new_position.unrelated = 'last'

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Duration (in milliseconds) to show the tab bar before hiding it when
# tabs.show is set to 'switching'.
# Type: Int
c.tabs.show_switching_delay = 800

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '10%'

# Which tab to select when the focused tab is removed
# Type: String
# Valid values:
#   - last-used: Select the previously selected tab
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical)
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical)
c.tabs.select_on_remove = 'prev'

# Open new tabs (middleclick/ctrl+click) in the background
# Type: Bool
c.tabs.background = True

## Definitions of search engines which can be used via the address bar.
## Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
## `{}` placeholder. The placeholder will be replaced by the search term,
## use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'red':     'https://reddit.com/r/{}',
    'osm':     'http://www.openstreetmap.org/search?query={}',
    'yt':      'https://youtube.com/search?q={}',
    'g':       'https://www.google.com/search?q={}',
    'ya':      'https://yandex.ru/search/?text={}'
}
