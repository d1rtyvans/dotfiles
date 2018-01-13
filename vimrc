syntax on
filetype plugin indent on

set nocompatible
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set ruler
set history=200
set nrformats-=octal
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase
set hlsearch

" turn off 'permanent' search highlight
nnoremap <leader><space> :nohlsearch<CR>

set wildmenu
set wildmode=full
set cursorline
set so=10              " Keep cursor centered when scrolling vertically
set hid                " Hide abandoned buffers

" Fuq .swp files
set nobackup
set nowritebackup
set noswapfile
set nojoinspaces

" Display trailing whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set foldenable
set foldmethod=indent
set foldlevelstart=10  " Start w/ folds open
set foldnestmax=10     " Don't get too fold crazy
nnoremap <space> za    " `space` opens/closes folds

set lazyredraw         " Redraw only when necessary
nnoremap j gj          " For vertical navigation of long wrapping annoying strings
nnoremap k gk

colorscheme elflord
execute pathogen#infect()


" Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("be rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


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


" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
