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
syntax enable
filetype plugin indent on
"sy on
colorscheme desert
"修改配置
nmap <F1> :tabnew ~/.vimrc<cr>


" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe', {'do':'/usr/local/bin/python3 install.py --clangd-completer'}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Shougo/echodoc.vim'
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

" For ale
" disable ale
"let g:ale_disable_lsp = 1
" 暂时没有好的配色，先关掉 
let g:ale_set_highlights = 0

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_fixers = {
            \    'c' : ['clang-format'],
            \    'cpp' : ['clang-format'],
            \    'rust' : ['rustfmt']
            \ }

"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"let g:ale_cpp_ccls_init_options = {'cache':{'directory': '/tmp/ccls/cache'}}


" For YCM
" CCLS need config files in prj root, ln -s should be fine.
" echo \"%compile_commands.json\" > .ccls-root 
" install brew install ccls
let g:ycm_language_server = [
            \   {
            \       'name': 'rust',
            \       'cmdline': ['rust-analyzer'],
            \       'filetypes': ['rust'],
            \       'project_root_files': ['Cargo.toml'],
            \   }
            \ ] 
"            \   {
"            \       'name': 'ccls',
"            \       'cmdline': ['ccls'],
"            \       'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
"            \       'project_root_files': ['.ccls-root', 'compile_commands.json']
"            \   }
"            \]
let g:ycm_rust_toolchain_root = '/Users/yuanyi/.rustup/toolchains/stable-x86_64-apple-darwin'
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.cpp_ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

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
"source $HOME/.vim/script/python.vim
"autocmd bufnewfile *.py call InitPythonClass()
    
"显示状态信息
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%o4v][%p%%]\ [LEN=%L]

set laststatus=2
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"tlist
map <C-c> :Tlist <cr>

"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>

"NERDTree
"nmap <C-d> :NERDTreeToggle <CR>
"
map <C-X> :Vex <cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_sort_by = 'time'
let g:netrw_sort_direction = 'reverse'
let g:netrw_browse_split = 4

"cscope
"cscope -Rbq -I dir(find include files) -P path
set cscopequickfix=s-,c-,d-,i-,t-,e-
" find c symbol
nmap ss : cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
" find function definition
nmap sg : cs find g <C-R>=expand("<cword>")<CR><CR>
" find called tree
nmap sc : cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
" find string
nmap st : cs find t <C-R>=expand("<cword>")<CR><CR>
" find this functinos called functions
nmap sd : cs find d <C-R>=expand("<cword>")<CR><CR>
" find which files #include this
nmap si : cs find i <C-R>=expand("<cword>")<CR><CR>
" find file
nmap sf : cs find f <C-R>=expand("<cword>")<CR><CR>
" find egrep
nmap se : cs find e <C-R>=expand("<cword>")<CR><CR>

"plugin xml.vim  needs 
":filetype plugin indent on
"set completeopt=longest,menu
"function! GetIndentWidth(string)
"    let indent  = '' 
"    let i       = 0
"    let len     = len(a:string)
"    while i < len
"        if a:string[i] != ' '
"            break
"        else
"            let indent .= ' ' 
"        endif
"        let i   += 1
"    endwhile
"
"    return indent
"endfunction
"
"autocmd bufnewfile,bufread *.py so $HOME/.vim/script/pythonlib.vim
"autocmd BufNewFile *.vim call common#InitVimscript()
"autocmd BufNewFile *.awk call common#InitGawkscript()
"autocmd BufNewFile *.cpp call common#InitCpp()
"autocmd BufNewFile *.h call common#InitHead()
"autocmd BufNewFile *.c call common#InitCpp()
"autocmd BufNewFile Makefile call common#InitMakefile()

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

let g:pymode_python = 'python3'
let g:pymode_rope = 0
