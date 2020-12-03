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

" themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

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
" Plug 'mattn/emmet-vim'

" clojure nrepl
Plug 'tpope/vim-fireplace'

" autoclose tags
Plug 'alvan/vim-closetag'

" text allignment
Plug 'junegunn/vim-easy-align'

" smooth scrolling (C-U; C-D)
Plug 'https://github.com/Kazark/vim-SimpleSmoothScroll'

" delete buffer without closing window
Plug 'https://github.com/moll/vim-bbye'

" s-exp - required by vim iced
Plug 'guns/vim-sexp' 
Plug 'liquidz/vim-iced', {'for': 'clojure'}

" s-exp for regular people
Plug 'git://github.com/tpope/vim-sexp-mappings-for-regular-people'
Plug 'git://github.com/tpope/vim-repeat'

" Search for a visual selection
Plug 'https://github.com/nelstrom/vim-visual-star-search'

" Interactive environment for evaluating code
Plug 'Olical/conjure', {'tag': 'v4.8.0'}

" janet syntax support
Plug 'bakpakin/janet.vim'

" modern generic interactive finder and dispatcher
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Better Django support
Plug 'https://github.com/tweekmonster/django-plus.vim'

" Start screen and sessions
Plug 'mhinz/vim-startify'

call plug#end()


" -------------------------
" -- Custom key mappings --
" -------------------------

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

" set localleader as space
let maplocalleader="\<space>"

" Tab width hotkeys
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

" Delete buffer
nnoremap <Leader>d :Bdelete<CR>


" vim word completion navigating with 'j' and 'k'
" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

map <C-n> :NERDTreeToggle %<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" align inside [] and {}
nnoremap <buffer> <leader>a[ vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
nnoremap <buffer> <leader>a{ vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=



" --------------------
" -- Other Settings --
" --------------------
let g:gruvbox_italic=1 "Enable italic
" set guifont=Fira\ Code:h12
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

" smartcase search (lowercase is case insensitive)
set ignorecase
set smartcase

" Share the default yank register with your system clipboard
set clipboard=unnamedplus

" let g:user_emmet_leader_key='\' "Activate emmet with ,,

" no conceal for markdown files
au FileType markdown setl conceallevel=0

" better go file for javascript
au FileType javascript,javascriptreact set path=.,src

" --------------------
" -- FZF ------
" --------------------

" Launch Fzf hotkeys
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Ag<CR>
" nmap <leader>ff :FZF<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>ff! :Files!<CR>
nnoremap <silent> <Leader>ag :Ag<CR>
nnoremap <silent> <Leader>ag! :Ag!<CR>
nnoremap <silent> <Leader>rg :Rg ''<CR>
nnoremap <silent> <Leader>rg! :Rg! ''<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
" Example: :Rg myterm -g '*.md'
" Example: :Rg -t html myterm
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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ----------------------
" -- ALE Settings --
" ----------------------

" show info in a tooltip
let g:ale_set_balloons = 1

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'javascriptreact': ['eslint']
 \ }

let g:ale_linters = {'clojure': ['clj-kondo']}

" let g:ale_fix_on_save = 1

nmap <leader>fix :ALEFix<CR>
nmap <leader>ald :ALEDetail<CR>

" ----------------------
" -- Airline Settings --
" ----------------------
let g:airline_powerline_fonts = 1 "Powerline fonts
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Custom cursor line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:Powerline_symbols='unicode' "Support unicode


" ----------------------
" -- Startify Settings --
" ----------------------
let g:startify_change_to_dir       = 0
let g:startify_session_persistence = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


" --------------------------
" -- Other plugins Settings --
" --------------------------
let g:indentLine_fileTypeExclude = ['json', 'markdown']
let g:iced_enable_default_key_mappings = v:true
