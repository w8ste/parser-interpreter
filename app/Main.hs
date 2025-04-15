-- app/Main.hs
module Main where

import Parser
import Eval

main :: IO ()
main = do
  putStrLn "Enter an expression:"
  input <- getLine
  case parseExpr input of
    Left err  -> print err
    Right ast -> do
      print ast
      print (eval ast)

