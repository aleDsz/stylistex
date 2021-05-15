Definitions.

INT         = [0-9]+
FLOAT       = [0-9\.]+
HEXCOLOR    = #[0-9A-Fa-f]+
STRING      = [a-zA-Z_\-]+
EOF         = [\r$]
WHITESPACE  = [\s\t\n]
COMMENTARY  = /*(.|[\r\n])*\*/ 
URL         = url\((.*)\) 
FUNCTION    = (.*)\((.*)\) 

Rules.
{WHITESPACE}  : {token, {whitespace_token,  TokenLine, TokenChars}}.
{COMMENTARY}  : {token, {commentary_token, TokenLine, TokenChars}}.
{FUNCTION}    : {token, {function_token, TokenLine, TokenChars}}.
{URL}         : {token, {url_token, TokenLine, TokenChars}}.
{INT}         : {token, {digit_token,  TokenLine, TokenChars}}.
{FLOAT}       : {token, {float_token,  TokenLine, TokenChars}}.
{STRING}      : {token, {escaped_token, TokenLine, TokenChars}}.
{EOF}         : {token, {eof_token, TokenLine, TokenChars}}.
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
{HEXCOLOR}    : {token, {hex_token, TokenLine, TokenChars}}.
\.            : {token, {dot_token,  TokenLine, TokenChars}}.
\>            : {token, {major_token,  TokenLine, TokenChars}}.
\+            : {token, {plus_token,  TokenLine, TokenChars}}.
\%            : {token, {percentage_token,  TokenLine, TokenChars}}.

Erlang code.
