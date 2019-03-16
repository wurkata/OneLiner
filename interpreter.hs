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

Data ProgOutput = Acc [Int] Prog [Int] 
-- interpret* -> 3 args : 1) data to interpret 2) input data 3) acc data

interpret :: [[Int]] -> Prog -> [[Int]]
interpret inputls (Prog argv fun) = interpretArgs inputls argv

interpretArgs :: [Int] -> Args -> [[Int]]
interpretArgs inputls (Argv exp) = [[1]] 

interpretFun :: [Int] -> [Int] -> Fun -> ProgOutput
interpretFun acc input (Fun exps exps') = Acc accData Prog progData
                                        where accData  = interpretIntExp exps
                                              progData = interpretIntExp exps'

interpretIntExp :: [Int] -> [Int] -> IntExp -> Int
interpretIntExp acc input (Data n) = input !! (n - 1)
interpretIntExp acc input (Int n) = n
interpretIntExp acc input (IntOp o e e')  | o == Plus = (v + v')
                                      | o == Times = (v * v')
                                      | o == Div = (div v v')
                                      | o == Pow = (v^v')
                                      | o == Mod = (mod v v')
                                      where v = interpretIntExp acc input e
                                            v' = interpretIntExp acc input e'


getInts :: [String] -> [[Int]]
--getInts s = [trace ("with val " ++ (show x)) x| x <- (map words s)]
getInts s = [map read x| x <- (map words s)]


{- myLoop = do done <- isEOF
            if done
              then putStrLn "Bye!"
              else do inp <- getLine
                      putStrLn (inp)
                      myLoop
 -}
getInput :: IO [String]
getInput = do 
            s <- getContents
            return $ lines s
inter :: [Int] -> Int
inter [x] = x
inter (x:xs) = x + inter xs
{- myLoop :: [Int] -> IO ()
myLoop l = do done <- isEOF
            if done
              then putStrLn "bye"
              else do inp <- getLine
                      putStrLn (inp)
                      myLoop l -}
