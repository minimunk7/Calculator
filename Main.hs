module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

--import Render
--import Initial
--import Input
--import Lib

data Knapp = Plus (Int,Int)

type Räknare = ([Char],(Float,Float))

main :: IO ()
main = play
       windowDisplay
       backgroundColor
       20
       initialCalculator
       render
       inputHandler
       placeholder

windowDisplay :: Display
windowDisplay = InWindow "Calculator" (1028, 720) (200, 400)






















initialCalculator = ([],(0,0))

backgroundColor = black

--Renderingen av bilderna
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
                               Color white (Translate (x-550)(0+200) (Text (reverse a)))]
                         

initialCalc (a,(x,y)) = pictures (buttonsAndFields (a,(x,y)))

render :: Räknare -> Picture
render (a,(x,1)) = pictures (buttonsAndFields (a,(x,1)))
render (a,(x,y)) = initialCalc (a,(x,y))







--Inputhandler
inputHandler :: Event -> Räknare -> Räknare
inputHandler (EventKey (MouseButton LeftButton) Down _ (x', y')) (a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 140) && (y' >= 20)) = ("+ "++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 20) && (y' >= -100)) = ("- "++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -100) && (y' >= -220)) = ("/ "++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -220) && (y' >= -340)) = ("EVLOS "++a,(x,y))
  
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 140) && (y' >= 20)) = ("* "++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 20) && (y' >= -100)) = ("9 "++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -100) && (y' >= -220)) = ("6 "++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -220) && (y' >= -340)) = ("3 "++a,(x,y))

  | ((x'<= 50) && (x' >= -50)) && ((y'<= 140) && (y' >= 20)) = ("soc "++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= 20) && (y' >= -100)) = ("8 "++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -100) && (y' >= -220)) = ("5 "++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -220) && (y' >= -340)) = ("2 "++a,(x,y))

  | ((x'<= -50) && (x' >= -150)) && ((y'<= 140) && (y' >= 20)) = ("nis "++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= 20) && (y' >= -100)) = ("7 "++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -100) && (y' >= -220)) = ("4 "++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -220) && (y' >= -340)) = ("1 "++a,(x,y))

  | ((x'<= -150) && (x' >= -250)) && ((y'<= 140) && (y' >= 20)) = ([],(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= 20) && (y' >= -100)) = ("trqs "++a,(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -100) && (y' >= -220)) = ("x "++a,(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -220) && (y' >= -340)) = undefined
inputHandler _ räknare = räknare






--Updaterar frekvent
placeholder _ räknare = räknare

cycler _ (a,(x,y))
  | (shallWeSolve (a,(x,y))) == True = ((solver_func a),(x,y))
  | otherwise = (a,(x,y))

shallWeSolve (a,(x,y)) = if (filter (== "SOLVE" ) a) /= [] then True else False

--Solver!!!!!!!
solver_func räknare = undefined



-- Tecknena på miniräknaren
numbers = [(10,"_"),(1,"1"),(2,"2"),(3,"3"),(4,"4"),(5,"5"),(6,"6"),(7,"7"),(8,"8"),(9,"9"),(0,"0")]

operators = ["+","-","*","=","R","/"]

fromJust (Just x) = x

fromOperators x = Text (head (filter (== x) operators))
fromNumbers x = Text (fromJust (lookup x numbers))

--Rester, kan komma till användening kanske, perhaps, sometimes, en gång i framtiden.

--render (x,y) = pictures    [Color white (Translate x y (rectangleWire 200 100)),
--                              Color white (Translate (x-50) (y-43) text'),
--                              Color white (Translate x (y+250) (rectangleWire  1000 175)),
--                              Color white (Translate (x-100)(y+180) text' )]

{-
buttonsAndFields (a,(x,1)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]
buttonsAndFields (a,(x,2)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,3)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,4)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,5)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,6)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,7)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,8)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,9)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,10)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

buttonsAndFields (a,(x,11)) = [Color white (Translate x 0 (rectangleWire 200 100)),
                          Color white (Translate (x-50) (-43) (fromOperators "+")),
                          Color white (Translate x (0+250) (rectangleWire  1000 125)),
                          Color white (Translate (x-200)(0+200) (fromOperators "+"))]

-}

