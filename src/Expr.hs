module Expr where

data Expr
    = Lit Int
    | Add Expr Expr
    | Sub Expr Expr
    | Neg Expr
    | Mul Expr Expr
    | Div Expr Expr
    deriving(Show, Eq)
