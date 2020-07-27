Definitions.

INT        = [0-9]+
STRING     = [a-z_\-]|[A-Z]+
WHITESPACE = [\s|\t|\n|\r]
COMMENTARY = [\(/\*\([^*]|[\r\n]|\(\*+\([^*/]|[\r\n]\)\)\)*\*+/\)|\(//.*\)]

Rules.
{WHITESPACE}+ : skip_token.
{INT}         : {token, {digit_token,  TokenLine, TokenChars}}.
{STRING}      : {token, {escaped_token, TokenLine, TokenChars}}.
{COMMENTARY}  : {token, {commentary_token, TokenLine, TokenChars}}.
\#            : {token, {hash_token,  TokenLine, TokenChars}}.
\[            : {token, {left_square_token,  TokenLine, TokenChars}}.
\]            : {token, {right_square_token,  TokenLine, TokenChars}}.
\{            : {token, {left_curly_token,  TokenLine, TokenChars}}.
\}            : {token, {right_curly_token,  TokenLine, TokenChars}}.
\(            : {token, {left_parens_token,  TokenLine, TokenChars}}.
\)            : {token, {right_parens_token,  TokenLine, TokenChars}}.
\,            : {token, {comma_token,  TokenLine, TokenChars}}.
\;            : {token, {semicolon_token,  TokenLine, TokenChars}}.
\:            : {token, {colon_token,  TokenLine, TokenChars}}.
\.            : {token, {dot_token,  TokenLine, TokenChars}}.
\>            : {token, {major_token,  TokenLine, TokenChars}}.
\+            : {token, {plus_token,  TokenLine, TokenChars}}.
\%            : {token, {percentage_token,  TokenLine, TokenChars}}.

Erlang code.
