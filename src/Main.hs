{-# LANGUAGE OverloadedStrings #-}

-- The langauge extension OverloadedStrings makes literal strings more flexible. 
-- In our case, it makes our URL automatically parsed into a Request.

module Main where

import qualified Data.ByteString.Char8        as BS
import           Data.Text                      ( Text )
import           Data.Aeson.Lens                ( key, _String )
import           Control.Lens                   ( preview )
import           Network.HTTP.Simple            ( httpBS, getResponseBody )


-- Data.ByteStrings.Char8 helps work with bytestrings
-- Network.HTTP.Simple is used to make HTTP request

fetchJSON :: IO BS.ByteString
fetchJSON = do
  res <- httpBS "https://api.coindesk.com/v1/bpi/currentprice.json"
  return (getResponseBody res)

-- fetchJSON fetches the JSON from the URL by making an HTTP request and then returns the response body

getRate :: BS.ByteString -> Maybe Text
getRate = preview (key "bpi" . key "USD" . key "rate" . _String)

-- We need to extract the Bitcoin rate in USD, in JS this is like json.bpi.USD.rate
-- We use lenses to extract the rate from the somewhat complicated structure

-- Date.Lens.Aeson lets us work with JSON data, by providing lenses with a Haskell representation of JSON objects.
-- It also provides key, which focuses on a property value.

main :: IO ()
main = do
  json <- fetchJSON
  print (getRate json)

