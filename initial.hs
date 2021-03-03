module Initial where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

type Räknare = ([Char],(Float,Float))

initialCalculator :: Räknare
initialCalculator = ([],(0.0,0.0))

