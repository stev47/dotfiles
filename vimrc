set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'flazz/vim-colorschemes'
Bundle "Lokaltog/vim-easymotion"

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" web
Bundle "mutewinter/vim-css3-syntax"
Bundle "pangloss/vim-javascript"


filetype plugin indent on


set tabstop=4		"numbers of spaces of tab char
set shiftwidth=4
"set hlsearch
set number
syntax on
set autoindent
set smartindent



" My stuff

" typo correction mappings

" Some remappings for mistyped ':w'
cmap ^ <C-R>=Circumflex()<CR>
function! Circumflex()
	if getcmdtype() == ':' && getcmdpos() == 1
		return 'w'
	else
		return '^'
	endif
endfunction
cmap <PageDown> w


" Save with Control s (I can't get myself used to this, not sure if it is
" needed)
nmap <C-s> :w<Return>
imap <C-s> <Esc>:w<Return>a

" Prevent some strange command line from occasionally popping up
nmap q: :

" Movements with Neo2 keyboard layout
nmap <Home> ^
nmap <End> $
nmap <PageUp> <C-U>
nmap <PageDown> <C-D>
" lookahead/lookbefore when in insert mode
imap <PageUp> <Esc>m"<C-U>`"a
imap <PageDown> <Esc>m"<C-D>`"a

