set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'


source ~/.vim/keymaps.vim


" My Bundles
Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_no_mappings = 1
let g:LatexBox_latexmk_async = 1
let g:LatexBox_quickfix = 1
"let g:LatexBox_latexmk_options = '-pdflatex="TEXINPUTS=../common: pdflatex -synctex=1 %O %S"'
let g:LatexBox_latexmk_options = '-synctex=1'
let g:LatexBox_latexmk_env = 'TEXINPUTS=~/uni/common:'
let g:LatexBox_show_warnings = 0


"Bundle 'flazz/vim-colorschemes'
"Bundle "Lokaltog/vim-easymotion"

" Highlight CSS Colors, like #FF00000
"Bundle "stev47/vim-css-color"
"let g:cssColorVimDoNotMessMyUpdatetime = 1

" Snipmate
"Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"


let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<Tab>"
let g:UltiSnips.ListSnippets = "<C-Tab>"
let g:UltiSnips.JumpForwardTrigger = "¿"
let g:UltiSnips.JumpBackwardTrigger = "¡"

Bundle "MarcWeber/ultisnips"
set rtp+=~/.vim/snippets

" TODO: Doesn't work??
let g:UltiSnipsEditSplit = 'vertical'


"Bundle "Lokaltog/powerline"
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" web
"Bundle "mutewinter/vim-css3-syntax"
"Bundle "pangloss/vim-javascript"

" fugitive - git plugin
Bundle "tpope/vim-fugitive"


filetype plugin indent on


" Vala filetype detection
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala



"set fileformat=unix

set tabstop=4		"numbers of spaces of tab char
set shiftwidth=4
"set hlsearch
set number
syntax on
set autoindent
set smartindent
set formatoptions="cq"

"==========
" Project Setup
"==========

augroup ProjectSetup
	" force tabs in Makefiles
	autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=4
    " indentation rules for FFmpeg: 4 spaces, no tabs
    au BufRead,BufEnter /home/stev47/test/ffmpeg/* set expandtab shiftwidth=4 softtabstop=4 cindent
    au BufRead,BufEnter /home/stev47/uni/ana3/* set expandtab shiftwidth=2 softtabstop=2 cindent
augroup END


"=============
" My stuff
"==============





colorscheme mustang

function! LatexSetViewer()
	let g:LatexBox_viewer = "evince_vim_synctex " . v:servername
endfun
au BufEnter *.tex call LatexSetViewer()

function! LatexEvinceSearch()
	silent! call system('evince_forward_search "'. LatexBox_GetOutputFile(). '" ' . line('.') . ' ' . expand("%:p"))
endfun
"nmap ls :silent call LatexEvinceSearch()<Return>
nmap <Leader>ls :call LatexEvinceSearch()<Return>
"nmap <Leader>lv :LatexView<Return>


" Highlight trailing whitespace
" =============================
highlight TrailingWhitespace guibg=red ctermbg=red
match TrailingWhitespace /\s\+$/
" in insert mode, do not highlight whitespace preceding the cursor
autocmd InsertEnter * match TrailingWhitespace /\(\s\%#\@!\)\+$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/


" typo correction mappings
"--------------------------

" When I want to go left and Mod3 is still active.
"imap ∫ <Left>

" Save with Control s (I can't get myself used to this, not sure if it is
" needed)
nmap <C-s> :w<Return>
imap <C-s> <Esc>:w<Return>

" Movements with Neo2 keyboard layout
map <Home> ^
map <End> $
nmap <PageUp> 10<C-Y>
nmap <PageDown> 10<C-E>
" lookahead/lookbefore when in insert mode
inoremap <PageUp> <Esc>m"10<C-Y>`"a
inoremap <PageDown> <Esc>m"10<C-E>`"a

noremap <BS> X
noremap <Del> x

" Latex \[ \] --> \begin{align*} \end{align*}
nmap <Leader>la		<Plug>LatexChangeEnvalign*<Return>
nmap <Leader>lce		<Plug>LatexChangeEnv


" Horizontal Scrolling
map <S-ScrollWheelUp> 10zh
map <S-ScrollWheelDown> 10zl

" Make shortcut
"noremap <C-m> :make<Return>

" Habit-breaking
map pt <Nop>
map <C-w> <Nop>
map d <Nop>
noremap <C-q> <Nop>
noremap q <Nop>
noremap Q <Nop>
noremap & <Nop>
" <C-m> is equivalent to <CR>, so this is no good idea
"map <C-m> <Nop>


if has("gui_running")
	set lines=999 columns=999
else

endif


" LaTeX-Mappings

" Useful Mappings
noremap <F7> :set ff=unix<CR>:set fileencoding=utf-8<CR>:set encoding=utf-8<CR>

