" Vim syntax file
" Language:     gro
" Maintainer:   
" Last Change:  
" Filenames:    *.gro 

syn case match

" Comment //
syn match groComment "\/\/.*"

" Constant
" string enclosed in double quotes
syn region groString start=/"/ skip=/\\\\\|\\"/ end=/"/
" string enclosed in single quotes
syn region groString start=/'/ skip=/\\\\\|\\'/ end=/'/
" number with no fractional part or exponent
syn match groNumber /\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match groFloat /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match groFloat /\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match groFloat /\d\+[Ee][-+]\=\d\+/

" Statement
setlocal iskeyword+=-
setlocal iskeyword+=?
"syn keyword nlogoStatement carefully error-message map report run runresult stop startup wait without-interruption 
syn keyword groStatement include program fun ecoli yeast
syn keyword groConditional if end then else 
syn keyword groRepeat while foreach do in

" Constant
"syn keyword groConstant e pi 
syn keyword groBoolean false true

" Type
syn keyword groType int unit real string

" Special
"syn match nlogoError      /[)\]}]/
"syn match nlogoCurlyError "]" 
"syn match nlogoCurlyError /[)\]]/ contained
"syn match nlogoParenError ")" 

syn keyword groTodo contained TODO FIXME XXX ToDo 
syn cluster groCommentGroup contains=vimTodo

" assignment
syn keyword groDefine set 

syn keyword nlogoSpecial with value-from values-from max-one-of min-one-of one-of random-n-of random-one-of with-max with-min but-first but-last empty?first last any?
syn keyword groIdentifier ecoli yeast signal get_signal set_signal emit_signal absorb_signal message clear_messages reset stop stats snapshot set die divide 

hi link groComment    Comment
"hi link groConstant Constant
hi link groString     String
hi link groNumber     Number
hi link groBoolean     Boolean
hi link groFloat       Float
hi link groStatement   Statement
hi link groConditional Conditional
hi link groRepeat      Repeat
hi link groIdentifier  Identifier
hi link groType	      Type
hi link groDefine     Define
hi link nlogoSpecial    Special
hi link nlogoError       Error
hi link nlogoBraceError  Error
hi link nlogoCurlyError  Error
hi link nlogoParenError  Error
hi link groTodo       Todo

let b:current_syntax="gro"

";;; attempt at a gro mode
"
" (defvar gro-font-lock-keywords
"   '( 
"      ("// .*" . font-lock-comment-face)
"      ("\\b\\(dt\\|die\\|ecoli\\|yeast\\|set_signal\\|absorb_signal\\|emit_signal\\|signal\\|get_signal\\|set\\)\\b" (1 font-lock-comment-face))
"      ("\\b\\(compose\\|include\\|fun\\|if\\|then\\|else\\|end\\|let\\|in\\|program\\|exec\\|true\\|false\\|lambda\\|external\\|head\\|tail\\)\\b"
"         (1 font-lock-keyword-face))
"      ("\\b\\(real\\|list\\|int\\|bool\\|unit\\|string\\)\\b"
"         (1 font-lock-reference-face))
"      ("fun \\(\\(\\sw\\|\\s_\\)+\\)" (1 font-lock-function-name-face))
"      ("program \\(\\(\\sw\\|\\s_\\)+\\)" (1 font-lock-function-name-face))
"      ("\\([a-zA-Z_][a-zA-Z0-9_]*\\)" (1 font-lock-type-face))
"      )
"   "Keyword highlighting specification for `gro-mode'.")
"
" (define-derived-mode gro-mode fundamental-mode "gro"
"   "A major mode for editing gro files."
"   (set (make-local-variable 'font-lock-defaults) '(gro-font-lock-keywords))
" )
"
"(provide 'gro)
"
"(add-to-list 'auto-mode-alist '("\\.gro" . gro-mode))

