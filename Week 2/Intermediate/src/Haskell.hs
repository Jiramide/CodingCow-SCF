module Week2Intermediate
  ( decodeMsg
  ) where

import qualified Control.Monad as Mon
import qualified Data.List as List
import qualified Data.Maybe as Mayb
import qualified Data.Char as Char

toHex :: Char -> Int
toHex = Mayb.fromMaybe 0 . flip List.elemIndex "0123456789ABCDEF" . Char.toUpper

everyN :: Int -> ([a] -> b) -> [a] -> [b]
everyN _ _ [] = []
everyN n f xs = f t : everyN n f d
  where (t, d) = splitAt n xs

decodeMsg :: String -> String
decodeMsg = everyN 2 (\[a, b] -> toEnum $ 16 * toHex a + toHex b)

main :: IO ()
main = Mon.forever $ getLine >>= print . decodeMsg
