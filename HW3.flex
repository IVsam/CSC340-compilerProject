%%
%class HW3
%byaccj
%column
%line



%{
	private Parser yyparser;
	public HW3 (java.io.Reader r, Parser yyparser) {

		this (r); 
		this.yyparser = yyparser; 
		}
		public int getLine() { 
		return yyline; 
		}
		public int getColumn() { 
		return yycolumn; 
		}
		public String getWord() {
			return yytext();
	}
%}


id = [a-zA-Z]([0-9]|[a-zA-Z]|_)*
literal = \d+
left = \(
right = \)
assigment = "="
equal = "=="
greater = \>
less = \<
gequal = ">="
lequal = "<="
nequal = "<>"
minus = \-
add = \+
multiply = \*
divide = \/
exp = \^
semiq = \;
col = \,
definiton = definiton
ifstatment = ifstatment
thenstatment = then
elsestatment = else
dostatment = do
untilstatment = until
%%

	[\s]+ {}

	{definiton} {return Parser.definiton;}

	{ifstatment} {return Parser.ifstatment;}

	{thenstatment} {return Parser.thenstatment;}

	{elsestatment} {return Parser.elsestatment;}

	{semiq} {return Parser.semiq;}

	{col} {return Parser.col;}

	{left} {return Parser.left;}

	{right} {return Parser.right;}

	{minus} {return Parser.minus;}

	{add} {return Parser.add;}

	{multiply} {return Parser.multiply;}

	{divide} {return Parser.divide;}

	{exp} {return Parser.exp;}

	{dostatment} {return Parser.dostatment;}

	{untilstatment} {return Parser.untilstatment;}

	{assigment} {return Parser.assigment;}

	{equal} {return Parser.equal;}

	{greater} {return Parser.greater;}

	{less} {return Parser.less;}

	{gequal} {return Parser.gequal;}

	{lequal} {return Parser.lequal;}

	{nequal} {return Parser.nequal;}

	{id} {return Parser.id;}

	{literal} {return Parser.literal;}

	. {
		System.err.println("JFLEX Error: " + (yyline+1) + ". Token: '" + yytext() + "' does not belong");
		return -1;
	}