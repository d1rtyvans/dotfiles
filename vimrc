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

" See ur directoriez
noremap <c-n> :NERDTreeToggle<cr>

" Pressing <shift> takes too long
nnoremap ; :

" For j/k navigation of wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap \ :Ag 

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
" - Normalize indent after running this
nnoremap <leader>{ V:s/\v\{ *(\<bar>\w+\<bar>)? *(.+) +\}/do \1\r  \2\rend/g<cr>

" Replace do end w/ brackets (in ruby)
nnoremap <leader>} $? do$<cr>v/end<cr>:s/\v do$\n +(.+)\nend/ { \1 }/g<cr>

" swap single and double quotes, vice versa
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

" Copy line to clipboard
nnoremap yl V"*y

" 4 my ego
iabbrev @@    chris.scott@ext.airbnb.com
iabbrev ccopy Copyright 2019 Chris Scott, all rights reserved

iabbrev rrh require 'rails_helper'<cr><cr>RSpec.describe
iabbrev bdp require 'pry'; binding.pry<esc>
iabbrev fsl # frozen_string_literal: true<cr><bs>

execute pathogen#infect()

" Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("be rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>a :call RunAllSpecs()<cr>


" Ctrl P 4 ctagzz
nnoremap <leader>. :Tags<cr>

" Powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" FZF
set rtp+=/usr/local/opt/fzf

nnoremap <c-p> :Files<cr>

" Handle tabs differently in Golang
au BufNewFile,BufRead *.go set nolist
autocmd FileType go set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
