syntax on
filetype plugin indent on

set nocompatible
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set wildmenu
set incsearch
set wildmode=full
set history=200
set nrformats-=octal
colorscheme zellner
execute pathogen#infect()

" Vim Rspec
let g:rspec_command = 'call Send_to_Tmux("be rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

