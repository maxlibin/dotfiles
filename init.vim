lua require("init")
lua require('plugins')

" Start Vim  
" ------------------------------------------------------------------------------
set undodir=~/.vim/undordir
set undofile
set nocompatible
filetype plugin on

call plug#begin('~/.vim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomlion/vim-solidity'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'rescript-lang/vim-rescript'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'andymass/vim-matchup'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'terryma/vim-multiple-cursors'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1 

let g:tokyonight_style = "night"
"let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
set background=dark
colorscheme tokyonight

" ------------------------------------------------------------------------------
" Configs for COC plugin
" ------------------------------------------------------------------------------

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :sp<CR><Plug>(coc-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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


" ------------------------------------------------------------------------------
" Other Keys mapping 
" ------------------------------------------------------------------------------
" nmap <C-b> :Vexplore<CR>
nnoremap <space>e :CocCommand explorer<CR>
" nmap <C-g> :GFiles<CR>
nmap <C-h> :History<CR>
nmap <C-p> :Files<CR>
" Find files using Telescope command-line sugar.
nmap <C-g> :Telescope find_files<CR>
nmap <C-f> :Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <C-s> :w<CR>
imap jj <Esc>
imap kk <Esc>
nnoremap <silent> <C-z> :FloatermToggle<Enter>                                                                                                                                                                                                                                    
tnoremap <silent> <C-z> <C-\><C-n>:FloatermToggle<CR>
vnoremap <leader>c :OSCYank<CR>

" move among buffers with CTRL
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>
" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" -----------------------------------------------------------------------------

" Formting ReasonML with bsrefmt
augroup reasonml
autocmd!
  autocmd FileType reason nmap <silent> == :! yarn bsrefmt --in-place -w 120 %:p <CR> :e! <CR>
augroup END

" enable autocomplete
let g:deoplete#enable_at_startup = 1

" -----------------------------------------------------------------------------
" Set Yank to end the visual block at last line
" -----------------------------------------------------------------------------
function! YRRunAfterMaps()
  vmap y ygv<Esc>
endfunction
" -----------------------------------------------------------------------------

" Set floating window border line color to cyan, and background to orange
" hi FloatermBorder guifg=cyan

autocmd InsertEnter,InsertLeave * set cul!
hi CursorColumn guibg=#202020
hi CursorLine guibg=#202020

set t_ZH=^[[3m
set t_ZR=^[[23m
set clipboard^=unnamed,unnamedplus
