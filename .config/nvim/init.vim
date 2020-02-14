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
Plug 'philrunninger/nerdtree-visual-selection'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" css colors preview
Plug 'ap/vim-css-color'
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

" Pairs of mappings [*, ]*
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

" clojure nrepl
Plug 'tpope/vim-fireplace'

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

" Remap line motions
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nmap \4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Stop terminal mode
tnoremap <Esc> <C-\><C-n>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" " for replacing a few instances of the term (comparable to multiple
" cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn


" vim word completion navigating with 'j' and 'k'
" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"


" --------------------
" -- Other Settings --
" --------------------
let g:gruvbox_italic=1 "Enable italic
set guifont=Fira\ Code:h12
colorscheme gruvbox

" filetype detection
filetype plugin indent on

" set tab width to 2
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab


" set tab width to 4
" set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

"Show line number
set nu 

"Set mouse mode
set mouse=n 

"Auto current directory
" set autochdir 

"Fix Parcel hot realoading
set backupcopy=yes 

"find cmd autocompletion
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

" Share the default yank register with your system clipboard
set clipboard=unnamedplus

let g:user_emmet_leader_key='\' "Activate emmet with ,,

" no conceal for markdown files
au FileType markdown setl conceallevel=0

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
" -- FZF ------
" --------------------

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>
" nmap <leader>ff :FZF<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

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


" --------------------------
" -- Indent Line Settings --
" --------------------------

let g:indentLine_fileTypeExclude = ['json', 'markdown']

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
