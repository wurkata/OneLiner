-- COMP2209 Coursework 2, University of Southampton 2018
-- DUMMY FILE FOR YOU TO EDIT AND ADD YOUR OWN IMPLEMENTATIONS
-- NOTE THAT NO THIRD PARTY MODULES MAY BE USED IN SOLVING THESE EXERCISES AND
-- THAT YOU MAY NOT CHANGE THE FUNCTION TYPE SIGNATURES NOR TYPE DEFINITIONS 
-- This module statement makes public only the specified functions and types
-- DO NOT CHANGE THIS LIST OF EXPORTED FUNCTIONS AND TYPES
{-#LANGUAGE FlexibleInstances#-}
module Challenges (convertLet, prettyPrint, parseLet, countReds, compileArith,
    Expr(App, Let, Var), LamExpr(LamApp, LamAbs, LamVar)) where

import Data.Char
import Parsing

-- Challenge 1
data Expr = App Expr Expr | Let [Int] Expr Expr | Var Int deriving (Show,Eq)
data LamExpr = LamApp LamExpr LamExpr | LamAbs Int LamExpr | LamVar Int deriving (Show,Eq)

-- convert a let expression to lambda expression
convertLet :: Expr -> LamExpr 
-- replace the definition below with your solution

convertLet (Var a) = LamVar a
convertLet (App e e') = LamApp (cl [] e) (cl [] e')
convertLet (Let (x:xs) e e') = LamApp (LamAbs x (cl [] e')) (cl xs e)

cl :: [Int] -> Expr -> LamExpr
cl [] (Var v)            = LamVar v
cl (x:xs) (Var v)        = LamAbs x (cl xs (Var v))
cl [] (App e e')         = LamApp (cl [] e) (cl [] e')
cl [x] (App e e')        = LamAbs x (LamApp (cl [] e) (cl [] e'))
cl (x:xs) exp@(App e e') = LamAbs x (cl xs exp)
cl _ (Let (x:xs) e e')   = LamApp (LamAbs x (cl [] e')) (cl xs e)

