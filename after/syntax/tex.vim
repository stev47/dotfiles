" LaTeX3 Syntax highlighting
syn match texStatement "\\[a-zA-Z_:]\+"

syn region texMathZoneA start="\\begin\s*{\s*align\s*}" end="\\end\s*{\s*align\s*}" keepend concealends contains=@texMathZoneGroup
syn region texMathZoneAS start="\\begin\s*{\s*align\*\s*}" end="\\end\s*{\s*align\*\s*}" keepend concealends contains=@texMathZoneGroup
