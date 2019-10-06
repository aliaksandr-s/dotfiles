call plug#begin('~/.local/share/nvim/plugged')

"Use gcc to comment out a line (takes a count)
Plug 'tpope/vim-commentary'



"Provide text objects (ae and ie by default) to select the entire content of a buffer."
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

call plug#end()
