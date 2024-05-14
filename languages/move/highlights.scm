; Highlighting rules for Move language based on the provided grammar

; Commments & Whitespaces
[
  (line_comment)
  (block_comment)
] @comment

; Keywords
[
  "use"
  "public"
  "module"
  "friend"
  "fun"
  "const"
  "struct"
  "enum"
  "native"
  "spec"
  "let"
  "if"
  "else"
  "while"
  "loop"
  "return"
  "abort"
  "break"
  "continue"
  "move"
  "copy"
  "drop"
  "store"
  "key"
  "as"
  "true"
  "false"
  "address"
] @keyword

; Condition & loop keywords
[
  "if"
  "else"
  "while"
  "loop"
  "return"
  "abort"
  "break"
  "continue"
] @conditional

; Operators
[
  "+"
  "*"
] @operator

; Punctuation
[
  ";"
  ","
  ":"
  "::"
  "."
  "("
  ")"
  "{"
  "}"
  "["
  "]"
  "<"
  ">"
] @punctuation

; Numeric literals
(num_literal) @number

; Boolean literals
(bool_literal) @boolean

; Address literals
(address_literal) @constant.builtin

; String literals including hex strings and byte strings
[
  (hex_string_literal)
  (byte_string_literal)
] @string
