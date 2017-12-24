execute pathogen#infect()
syntax on

filetype plugin on
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" powerline config
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
