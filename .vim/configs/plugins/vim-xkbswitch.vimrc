let g:XkbSwitchEnabled = 1
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines

if CheckOS() == 'Linux'
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch/install/lib/libxkbswitch.so"
endif
if CheckOS() == 'Darwin'
    let g:XkbSwitchLib = $HOME."/.vim/plugged/input-source-switcher/install/lib/libInputSourceSwitcher.dylib"
endif
if CheckOS() == 'Windows'
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch-win/bin/libxkbswitch32.dll"
endif
