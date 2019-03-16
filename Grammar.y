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
    '=>'  { TokenRArrow } 
    '<'   { TokenLT } 
    '<<'  { TokenArgsStart } 
    '>'   { TokenGT } 
    '>>'  { TokenArgsEnd } 
    ','   { TokenComma } 

%nonassoc '>' '<'
%left '+' '-' 
%left '*' '/' 
%left NEG 
%left PIPE 
%left '=>'
%% 

Prog : Args Fun                  { Prog $1 $2 }
     | Prog '>' Prog %prec PIPE  { Pipe $1 $3 }
     | Prog '=>' Prog            { Pass $1 $3 }

Args : '<<' Argv '>>'            { Argv $2 }

Fun : '[' AccExp '|' FunExp ']'  { Exp $2 $4 }

Argv : IntExp ',' Argv           { $1 : $3 }
     | IntExp                    { [$1] }
     | {- empty -}               { [] }

AccExp : IntExp ',' AccExp       { $1 : $3 }
       | IntExp                  { [$1] }
       | {- empty -}             { [] }

FunExp : IntExp '|' FunExp       { $1 : $3 }
       | IntExp                  { [$1] }
       | {- empty -}             { [] }

IntExp : IntExp Op IntExp        { IntOp $2 $1 $3 }
       | int                     { Int $1 }
       | data                    { Data $1 }

Op : '+'                         { Plus }
   | '*'                         { Times }
   | '/'                         { Div }
   | '^'                         { Pow }
   | '%'                         { Mod }
   | '='                         { Eq }
{ 
parseError :: [Token] -> a
parseError _ = error "Parse error" 

data Op = Plus | Times | Div | Pow | Mod | Eq deriving (Eq, Show)

data Prog = Prog Args Fun
          | Pipe Prog Prog
          | Pass Prog Prog
          deriving Show

data Args = Argv [IntExp]
          deriving Show

data Fun = Exp [IntExp] [IntExp]
         deriving Show

data IntExp = IntOp Op IntExp IntExp 
            | Data Int
            | Int Int
            deriving Show
} 
