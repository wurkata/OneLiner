{ 
module Tokens where 
}

%wrapper "basic" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+       ; 
  "--".*        ; 
  $digit+       { \s -> TokenInt (read s) } 
  \$$digit+     { \s -> TokenData (read (tail s)) } 
  \=            { \s -> TokenEq }
  \+            { \s -> TokenPlus }
  \-            { \s -> TokenMinus }
  \*            { \s -> TokenTimes }
  \^            { \s -> TokenPow}
  \%            { \s -> TokenMod}
  \/            { \s -> TokenDiv }
  \(            { \s -> TokenLParen }
  \)            { \s -> TokenRParen }
  \|            { \s -> TokenVLine }
  \[            { \s -> TokenLSquare}
  \]            { \s -> TokenRSquare}
  \=\>          { \s -> TokenRArrow }
  \<\<          { \s -> TokenArgsStart }
  \>\>          { \s -> TokenArgsEnd }
  \>            { \s -> TokenGT }
  \<            { \s -> TokenLT}
  \,            { \s -> TokenComma }


{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInt Int     |
  TokenData Int    | 
  TokenEq          |
  TokenPlus        |
  TokenMinus       |
  TokenTimes       |
  TokenPow         |
  TokenMod         |
  TokenDiv         |
  TokenLParen      |
  TokenRParen      |
  TokenVLine       |
  TokenLSquare     |
  TokenRSquare     |
  TokenArgsStart   |
  TokenArgsEnd     |
  TokenRArrow      |
  TokenGT          |
  TokenLT          |
  TokenComma
  deriving (Eq,Show) 
}
