module Week2Easy
  ( decodeMsg
  ) where

import qualified Control.Monad as Mon

decodeMsg :: String -> String
decodeMsg = fmap toEnum . fmap read . words

main :: IO ()
main = Mon.forever $ getLine >>= putStrLn . decodeMsg
