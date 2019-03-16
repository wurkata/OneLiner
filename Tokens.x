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
  $digit+\.\.$digit+          { \s -> TokenSeq (read $ head (splitOn ".." s [])) (read $ last (splitOn ".." s []))}


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
  TokenSeq Int Int
  deriving (Eq,Show) 

splitOn :: String -> String -> String -> [String]
splitOn _ [] _ = []
splitOn [] str _ = [str]
splitOn del str acc | comp del str = trace ("acc = " ++ show acc) acc : (splitOn del (drop ((length acc) + (length del)) str) [])
                    | otherwise = splitOn del str (acc ++ [head str])

comp :: String -> String -> Bool
comp [] _ = True
comp del str | (head del) == (head str) = trace ("We have a match!") comp (tail del) (tail str)
             | otherwise = trace ("No match with input " ++ (show str)) False
}
