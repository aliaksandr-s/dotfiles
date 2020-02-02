" -------------
" -- Plugins --
" -------------
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

" Git gutter
Plug 'airblade/vim-gitgutter'

" Autocmpletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-tsserver coc-json coc-eslint

" Linting
Plug 'dense-analysis/ale'

" Multiple cursor
" Plug 'terryma/vim-multiple-cursors'

" Pairs of mappings
Plug 'https://github.com/tpope/vim-unimpaired'

" Fuzzy findings
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Highlight indentation
Plug 'Yggdroot/indentLine'

" Emmet
Plug 'mattn/emmet-vim'


call plug#end()


" -------------------------
" -- Custom key mappings --
" -------------------------
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



" -------------------------
" -- Custom commands --
" -------------------------
nmap <leader>ff :FZF<CR>


" --------------------
" -- Other Settings --
" --------------------
let g:gruvbox_italic=1 "Enable italic
set guifont=Fira\ Code:h12
colorscheme gruvbox

" set tab width to 4
filetype plugin indent on
" set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" set tab width to 2
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"Show line number
set nu 

"Set mouse mode
set mouse=n 

"Auto current directory
" set autochdir 

"Fix Parcel hot realoading
set backupcopy=yes 

"find autocompletion
set wildmenu 

"always show signcolumns
set signcolumn=yes

" signcolumn color as background 
highlight clear SignColumn

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
set cmdheight=1


let g:user_emmet_leader_key=',' "Activate emmet with ,,


" --------------------
" -- Functions --
" --------------------
function! SimpleMenu(options)
  let l:choice_map = {}

  for choice in a:options
    let l:key = choice[0]
    let l:choice_map[l:key] = choice[2]

    echohl Boolean
    echon l:key . ' '
    echohl None
    echon choice[1]
    echo ''
  endfor

  let l:response = nr2char(getchar())

  redraw!

  if has_key(l:choice_map, l:response)
    call call(l:choice_map[l:response], [])
  endif
endfunction

" --------------------
" -- COC Settings --
" --------------------

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" ----------------------
" -- ALE Settings --
" ----------------------

" show info in a tooltip
let g:ale_set_balloons = 1

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'javascriptreact': ['eslint']
 \ }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" let g:ale_fix_on_save = 1

nmap <leader>alf :ALEFix<CR>
nmap <leader>ald :ALEDetail<CR>
" ----------------------
" -- Airline Settings --
" ----------------------

let g:airline_powerline_fonts = 1 "Powerline fonts
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Custom cursor line
" let g:airline#extensions#keymap#enabled = 0 "Hide current mapping
" let g:airline#extensions#xkblayout#enabled = 0 "Turn off xkblayout
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:Powerline_symbols='unicode' "Support unicode

" let g:NERDTreeWinPos = "right" "Open window on the right side 
