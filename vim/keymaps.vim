" Remapping of keys to better positions (remember to change when altering keyboard layout)
let mapleader="k"
let maplocalleader="k"

"silent! unmap gx

" quit mappings
noremap 7 :q<CR>
noremap € :wq<CR>
noremap ¥ :q!<CR>

noremap ü :w<CR>


"noremap <nowait> x /
"noremap <nowait> X ?
noremap l ;
noremap L ,
noremap c n
noremap C N
noremap w /
noremap W ?
noremap h i
noremap H I
noremap g a
noremap G A
noremap f c
noremap F C
"noremap q v
"noremap Q V
noremap u b
noremap U B
noremap i t
noremap I T
noremap a f
noremap A F
noremap e e
noremap E E
noremap o w
noremap O W
noremap s u
noremap n p
noremap N P
noremap r d
noremap R D
noremap t v
noremap T V
"noremap d x
"noremap D X
"norema  ü v
"norema  Ü V
noremap ö '
"norema  ä `
"noremap ä b
"noremap Ä B
noremap ä q
noremap Ä @
noremap ÄÄ @@

noremap p g
noremap P G
noremap z z
noremap Z Z
noremap b .
noremap m o
noremap M O
noremap , s
noremap – S
noremap . r
noremap • R
noremap j y
noremap J Y

noremap Q J

" Unmap printable characters from select mode

"silent! sunmap x
"silent! sunmap v
"silent! sunmap l
"silent! sunmap c
"silent! sunmap w
"silent! sunmap k
"silent! sunmap h
"silent! sunmap g
"silent! sunmap f
"silent! sunmap q
"silent! sunmap ß
"silent! sunmap u
"silent! sunmap i
"silent! sunmap a
"silent! sunmap e
"silent! sunmap o
"silent! sunmap s
"silent! sunmap n
"silent! sunmap r
"silent! sunmap t
"silent! sunmap d
"silent! sunmap y
"silent! sunmap ü
"silent! sunmap ö
"silent! sunmap ä
"silent! sunmap p
"silent! sunmap z
"silent! sunmap b
"silent! sunmap m
"silent! sunmap ,
"silent! sunmap .
"silent! sunmap j

vnoremap a f
vnoremap i t


" Visual block-mode map
noremap - <C-v>


noremap pp gg
" Tab movement
noremap pr gt
noremap pn gT
" select last search
noremap pc gn
" last visual selection
noremap pt gv

onoremap h i
onoremap g a
onoremap he iw
onoremap ge aw

vnoremap h i
vnoremap g a
vnoremap he iw
vnoremap ge aw

" Diff commands
noremap da do
noremap de dp
noremap d<Up> [czz
noremap d<Down> ]czz


smapclear

" Window key
noremap v <C-w>


