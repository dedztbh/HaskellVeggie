module HW1.Ex1 where

import CodeWorld

botCircle, topCircle, midCircle :: Color -> Picture
botCircle c = colored c (translated 0 (-4.5) (solidCircle 1))
midCircle c = colored c (translated 0 (-1.5) (solidCircle 1))
topCircle c = colored c (translated 0   1.5  (solidCircle 1))

frame :: Picture
frame = rectangle 2.5 7.5

trafficLight :: Int -> Picture
--green
trafficLight 1 = botCircle green & midCircle black & topCircle black & frame
--amber
trafficLight 2 = botCircle black & midCircle yellow & topCircle black & frame
--red
trafficLight 3 = botCircle black & midCircle black & topCircle red   & frame
--red&amber
trafficLight 4 = botCircle black & midCircle yellow & topCircle red   & frame

trafficController :: Double -> Picture
trafficController t
  | round (t/3) `mod` 6 <= 2  = trafficLight 1
  | round (t/3) `mod` 6 <= 3  = trafficLight 2
  | round (t/3) `mod` 6 <= 5  = trafficLight 3
  | otherwise                 = trafficLight 4

main :: IO ()
main = animationOf trafficController