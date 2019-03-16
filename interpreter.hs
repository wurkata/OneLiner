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
    interpret sourceText inputData accData
    --n <- getInput
    --putStrLn("d " ++ (show n))
    let parsedProg = parseCalc (alexScanTokens sourceText)
    putStrLn ("Parsed as " ++ (show parsedProg))
    interpret inputData parsedProg


interpret :: Prog -> [[Int]]
interpret p = [[5]]

interpretIntExp :: IntExp -> Int
interpretIntExp (Data n) = input !! 3
interpretIntExp (Int n) = n
-- interpret* -> 3 args : 1) data to interpret 2) input data 3) acc data

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