module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import Test.HUnit

import Render
import Initial
import Input
import Lib


{-main
  The function that runs the whole program using the importet "play" function from the gloss library. This function requires
  these six parameters to exist, either as functions or as values themselves, such as the 20 which is the frames per seconds that the calculator runs at. The "play" function requires the following, take from the librarys documentation:
  a display mode.
  a background color.
  the number of simulation steps to take for each second of real time.
  The initial world.
  A function to convert the world a picture.
  A function to handle input events.
  A function to step the world one iteration. It is passed the period of time (in seconds) needing to be advanced.
  PRE: -
  SIDE: -
  RETURNS: As long as the program is running the picture will be updated 20 times per second and be changing depending on the user/"player" input
-}
main :: IO ()
main = play
       windowDisplay
       Render.backgroundColor
       20
       Initial.initialCalculator
       Render.render
       Input.inputHandler
       cycler

windowDisplay :: Display
windowDisplay = InWindow "Calculator" (1028, 720) (200, 400)















--Updaterar frekvent
placeholder _ räknare = räknare

cycler :: Float -> Initial.Räknare -> Initial.Räknare
cycler _ (a,(x,y)) = (a,(y,x))

--shallWeSolve (a,(x,y)) = if (filter (== "SOLVE" )  a) /= [] then True else False

--Solver!!!!!!!


--Tests
--testCycler1 = TestCase(assertEqual "After a cycle the calculation happens" (["10"],(0,0)) (placeholder 1 (["5+5"],(0,0))))

--testCycler2 = TestCase(assertEqual "Again a calculation" ((["54"],(0,0)))  (cycler 1 (["10*5+7-3"],(0,0))))

--testInput1 = TestCase(assertEqual "Click at certain coordinate adds the right character to string" ([7]) (fst(Input.Inputhandler () ([],(0,0)))))

--testInput1 = TestCase(assertEqual "Click at certain coordinate adds the right character to string" (["sin"]) (fst(Input.Inputhandler () ([],(0,0)))))

--testlist = TestList [TestLabel "Cycler" testCycler1,
--                     TestLabel "Cycler" testCycler2,
--                     TestLabel "Input" testInput1,
--                     TestLabel "Input" testInput2]
