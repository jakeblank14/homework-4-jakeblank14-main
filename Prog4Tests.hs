{- ##################################
   Richard Burns
   Units Tests for Homework 4.

   Usage: ghci Prog2Tests; main

   Dependencies: cabal install tasty
                 cabal install tasty-hunit
   ################################## -}


import Prog4
import Test.Tasty 
import Test.Tasty.HUnit 
import System.Environment

main = do
    setEnv "TASTY_TIMEOUT" "2s"
    defaultMain tests

{-
main = defaultMain tests 
-}

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests = testGroup "Unit tests"
  [
    -- tripleAll :: [Int] -> [(Int,Int)]
    testCase "test_tripleAll1" $ assertEqual [] [(2,6),(3,9),(5,15)] (tripleAll [2,3,5]),
    testCase "test_tripleAll2" $ assertEqual [] [(5,15)] (tripleAll [5]),
    testCase "test_tripleAll3" $ assertEqual [] [(9,27),(10,30)] (tripleAll [9..10]),

    -- flip' :: [(Int, Int)] -> [(Int, Int)]
    testCase "test_flip1" $ assertEqual [] [(5,3)] (flip' [(3,5)]),
    testCase "test_flip2" $ assertEqual [] [(5,3),(6,4)] (flip' [(3,5),(4,6)]),
    testCase "test_flip3" $ assertEqual [] [(5,3),(6,4),(7,5)] (flip' [(3,5),(4,6),(5,7)]),    

    -- sumLastPart :: Int -> [Int] -> Int
    testCase "test_sumLastPart1" $ assertEqual [] 10 (sumLastPart 1 [1..10]),
    testCase "test_sumLastPart2" $ assertEqual [] 27 (sumLastPart 3 [1..10]),
    testCase "test_sumLastPart3" $ assertEqual [] 40 (sumLastPart 5 [1..10]),

    -- middleProduct :: [Int] -> Int
    testCase "test_middleProduct1" $ assertEqual [] 24 (middleProduct [1..5]),
    testCase "test_middleProduct2" $ assertEqual [] 120 (middleProduct [1..6]),
    testCase "test_middleProduct3" $ assertEqual [] 120 (middleProduct [0..6]),

    -- init' :: [Int] -> [Int]
    testCase "test_init1" $ assertEqual [] [1..9] (init' [1..10]),
    testCase "test_init2" $ assertEqual [] [1..5] (init' [1..6]),
    testCase "test_init3" $ assertEqual [] [1] (init' [1,2]),
    testCase "test_init4" $ assertEqual [] [] (init' [1]),

    -- lowerOddLetters :: String -> String
    testCase "test_lowerOddLetters1" $ assertEqual [] "hAsKeLl" (lowerOddLetters "HASKELL"),
    testCase "test_lowerOddLetters2" $ assertEqual [] "h" (lowerOddLetters "H"),
    testCase "test_lowerOddLetters3" $ assertEqual [] "haskell" (lowerOddLetters "Haskell"),
    testCase "test_lowerOddLetters4" $ assertEqual [] "haskell" (lowerOddLetters "haskell"), 

    -- elemAt :: Int -> [Int] -> Int
    testCase "test_elemAt1" $ assertEqual [] 6 (elemAt 1 [6..10]),
    testCase "test_elemAt2" $ assertEqual [] 7 (elemAt 2 [6..10]), 
    testCase "test_elemAt3" $ assertEqual [] 9 (elemAt 4 [6..10]), 

    -- iSort' :: [(String,Int)] -> [(String,Int)]
    testCase "test_iSort1" $ assertEqual [] [("b", (-2)), ("a", 4), ("c", 9), ("d", 18)]
                                       (iSort' [("a", 4), ("b", (-2)), ("c", 9), ("d", 18)]),
    testCase "test_iSort2" $ assertEqual [] [("a",2),("aa",3),("aaa",4)] 
                                       (iSort' [("aaa",4),("aa",3),("a",2)]),
    testCase "test_iSort3" $ assertEqual [] [("aBD",2), ("bc",3)]
                                       (iSort' [("bc",3), ("aBD",2)]),
  

    -- middleWord :: String -> String
    testCase "test_middleWord1" $ assertEqual [] "is" (middleWord "Haskell is fun!"),
    testCase "test_middleWord2" $ assertEqual [] "more" (middleWord "no more school"),
    testCase "test_middleWord3" $ assertEqual [] "b" (middleWord "world b free"),  

    -- lowerFirstLetter :: String -> String
    testCase "test_lowerFirstLetter1" $ assertEqual [] "haskell is fun" (lowerFirstLetter "Haskell is fun"),
    testCase "test_lowerFirstLetter2" $ assertEqual [] "nO MORE SCHOOL" (lowerFirstLetter "NO MORE SCHOOL"),
    testCase "test_lowerFirstLetter3" $ assertEqual [] "world b free" (lowerFirstLetter "world b free"),
    testCase "test_lowerFirstLetter4" $ assertEqual [] "world b fREE" (lowerFirstLetter "world b FREE")

  ]
