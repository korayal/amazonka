{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.Types.LogEvent
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Lightsail.Types.LogEvent where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes a database log event.
--
--
--
-- /See:/ 'logEvent' smart constructor.
data LogEvent = LogEvent'
  { _leMessage ::
      !(Maybe Text),
    _leCreatedAt :: !(Maybe POSIX)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'LogEvent' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'leMessage' - The message of the database log event.
--
-- * 'leCreatedAt' - The timestamp when the database log event was created.
logEvent ::
  LogEvent
logEvent =
  LogEvent'
    { _leMessage = Nothing,
      _leCreatedAt = Nothing
    }

-- | The message of the database log event.
leMessage :: Lens' LogEvent (Maybe Text)
leMessage = lens _leMessage (\s a -> s {_leMessage = a})

-- | The timestamp when the database log event was created.
leCreatedAt :: Lens' LogEvent (Maybe UTCTime)
leCreatedAt = lens _leCreatedAt (\s a -> s {_leCreatedAt = a}) . mapping _Time

instance FromJSON LogEvent where
  parseJSON =
    withObject
      "LogEvent"
      ( \x ->
          LogEvent'
            <$> (x .:? "message") <*> (x .:? "createdAt")
      )

instance Hashable LogEvent

instance NFData LogEvent
