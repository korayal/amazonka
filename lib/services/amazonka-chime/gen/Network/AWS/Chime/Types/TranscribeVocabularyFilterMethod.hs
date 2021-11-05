{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.Chime.Types.TranscribeVocabularyFilterMethod
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Chime.Types.TranscribeVocabularyFilterMethod
  ( TranscribeVocabularyFilterMethod
      ( ..,
        TranscribeVocabularyFilterMethod_Mask,
        TranscribeVocabularyFilterMethod_Remove,
        TranscribeVocabularyFilterMethod_Tag
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Prelude as Prelude

newtype TranscribeVocabularyFilterMethod = TranscribeVocabularyFilterMethod'
  { fromTranscribeVocabularyFilterMethod ::
      Core.Text
  }
  deriving stock
    ( Prelude.Show,
      Prelude.Read,
      Prelude.Eq,
      Prelude.Ord,
      Prelude.Generic
    )
  deriving newtype
    ( Prelude.Hashable,
      Prelude.NFData,
      Core.FromText,
      Core.ToText,
      Core.ToByteString,
      Core.ToLog,
      Core.ToHeader,
      Core.ToQuery,
      Core.FromJSON,
      Core.FromJSONKey,
      Core.ToJSON,
      Core.ToJSONKey,
      Core.FromXML,
      Core.ToXML
    )

pattern TranscribeVocabularyFilterMethod_Mask :: TranscribeVocabularyFilterMethod
pattern TranscribeVocabularyFilterMethod_Mask = TranscribeVocabularyFilterMethod' "mask"

pattern TranscribeVocabularyFilterMethod_Remove :: TranscribeVocabularyFilterMethod
pattern TranscribeVocabularyFilterMethod_Remove = TranscribeVocabularyFilterMethod' "remove"

pattern TranscribeVocabularyFilterMethod_Tag :: TranscribeVocabularyFilterMethod
pattern TranscribeVocabularyFilterMethod_Tag = TranscribeVocabularyFilterMethod' "tag"

{-# COMPLETE
  TranscribeVocabularyFilterMethod_Mask,
  TranscribeVocabularyFilterMethod_Remove,
  TranscribeVocabularyFilterMethod_Tag,
  TranscribeVocabularyFilterMethod'
  #-}
