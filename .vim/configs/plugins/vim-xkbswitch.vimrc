let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines

if g:isLinux
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch/install/lib/libxkbswitch.so"
endif
if g:isMac
    let g:XkbSwitchLib = $HOME."/.vim/plugged/input-source-switcher/install/lib/libInputSourceSwitcher.dylib"
endif
if g:isWindows
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch-win/bin/libxkbswitch32.dll"
endif

if $DISPLAY == ""
    let g:XkbSwitchEnabled = 0
else
    let g:XkbSwitchEnabled = 1
endif
