
%%

%class HW2
%standalone

Keyword="def"|"if"|"then"|"else"|"do"|"until"

Punctuationelement= "(" | ")" |":" |";"

Operator= "=" | "+"| "-" |"*"| "/"| "^"| "==" | ">" | "<" | "<=" | ">=" | "<>"

Identifier=[a-zA-Z][a-zA-Z0-9_]*

Literal=[0-9]+

%%

{Keyword} {System.out.println("<keyword,"+yytext()+">");}

{Punctuationelement} {System.out.println("<Punctuationelement,"+yytext()+">");}

{Operator} {System.out.println(""<operator,"+yytext()+">"");}

{Identifier} {System.out.println(""<identifier,"+yytext()+">"");}

{Literal} {System.out.print("<literal,"+yytext()+">");}

[\s]+ {}

/* else reject */