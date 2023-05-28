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

let g:diagnostic_sign_error = '✗'
let g:diagnostic_sign_warning = '⚡'
let g:diagnostic_sign_info = "➤"
let g:diagnostic_sign_hint = "➜"

lua require('plugins')
lua require('keymaps')
lua require('properties')

