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


" Vala filetype detection
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala


set lines=35 columns=110
winpos 550 150


set fileformat=unix

set tabstop=4		"numbers of spaces of tab char
set shiftwidth=4
"set hlsearch
set number
syntax on
set autoindent
set smartindent


"==========
" FFmpeg
"==========

augroup ProjectSetup
	" allow tabs in Makefiles
	autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=8
	" Trailing whitespace and tabs are forbidden, so highlight them.
	highlight ForbiddenWhitespace ctermbg=red guibg=red
    " indentation rules for FFmpeg: 4 spaces, no tabs
    au BufRead,BufEnter /home/stev47/test/ffmpeg/* set expandtab shiftwidth=4 softtabstop=4 cindent
    au BufRead,BufEnter /home/stev47/test/ffmpeg/* match ForbiddenWhitespace /\s\+$\|\t/
    " Do not highlight spaces at the end of line while typing on that line.
    au BufRead,BufEnter /home/stev47/test/ffmpeg/* autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

    au BufRead,BufEnter /home/stev47/uni/ana3/hmenke/* set expandtab shiftwidth=2 softtabstop=2 cindent
augroup END


"=============
" My stuff
"==============

" typo correction mappings
"--------------------------

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

" When I want to go left and Mod3 is still active.
imap ∫ <Left>

" Save with Control s (I can't get myself used to this, not sure if it is
" needed)
nmap <C-s> :w<Return>
imap <C-s> <Esc>:w<Return>

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


" Latex \[ \] --> \begin{align*} \end{align*}
nmap <Leader>la		<Plug>LatexChangeEnvalign*<Return>


