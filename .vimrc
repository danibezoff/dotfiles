" be iMproved
set nocompatible

" set shell
set shell=/bin/bash

" for Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""" netrw """""""""""""""""""
" remove top banner
let g:netrw_banner = 0

"""""""""""""" CtrlP """""""""""""""""""
" change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" allows opening files in windows created by netrw
let g:ctrlp_reuse_window = 'netrw'

" don't ignore dotfiles
let g:ctrlp_show_hidden = 1

" custom ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.git)$'

" show mru files only in cwd
let g:ctrlp_mruf_relative = 1

" set no limit for files number to scan
let g:ctrlp_max_files = 0

" allow opening the same file in different buffers
let g:ctrlp_switch_buffer = 1

"""""""""""""" table-mode """"""""""""""
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"""""""""""""" Emmet """""""""""""""""""
" enable just for html
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall

" remedy ambiguous use of user-defined command
command! E Explore

"""""""""""""" COMMON """"""""""""""""""
colorscheme minimalist

" show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" folders for .swp and backup files
set directory=~/.vim/swaps//,.
set backupdir=~/.vim/backups//,.

" show where 80 chars area ends
set colorcolumn=81

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 2 spaces
set tabstop=2

" when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" show the matching part of the pair for [] {} and ()
set showmatch

" extended match with '%'
runtime macros/matchit.vim

" allow switching buffers if current one have unsaved edits
set hidden

" use smartcase for search
set ignorecase
set smartcase

" highlight notes
augroup myTodo
  autocmd!
  autocmd Syntax * syntax match myTodo
        \ /\v.<(TODO|FIXME|NOTE|HACK|OPTIMIZE):/hs=s+1 containedin=ALL
augroup END
highlight link myTodo Todo

" create foldings and open them
set foldmethod=syntax
set foldlevel=999

"""""""""""""" GOLANG """"""""""""""""""
" don't highlight trailing space
let g:go_highlight_trailing_whitespace_error=0

"""""""""""""" CUSTOM BINDINGS """""""""
" `^ restores the cursor position so exiting insert does not move the cursor left.
inoremap <Esc> <Esc>`^
" uses Tab for autocompletion
inoremap <Tab> <C-n>
" to insert actual tab character
inoremap <Leader><Tab> <Tab>
" disable Ex mode on Q
nnoremap Q <nop>

"""""""""""""" CUSTOM COMMANDS """""""""
" toggle English spellcheck
command SC setlocal spell! spelllang=en_us
