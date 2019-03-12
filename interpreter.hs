import Grammar
import Tokens
import System.Environment
main :: IO ()
main = do 
    s <- getArgs
    putStrLn (show s)

    --(fileName : _) <- getArgs
    --sourceText <- readFile fileName
    --putStrLn ("Parsing : " ++ sourceText)
    --let parsedProg = parseCalc (alexScanTokens sourceText)
    --putStrLn ("Parsed as " ++ (show parsedProg))