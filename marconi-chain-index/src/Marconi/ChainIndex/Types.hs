{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE PatternSynonyms    #-}
{-# LANGUAGE TypeFamilies       #-}

-- | This module provides several type aliases and utility functions to deal with them.
module Marconi.ChainIndex.Types
       (
       -- * Addresses alias used to query marconi
       TargetAddresses,
       -- * Aliases for the current Cardano era
       CurrentEra,
       pattern AsCurrentEra,
       pattern CurrentEra,
       TxOut,
       -- * Aliases to ease concept mapping between plutus types and cardano types
       TxOutRef,
       txOutRef,
       -- * Database file names
       utxoDbName,
       addressDatumDbName,
       datumDbName,
       scriptTxDbName,
       epochStakepoolSizeDbName,
       mintBurnDbName
       ) where

import Cardano.Api qualified as C
import Data.List.NonEmpty (NonEmpty)

-- | Typre represents non empty list of Bech32 Shelley compatable addresses
type TargetAddresses = NonEmpty (C.Address C.ShelleyAddr)

-- | An alias for the current era, to ease the transition from one era to the next one
type CurrentEra = C.BabbageEra

pattern CurrentEra :: C.CardanoEra CurrentEra
pattern CurrentEra = C.BabbageEra

pattern AsCurrentEra :: C.AsType CurrentEra
pattern AsCurrentEra = C.AsBabbageEra

-- | A Cardano TxOut of the current Era
type TxOut = C.TxOut C.CtxTx CurrentEra

-- | A reference to a transaction output. This is a
-- pair of a transaction reference, and an index indicating which of the outputs
-- of that transaction we are referring to.
type TxOutRef = C.TxIn

txOutRef :: C.TxId -> C.TxIx -> C.TxIn
txOutRef = C.TxIn

-- * Database file names

utxoDbName :: FilePath
utxoDbName = "utxo.db"

addressDatumDbName :: FilePath
addressDatumDbName = "addressdatum.db"

datumDbName :: FilePath
datumDbName = "datum.db"

scriptTxDbName :: FilePath
scriptTxDbName = "scripttx.db"

epochStakepoolSizeDbName :: FilePath
epochStakepoolSizeDbName = "epochstakepool.db"

mintBurnDbName :: FilePath
mintBurnDbName = "mintburn.db"
