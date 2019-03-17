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
    '..'  { TokenSeq }

%nonassoc '>' '<'
%left '+' '-' 
%left '*' '/' 
%left NEG 
%left PIPE 
%left '=>'
%% 

App : Fix Prog Fix               { App $1 $2 $3 }

Fix : IntExp                     { Fix [$1] }
    | {- empty -}                { Fix [] }

Prog : Args Fun                  { Prog $1 $2 }
     | Prog '>' Prog %prec PIPE  { Pipe $1 $3 }
     | Prog '=>' Prog            { Pass $1 $3 }

Args : '<<' Argv '>>'            { Argv $2 }

Fun : '[' AccExp '|' FunExp ']'  { Fun $2 $4 }

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
       | int '..' int            { Seq $1 $3 }

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

data App = App Fix Prog Fix 
         deriving Show

data Fix = Fix [IntExp] 
         deriving Show

data Prog = Prog Args Fun
          | ProgPrefix Args Fun 
          | ProgSuffix Args Fun 
          | Pipe Prog Prog
          | Pass Prog Prog
          deriving Show

data Args = Argv [IntExp]
          deriving Show

data Fun = Fun [IntExp] [IntExp]
         deriving Show

data IntExp = IntOp Op IntExp IntExp 
            | Data Int
            | Int Int
            | Seq Int Int
            deriving Show
} 
