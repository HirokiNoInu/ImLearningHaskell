module Main where

import Src
import System.Exit qualified as Exit
import Test.HUnit

main :: IO ()
main = do
  result <- runTestTT tests
  if failures result > 0 || errors result > 0
    then Exit.exitFailure
    else Exit.exitSuccess

tests :: Test
tests =
  TestList
    [ TestLabel "addition" addTest
    ]

addTest :: Test
addTest =
  TestCase $ do
    assertEqual
      "1 + 2"
      3
      (add 1 2)
