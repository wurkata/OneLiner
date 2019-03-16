import Grammar
import Tokens
import System.Environment
import System.IO (isEOF)
main :: IO ()
main = do 
    (fileName : _) <- getArgs
    sourceText <- readFile fileName
    putStrLn ("Parsing : " ++ sourceText)
    myLoop []
    --n <- getInput
    --putStrLn("d " ++ (show n))
    --let parsedProg = parseCalc (alexScanTokens sourceText)
    --putStrLn ("Parsed as " ++ (show parsedProg))


interpret :: Prog -> [[Int]]
interpret p = [[5]]

getInts :: String -> [Int]
getInts s = [read x :: Int | x <- (words s)]

myFive = 5

{- myLoop = do done <- isEOF
            if done
              then putStrLn "Bye!"
              else do inp <- getLine
                      putStrLn (inp)
                      myLoop
 -}
myLoop :: [Int] -> IO ()
myLoop l = do done <- isEOF
            if done
              then putStrLn "bye"
              else do inp <- getLine
                      putStrLn (inp)
                      myLoop l