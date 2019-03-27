import Grammar
import Tokens
import System.Environment
import System.IO (isEOF)
import Debug.Trace

main :: IO ()
main = do 
    (fileName : _) <- getArgs
    sourceText <- readFile fileName
    --putStrLn ("Parsing : " ++ sourceText)
    s <- getInput
    --putStr ("Input : ")
    --print $ getInts s
    let inputData = getInts s
    let parsedProg = parseCalc (alexScanTokens sourceText)
    --print parsedProg
    let output = interpret inputData parsedProg
    --print output
    let inputLength = length inputData
    let output' = take inputLength output
    let strs = map (\row -> join row "\t") output'
    mapM_ putStrLn strs
    
data State = Output { 
                      accData :: [Int],
                      progData :: [Int]
                    } deriving Show
-- interpret* -> 3 args : 1) data to interpret 2) input data 3) acc data

interpret :: [[Int]] -> App -> [[Int]]
interpret input (App (Fix prefix) (Prog argv fun) (Fix suffix)) = prefix' ++ interpret' (interpretArgs argv) input fun ++ suffix'
                                  where prefix' = interpretSeq prefix
                                        suffix' = interpretSeq suffix

interpret input (App prefix (Pipe p1 p2) suffix) = trace ("First is " ++ (show first) ++ " Second is " ++ (show second)) (first ++ second)
                                  where first  = interpret input (App prefix p1 (Fix []))
                                        second = interpret input (App (Fix []) p2 suffix)

interpret' :: [Int] -> [[Int]] -> Fun -> [[Int]]
interpret' _ [] _ = []
interpret' acc input fun = out' : interpret' acc' (tail input) fun
                         where  progState = interpretFun acc (head input) fun
                                acc' = accData progState
                                out' = progData progState

interpretArgs :: Args -> [Int]
interpretArgs (Argv exps) = acc
                          where acc = map (\e -> interpretIntExp [] [] e) exps

interpretFun :: [Int] -> [Int] -> Fun -> State
interpretFun acc input (Fun exps exps') = state
                                        where state = Output {accData = map (\e -> interpretExp acc input e) exps, progData = map(\e -> interpretExp acc input e) exps'}

interpretExp :: [Int] -> [Int] -> Exp -> Int
interpretExp acc input (Cond c e e') = if evaluatedB then v else v'
                                        where evaluatedB = interpretCond acc input c
                                              v = interpretIntExp acc input e
                                              v' = interpretIntExp acc input e'
interpretExp acc input (IntExp i) = interpretIntExp acc input i

interpretIntExp :: [Int] -> [Int] -> IntExp -> Int
interpretIntExp acc input (Data n)  | n > 0 = input !! (n - 1)
                                    | otherwise = acc !! (abs n)
interpretIntExp acc input (Int n) = n
interpretIntExp acc input (IntOp o e e')  | o == Plus = (v + v')
                                      | o == Times = (v * v')
                                      | o == Div = (div v v')
                                      | o == Pow = (v^v')
                                      | o == Mod = (mod v v')
                                      where v = interpretIntExp acc input e
                                            v' = interpretIntExp acc input e'

interpretCond :: [Int] -> [Int] -> Cond -> Bool
interpretCond acc input (Stmt b) = interpretBoolExp acc input b
interpretCond acc input (AND c c') = b && b'
                                    where b = interpretCond acc input c
                                          b' = interpretCond acc input c'
interpretCond acc input (OR c c') = b || b'
                                    where b = interpretCond acc input c
                                          b' = interpretCond acc input c'
interpretBoolExp :: [Int] -> [Int] -> BoolExp -> Bool
interpretBoolExp acc input (GRT e e') = if v > v' then True else False
                                        where v = interpretIntExp acc input e
                                              v' = interpretIntExp acc input e'
interpretBoolExp acc input (LST e e') = if v < v' then True else False
                                        where v = interpretIntExp acc input e
                                              v' = interpretIntExp acc input e'
interpretBoolExp acc input (EQQ e e') = if v == v' then True else False
                                        where v = interpretIntExp acc input e
                                              v' = interpretIntExp acc input e'
      

interpretSeq :: [Int] -> [[Int]]
interpretSeq [] = []
interpretSeq ls = [[x] | x <- [(head ls)..(last ls)]]


getInts :: [String] -> [[Int]]
--getInts s = [trac`e ("with val " ++ (show x)) x| x <- (map words s)]
getInts s = [map read x| x <- (map words s)]

getInput :: IO [String]
getInput = do 
            s <- getContents
            return $ lines s

join :: [Int] -> String -> String
join [inp] del = show inp
join (inp:inps) del = (show inp) ++ del ++ join inps del
join [] del = []

inter :: [Int] -> Int
inter [x] = x
inter (x:xs) = x + inter xs
