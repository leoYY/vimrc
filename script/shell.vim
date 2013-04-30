function InitShell()
    call setline(1,"#!/bin/bash")
    call append(line("."),"# arguments len : $#")
    call append(line("."),"# arguments : $@")
    echo "you are using vimscript \<initshell\>"

endfunction

function Test()
    echo getcwd()
endfunction
