call plug#begin('~/.local/share/nvim/plugged')

"Use gcc to comment out a line (takes a count)
Plug 'tpope/vim-commentary'

"(ae and ie by default) to select the entire content of a buffer."
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" File explorer
Plug 'scrooloose/nerdtree'

call plug#end()

" Custom key mappings
map <C-n> :NERDTreeToggle<CR>
