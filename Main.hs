module Main(main) where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Picture

type Calc = (Float, Float)


main :: IO ()
main = play
  windowDisplay
  white 20 (0, 0)
  drawingFunc
  inputHandler
  updateFunc

windowDisplay :: Display
windowDisplay = InWindow "Calculator" (700, 700) (400, 500)

drawingFunc :: Calc -> Picture
drawingFunc (x, y) = translate x y (rectangleSolid 200 100)

inputHandler :: Event -> Calc -> Calc
inputHandler (EventKey (SpecialKey KeyDown) Down _ _) (x,y) = (x-20,y)
inputHandler (EventKey (MouseButton LeftButton) Down _ _) (x, y) = (x+20,y)
inputHandler _ w = w

updateFunc :: Float -> Calc -> Calc
updateFunc _ (x, y) = (x,y)
