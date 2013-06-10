
-- | This module contains rule types that have special behaviour in some way.
--   Everything in this module is a hack.
module Development.Shake.Special(
    specialAlwaysRebuilds,
    specialIsFileKey
    ) where

import Development.Shake.Value
import Data.List
import Data.Typeable


specialAlwaysRebuilds :: Key -> Value -> Bool
specialAlwaysRebuilds k v = sk == "AlwaysRerunQ" || "OracleQ " `isPrefixOf` sk || sv == "FileA (FileTime 2147483647)"
    where sk = show k; sv = show v


specialIsFileKey :: TypeRep -> Bool
specialIsFileKey t = con == "FileQ"
    where con = show $ fst $ splitTyConApp t
