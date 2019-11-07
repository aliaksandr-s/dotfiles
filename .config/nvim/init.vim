" -- Plugins --
call plug#begin('~/.local/share/nvim/plugged')

" Use gcc to comment out a line (takes a count)
Plug 'tpope/vim-commentary'
            
" (ae and ie by default) to select the entire content of a buffer."
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" NerdTree File explorer
Plug 'scrooloose/nerdtree'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Status bar
Plug 'vim-airline/vim-airline'

" Icons for Airline and Nerdtree
Plug 'ryanoasis/vim-devicons'

" Easy surroundigs
Plug 'tpope/vim-surround'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Notes taking
Plug 'vimwiki/vimwiki'

" Autocmpletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-tsserver coc-json

" Multiple cursor
" Plug 'terryma/vim-multiple-cursors'

" Pairs of mappings
Plug 'https://github.com/tpope/vim-unimpaired'

" Fuzzy findings
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
" --------------- "

" -- Custom key mappings --
map <C-n> :NERDTreeToggle<CR>

" Replace highlighting
nnoremap <C-s> :%s///g<left><left>

" Clear highlighting
" nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <esc><esc> :noh<return>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Stop terminal mode
tnoremap <Esc> <C-\><C-n>
" --------------- "



" -- Other Settings --
colorscheme gruvbox

" set tab width to 4
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

set nu "Show line number
set mouse=n "Set mouse mode

set autochdir "Auto current directory

set backupcopy=yes "Fix Parcel hot realoading

let g:gruvbox_italic=1 "Enable italic

let g:airline_powerline_fonts = 1 "Powerline fonts
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Custom cursor line
" let g:airline#extensions#keymap#enabled = 0 "Hide current mapping
" let g:airline#extensions#xkblayout#enabled = 0 "Turn off xkblayout
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:Powerline_symbols='unicode' "Support unicode

" let g:NERDTreeWinPos = "right" "Open window on the right side 
" --------------- "