-- Challenge 2
-- pretty print a let expression by converting it to a string
prettyPrint :: Expr -> String
-- replace the definition below with your solution
prettyPrint (Var v)       = printVars [v] 
prettyPrint e@(App _ _)   = evalApp e 
prettyPrint (Let xs e e') = "let " ++ printVars xs ++ " = " ++ prettyPrint e ++ " in " ++ prettyPrint e'

evalApp :: Expr -> String
evalApp (App e@(Let _ _ _) e'@(App _ _)) = "(" ++ prettyPrint e ++ ")(" ++ prettyPrint e' ++ ")" 
evalApp (App e@(Let _ _ _) e')           = "(" ++ prettyPrint e ++ ") " ++ prettyPrint e' 
evalApp (App e e'@(App _ _))             = prettyPrint e ++ " (" ++ prettyPrint e' ++ ")" 
evalApp (App e e')                       = prettyPrint e ++ " " ++ prettyPrint e' 
                                        -- "(" ++ prettyPrint e ++ " " ++ prettyPrint e' ++ ")" 

printVars :: [Int] -> String
printVars []     = ""
printVars [x]    = "x" ++ show x
printVars (x:xs) = "x" ++ show x ++ " " ++ printVars xs

-- Challenge 3
-- parse a let expression
parseLet :: String -> Maybe Expr
-- replace the definition below with your solution
parseLet s = case (parse p_expr s) of
                  [(n,[])]  -> Just n
                  [(n,out)] -> error ("Unused input: " ++ out)
                  []        -> Nothing

p_expr :: Parser Expr
p_expr = do symbol "let"
            vs <- get_vars
            symbol "="
            e  <- p_app
            symbol "in"
            e' <- p_expr
            return (Let vs e e')
     <|> do e <- p_app
            return e

p_app :: Parser Expr
p_app = do symbol "("
           e <- p_app
           symbol ")"
           return e
    <|> do es <- apps
           do space
              e' <- p_app
              return (App (eval_app es) e')
             <|> return (eval_app es)

eval_app :: [Expr] -> Expr
eval_app [e] = e
eval_app (e:e':[]) = (App e e')
eval_app xs = (App (eval_app es) e')
              where e' = last xs
                    es = init xs

apps :: Parser [Expr]
apps = do e <- p_var
          es <- many $ do {space; p_var}
          return (e:es)

get_vars :: Parser [Int]
get_vars = do symbol "x"
              n <- int
              do space
                 vs <- get_vars
                 return (n:vs)
                <|> return [n]

p_var :: Parser Expr
p_var = do symbol "x"
           x <- int
           return (Var x)

-- Challenge 4
-- count reductions using two different strategies 
countReds :: LamExpr -> Int -> (Maybe Int, Maybe Int)
-- replace the definition below with your solution
countReds e limit | lhs <= limit && rhs <= limit = (Just lhs, Just rhs)
                  | lhs <= limit && rhs > limit = (Just lhs, Nothing)
                  | lhs > limit && rhs <= limit = (Nothing, Just rhs)
                  | otherwise = (Nothing, Nothing)
                    where lhs = length $ traceLI e 
                          rhs = length $ traceRI e

evalLI = eval evalLI'
traceLI = trace evalLI'
evalRI = eval evalRI'
traceRI = trace evalRI'

evalLI' :: LamExpr -> LamExpr
evalLI' e@(LamVar _) = e
evalLI' (LamAbs x e) = (LamAbs x e) -- do not evaluate right expression
evalLI' (LamApp e@(LamAbs x e1) e2) = subst e1 x e2 -- remove evaluation
evalLI' (LamApp e@(LamVar _) e2) = LamApp e (evalLI' e2)
evalLI' (LamApp e1 e2) = LamApp (evalLI' e1) e2

evalRI' :: LamExpr -> LamExpr
evalRI' e@(LamVar _) = e
evalRI' (LamAbs x e) = (LamAbs x e)
-- evalRI' (LamApp (LamAbs x e1) e@(LamAbs y e2)) = subst e1 x e
-- evalRI' (LamApp (LamAbs x e1) e@(LamVar _)) = subst e1 x e
evalRI' (LamApp (LamAbs x e1) e2) = (subst e1 x e2) -- remove evaluation
-- evalRI' (LamApp e@(LamAbs x e1) e2) = LamApp e (evalRI' e2)
evalRI' (LamApp e e'@(LamVar _)) = LamApp (evalRI' e) e'
evalRI' (LamApp e1 e2) = LamApp e1 (evalRI' e2)

subst :: LamExpr -> Int -> LamExpr -> LamExpr
subst (LamVar x) y e | x == y = e
                     | otherwise = LamVar x
subst (LamAbs x e') y e | x /= y && not (free x e) = LamAbs x (subst e' y e)
                        | x /=y && (free x e) = let x' = rename x in
                                subst (LamAbs x' (subst e' x (LamVar x'))) y e
                        | otherwise = LamAbs x e'
subst (LamApp e e') y expr = LamApp (subst e y expr) (subst e' y expr)

reductions :: (LamExpr -> LamExpr) -> LamExpr -> [ (LamExpr, LamExpr) ]
reductions ss e = [ p | p <- zip evals (tail evals) ]
   where evals = iterate ss e

eval :: (LamExpr -> LamExpr) -> LamExpr -> LamExpr
eval ss = fst . head . dropWhile (uncurry (/=)) . reductions ss

trace :: (LamExpr -> LamExpr) -> LamExpr -> [LamExpr]
trace ss  = (map fst) . takeWhile (uncurry (/=)) .  reductions ss

free :: Int -> LamExpr -> Bool
free x (LamVar y) = x == y
free x (LamAbs y e) | x == y = False
                    | otherwise = free x e
free x (LamApp e e') = (free x e) || (free x e')

rename :: Int -> Int
rename x = x + 100

-- Challenge 5
-- compile an arithmetic expression into a lambda calculus equivalent
compileArith :: String -> Maybe LamExpr
-- replace the definition below with your solution
compileArith s = case (parse arithExpr s) of
                      [(e, [])] -> Just e 
                      _         -> Nothing

arithExpr :: Parser LamExpr
arithExpr = do n <- value
               return (LamAbs 1 (LamAbs 2 (convChurch (cint n))))
        <|> do n <- section
               case (cint n) of
                  1 -> return (LamApp (LamAbs 1 (LamAbs 2 (convChurch (cint n)))) (successor))
                  n -> return (LamAbs 1 (LamAbs 2 (convChurch n)))

section :: Parser (Church a)
section = do symbol "("
             do symbol "+"
                n <- value
                symbol ")"
                return n
              <|> do n <- value
                     symbol ")"
                     return n

value :: Parser (Church a)
value = do n <- section
           n' <- value
           return (cadd n n') -- (+1) 3 - adds them and the takes the succ
    <|> do ns <- mValues
           do n <- value
              return (addMValues (n:ns))
            <|> return (addMValues ns)
    <|> do n <- natural
           return (church n)

mValues :: Parser [Church a]
mValues = do n <- natural
             symbol "+"
             ns <- many $ do {symbol "+"; value}
             return ((church n):ns)

addMValues :: [Church a] -> Church a
addMValues [a] = a
addMValues (n:n':ns) = addMValues ((cadd n n'):ns)

convChurch :: Int -> LamExpr
convChurch 0 = LamVar 2
convChurch n = LamApp (LamVar 1)  (convChurch (n - 1))

cint :: Church Int -> Int
cint cn = cn (+1) 0

type Church a = (a -> a) -> (a -> a)

successor = (LamAbs 1 (LamAbs 2 (LamAbs 3 (LamApp (LamVar 2) (LamApp (LamApp (LamVar 1) (LamVar 2)) (LamVar 3))))))

zero :: Church a
zero f = id

church :: Int -> Church a
church 0 = zero
church n = scc (church (n - 1))

scc :: Church a -> Church a
scc c = \f -> f.(c f)

cadd :: Church a -> Church a -> Church a
cadd c' c'' = \f -> (c' f).(c'' f)

instance (Show a, Num a) => Show ((a -> a) -> a -> a) where
    show n = show $ n (+1) 0

-- Testing
one = LamAbs 1 (LamAbs 2 (LamApp (LamVar 1) (LamVar 2))) 
suc = LamAbs 1 (LamAbs 2 (LamAbs 3 (LamApp (LamVar 2) (LamApp (LamApp (LamVar 1) (LamVar 2)) (LamVar 3)))))
