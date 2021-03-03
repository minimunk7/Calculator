module Render where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

import Initial

--Renderingen av bilderna

render :: Initial.Räknare -> Picture
render (a,(x,1)) = pictures (buttonsAndFields (a,(x,1)))
render (a,(x,y)) = initialCalc (a,(x,y))

initialCalc (a,(x,y)) = pictures (buttonsAndFields (a,(x,y)))

backgroundColor :: Color
backgroundColor = black

buttonsAndFields :: Initial.Räknare -> [Picture]
buttonsAndFields ([],(x,y)) = [Color white (Translate 150 37 (fromOperators "+")),
                               Color white (Translate 150 (-87) (fromOperators "-")),
                               Color white (Translate 150 (-207) (fromOperators "/")),
                               Color white (Translate 150 (-327) (fromOperators "=")),
                               Color white (Translate 50 37 (fromOperators "*")),
                               Color white (Translate 50 (-87) (Text "9")),
                               Color white (Translate 50 (-207) (Text "6")),
                               Color white (Translate 50 (-327) (Text "3")),
                               Color white (Translate (-50) 37 (Text "c")),
                               Color white (Translate (-50) (-87) (Text "8")),
                               Color white (Translate (-50) (-207) (Text "5")),
                               Color white (Translate (-50) (-327) (Text "2")),
                               Color white (Translate (-150) 37 (Text "s")),
                               Color white (Translate (-150) (-87) (Text "7")),
                               Color white (Translate (-150) (-207) (Text "4")),
                               Color white (Translate (-150) (-327) (Text "1")),
                               Color white (Translate (-250) 37 (Text "C")),
                               Color white (Translate (-250) (-87) (fromOperators "R")),
                               Color white (Translate (-240) (-207) (Text "x")),
                               Color white (Translate (-245) (-327) (Text "X")),
                               Color white (Translate 200 80 (rectangleWire 100 120)),
                               Color white (Translate 100 80 (rectangleWire 100 120)),
                               Color white (Translate 0 80 (rectangleWire 100 120)),
                               Color white (Translate (-100) 80 (rectangleWire 100 120)),
                               Color white (Translate (-200) 80 (rectangleWire 100 120)),
                               Color white (Translate 200 (-40) (rectangleWire 100 120)),
                               Color white (Translate 100 (-40) (rectangleWire 100 120)),
                               Color white (Translate 0 (-40) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-40) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-40) (rectangleWire 100 120)),
                               Color white (Translate 200 (-160) (rectangleWire 100 120)),
                               Color white (Translate 100 (-160) (rectangleWire 100 120)),
                               Color white (Translate 0 (-160) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-160) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-160) (rectangleWire 100 120)),
                               Color white (Translate 200 (-280) (rectangleWire 100 120)),
                               Color white (Translate 100 (-280) (rectangleWire 100 120)),
                               Color white (Translate 0 (-280) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-280) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-280) (rectangleWire 100 120)),
                               Color white (Translate x (0+250) (rectangleWire  1000 175)),
                               Color white (Translate (x-500)(0+220) (Text ":"))]
buttonsAndFields (a,(x,y))  = [Color white (Translate 150 37 (fromOperators "+")),
                               Color white (Translate 150 (-87) (fromOperators "-")),
                               Color white (Translate 150 (-207) (fromOperators "/")),
                               Color white (Translate 150 (-327) (fromOperators "=")),
                               Color white (Translate 50 37 (fromOperators "*")),
                               Color white (Translate 50 (-87) (Text "9")),
                               Color white (Translate 50 (-207) (Text "6")),
                               Color white (Translate 50 (-327) (Text "3")),
                               Color white (Translate (-50) 37 (Text "c")),
                               Color white (Translate (-50) (-87) (Text "8")),
                               Color white (Translate (-50) (-207) (Text "5")),
                               Color white (Translate (-50) (-327) (Text "2")),
                               Color white (Translate (-150) 37 (Text "s")),
                               Color white (Translate (-150) (-87) (Text "7")),
                               Color white (Translate (-150) (-207) (Text "4")),
                               Color white (Translate (-150) (-327) (Text "1")),
                               Color white (Translate (-250) 37 (Text "C")),
                               Color white (Translate (-250) (-87) (fromOperators "R")),
                               Color white (Translate (-240) (-207) (Text "x")),
                               Color white (Translate (-245) (-327) (Text "X")),
                               Color white (Translate 200 80 (rectangleWire 100 120)),
                               Color white (Translate 100 80 (rectangleWire 100 120)),
                               Color white (Translate 0 80 (rectangleWire 100 120)),
                               Color white (Translate (-100) 80 (rectangleWire 100 120)),
                               Color white (Translate (-200) 80 (rectangleWire 100 120)),
                               Color white (Translate 200 (-40) (rectangleWire 100 120)),
                               Color white (Translate 100 (-40) (rectangleWire 100 120)),
                               Color white (Translate 0 (-40) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-40) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-40) (rectangleWire 100 120)),
                               Color white (Translate 200 (-160) (rectangleWire 100 120)),
                               Color white (Translate 100 (-160) (rectangleWire 100 120)),
                               Color white (Translate 0 (-160) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-160) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-160) (rectangleWire 100 120)),
                               Color white (Translate 200 (-280) (rectangleWire 100 120)),
                               Color white (Translate 100 (-280) (rectangleWire 100 120)),
                               Color white (Translate 0 (-280) (rectangleWire 100 120)),
                               Color white (Translate (-100) (-280) (rectangleWire 100 120)),
                               Color white (Translate (-200) (-280) (rectangleWire 100 120)),
                               Color white (Translate x (0+250) (rectangleWire  1000 175)),
                               Color white (Translate (x-500)(0+200) (Text (reverse a)))]
-- Tecknena på miniräknaren
numbers = [(10,"_"),(1,"1"),(2,"2"),(3,"3"),(4,"4"),(5,"5"),(6,"6"),(7,"7"),(8,"8"),(9,"9"),(0,"0")]

operators = ["+","-","*","=","R","/"]

fromJust (Just x) = x

fromOperators :: [Char] -> Picture
fromOperators x = Text (head (filter (== x) operators))
fromNumbers :: Integer -> Picture
fromNumbers x = Text (fromJust (lookup x numbers))
