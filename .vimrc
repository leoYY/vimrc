" <leader> is just like command-prefix like <C-B> in tmux ; default <leader> for vim is '\'
set exrc "support dynamic vimrc
set nu
set vb
set autoindent
set cindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set showmatch
set backspace=indent,eol,start
syntax enable
filetype plugin indent on
"sy on
colorscheme iceberg
" 设计背景透明度
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bj 

" keep in mind some shortcuts 
" [[ // search up and move cursor to nearest function starting point.
" ][ // search down and move cursor to nearest function endding point.
" ]] // search down and move cursor to second function starting point.
" [] // search up and move cursor to second function endding point.

" fold code
" some command zc,za,zR,zM. search for help; 
" Don't use this, it make insert too slow when syntax enable
set foldmethod=manual
set nofoldenable

"修改配置
nmap <F1> :tabnew ~/.vimrc<CR>
"更新配置
noremap <leadr>r : source ~/.vimrc<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ycm-core/YouCompleteMe', {'do':'python3 install.py --clangd-completer'}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'rust-lang/rust.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'mattn/vim-lsp-settings'
"Plug 'liuchengxu/vista.vim'
"Plug 'Shougo/echodoc.vim'
" Initialize plugin system
"Plug 'skywind3000/gutentags_plus'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'
" copy colors/iceberg.vim to .vim/colors/
Plug 'cocopon/iceberg.vim', {'do':'mkdir ~/.vim/colors && cp ./colors/iceberg.vim ~/.vim/colors/'} 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'puremourning/vimspector'
Plug 'skywind3000/asyncrun.vim'
call plug#end()

nnoremap <leader>jj :call common#GotoJump()<CR>

" For vista
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'vim_lsp'
"let g:vista_executive_for = {
"      \ 'cpp': 'vim_lsp',
"      \ 'rust': 'vim_lsp',
"  \ }
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 1
"map <C-c> :Vista <cr>


" For echodoc
"set cmdheight=2
"set noshowmode
"let g:echodoc_enable_at_startup=1
"let g:echodoc#type = "echo"

" For ale
" disable ale
" ln -s ale_linters dir to $HOME/.vim/
" duplicated lsp-server 
let g:ale_disable_lsp = 1
" 暂时没有好的配色，先关掉 
let g:ale_set_highlights = 0

let g:ale_linters = 
            \ {
            \   'rust': ['cargo', 'rls','analyzer'],
            \   'cpp': ['clang', 'clangd'],
            \   'c': ['clang', 'clangd']
            \ }
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
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"let g:ale_cpp_ccls_init_options = {'cache':{'directory': '/tmp/ccls/cache'}}


" For YCM
" CCLS need config files in prj root, ln -s should be fine.
" echo \"%compile_commands.json\" > .ccls-root 
" install brew install ccls
let g:ycm_clangd_binary_path = '/usr/bin/clangd' 
let g:ycm_language_server = [
            \   {
            \       'name': 'rust',
            \       'cmdline': ['rust-analyzer'],
            \       'filetypes': ['rust'],
            \       'project_root_files': ['Cargo.toml'],
            \   }
            \ ]
let g:ycm_rust_toolchain_root = '/Users/yuanyi/.rustup/toolchains/stable-x86_64-apple-darwin'
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.cpp_ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_auto_hover=''

"set completeopt=menu,menuone
set completeopt=menu,menuone,popup
set completepopup=height:10,width:60,highlight:InfoPopup
"set completepopup=align:menu,border:off,highlight:InfoPopup
"set completeopt=menu,menuone,preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"let g:loaded_youcompleteme = 1

"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
	   
nmap <leader>yf <Plug>(YCMFindSymbolInWorkspace)
noremap <leader>gg :YcmCompleter GoTo<CR>
noremap <leader>gc :YcmCompleter GoToCallers<CR>
noremap <leader>gi :YcmCompleter GoToImplementation<CR>
noremap <leader>gr :YcmCompleter GoToReferences<CR>

