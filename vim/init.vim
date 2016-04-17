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
let g:LatexBox_quickfix = 2
let g:LatexBox_latexmk_options = ' -e ' . shellescape('$pdflatex=q/xelatex -synctex=1 -shell-escape %O %S/')
let g:LatexBox_latexmk_env = 'TEXINPUTS=~/uni/common:'
let g:LatexBox_show_warnings = 1
let g:LatexBox_ignore_warnings = ['Underfull', 'Overfull']

let g:tex_flavor = 'latex'
let g:tex_nospell = 1
let g:tex_no_error = 1

"Bundle 'flazz/vim-colorschemes'
"Bundle "Lokaltog/vim-easymotion"

" Highlight CSS Colors, like #FF00000
"Bundle "stev47/vim-css-color"
"let g:cssColorVimDoNotMessMyUpdatetime = 1

" Snipmate
"Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" Autodetect indent style
Bundle "tpope/vim-sleuth"

let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<Tab>"
let g:UltiSnips.ListSnippets = "<C-Tab>"
let g:UltiSnips.JumpForwardTrigger = "¿"
let g:UltiSnips.JumpBackwardTrigger = "¡"
let g:UltiSnips.EditSplit = 'vsplit'

Bundle "MarcWeber/ultisnips"
set rtp+=~/.vim/snippets



"Bundle "Lokaltog/powerline"
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" web
"Bundle "mutewinter/vim-css3-syntax"
Bundle "pangloss/vim-javascript"
Bundle "digitaltoad/vim-jade"

" fugitive - git plugin
Bundle "tpope/vim-fugitive"

nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>



" vim-markdown - with github flavored markdown
Bundle "gabrielelana/vim-markdown"
let g:markdown_enable_insert_mode_mappings = 0

" Tabular plugin (aligning text)
Bundle "godlygeek/tabular"

" Julia
Bundle "JuliaLang/julia-vim"


filetype plugin indent on


" Vala filetype detection
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala



"set fileformat=unix

set tabstop=8
set shiftwidth=4
set expandtab
"set hlsearch
set number
syntax on
set autoindent
set smartindent
set formatoptions="cq"
set spelllang=""        " vim-markdown decides to switch it on if it's not empty
set clipboard^=unnamedplus
set mouse=a

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



" do not redraw in the midst of non-typed commands/macros
set lazyredraw

" mimic word-delete by ctrl+backspace
inoremap <C-BS> <Esc>dbi<Del>


" latex specific things
autocmd FileType tex source ~/.vim/latex.vim


set noswapfile


colorscheme mustang

function! LatexSetViewer()
    "let g:LatexBox_viewer = "evince_vim_synctex " . v:servername
    let g:LatexBox_viewer = "zathura -x " . shellescape("gvim --servername " . v:servername . " --remote-send '<Esc>:call foreground()<CR>' --remote-silent '+\\%{line}<Enter>zz' \\%{input}")
endfun
au BufEnter *.tex call LatexSetViewer()

"function! LatexEvinceSearch()
"    silent! call system('evince_forward_search "'. LatexBox_GetOutputFile(). '" ' . line('.') . ' ' . expand("%:p"))
"endfun

function! LatexForwardSearch ()
    silent! call system('zathura --synctex-forward ' . line('.') . ':' . col('.') . ':' . expand('%:p') . ' ' . 'course.pdf')
endfun

nmap <Leader>ls :silent call LatexForwardSearch()<Return>
"nmap <Leader>lv :LatexView<Return>


" Highlight trailing whitespace
" =============================
highlight TrailingWhitespace guibg=red ctermbg=red
match TrailingWhitespace /\s\+$/


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

" LaTeX mappings
"================

" Latex \[ \] --> \begin{align*} \end{align*}
nmap <Leader>la		<Plug>LatexChangeEnvalign*<Return>
nmap <Leader>lce		<Plug>LatexChangeEnv

map <Leader>lfm    :Tabularize/&<Return>:Tabularize/\\\\<Return>

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
    set guioptions -=T " hide toolbar
    set guioptions -=m " hide menubar
    set guioptions -=r " hide scrollbar
    set guioptions -=c " use console dialogs
    "set lines=999 columns=999
    if hostname() == "st-nb"
        set guifont=Monospace\ 9
    endif
else

endif


" LaTeX-Mappings

" Unix line endings + convert to UTF-8
noremap <F7> :set ff=unix<CR>:set fileencoding=utf-8<CR>:set encoding=utf-8<CR>

" Remove whitespace at end of line
noremap <F8> :%s/\s\+$//g<CR>

noremap <F9> :set ts=8<CR>:set et<CR>:set sw=4<CR>


" Workstation specific stuff
"============================

" Beware! match returns index on success and -1 on failure
if match(hostname(), '^stud') != -1

    " in insert mode, do not highlight whitespace preceding the cursor
    autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@!$/
    autocmd InsertLeave * match TrailingWhitespace /\s\+$/

    Bundle 'sgeb/vim-matlab'
    let g:mlint_path_to_mlint='/opt/matlab/bin/glnxa64/mlint'

elseif match(hostname(), 'nb$') != -1

    let g:loaded_matchparen = 0
    let g:LatexBox_loaded_matchparen = 1 " Not setting slows down editing considerably
    " These are useful even if LatexBox_loaded_matchparen is set
    " fixme: LatexBox shouldn't leave these out
    nmap <buffer> % <Plug>LatexBox_JumpToMatch
    vmap <buffer> % <Plug>LatexBox_JumpToMatch
    omap <buffer> % <Plug>LatexBox_JumpToMatch

else
    " in insert mode, do not highlight whitespace preceding the cursor
    autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@!$/
    autocmd InsertLeave * match TrailingWhitespace /\s\+$/

    "let g:mlint_path_to_mlint='/usr/local/MATLAB/R2013a/bin/glnxa64/mlint'
endif