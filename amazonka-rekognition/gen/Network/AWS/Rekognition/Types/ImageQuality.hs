{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Rekognition.Types.ImageQuality
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Rekognition.Types.ImageQuality where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Identifies face image brightness and sharpness.
--
--
--
-- /See:/ 'imageQuality' smart constructor.
data ImageQuality = ImageQuality'
  { _iqBrightness ::
      !(Maybe Double),
    _iqSharpness :: !(Maybe Double)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ImageQuality' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iqBrightness' - Value representing brightness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a brighter face image.
--
-- * 'iqSharpness' - Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a sharper face image.
imageQuality ::
  ImageQuality
imageQuality =
  ImageQuality'
    { _iqBrightness = Nothing,
      _iqSharpness = Nothing
    }

-- | Value representing brightness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a brighter face image.
iqBrightness :: Lens' ImageQuality (Maybe Double)
iqBrightness = lens _iqBrightness (\s a -> s {_iqBrightness = a})

-- | Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a sharper face image.
iqSharpness :: Lens' ImageQuality (Maybe Double)
iqSharpness = lens _iqSharpness (\s a -> s {_iqSharpness = a})

instance FromJSON ImageQuality where
  parseJSON =
    withObject
      "ImageQuality"
      ( \x ->
          ImageQuality'
            <$> (x .:? "Brightness") <*> (x .:? "Sharpness")
      )

instance Hashable ImageQuality

instance NFData ImageQuality
