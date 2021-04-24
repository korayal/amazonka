{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SWF.Types.ScheduleActivityTaskFailedEventAttributes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.SWF.Types.ScheduleActivityTaskFailedEventAttributes where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.SWF.Types.ActivityType
import Network.AWS.SWF.Types.ScheduleActivityTaskFailedCause

-- | Provides the details of the @ScheduleActivityTaskFailed@ event.
--
--
--
-- /See:/ 'scheduleActivityTaskFailedEventAttributes' smart constructor.
data ScheduleActivityTaskFailedEventAttributes = ScheduleActivityTaskFailedEventAttributes'
  { _satfeaActivityType ::
      !ActivityType,
    _satfeaActivityId ::
      !Text,
    _satfeaCause ::
      !ScheduleActivityTaskFailedCause,
    _satfeaDecisionTaskCompletedEventId ::
      !Integer
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ScheduleActivityTaskFailedEventAttributes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'satfeaActivityType' - The activity type provided in the @ScheduleActivityTask@ decision that failed.
--
-- * 'satfeaActivityId' - The activityId provided in the @ScheduleActivityTask@ decision that failed.
--
-- * 'satfeaCause' - The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
--
-- * 'satfeaDecisionTaskCompletedEventId' - The ID of the @DecisionTaskCompleted@ event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
scheduleActivityTaskFailedEventAttributes ::
  -- | 'satfeaActivityType'
  ActivityType ->
  -- | 'satfeaActivityId'
  Text ->
  -- | 'satfeaCause'
  ScheduleActivityTaskFailedCause ->
  -- | 'satfeaDecisionTaskCompletedEventId'
  Integer ->
  ScheduleActivityTaskFailedEventAttributes
scheduleActivityTaskFailedEventAttributes
  pActivityType_
  pActivityId_
  pCause_
  pDecisionTaskCompletedEventId_ =
    ScheduleActivityTaskFailedEventAttributes'
      { _satfeaActivityType =
          pActivityType_,
        _satfeaActivityId = pActivityId_,
        _satfeaCause = pCause_,
        _satfeaDecisionTaskCompletedEventId =
          pDecisionTaskCompletedEventId_
      }

-- | The activity type provided in the @ScheduleActivityTask@ decision that failed.
satfeaActivityType :: Lens' ScheduleActivityTaskFailedEventAttributes ActivityType
satfeaActivityType = lens _satfeaActivityType (\s a -> s {_satfeaActivityType = a})

-- | The activityId provided in the @ScheduleActivityTask@ decision that failed.
satfeaActivityId :: Lens' ScheduleActivityTaskFailedEventAttributes Text
satfeaActivityId = lens _satfeaActivityId (\s a -> s {_satfeaActivityId = a})

-- | The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
satfeaCause :: Lens' ScheduleActivityTaskFailedEventAttributes ScheduleActivityTaskFailedCause
satfeaCause = lens _satfeaCause (\s a -> s {_satfeaCause = a})

-- | The ID of the @DecisionTaskCompleted@ event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
satfeaDecisionTaskCompletedEventId :: Lens' ScheduleActivityTaskFailedEventAttributes Integer
satfeaDecisionTaskCompletedEventId = lens _satfeaDecisionTaskCompletedEventId (\s a -> s {_satfeaDecisionTaskCompletedEventId = a})

instance
  FromJSON
    ScheduleActivityTaskFailedEventAttributes
  where
  parseJSON =
    withObject
      "ScheduleActivityTaskFailedEventAttributes"
      ( \x ->
          ScheduleActivityTaskFailedEventAttributes'
            <$> (x .: "activityType")
            <*> (x .: "activityId")
            <*> (x .: "cause")
            <*> (x .: "decisionTaskCompletedEventId")
      )

instance
  Hashable
    ScheduleActivityTaskFailedEventAttributes

instance
  NFData
    ScheduleActivityTaskFailedEventAttributes
