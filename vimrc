syntax on
filetype plugin indent on
colorscheme elflord

set nocompatible                               " Really no point in having this
set expandtab                                  " Don't bring tabs to the party
set tabstop=2 softtabstop=2 shiftwidth=2       " If you use four space tabs we can't be friends
set shiftround                                 " Indent how you're supposed to
set history=200                                " I guess this makes me a... History buff
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
nmap ; :

" For j/k navigation of wrapped lines
nmap j gj
nmap k gk

" turn off 'permanent' search highlight
nmap <leader><space> :nohlsearch<cr>

" Easily edit vimrc & refresh that thang
nmap <silent> <leader>ev :e ~/.vimrc<cr>
nmap <silent> <leader>rf :source ~/.vimrc<cr>

" Ctrl P 4 ctagzz
nmap <leader>. :CtrlPTag<cr>

" Select a werd w/ space
nmap <space> viw

" Easily upcase stuff
vmap \ U

" Pointless insert mode mappings below
" Delete line
imap <c-d> <esc>ddi

" Upcase/downcase current word
imap <c-j> <esc><space> Uea
imap <c-l> <esc><space> uea

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
    nmap \ :Ag<SPACE>
  endif
endif

"Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'


" Powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
