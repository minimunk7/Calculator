module Input where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game


import Initial
import Lib

--Inputhandler
{-inputHandler input räknare
  a function that takes in an event, which is how gloss handles "player" input in the play function that resides in main,
  as well as the current state of the calculator and then changes the calculator state depending on what "player" input the
  inputHandler function takes in. It only handles mouse leftclicks for all its functionality.
  PRE: -
  SIDE: -
  RETURN: An altered calculator dependin on the input where some symbol is added or removed to the string that the screen displayes as well as the result of the calulation if the "player" clicks the "=" button which initiates the solver function.
-}
inputHandler :: Event -> Initial.Räknare -> Initial.Räknare
inputHandler (EventKey (MouseButton LeftButton) Down _ (x', y')) (a,(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 140) && (y' >= 20)) = (Lib.checkOperator a " + ",(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= 20) && (y' >= -100)) = (Lib.checkOperator a " - ",(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -100) && (y' >= -220)) = (Lib.checkOperator a " / ",(x,y))
  | ((x'<= 250) && (x' >= 150)) && ((y'<= -220) && (y' >= -340)) && Lib.checkEqual a = (show(Lib.calculate (Lib.getValues a)),(x,y))
  
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 140) && (y' >= 20)) = (Lib.checkOperator a " * ",(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= 20) && (y' >= -100)) = (a++"9",(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -100) && (y' >= -220)) = (a++"6",(x,y))
  | ((x'<= 150) && (x' >= 50)) && ((y'<= -220) && (y' >= -340)) = (a++"3",(x,y))

  | ((x'<= 50) && (x' >= -50)) && ((y'<= 140) && (y' >= 20)) = (a,(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= 20) && (y' >= -100)) = (a++"8",(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -100) && (y' >= -220)) = (a++"5",(x,y))
  | ((x'<= 50) && (x' >= -50)) && ((y'<= -220) && (y' >= -340)) = (a++"2",(x,y))

  | ((x'<= -50) && (x' >= -150)) && ((y'<= 140) && (y' >= 20)) = (a,(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= 20) && (y' >= -100)) = (a++"7",(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -100) && (y' >= -220)) = (a++"4",(x,y))
  | ((x'<= -50) && (x' >= -150)) && ((y'<= -220) && (y' >= -340)) = (a++"1",(x,y))

  | ((x'<= -150) && (x' >= -250)) && ((y'<= 140) && (y' >= 20)) = ([],(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= 20) && (y' >= -100)) = ((backspacer a),(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -100) && (y' >= -220)) = (a++".",(x,y))
  | ((x'<= -150) && (x' >= -250)) && ((y'<= -220) && (y' >= -340)) = (a++"0",(x,y))
inputHandler _ räknare = räknare

{-backspacer string
  a function that takes in a string and checks if the first three characters are one of the three trigonometric functions
  sin, cos and tan. If it matches then the whole sin, cos or tan substring is dropped otherwise only one character from the string is dropped.
  PRE: -
  SIDE: -
  RETURNS: An altered string where either the first letter is removed or the first three letters are removed depending on if the first three are one of the three functions sin, cos or tan
-}
backspacer :: String -> String
backspacer string
  | take 3 string == "sin"  = drop 3 string
  | take 3 string == "cos"  = drop 3 string
  | take 3 string == "tan"  = drop 3 string
  | otherwise = drop 1 string





