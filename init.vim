lua require("init")
lua require('plugins')

set undodir=~/.vim/undordir
set undofile

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

colorscheme tokyonight-night

" Formting ReasonML with bsrefmt
augroup reasonml
  autocmd!
  autocmd FileType reason nmap <silent> == :! yarn bsrefmt --in-place -w 120 %:p <CR> :e! <CR>
augroup END

" enable autocomplete
let g:deoplete#enable_at_startup = 1
"
" Showing minimap - https://github.com/wfxr/minimap.vim
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

autocmd InsertEnter,InsertLeave * set cul!
hi CursorColumn guibg=#050020
hi CursorLine guibg=#050020

set t_ZH=^[[3m
set t_ZR=^[[23m
" set clipboard^=unnamed,unnamedplus

autocmd BufRead,BufNewFile *.atd set filetype=ocaml

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
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <C-s> :w<CR>
imap jj <Esc>
imap kk <Esc>
" setup mapping to call :LazyGit
vnoremap <leader>c :OSCYank<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

" move among buffers with CTRL
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>
" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" ------------------------------------------------------------------------------
" Configs for COC plugin
" ------------------------------------------------------------------------------

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

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

" " Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
"autocmd CursorHold * silent call CocActionAsync('highlight')

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
