Definitions.

INT        = [0-9]+
ATOM       = :[a-z_]+
WHITESPACE = [\s\t\n\r]

Rules.

{INT}         : {token, {int,  TokenLine, TokenChars}}.
{ATOM}        : {token, {atom, TokenLine, TokenChars}}.
\[            : {token, {'[',  TokenLine}}.
\]            : {token, {']',  TokenLine}}.
,             : {token, {',',  TokenLine}}.
{WHITESPACE}+ : skip_token.

Erlang code.
