{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AppSync.Types.SchemaStatus
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AppSync.Types.SchemaStatus
  ( SchemaStatus
      ( ..,
        SchemaStatusACTIVE,
        SchemaStatusDELETING,
        SchemaStatusFAILED,
        SchemaStatusNOTAPPLICABLE,
        SchemaStatusPROCESSING,
        SchemaStatusSUCCESS
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

newtype SchemaStatus = SchemaStatus'
  { fromSchemaStatus ::
      Prelude.Text
  }
  deriving
    ( Prelude.Eq,
      Prelude.Ord,
      Prelude.Read,
      Prelude.Show,
      Prelude.Data,
      Prelude.Typeable,
      Prelude.Generic
    )

pattern SchemaStatusACTIVE :: SchemaStatus
pattern SchemaStatusACTIVE = SchemaStatus' "ACTIVE"

pattern SchemaStatusDELETING :: SchemaStatus
pattern SchemaStatusDELETING = SchemaStatus' "DELETING"

pattern SchemaStatusFAILED :: SchemaStatus
pattern SchemaStatusFAILED = SchemaStatus' "FAILED"

pattern SchemaStatusNOTAPPLICABLE :: SchemaStatus
pattern SchemaStatusNOTAPPLICABLE = SchemaStatus' "NOT_APPLICABLE"

pattern SchemaStatusPROCESSING :: SchemaStatus
pattern SchemaStatusPROCESSING = SchemaStatus' "PROCESSING"

pattern SchemaStatusSUCCESS :: SchemaStatus
pattern SchemaStatusSUCCESS = SchemaStatus' "SUCCESS"

{-# COMPLETE
  SchemaStatusACTIVE,
  SchemaStatusDELETING,
  SchemaStatusFAILED,
  SchemaStatusNOTAPPLICABLE,
  SchemaStatusPROCESSING,
  SchemaStatusSUCCESS,
  SchemaStatus'
  #-}

instance Prelude.FromText SchemaStatus where
  parser = SchemaStatus' Prelude.<$> Prelude.takeText

instance Prelude.ToText SchemaStatus where
  toText (SchemaStatus' x) = x

instance Prelude.Hashable SchemaStatus

instance Prelude.NFData SchemaStatus

instance Prelude.ToByteString SchemaStatus

instance Prelude.ToQuery SchemaStatus

instance Prelude.ToHeader SchemaStatus

instance Prelude.FromJSON SchemaStatus where
  parseJSON = Prelude.parseJSONText "SchemaStatus"
