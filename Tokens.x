{ 
module Tokens where 
import Debug.Trace
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
  \-$digit+     { \s -> TokenInt (read s) } 
  \$$digit+     { \s -> TokenData (read (tail s)) } 
  \$\-$digit+   { \s -> TokenData (read (tail s)) } 
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
  \.\.          { \s -> TokenSeq }


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
  TokenComma       |
  TokenSeq 
  deriving (Eq,Show) 

splitOn :: String -> String -> String -> [String]
splitOn _ [] acc = [acc]
splitOn [] str _ = [str]
splitOn del str acc | comp del str = acc : (splitOn del (drop (length del) str) [])
                    | otherwise = splitOn del (tail str) (acc ++ [head str])

comp :: String -> String -> Bool
comp [] _ = True
comp del str | (head del) == (head str) = comp (tail del) (tail str)
             | otherwise = False
}
