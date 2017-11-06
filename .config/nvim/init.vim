set nocompatible

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
" show status bar even with only one window
set laststatus=2


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
" show tab-completion option
set wildmenu

" indent stuff
set expandtab
set shiftwidth=2
" keep indent of previous line
set autoindent
" Tab in insert mode increases indent (respecting 'shiftwidth')
set smarttab

" clipboard, save only to register '+'
set clipboard=unnamedplus




" staging
" =======

" autoscroll when cursor moves close to edge
set scrolloff=2
set sidescrolloff=5

" use extended group matching (think %)
runtime! macros/matchit.vim


" filetype specific
" =================

autocmd FileType mail set textwidth=79
