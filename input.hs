module Input where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

import Initial

--Inputhandler

inputHandler :: Event -> Initial.Räknare -> Initial.Räknare
inputHandler (EventKey (MouseButton LeftButton) Down _ (x', y')) (a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 140) && (y' >= 20)) = ("+"++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 20) && (y' >= -100)) = ("-"++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -100) && (y' >= -220)) = ("/"++a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -220) && (y' >= -340)) = ("EVLOS"++a,(x,y))
  
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 140) && (y' >= 20)) = ("*"++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 20) && (y' >= -100)) = ("9"++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -100) && (y' >= -220)) = ("6"++a,(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -220) && (y' >= -340)) = ("3"++a,(x,y))

  | ((x'<= 50) && (x' >= -50)) && ((y'<= 140) && (y' >= 20)) = ("soc"++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= 20) && (y' >= -100)) = ("8"++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -100) && (y' >= -220)) = ("5"++a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -220) && (y' >= -340)) = ("2"++a,(x,y))

  | ((x'<= -50) && (x' >= -150)) && ((y'<= 140) && (y' >= 20)) = ("nis"++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= 20) && (y' >= -100)) = ("7"++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -100) && (y' >= -220)) = ("4"++a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -220) && (y' >= -340)) = ("1"++a,(x,y))

  | ((x'<= -150) && (x' >= -250)) && ((y'<= 140) && (y' >= 20)) = ([],(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= 20) && (y' >= -100)) = ("trqs"++a,(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -100) && (y' >= -220)) = ((backspacer a),(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -220) && (y' >= -340)) = undefined
inputHandler _ räknare = räknare

backspacer :: String -> String
backspacer string
  | take 3 string == "sin" = drop 3 string
  | take 3 string == "cos" = drop 3 string
  | take 3 string == "tan" = drop 3 string
  | otherwise = drop 1 string






