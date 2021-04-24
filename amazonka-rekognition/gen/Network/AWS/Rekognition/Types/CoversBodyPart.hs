{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Rekognition.Types.CoversBodyPart
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Rekognition.Types.CoversBodyPart where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information about an item of Personal Protective Equipment covering a corresponding body part. For more information, see 'DetectProtectiveEquipment' .
--
--
--
-- /See:/ 'coversBodyPart' smart constructor.
data CoversBodyPart = CoversBodyPart'
  { _cbpConfidence ::
      !(Maybe Double),
    _cbpValue :: !(Maybe Bool)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CoversBodyPart' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cbpConfidence' - The confidence that Amazon Rekognition has in the value of @Value@ .
--
-- * 'cbpValue' - True if the PPE covers the corresponding body part, otherwise false.
coversBodyPart ::
  CoversBodyPart
coversBodyPart =
  CoversBodyPart'
    { _cbpConfidence = Nothing,
      _cbpValue = Nothing
    }

-- | The confidence that Amazon Rekognition has in the value of @Value@ .
cbpConfidence :: Lens' CoversBodyPart (Maybe Double)
cbpConfidence = lens _cbpConfidence (\s a -> s {_cbpConfidence = a})

-- | True if the PPE covers the corresponding body part, otherwise false.
cbpValue :: Lens' CoversBodyPart (Maybe Bool)
cbpValue = lens _cbpValue (\s a -> s {_cbpValue = a})

instance FromJSON CoversBodyPart where
  parseJSON =
    withObject
      "CoversBodyPart"
      ( \x ->
          CoversBodyPart'
            <$> (x .:? "Confidence") <*> (x .:? "Value")
      )

instance Hashable CoversBodyPart

instance NFData CoversBodyPart
