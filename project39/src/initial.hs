module Initial where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

{- This datatype represents the the calculators vislual look.
   The shapes and symbols(pictures) uses the second part of this type, (Float,Float), which represents the x and y coordinates to place the pictures in the right place.
   The first part of the type, [Char], is the string that is displayed on the screen and represents the buttonpresses
   and is also used when calculating the expressions within the string
   place the 
     INVARIANT: The characters that can appear in the string is anything from the empty string to all the characters that are assigned to the buttons.
-}
type Räknare = (String,(Float,Float))

initialCalculator :: Räknare
initialCalculator = ("",(0.0,0.0))
