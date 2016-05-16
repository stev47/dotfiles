set nocompatible
filetype off

" keyboard-layout remapping
"source ~/.vim/keymaps.vim

" vundle for vim plugins
set rtp+=~/.vim/bundle/vundle
call vundle#begin()


Plugin 'gmarik/vundle'

" local directory config
set exrc
set secure

" disable welcome screen
set shortmess+=I

" My Plugins

" LaTeX-Box
Plugin 'LaTeX-Box-Team/LaTeX-Box'
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


" lib, needed?
Plugin 'tomtom/tlib_vim'

" autodetect indent style
Plugin 'tpope/vim-sleuth'


" ultisnips, snippets
Bundle "MarcWeber/ultisnips"
set rtp+=~/.vim/snippets
let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<Tab>"
let g:UltiSnips.ListSnippets = "<C-Tab>"
let g:UltiSnips.JumpForwardTrigger = "¿"
let g:UltiSnips.JumpBackwardTrigger = "¡"
let g:UltiSnips.EditSplit = 'vsplit'


" web

"Plugin 'mutewinter/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
" highlight HTML/CSS colors like #FF00000
"Plugin 'stev47/vim-css-color'
"let g:cssColorVimDoNotMessMyUpdatetime = 1


" fugitive - git plugin
Plugin 'tpope/vim-fugitive'
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>



" vim-markdown - with github flavored markdown
Plugin 'gabrielelana/vim-markdown'
let g:markdown_enable_insert_mode_mappings = 0

" Tabular plugin (aligning text)
Plugin 'godlygeek/tabular'

" Julia
Plugin 'JuliaLang/julia-vim'


" vundle end
call vundle#end()
filetype plugin indent on


" Vala filetype detection
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala



"set fileformat=unix

set tabstop=8
set shiftwidth=4
set expandtab
set number
syntax on
set smartindent
set formatoptions="cq"
set spelllang=""        " vim-markdown decides to switch it on if it's not empty
set clipboard^=unnamedplus
set mouse=a
set virtualedit=all


"=============
" My stuff
"==============

" use hidden buffers
set hidden

" expand to directory of current file
cnoremap %% <C-r>=fnameescape(expand('%:h')).'/'<CR>
nmap <leader>e :e %%
nmap <leader>v :tabedit $MYVIMRC<CR>

" habit-breaking
nmap <Left> <nop>
nmap <Right> <nop>
nmap <Up> <nop>
nmap <Down> <nop>

" 1st row
noremap i y
noremap I y$
noremap a d
noremap A D
noremap e p
noremap E P
"
noremap h b
noremap H B
noremap g w
noremap G W
noremap f e
noremap F E

" 2nd row
noremap v i
noremap V I
noremap l a
noremap L A
noremap c c
noremap C C
noremap w o
noremap W O
" navigation: i3-like
noremap n h
noremap r j
noremap t k
noremap d l
noremap <S-n> <C-w>h
noremap <S-r> <C-w>j
noremap <S-t> <C-w>k
noremap <S-d> <C-w>l


" 3rd row
noremap ä r
noremap Ä R
noremap <nowait> p v
noremap <nowait> P V
noremap <nowait> <C-p> <C-v>
"
noremap b t
noremap B T
noremap m f
noremap M F





" do not redraw in the midst of non-typed commands/macros
set lazyredraw

" mimic word-delete by ctrl+backspace
inoremap <C-BS> <Esc>dbi<Del>


" latex specific things
autocmd FileType tex source ~/.vim/latex.vim


set noswapfile


colorscheme mustang
set cursorline
set colorcolumn=110

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


" Movements with Neo2 keyboard layout
nmap <PageUp> <C-U>
nmap <PageDown> <C-D>
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
