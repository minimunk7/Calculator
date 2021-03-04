module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

--De två nästa funktionerna är tagna från ett tidigare projekt
{- getValuesAux (x:xs) currString
   takes a string containing numbers and an empty and returns them as Ints in a list
   PRE:  String needs to contain numbers with spaces between them. Second string needs to be empty as it  is an accumulator
   RETURNS: returns the numbers within the string as a list
   SIDE EFFECTS: -
   
   getValues stringWithScore
   takes a single string to simplify the use of getValuesAux
-}

getValuesAux :: String -> String -> [String]
getValuesAux [] currString = [currString]
getValuesAux (' ':xs) currString = [currString] ++ getValuesAux xs ""
getValuesAux (x:xs) currString = getValuesAux xs (currString ++ [x])

{- getValues stringWithScore
     Takes a string and returns a list of parts separated by spaces
     PRE:  The function assumes theres only one space between each part
     RETURNS: "This sentence returns" ["This", "Sentence", "Returns"]
     SIDE EFFECTS: -
     EXAMPLES: "This     Returns" ["This","","","","","Returns"]
  -}

getValues :: String -> [String]
getValues stringWithScore = getValuesAux stringWithScore ""


{- secondPrio x:xs
     Takes a list of numbers and operators (+, -) and evaluates them.
     Intended to be used with calculate.
     PRE: The values must alternate correctly. No exceptionhandling as
     function is intended for calculator with limited user input
     RETURNS: The content of the list as a single float value
     SIDE EFFECTS: Will cause an exception if the order of elements is worng
     EXAMPLES: ["123", "+", "34", "-", 3] = 54.0, ["123", "-"] wont work
  -}
secondPrio :: [String] -> Float
secondPrio [] = 0
secondPrio (x:[]) = (read x)
secondPrio (x:"+":xs) = (read x) + (secondPrio xs)
secondPrio (x:"-":xs) = (read x) - (secondPrio xs)

{- firstPrio x:xs
     Calculates each multiplication and division and returns it
     as a list of remaining values. May have to be run multiple times.
     Intended to be used with calculate.
     PRE:  The values must alternate correctly. No exceptionhandling as
     function is intended for calculator with limited user input
     RETURNS: A tweaked list containing some of the values evaluated
     SIDE EFFECTS: Will cause exception if not alternating between number and operator
     EXAMPLES: ["2", "*", "3", "/", "5"] will return ["6", "/", "5"]
     ["2", "*", "3", "+", "5", "/", "5"] will return ["6" + "1"]
  -}

firstPrio :: [String] -> [String]
firstPrio [] = []
firstPrio (x:[]) = [x]
firstPrio ("+":xs) = ["+"] ++ (firstPrio xs)
firstPrio ("-":xs) = ["-"] ++ (firstPrio xs)
firstPrio ("*":xs) = ["*"] ++ (firstPrio xs)
firstPrio ("/":xs) = ["/"] ++ (firstPrio xs)
firstPrio (x:"+":xs) = [x, "+"] ++ (firstPrio xs)
firstPrio (x:"-":xs) = [x, "-"] ++ (firstPrio xs)
firstPrio (x:"/":y:xs) = [show ((read x::Float) / (read y::Float))] ++ (firstPrio xs)
firstPrio (x:"*":y:xs) = [show ((read x) * (read y::Float))] ++ (firstPrio xs)

{- calculate list
     evaluates a list of strings into a float value
     PRE:  They must be ordered correctly alternating between numbers and operator and cannot end on an operator
     RETURNS: the calculated result of the lists content
     SIDE EFFECTS: can cause exceptions
     EXAMPLES: [1" ,"*" ,"2" ,"+" ,"3" ,"*" ,"4" ,"/" ,"5"] = 4.4
-}

calculate :: [String] -> Float
calculate list 
   --Runs firstPrio until theres no more multiplications and divisions to compute
   | elem "*" list || elem "/" list = calculate (firstPrio list)
   | otherwise = secondPrio list