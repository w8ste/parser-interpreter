module Eval (eval) where

import Expr

eval :: Expr -> Int
eval (Lit n)     = n
eval (Add x y)   = eval x + eval y
eval (Sub x y)   = eval x - eval y
eval (Neg x)     = - eval x
eval (Mul x y)   = eval x * eval y
eval (Div x y)   = let denom = eval y
                   in if denom == 0
                    then error "Division by zero error!"
                    else eval x `div` eval y
