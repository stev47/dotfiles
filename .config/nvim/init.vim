set nocompatible

call plug#begin()

" sensible defaults (neovim has most of them)
Plug 'tpope/vim-sensible'
" latex stuff
Plug 'lervag/vimtex'
"let g:vimtex_mappings_enabled=1
let g:vimtex_compiler_latexmk = {
  \ 'backend' : 'process',
  \ 'background' : 1,
  \ 'build_dir' : '',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'options' : [
  \   '-lualatex',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \}

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'JuliaEditorSupport/julia-vim'

call plug#end()


" purely key position remapping (beware of keyboard layout changes)
runtime keymaps-layout.vim


" visuals
" =======

" syntax highlighting
colorscheme frugal
syntax on
" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" line numbering
set number


" simplify and speed up
" =====================

" don't redraw within macros, etc
set lazyredraw
" hide welcome message
set shortmess+=I
" don't create '*.swp' files all over
set noswapfile


" convenience
" ===========

" allow mouse interaction
if has('mouse') | set mouse=a | endif
" allow the cursor to be positioned anywhere
set virtualedit=all
" work with hidden buffers
set hidden

" indent stuff
set expandtab
set shiftwidth=2

" clipboard, save only to register '+'
set clipboard=unnamedplus


" staging
" =======

" expand to directory of current file
cnoremap %% <C-r>=fnameescape(expand('%:h')).'/'<CR>

" quick-edit
nmap <leader>e :e %%
nmap <leader>v :tabedit $MYVIMRC<CR>


" filetype specific
" =================

autocmd FileType mail set textwidth=79
