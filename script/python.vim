function InitPythonClass()
    let l:tmp = readfile($HOME."/.vim/tmn/python.vim")
    call setline(1,"# -*- coding: ".strpart($LANG,stridx($LANG,"\.")+1,strlen($LANG))." -*-")
    let user = system("whoami")
    let l:word = []
    :lan tim en_US.utf8
    let l:date = strftime("%c")
    for line in l:tmp
       let line = substitute(line,"@USER",strpart(user,-1,strlen(user)),"g") 
       let line = substitute(line,"@DATE",l:date,"g")
       let line = substitute(line,"@FILE_NAME",expand("%:t"),"g")
       let line = substitute(line, "@FILE", expand("%:t:r"), "g")
       call add(l:word,line)
    endfor
    call append(line("."),l:word)
endfunction
