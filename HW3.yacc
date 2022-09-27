%{
  import java.io.*;
%}

%start P     

%token id         
%token literal
%token definiton
%token ifstatment
%token thenstatment
%token elsestatment
%token dostatment
%token untilstatment
%token left
%token right
%token equal
%token assigment
%token greater
%token less
%token gequal
%token lequal
%token nequal
%token minus
%token add
%token multiply
%token divide
%token exp
%token semiq
%token col

%left minus add
%left multiply divide
%left NEG          /* negation--unary minus */
%right exp         /* exponentiation        */
%%

P : D semiq P 
|   D
;

D : definiton id left ARGS right assigment E semiq
;

ARGS : id col ARGS
|      id
;


E:     literal
|      id
|      ifstatment E OP E thenstatment E elsestatment E
|      dostatment E untilstatment E
|      E add E
|      E minus E
|      E multiply E
|      E divide E
|      E exp E
|      id left EE right
;

EE:   E col EE 
|    E
;

OP: equal
|   greater
|   less
|   gequal
|   lequal
|   nequal
;

    
%%

  private HW3 lexer;
  public static boolean errFlag = false;

  private int yylex () {
    int yyl_return = -1;
    try {
      yyl_return = lexer.yylex();
    }
    catch (IOException e) {
      System.err.println(e);
    }
    return yyl_return;
  }


  public void yyerror (String error) {
    System.err.println(error + ": parsing " + lexer.getWord() + " failed.");  
    errFlag = true;
  }


  public Parser(Reader r) {
    lexer = new HW3 (r, this);
  }

  public static void main(String args[]) throws IOException {

    Parser yyparser;
    if (args.length > 0){
      // parse a file
      yyparser = new Parser(new FileReader(args[0]));
      System.out.println("Starting...");
      yyparser.yyparse();
      if(!errFlag)
        System.out.println("Parsed file");
      else
        System.out.println("Error: File has errors, parsing stopped");
    }
    else
      System.err.println("Error: no provided argument");  
    
  }
