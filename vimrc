execute pathogen#infect()
syntax on

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
