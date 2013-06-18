set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles
Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_quickfix = 0
Bundle 'flazz/vim-colorschemes'
Bundle "Lokaltog/vim-easymotion"

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "MarcWeber/ultisnips"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

"let g:UltiSnips = {}
"let g:UltiSnips.snipmate_ft_filter = {
			\ 'default' : {'filetypes': ["FILETYPE", "_"] },
			\ 'html'    : {'filetypes': ["html", "javascript", "_"] },
			\ 'xhtml'    : {'filetypes': ["xhtml", "html", "javascript", "_"] },
			\ 'cpp'    : {'filetypes': [] },
			\ }
"let g:UltiSnips.ExpandTrigger = "<tab>"
"let g:UltiSnips.JumpForwardTrigger = "<tab>"
"let g:UltiSnips.always_use_first_snippet = 1

" web
Bundle "mutewinter/vim-css3-syntax"
Bundle "pangloss/vim-javascript"

" fugitive - git plugin
Bundle "tpope/vim-fugitive"


filetype plugin indent on


" Vala filetype detection
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala



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

    au BufRead,BufEnter /home/stev47/uni/ana3/* set expandtab shiftwidth=2 softtabstop=2 cindent
augroup END


"=============
" My stuff
"==============
"

function! LatexSetViewer()
	let g:LatexBox_viewer = "evince_vim_synctex " . v:servername
endfun
au VimEnter *.tex call LatexSetViewer()

function! LatexEvinceSearch()
	let cmd = 'evince_forward_search "'. LatexBox_GetOutputFile(). '" ' . line('.') . ' ' . expand("%:p")
	let output = system(cmd)
endfun
nmap ls :silent call LatexEvinceSearch()<Return>
"function! LatexEvinceSearch()
"	execute "!cd " . LatexBox_GetTexRoot() . '; evince_vim_dbus.py EVINCE "`basename ' . LatexBox_GetOutputFile(). '`" ' . line('.') . ' "%:p"'
"endfun
"command! LatexEvinceSearch call LatexEvinceSearch()
"au FileType tex map ls :silent LatexEvinceSearch


" Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=red guibg=red

" trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\(\s\|\t\)\+$/

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
nmap <PageUp> 10<C-Y>
nmap <PageDown> 10<C-E>
" lookahead/lookbefore when in insert mode
imap <PageUp> <Esc>m"<PageUp>`"a
imap <PageDown> <Esc>m"<PageDown>`"a


" Latex \[ \] --> \begin{align*} \end{align*}
nmap <Leader>la		<Plug>LatexChangeEnvalign*<Return>
nmap <Leader>lce		<Plug>LatexChangeEnv


" Horizontal Scrolling
map <S-ScrollWheelUp> 10zh
map <S-ScrollWheelDown> 10zl

" Make shortcut
nmap <C-m> :make<Return>
