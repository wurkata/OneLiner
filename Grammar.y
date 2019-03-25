{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    int   { TokenInt $$ } 
    data  { TokenData $$ } 
    '='   { TokenEq } 
    '+'   { TokenPlus } 
    '-'   { TokenMinus } 
    '*'   { TokenTimes } 
    '/'   { TokenDiv } 
    '^'   { TokenPow } 
    '%'   { TokenMod } 
    '('   { TokenLParen } 
    ')'   { TokenRParen } 
    '|'   { TokenVLine } 
    '['   { TokenLSquare } 
    ']'   { TokenRSquare } 
    '<'   { TokenLT } 
    '>'   { TokenGT } 
    ','   { TokenComma } 
    '..'  { TokenSeq }
    '?'   { TokenQMark }
    ':'   { TokenColon }
    '=='  { TokenEqq }
    '||'  { TokenOr } 
    '&&'  { TokenAnd } 

%nonassoc '>' '<'
%left '+' '-' 
%left '^' '*' '/' 
%left NEG 
%left PIPE 
%% 

App : Seq Prog Seq                       { App $1 $2 $3 }

Prog : Args Fun                          { Prog $1 $2 }
     | Prog '>' Prog %prec PIPE          { Pipe $1 $3 }

Args : '(' Argv ')'                      { Argv $2 }
     | {- empty -}                       { Argv [] }

Fun : '[' AccExp '|' FunExp ']'          { Fun $2 $4 }

Argv : IntExp ',' Argv                   { $1 : $3 }
     | IntExp                            { [$1] }
     | {- empty -}                       { [] }

AccExp : IntExp ',' AccExp               { $1 : $3 }
       | IntExp                          { [$1] }
       | {- empty -}                     { [] }

FunExp : Exp '|' FunExp                  { $1 : $3 }
       | Exp                             { [$1] }
       | {- empty -}                     { [] }

Exp : Cond                               { Cond $1 }
    | IntExp                             { IntExp $1 }

Cond : BoolExp '?' IntExp ':' IntExp     { Stmt $1 $3 $5 }
     | Cond '&&' Cond                    { AND $1 $3 }
     | Cond '||' Cond                    { OR $1 $3 }
     | '(' Cond ')'                      { $2 }

BoolExp : IntExp '>' IntExp              { GRT $1 $3 }
        | IntExp '<' IntExp              { LST $1 $3 }
        | IntExp '==' IntExp             { EQQ $1 $3 }

IntExp : IntExp Op IntExp                { IntOp $2 $1 $3 }
       | '(' IntExp ')'                  { $2 }
       | '-' int                         { Int $2 }
       | int                             { Int $1 }
       | data                            { Data $1 }

Seq : int '..' int                       { Seq ($1 : $3 : []) }
    | {- empty -}                        { Seq [] }

Op : '+'                                 { Plus }
   | '*'                                 { Times }
   | '/'                                 { Div }
   | '^'                                 { Pow }
   | '%'                                 { Mod }
   | '='                                 { Eq }

{ 
parseError :: [Token] -> a
parseError _ = error "Parse error" 

data Op = Plus | Times | Div | Pow | Mod | Eq deriving (Eq, Show)
data Exp = IntExp IntExp | Cond Cond deriving Show

data App = App Seq Prog Seq
         deriving Show

data Prog = Prog Args Fun
          | Pipe Prog Prog
          deriving Show

data Args = Argv [IntExp]
          deriving Show

data Fun = Fun [IntExp] [Exp]
         deriving Show

data Cond = Stmt BoolExp IntExp IntExp
          | AND Cond Cond
          | OR Cond Cond
          deriving Show

data BoolExp = GRT IntExp IntExp
             | LST IntExp IntExp
             | EQQ IntExp IntExp
             deriving Show

data IntExp = IntOp Op IntExp IntExp 
            | Data Int
            | Int Int
            deriving Show

data Seq = Seq [Int] 
         deriving Show
} 
