{-# LANGUAGE OverloadedStrings #-}

module Twitter (searchTwitter) where
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Time
import Web.Twitter.Types
import Data.Aeson
import Web.Authenticate.OAuth
import Network.HTTP.Conduit
import Data.Foldable
import Control.Monad

analyze :: [Status] -> IO ()
analyze s = putStrLn "analyzing tweets..."

searchTwitter :: String -> IO [Status]
searchTwitter searchTerm = error "TODO"

myoauth :: OAuth
myoauth =
  newOAuth { oauthServerName     = "api.twitter.com"
           , oauthConsumerKey    = "your consumer key here"
           , oauthConsumerSecret = "your consumer secret here"
             }

mycred :: Credential
mycred = newCredential "your oauth token here"
                       "your oauth token secret here"
