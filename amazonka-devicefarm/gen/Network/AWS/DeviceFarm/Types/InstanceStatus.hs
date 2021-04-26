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
-- Module      : Network.AWS.DeviceFarm.Types.InstanceStatus
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DeviceFarm.Types.InstanceStatus
  ( InstanceStatus
      ( ..,
        InstanceStatusAVAILABLE,
        InstanceStatusINUSE,
        InstanceStatusNOTAVAILABLE,
        InstanceStatusPREPARING
      ),
  )
where

import qualified Network.AWS.Prelude as Prelude

newtype InstanceStatus = InstanceStatus'
  { fromInstanceStatus ::
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

pattern InstanceStatusAVAILABLE :: InstanceStatus
pattern InstanceStatusAVAILABLE = InstanceStatus' "AVAILABLE"

pattern InstanceStatusINUSE :: InstanceStatus
pattern InstanceStatusINUSE = InstanceStatus' "IN_USE"

pattern InstanceStatusNOTAVAILABLE :: InstanceStatus
pattern InstanceStatusNOTAVAILABLE = InstanceStatus' "NOT_AVAILABLE"

pattern InstanceStatusPREPARING :: InstanceStatus
pattern InstanceStatusPREPARING = InstanceStatus' "PREPARING"

{-# COMPLETE
  InstanceStatusAVAILABLE,
  InstanceStatusINUSE,
  InstanceStatusNOTAVAILABLE,
  InstanceStatusPREPARING,
  InstanceStatus'
  #-}

instance Prelude.FromText InstanceStatus where
  parser = InstanceStatus' Prelude.<$> Prelude.takeText

instance Prelude.ToText InstanceStatus where
  toText (InstanceStatus' x) = x

instance Prelude.Hashable InstanceStatus

instance Prelude.NFData InstanceStatus

instance Prelude.ToByteString InstanceStatus

instance Prelude.ToQuery InstanceStatus

instance Prelude.ToHeader InstanceStatus

instance Prelude.FromJSON InstanceStatus where
  parseJSON = Prelude.parseJSONText "InstanceStatus"
