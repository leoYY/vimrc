"=====================================
"@author    : yuanyi
"@summary   : common lib
"@date      :    
"=====================================
"
let b:mail = ""
let b:user = system("whoami")
"============  date  lib =============

" get time now
function! common#GetCurrentTime()
    if exists("*strftime")
        return strftime("%c")
    else
        return localtime()
    endif
endfunction

"============  file  lib ============
"============  file content lib ============
" get current file content line
function! common#GetCurrentLineContent()
    return getline(".")
endfunction

function! common#GetFileAbsPath()
    return expand("%:p")
endfunction

function! common#GetCurrentLineNum()
    return line(".")
endfunction

function! common#GetIndentWidth(string)
    let l:indent = ''
    let l:i = 0
    let l:length = len(a:string) 
    while i< length
        if a:string[i] != ' '
            break
        else 
            let l:indent .=' '
        endif
        let l:i +=1
    endwhile
    return l:indent
endfunction
function! common#Test()
    let b:curLine = common#GetCurrentLineContent()
    let b:intent = common#GetIndentWidth(b:curLine)
    let addContent = b:intent . "/**"
    call setline(".",addContent)
    call setline(line(".")+1,b:intent . ' *' )
endfunction

function! common#GetFileName()
    return expand("%:t")
endfunction

"==========================
" search and load cscope
"==========================
function! common#SchAndLoad()
    let l:paths=split(expand("%:p"),"\/")[2:]
    let l:abspath=$HOME
    let l:abspaths=[]
    for path in l:paths
        l:abspath = l:apspath."/".path
        call add(l:abspaths,l:abspath)
    endfor
    echo l:abspaths    
endfunction

"======================================
"               gawk script init 
"======================================
function! common#InitGawkscript()
    let initContent = readfile($HOME."/.vim/tmn/gawk.vim")
    call setline(1,"#!/bin/gawk")
    let date = strftime("%Y.%m.%d")
    let year = strftime("%Y")
    let l:word = []
    for line in initContent 
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATA",date,"g")
        let line = substitute(line,"$FILE_NAME",common#GetFileName(),"g")
        let line = substitute(line,"$YEAR",year,"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(line("."),l:word)
endfunction

"======================================
"               Head init 
"======================================
function! common#InitHead()
    let initContent = readfile($HOME."/.vim/tmn/h.vim")
    let date = strftime("%Y.%m.%d")
    let year = strftime("%Y")
    let l:word = []
    for line in initContent 
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATA",date,"g")
        let line = substitute(line,"$FILE",toupper(strpart(common#GetFileName(),0,stridx(common#GetFileName(),"."))),"g")
        let line = substitute(line,"$YEAR",year,"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(0,l:word)
endfunction


"======================================
"               C/Cpp init 
"======================================
function! common#InitCpp()
    let initContent = readfile($HOME."/.vim/tmn/cpp.vim")
    let date = strftime("%Y.%m.%d")
    let year = strftime("%Y")
    let l:word = []
    for line in initContent 
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATA",date,"g")
        let line = substitute(line,"$FILE",strpart(common#GetFileName(),0,stridx(common#GetFileName(),".")),"g")
        let line = substitute(line,"$YEAR",year,"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(0,l:word)
endfunction


"======================================
"               vim script init 
"======================================
function! common#InitVimscript()
    let initContent = readfile($HOME."/.vim/tmn/vimscript.vim")
    call setline(1,"\" -*- coding: ".strpart($LANG,stridx($LANG,"\. ")+1,strlen($LANG))." -*-")
    let date = strftime("%Y.%m.%d")
    let year = strftime("%Y")
    let l:word = []
    for line in initContent 
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATA",date,"g")
        let line = substitute(line,"$FILE_NAME",common#GetFileName(),"g")
        let line = substitute(line,"$YEAR",year,"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(line("."),l:word)
endfunction

"======================================
"               java init 
"======================================
function! common#InitJava()
    let initContent = readfile($HOME."/.vim/tmn/java.vim")
    call setline(1,"// -*- coding: ".strpart($LANG,stridx($LANG,"\. ")+1,strlen($LANG))." -*-")
    let date = strftime("%Y.%m.%d")
    let l:word =[]
    for line in initContent
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATE",date,"g")
        let line = substitute(line,"$FILE_NAME",common#GetFileName(),"g")
        let line = substitute(line,"$FILE",strpart(common#GetFileName(),0,stridx(common#GetFileName(),".")),"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(line("."),l:word)
endfunction

"======================================
"               makefile init 
"======================================
function! common#InitMakefile()
    let initContent = readfile($HOME."/.vim/tmn/makefile.vim")
    let date = strftime("%Y.%m.%d")
    let l:word =[]
    for line in initContent
        let line = substitute(line,"$USER",strpart(b:user,-1,strlen(b:user)),"g")
        let line = substitute(line,"$DATE",date,"g")
        let line = substitute(line,"$FILE_NAME",common#GetFileName(),"g")
        let line = substitute(line,"$FILE",strpart(common#GetFileName(),0,stridx(common#GetFileName(),".")),"g")
        let line = substitute(line,"$MAIL",b:mail,"g")
        call add(l:word,line)
    endfor
    call append(line("."),l:word)
endfunction


