import PortfolioCore
import DomainReview

expect :: Bool -> IO ()
expect True = pure ()
expect False = error "fixture mismatch"

main :: IO ()
main = do
  let signalcase_1 = Signal 78 101 15 16 8
  expect (score signalcase_1 == 109)
  expect (classify signalcase_1 == "review")
  let signalcase_2 = Signal 66 80 13 10 11
  expect (score signalcase_2 == 123)
  expect (classify signalcase_2 == "review")
  let signalcase_3 = Signal 72 84 14 16 11
  expect (score signalcase_3 == 93)
  expect (classify signalcase_3 == "review")
  let domainReview = ReviewItem 41 47 24 87
  expect (reviewScore domainReview == 144)
  expect (reviewLane domainReview == "ship")
