" use indents of 4 spaces, and have them copied down lines:
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 4
let g:syntastic_python_python_exec = 'python3'

let g:syntastic_python_checkers = ['pylint'] 
", 'mypy']
"Disable annoying pylint mesages
" C0103 Invalid constant name
" R0903 Too few public methods (Classes aren't meant to just store data.)
" W0141 Used builtin function 'map'|'filter' (Why not? Nonsense!)
" W0142 Used * or ** magic (Why not? Nonsense!)
let g:syntastic_python_pylint_post_args='--disable=C0103,R0903,W0141,W0142'

"" Python-mode
"" Activate rope
"" Keys:
"" K             Show python docs
"" <Ctrl-Space>  Rope autocomplete
"" <Ctrl-c>g     Rope goto definition
"" <Ctrl-c>d     Rope show documentation
"" <Ctrl-c>f     Rope find occurrences
"" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"" [[            Jump on previous class or function (normal, visual, operator modes)
"" ]]            Jump on next class or function (normal, visual, operator modes)
"" [M            Jump on previous class or method (normal, visual, operator modes)
"" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 0 "jedi is better
"
"" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"
""Linting
"let g:pymode_lint = 1
""let g:pymode_lint_checker = "pyflakes,pep8"
"let g:pymode_lint_checker = "pyflakes"
"let g:pymode_lint_ignore = "E265,E501,W"
"" Auto check on save
"let g:pymode_lint_write = 1
"
"" Support virtualenv
"let g:pymode_virtualenv = 1
"
"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"
"" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" Don't autofold code
"let g:pymode_folding = 0
