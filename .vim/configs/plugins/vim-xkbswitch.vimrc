let g:XkbSwitchEnabled = 1
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines

if !has('win32')
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch/install/lib/libxkbswitch.so"
else
    let g:XkbSwitchLib = $HOME."/.vim/plugged/xkb-switch-win/bin/libxkbswitch32.dll"
endif
