{-# LANGUAGE OverloadedStrings #-}

module Database where

import Hasql.Connection
import qualified Data.Configurator as Conf
import Data.Configurator

loadDBSettings :: IO (Maybe Settings)
loadDBSettings = do
  config   <- load [ Required "conf/app.cfg" ]
  let lookup key = Conf.lookup config key
  error "TODO"