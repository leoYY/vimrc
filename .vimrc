"default set 
set exrc "support dynamic vimrc
set nu
set vb
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showmatch
set backspace=indent,eol,start
syntax on
"sy on
colorscheme desert
"修改配置
nmap <F1> :tabnew ~/.vimrc<cr>

"echo  $LANG
"echo strftime(getftime(expand("%:t")))
"imap { {}<Esc>i
"imap < <><Esc>i

noremap <S-j> gj
noremap <S-k> gk
"noremap <S-h> g0
"noremap <S-l> g$

"跳转窗口方面
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
"调整窗口
"nmap <C-=> <C-W>+
"nmap <C--> <C-W>-
"nmap <C--> :res-1 <cr>
"nmap <C-=> :res+1 <cr>
"nmap <s-=> :resize -10 <cr>

"tab 操作
nmap <C-N> :tabnew .<cr>
nmap <s-h> :tabprevious <cr>
nmap <s-l> :tabnext <cr>

"移动窗口
"nmap <s-Down> <C-W>J
"nmap <s-Left> <C-W>H
"nmap <s-Right> <C-W>L
"nmap <s-Up> <C-W>K



"加载自定义脚本
source $HOME/.vim/script/python.vim
autocmd bufnewfile *.py call InitPythonClass()
    
"显示状态信息
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%o4v][%p%%]\ [LEN=%L]
set laststatus=2
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"tlist
map <C-c> :Tlist <cr>

"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>

"cscope 
set cscopequickfix=s-,c-,d-,i-,t-,e- 
nmap ss : cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR> 
nmap sg : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap sc : cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap st : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap sd : cs find d <C-R>=expand("<cword>")<CR><CR>

"plugin xml.vim  needs 
:filetype plugin indent on
"set completeopt=longest,menu
function! GetIndentWidth(string)
    let indent  = '' 
    let i       = 0
    let len     = len(a:string)
    while i < len
        if a:string[i] != ' '
            break
        else
            let indent .= ' ' 
        endif
        let i   += 1
    endwhile

    return indent
endfunction

autocmd bufnewfile,bufread *.py so $HOME/.vim/script/pythonlib.vim
autocmd BufNewFile *.vim call common#InitVimscript()
autocmd BufNewFile *.awk call common#InitGawkscript()
autocmd BufNewFile *.cpp call common#InitCpp()
autocmd BufNewFile *.h call common#InitHead()
autocmd BufNewFile *.c call common#InitCpp()
autocmd BufNewFile Makefile call common#InitMakefile()

set encoding=utf-8
set fileencoding=ucs-bom,utf-8,cp936
set termencoding=utf-8
