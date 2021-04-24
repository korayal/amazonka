{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.Types.DestinationInfo
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Lightsail.Types.DestinationInfo where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the destination of a record.
--
--
--
-- /See:/ 'destinationInfo' smart constructor.
data DestinationInfo = DestinationInfo'
  { _diId ::
      !(Maybe Text),
    _diService :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DestinationInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'diId' - The ID of the resource created at the destination.
--
-- * 'diService' - The destination service of the record.
destinationInfo ::
  DestinationInfo
destinationInfo =
  DestinationInfo'
    { _diId = Nothing,
      _diService = Nothing
    }

-- | The ID of the resource created at the destination.
diId :: Lens' DestinationInfo (Maybe Text)
diId = lens _diId (\s a -> s {_diId = a})

-- | The destination service of the record.
diService :: Lens' DestinationInfo (Maybe Text)
diService = lens _diService (\s a -> s {_diService = a})

instance FromJSON DestinationInfo where
  parseJSON =
    withObject
      "DestinationInfo"
      ( \x ->
          DestinationInfo'
            <$> (x .:? "id") <*> (x .:? "service")
      )

instance Hashable DestinationInfo

instance NFData DestinationInfo
