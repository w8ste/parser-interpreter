module Parser (parseExpr) where

import Text.Parsec
import Text.Parsec.String (Parser)
import qualified Text.Parsec.Expr as Ex
import qualified Text.Parsec.Token as Tok
import Text.Parsec.Language (emptyDef)
import Expr

lexer = Tok.makeTokenParser emptyDef

parens = Tok.parens lexer
integer = Tok.integer lexer
reservedOp = Tok.reservedOp lexer
whiteSpace = Tok.whiteSpace lexer

table = [ [prefix "-" Neg, prefix "+" id ]
        , [binary "*" Mul Ex.AssocLeft, binary "/" Div Ex.AssocLeft ]
        , [binary "+" Add Ex.AssocLeft, binary "-" Sub Ex.AssocLeft ]
        ]

binary name fun = Ex.Infix (reservedOp name >> return fun)
prefix name fun = Ex.Prefix (reservedOp name >> return fun)

expr :: Parser Expr
expr = Ex.buildExpressionParser table term

term = parens expr <|> fmap (Lit . fromInteger) integer

parseExpr :: String -> Either ParseError Expr
parseExpr = parse (whiteSpace >> expr) "<stdin>"

