module Eval (eval) where

import Expr

eval :: Expr -> Int
eval (Lit n)     = n
eval (Add x y)   = eval x + eval y
eval (Sub x y)   = eval x - eval y
eval (Neg x y)   = - eval x
eval (Mul x y)   = eval x * eval y
eval (Div x y)   = eval x `div` eval y
