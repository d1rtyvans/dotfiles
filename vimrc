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
set splitright
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
set number                                     " Line numbers r ugly but necessary
set relativenumber                             " thoughbot made me do it
set mouse=a                                    " Scroll noob

" Make line number colors better
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Don't show end of buffer ~
highlight EndOfBuffer ctermfg=black ctermbg=black

let NERDSpaceDelims=1                          " '# Comment' > '#Comment'
let mapleader = ","                            " \ is too far
let g:mapleader = ","
" let &colorcolumn=join(range(81,999),",")       "80 char line limit my g

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Pressing <shift> takes too long
nmap ; :

" For j/k navigation of wrapped lines
nmap j gj
nmap k gk

" Zoom and resize windows
nmap Zz <c-w>_ \| <c-w>\|
nmap Zo <c-w>=

" Move to beginning of text in line more easily)
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nnoremap H ^

" turn off 'permanent' search highlight
nmap <leader><space> :nohlsearch<CR>

" Easily edit vimrc
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>rf :source $MYVIMRC<cr>

" swap single and double quotes, vice versa
nmap ' V:s/"/'/g<cr>
nmap " V:s/'/"/g<cr>

" Select a werd w/ space
nmap <space> viw

iabbrev bdp require 'pry'; binding.pry<esc>
iabbrev fsl # frozen_string_literal: true<cr><bs>
execute pathogen#infect()


" Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Use Ag over Grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nmap \ :Ag<SPACE>
  endif
endif

" Use % for more stuff
runtime macros/matchit.vim


" Use FZF to find files
" TODO Depends on original fzf package, automate a brew install of this
set rtp+=/usr/local/opt/fzf
nmap <c-p> :Files<cr>
nmap <leader>. :Tags<cr>

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
