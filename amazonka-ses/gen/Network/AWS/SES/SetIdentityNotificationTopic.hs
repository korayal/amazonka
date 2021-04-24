{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SES.SetIdentityNotificationTopic
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering notifications. When you use this operation, you specify a verified identity, such as an email address or domain. When you send an email that uses the chosen identity in the Source field, Amazon SES sends notifications to the topic you specified. You can send bounce, complaint, or delivery notifications (or any combination of the three) to the Amazon SNS topic that you specify.
--
--
-- You can execute this operation no more than once per second.
--
-- For more information about feedback notification, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html Amazon SES Developer Guide> .
module Network.AWS.SES.SetIdentityNotificationTopic
  ( -- * Creating a Request
    setIdentityNotificationTopic,
    SetIdentityNotificationTopic,

    -- * Request Lenses
    sintSNSTopic,
    sintIdentity,
    sintNotificationType,

    -- * Destructuring the Response
    setIdentityNotificationTopicResponse,
    SetIdentityNotificationTopicResponse,

    -- * Response Lenses
    sintrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to specify the Amazon SNS topic to which Amazon SES will publish bounce, complaint, or delivery notifications for emails sent with that identity as the Source. For information about Amazon SES notifications, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications-via-sns.html Amazon SES Developer Guide> .
--
--
--
-- /See:/ 'setIdentityNotificationTopic' smart constructor.
data SetIdentityNotificationTopic = SetIdentityNotificationTopic'
  { _sintSNSTopic ::
      !(Maybe Text),
    _sintIdentity ::
      !Text,
    _sintNotificationType ::
      !NotificationType
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'SetIdentityNotificationTopic' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sintSNSTopic' - The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request or a null value is passed, @SnsTopic@ is cleared and publishing is disabled.
--
-- * 'sintIdentity' - The identity (email address or domain) that you want to set the Amazon SNS topic for. /Important:/ You can only specify a verified identity for this parameter. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). The following examples are all valid identities: @sender@example.com@ , @example.com@ , @arn:aws:ses:us-east-1:123456789012:identity/example.com@ .
--
-- * 'sintNotificationType' - The type of notifications that will be published to the specified Amazon SNS topic.
setIdentityNotificationTopic ::
  -- | 'sintIdentity'
  Text ->
  -- | 'sintNotificationType'
  NotificationType ->
  SetIdentityNotificationTopic
setIdentityNotificationTopic
  pIdentity_
  pNotificationType_ =
    SetIdentityNotificationTopic'
      { _sintSNSTopic =
          Nothing,
        _sintIdentity = pIdentity_,
        _sintNotificationType = pNotificationType_
      }

-- | The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request or a null value is passed, @SnsTopic@ is cleared and publishing is disabled.
sintSNSTopic :: Lens' SetIdentityNotificationTopic (Maybe Text)
sintSNSTopic = lens _sintSNSTopic (\s a -> s {_sintSNSTopic = a})

-- | The identity (email address or domain) that you want to set the Amazon SNS topic for. /Important:/ You can only specify a verified identity for this parameter. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). The following examples are all valid identities: @sender@example.com@ , @example.com@ , @arn:aws:ses:us-east-1:123456789012:identity/example.com@ .
sintIdentity :: Lens' SetIdentityNotificationTopic Text
sintIdentity = lens _sintIdentity (\s a -> s {_sintIdentity = a})

-- | The type of notifications that will be published to the specified Amazon SNS topic.
sintNotificationType :: Lens' SetIdentityNotificationTopic NotificationType
sintNotificationType = lens _sintNotificationType (\s a -> s {_sintNotificationType = a})

instance AWSRequest SetIdentityNotificationTopic where
  type
    Rs SetIdentityNotificationTopic =
      SetIdentityNotificationTopicResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "SetIdentityNotificationTopicResult"
      ( \s h x ->
          SetIdentityNotificationTopicResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable SetIdentityNotificationTopic

instance NFData SetIdentityNotificationTopic

instance ToHeaders SetIdentityNotificationTopic where
  toHeaders = const mempty

instance ToPath SetIdentityNotificationTopic where
  toPath = const "/"

instance ToQuery SetIdentityNotificationTopic where
  toQuery SetIdentityNotificationTopic' {..} =
    mconcat
      [ "Action"
          =: ("SetIdentityNotificationTopic" :: ByteString),
        "Version" =: ("2010-12-01" :: ByteString),
        "SnsTopic" =: _sintSNSTopic,
        "Identity" =: _sintIdentity,
        "NotificationType" =: _sintNotificationType
      ]

-- | An empty element returned on a successful request.
--
--
--
-- /See:/ 'setIdentityNotificationTopicResponse' smart constructor.
newtype SetIdentityNotificationTopicResponse = SetIdentityNotificationTopicResponse'
  { _sintrrsResponseStatus ::
      Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'SetIdentityNotificationTopicResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sintrrsResponseStatus' - -- | The response status code.
setIdentityNotificationTopicResponse ::
  -- | 'sintrrsResponseStatus'
  Int ->
  SetIdentityNotificationTopicResponse
setIdentityNotificationTopicResponse pResponseStatus_ =
  SetIdentityNotificationTopicResponse'
    { _sintrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
sintrrsResponseStatus :: Lens' SetIdentityNotificationTopicResponse Int
sintrrsResponseStatus = lens _sintrrsResponseStatus (\s a -> s {_sintrrsResponseStatus = a})

instance NFData SetIdentityNotificationTopicResponse
