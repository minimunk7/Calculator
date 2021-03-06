module Render where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import Initial

--Renderingen av bilderna
{-render räknare
  a function that takes the list of pictures provided to us by the buttonsAndFields function and renders them on the screen
  as the calculator.
  PRE: -
  SIDE: -
  RETURNS: The pictures to be rendered to the screen as the calculators.
-}
render :: Initial.Räknare -> Picture
render (a,(x,y)) = pictures (buttonsAndFields (a,(x,y)))


backgroundColor :: Color
backgroundColor = black

{-buttonsAndFields räknare
a function that produces a picture depending on the current state of the board that the funktion receives.
PRE: -
SIDE: -
RETURNS: Returns a list of pictures that make up the calculators buttons and the symbols on them as well as the screen.
EXAMPLE: buttonsAndFields ("HELLO",(0,0)) ==
[Color (RGBA 1.0 1.0 1.0 1.0) (Translate 150.0 37.0 (Text "+")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 150.0 (-87.0) (Text "-")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 150.0 (-207.0) (Text "/")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 150.0 (-327.0) (Text "=")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 50.0 37.0 (Text "*")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 50.0 (-87.0) (Text "9")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 50.0 (-207.0) (Text "6")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 50.0 (-327.0) (Text "3")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-50.0) 37.0 (Text "c")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-50.0) (-87.0) (Text "8")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-50.0) (-207.0) (Text "5")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-50.0) (-327.0) (Text "2")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-150.0) 37.0 (Text "s")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-150.0) (-87.0) (Text "7")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-150.0) (-207.0) (Text "4")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-150.0) (-327.0) (Text "1")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-250.0) 37.0 (Text "C")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-250.0) (-87.0) (Text "R")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-240.0) (-207.0) (Text "x")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-245.0) (-327.0) (Text "X")),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 200.0 80.0 (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 100.0 80.0 (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 0.0 80.0 (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-100.0) 80.0 (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-200.0) 80.0 (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 200.0 (-40.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 100.0 (-40.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 0.0 (-40.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-100.0) (-40.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-200.0) (-40.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 200.0 (-160.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 100.0 (-160.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 0.0 (-160.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-100.0) (-160.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-200.0) (-160.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 200.0 (-280.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 100.0 (-280.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 0.0 (-280.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-100.0) (-280.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-200.0) (-280.0) (Line [(-50.0,-60.0),(-50.0,60.0),(50.0,60.0),(50.0,-60.0),(-50.0,-60.0)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate 0.0 250.0 (Line [(-500.0,-87.5),(-500.0,87.5),(500.0,87.5),(500.0,-87.5),(-500.0,-87.5)])),Color (RGBA 1.0 1.0 1.0 1.0) (Translate (-500.0) 200.0 (Text "OLLEH"))]
-}
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
--numbers ::
numbers :: [(Integer, [Char])]
numbers = [(10,"_"),(1,"1"),(2,"2"),(3,"3"),(4,"4"),(5,"5"),(6,"6"),(7,"7"),(8,"8"),(9,"9"),(0,"0")]

operators :: [[Char]]
operators = ["+","-","*","=","R","/"]

fromJust :: Maybe a -> a
fromJust (Just x) = x

fromOperators :: [Char] -> Picture
fromOperators x = Text (head (filter (== x) operators))

fromNumbers :: Integer -> Picture
fromNumbers x = Text (fromJust (lookup x numbers))
