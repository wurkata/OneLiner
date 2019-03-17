import Grammar
import Tokens
import System.Environment
import System.IO (isEOF)
import Debug.Trace

main :: IO ()
main = do 
    (fileName : _) <- getArgs
    sourceText <- readFile fileName
    putStrLn ("Parsing : " ++ sourceText)
    s <- getInput
    print $ getInts s
    let inputData = getInts s
    print s
    --n <- getInput
    --putStrLn("d " ++ (show n))
    let parsedProg = parseCalc (alexScanTokens sourceText)
    putStrLn ("Parsed as " ++ (show parsedProg))
    print (interpret inputData parsedProg)

data State = Output { 
                      accData :: [Int],
                      progData :: [Int]
                    } 
-- interpret* -> 3 args : 1) data to interpret 2) input data 3) acc data

interpret :: [[Int]] -> App -> [[Int]]
interpret input (App (Fix prefix) (Prog argv fun) (Fix suffix)) = prefix' ++ interpret' (interpretArgs argv) input fun ++ suffix'
                                  where prefix' = map (\e -> interpretSeq e) prefix
                                        suffix' = map (\e -> interpretSeq e) suffix

interpret' :: [Int] -> [[Int]] -> Fun -> [[Int]]
interpret' _ [] _ = []
interpret' acc input fun = out' : interpret' acc' (tail input) fun
                         where  progState = interpretFun acc (head input) fun
                                acc' = accData progState
                                out' = progData progState

interpretArgs :: Args -> [Int]
interpretArgs (Argv exps) = map (\e -> interpretIntExp [] [] e) exps

interpretFun :: [Int] -> [Int] -> Fun -> State
interpretFun acc input (Fun exps exps') = state
                                        where state = Output {accData = map (\e -> interpretIntExp acc input e) exps, progData = map(\e -> interpretIntExp acc input e) exps'}

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

interpretSeq :: IntExp -> [Int]
interpretSeq (Seq a b) = [a..b]


getInts :: [String] -> [[Int]]
--getInts s = [trace ("with val " ++ (show x)) x| x <- (map words s)]
getInts s = [map read x| x <- (map words s)]

getInput :: IO [String]
getInput = do 
            s <- getContents
            return $ lines s
inter :: [Int] -> Int
inter [x] = x
inter (x:xs) = x + inter xs
