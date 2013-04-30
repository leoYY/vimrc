function! PythonPrint()
    let word=expand("<cword>")
    let inden = GetIndentWidth(getline("."))
    call append(line("."), inden . "print ".word)
endfunction
function! PythonDebug()
    let path = expand("%")
    write 
    exec '!python '.path
endfunction
function! AppendWithInden(line,string)
    let inden = GetIndentWidth(getline("."))
    call append(a:line,inden.a:string)
endfunction

:nnoremap <F2> :call PythonPrint()<CR>
:nnoremap <F5> :call PythonDebug()<CR>
:nnoremap <F3> :call AppendWithInden(".","print")<CR>
:nnoremap <F10> :!python <CR>
