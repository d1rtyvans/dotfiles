" TODO
" - Auto wrap comments at 80 col
syntax on
filetype plugin indent on
colorscheme elflord

set nocompatible                               " Really no point in having this
set expandtab                                  " Don't bring tabs to the party
set tabstop=2 softtabstop=2 shiftwidth=2       " If you use four space tabs we can't be friends
set shiftround                                 " Indent how you're supposed to
set history=200                                " I'm a history buff
set nrformats-=octal                           " Increment numbers like 08 how one would expect
set splitbelow                                 " Split panes are weird without this
set splitright                                 " and this
set number                                     " Show dem line nums
set relativenumber                             " thoughtbot made me do it
set incsearch                                  " Go to search as it's being typed in
set ignorecase                                 " Ignore case when searching
set smartcase                                  " BUT use case when caps present
set hlsearch                                   " Highlight search matches
set nobackup nowritebackup noswapfile          " Damn swap files to hell
set nojoinspaces                               " Don't add a second space when joining
set nowrap                                     " For the love of god don't wrap
set list
set listchars=tab:»·,trail:·,extends:#,nbsp:·  " Display trailing whitespace
set wildmenu                                   " Tab moves through possible options
set wildmode=full
set cursorline                                 " See where cursor is easily
set so=10                                      " Add a lil padding when scrolling
set hid                                        " Hide abandoned buffers
set lazyredraw                                 " Redraw only when necessary
set pastetoggle=<F2>                           " No more :setpaste
set mouse=a                                    " Get pervy with the mouse in vim

let NERDSpaceDelims=1                          " '# Comment' > '#Comment'
let mapleader = ","                            " \ is too far
let g:mapleader = ","
" let &colorcolumn=join(range(81,999),",")       "80 char line limit my g

" Color current line number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Pressing <shift> takes too long
nnoremap ; :

" For j/k navigation of wrapped lines
nnoremap j gj
nnoremap k gk

" Move to beginning of text in line more easily)
nnoremap H ^

" turn off 'permanent' search highlight
nnoremap <leader><space> :nohlsearch<cr>

" Easily edit vimrc & refresh that thang
nnoremap <silent> <leader>ev :split $MYVIMRC<cr>
nnoremap <silent> <leader>rf :source $MYVIMRC<cr>

" GNAR DOGGIEZ BELOW
" ------------------
" TODO switch these thangs to ruby only
" Join method args to one line (in ruby)
nnoremap <leader>J ^f(v%:s/\v(\w+),\n */\1, /g<cr>
" Split method args onto multiple lines (in ruby)
nnoremap <leader>S ^vf):s/\v, /,\r/g<cr>f)=%

" Replace brackets w/ do end (in ruby)
" TODO
" - This leaves whitespace at end if there are no block args...
" - Doesn't work for multiple block args
nnoremap <leader>{ V:s/\v\{ *(\<bar>\w+\<bar>)? *(.+) +\}/do \1\r  \2\rend/g<cr>

" Replace do end w/ brackets (in ruby)
nnoremap <leader>} $? do$<cr>v/end<cr>:s/\v do$\n +(.+)\nend/ { \1 }/g<cr>

" { *(\|\w+\|)? *(.+) *}
"
nnoremap ' V:s/"/'/g<cr>
nnoremap " V:s/'/"/g<cr>
" -----------------

" Select a werd w/ space
nnoremap <space> viw

" Wrap word in double quotes
nnoremap <leader>" lbi"<esc>ea"<esc>
" Wrap word in single quotes
nnoremap <leader>' lbi'<esc>ea'<esc>
" Easily upcase stuff
vnoremap \ U

" Delete line
inoremap <c-d> <esc>ddi
" Upcase current word
imap <c-j> <esc><space> Uea
" Downcase current word
imap <c-l> <esc><space> uea

" 4 my ego
iabbrev @@    chris.scott@ext.airbnb.com
iabbrev ccopy Copyright 2019 Chris Scott, all rights reserved

iabbrev rqrh require 'rails_helper'

execute pathogen#infect()

" Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("be rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>a :call RunAllSpecs()<cr>

" Silver searcher iz ze best
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

"Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'

" Ctrl P 4 ctagzz
nnoremap <leader>. :CtrlPTag<cr>


" Powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
