syn match agFile '^[^:]\+'
syn match agNumber '^[0-9]\+'

let b:current_syntax = "ag"

hi def link agFile String
hi def link agNumber Identifier
