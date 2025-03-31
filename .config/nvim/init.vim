set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"source ~/.vimrc

colorscheme iceberg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bj 
set autoindent
set cindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nu

nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

let g:diagnostic_sign_error = '✗'
let g:diagnostic_sign_warning = '⚡'
let g:diagnostic_sign_info = "➤"
let g:diagnostic_sign_hint = "➜"

let g:asyncrun_open = 20

imap <silent><script><expr> <C-L> copilot#Accept()
let g:copilot_no_tab_map = v:true

lua require('plugins')
lua require('keymaps')
lua require('properties')

set clipboard=unnamedplus
set mouse=a