" for highlighting
let g:ycm_enable_semantic_highlighting = 1
" for trigger SignatureHelp Manually
imap <silent><C-l> <Plug>(YCMToggleSignatureHelp)

" END YCM 

" For vim-lsp
"let g:lsp_auto_enable = 0
"let g:lsp_insert_text_enabled = 0
"let g:lsp_text_edit_enabled = 0
"let g:lsp_completion_documentation_enabled = 0
"let g:lsp_document_highlight_enabled = 1
"" close vim-lsp diagnostics, use ALE
"let g:lsp_diagnostics_enabled=0
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = 'vim-lsp.log'
"if executable('clangd')
"    augroup lsp_clangd
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd']},
"                    \ 'allowlist' : ['cpp', "c"]
"                    \ })
"        autocmd FileType c setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType objc setlocal omnifunc=lsp#complete
"        autocmd FileType objcpp setlocal omnifunc=lsp#complete
"    augroup end
"endif
"
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    let g:lsp_format_sync_timeout = 1000
"    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"    " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

"echo  $LANG
"echo strftime(getftime(expand("%:t")))
"imap { {}<Esc>i
"imap < <><Esc>i

"noremap <S-j> gj
"noremap <S-k> gk
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
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%o4v][%p%%]\ [LEN=%L]

set laststatus=2
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"tlist
map <C-d> :Tlist <cr>

"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>

"NERDTree
nmap <s-c> :NERDTreeToggle <CR><c-w><c-w>
"map <C-X> :Vex <cr>
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
"let g:netrw_sort_by = 'time'
"let g:netrw_sort_direction = 'reverse'
"let g:netrw_browse_split = 4
let NERDTreeWinSize=32          " 设置NERDTree子窗口宽度
let NERDTreeWinPos="right"      " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1        " 显示隐藏文件
let NERDTreeMinimalUI=1         " NERDTree 子窗口中不显示冗余帮助信息

" For gtags
" brew install global
let $GTAGSLABEL = 'ctags'
let $GTAGSCONF = '/opt/homebrew/Cellar/global/6.6.8/share/gtags/gtags.conf'
set cscopetag
set cscopeprg='gtags-cscope' 
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []

if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
"
"brew install --HEAD universal-ctags/universal-ctags/universal-ctags
let g:gutentags_define_advanced_commands = 1

" for LeaderF
"nmap sf : LeaderfFunction <CR>
"nmap se : LeaderfFunctionAll <CR>
"nmap ff : LeaderfFile <CR>

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
" for macos font err
"      brew tap homebrew/cask-fonts
"      brew install --cask font-hack-nerd-font
"      set iterm font to Hack nerd font
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }

let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>ss :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf rg --current-buffer %s", "")<CR><CR>
noremap <leader>fi :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf rg %s", expand("<cword>"))<CR><CR>

noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update --debug` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsAutoUpdate = 1
let g:Lf_Gtagslabel = 'ctags'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>fg :<C-U><C-R>=printf("Leaderf gtags --all --result ctags-mod")<CR><CR>

" for view
nmap <C-w>z : tab split<CR>

"cscope
"cscope -Rbq -I dir(find include files) -P path
set cscopequickfix=s-,c-,d-,i-,t-,e-
" find c symbol
"nmap ss : cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
" find function definition
"nmap sg : cs find g <C-R>=expand("<cword>")<CR><CR>
" find called tree
"nmap sc : cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
" find string
"nmap st : cs find t <C-R>=expand("<cword>")<CR><CR>
" find this functinos called functions
"nmap sd : cs find d <C-R>=expand("<cword>")<CR><CR>
" find which files #include this
"nmap si : cs find i <C-R>=expand("<cword>")<CR><CR>
" find file
"nmap sf : cs find f <C-R>=expand("<cword>")<CR><CR>
" find egrep
"nmap se : cs find e <C-R>=expand("<cword>")<CR><CR>

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

" for vimspector 
let g:vimspector_install_gadgets = [ 'vscode-cpptools', 'CodeLLDB' ]
"let g:vimspector_enable_mappings = 'HUMAN'

" for asyncrun 
let g:asyncrun_open = 20
