{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SES.Types.SNSAction
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.SES.Types.SNSAction where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.SES.Types.SNSActionEncoding

-- | When included in a receipt rule, this action publishes a notification to Amazon Simple Notification Service (Amazon SNS). This action includes a complete copy of the email content in the Amazon SNS notifications. Amazon SNS notifications for all other actions simply provide information about the email. They do not include the email content itself.
--
--
-- If you own the Amazon SNS topic, you don't need to do anything to give Amazon SES permission to publish emails to it. However, if you don't own the Amazon SNS topic, you need to attach a policy to the topic to give Amazon SES permissions to access it. For information about giving permissions, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html Amazon SES Developer Guide> .
--
-- /Important:/ You can only publish emails that are 150 KB or less (including the header) to Amazon SNS. Larger emails will bounce. If you anticipate emails larger than 150 KB, use the S3 action instead.
--
-- For information about using a receipt rule to publish an Amazon SNS notification, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-sns.html Amazon SES Developer Guide> .
--
--
-- /See:/ 'snsAction' smart constructor.
data SNSAction = SNSAction'
  { _snsaEncoding ::
      !(Maybe SNSActionEncoding),
    _snsaTopicARN :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SNSAction' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'snsaEncoding' - The encoding to use for the email within the Amazon SNS notification. UTF-8 is easier to use, but may not preserve all special characters when a message was encoded with a different encoding format. Base64 preserves all special characters. The default value is UTF-8.
--
-- * 'snsaTopicARN' - The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. An example of an Amazon SNS topic ARN is @arn:aws:sns:us-west-2:123456789012:MyTopic@ . For more information about Amazon SNS topics, see the <https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html Amazon SNS Developer Guide> .
snsAction ::
  -- | 'snsaTopicARN'
  Text ->
  SNSAction
snsAction pTopicARN_ =
  SNSAction'
    { _snsaEncoding = Nothing,
      _snsaTopicARN = pTopicARN_
    }

-- | The encoding to use for the email within the Amazon SNS notification. UTF-8 is easier to use, but may not preserve all special characters when a message was encoded with a different encoding format. Base64 preserves all special characters. The default value is UTF-8.
snsaEncoding :: Lens' SNSAction (Maybe SNSActionEncoding)
snsaEncoding = lens _snsaEncoding (\s a -> s {_snsaEncoding = a})

-- | The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. An example of an Amazon SNS topic ARN is @arn:aws:sns:us-west-2:123456789012:MyTopic@ . For more information about Amazon SNS topics, see the <https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html Amazon SNS Developer Guide> .
snsaTopicARN :: Lens' SNSAction Text
snsaTopicARN = lens _snsaTopicARN (\s a -> s {_snsaTopicARN = a})

instance FromXML SNSAction where
  parseXML x =
    SNSAction'
      <$> (x .@? "Encoding") <*> (x .@ "TopicArn")

instance Hashable SNSAction

instance NFData SNSAction

instance ToQuery SNSAction where
  toQuery SNSAction' {..} =
    mconcat
      [ "Encoding" =: _snsaEncoding,
        "TopicArn" =: _snsaTopicARN
      ]
