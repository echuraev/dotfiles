# General {{{ #
set prompt \033[1;32m(gdb) \033[0m
# Display instructions in Intel format
set disassembly-flavor intel
set history save
set print pretty on
# }}} General #
# Highlighting {{{ #
shell mkfifo /tmp/colorPipe

define hook-disassemble
echo \n
shell cat /tmp/colorPipe | c++filt | highlight --syntax=asm -s darkness -Oxterm256 &
set logging redirect on
set logging on /tmp/colorPipe
end

define hookpost-disassemble
hookpost-list
end

define hook-list
echo \n
shell cat /tmp/colorPipe | c++filt | highlight --syntax=cpp -s darkness -Oxterm256 &
set logging redirect on
set logging on /tmp/colorPipe
end

define hookpost-list
set logging off
set logging redirect off
shell sleep 0.1s
end

define hook-quit
shell rm /tmp/colorPipe
end

define re
hookpost-disassemble
echo \033[0m
end
document re
Restore colorscheme
end
# }}} Highlighting #
# vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldlevel=0
