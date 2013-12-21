" latexmk {{{
map <buffer> <LocalLeader>ll :Latexmk<CR>
map <buffer> <LocalLeader>lL :Latexmk!<CR>
map <buffer> <LocalLeader>lc :LatexmkClean<CR>
map <buffer> <LocalLeader>lC :LatexmkClean!<CR>
map <buffer> <LocalLeader>lg :LatexmkStatus<CR>
map <buffer> <LocalLeader>lG :LatexmkStatus!<CR>
map <buffer> <LocalLeader>lk :LatexmkStop<CR>
map <buffer> <LocalLeader>le :LatexErrors<CR>
" }}}

" View {{{
map <buffer> <LocalLeader>lv :LatexView<CR>
" }}}

" TOC {{{
map <silent> <buffer> <LocalLeader>lt :LatexTOC<CR>
" }}}

" Jump to match {{{
if !exists('g:LatexBox_loaded_matchparen')
	nmap <buffer> % <Plug>LatexBox_JumpToMatch
	vmap <buffer> % <Plug>LatexBox_JumpToMatch
	omap <buffer> % <Plug>LatexBox_JumpToMatch
endif
" }}}

" Define text objects {{{
vmap <buffer> he <Plug>LatexBox_SelectCurrentEnvInner
vmap <buffer> ge <Plug>LatexBox_SelectCurrentEnvOuter
omap <buffer> he :normal the<CR>
omap <buffer> ge :normal tge<CR>
vmap <buffer> h$ <Plug>LatexBox_SelectInlineMathInner
vmap <buffer> g$ <Plug>LatexBox_SelectInlineMathOuter
omap <buffer> h$ :normal th$<CR>
omap <buffer> g$ :normal tg$<CR>
" }}}
