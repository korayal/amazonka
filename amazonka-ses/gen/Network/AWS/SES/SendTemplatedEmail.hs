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
-- Module      : Network.AWS.SES.SendTemplatedEmail
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Composes an email message using an email template and immediately queues it for sending.
--
--
-- In order to send email using the @SendTemplatedEmail@ operation, your call to the API must meet the following requirements:
--
--     * The call must refer to an existing email template. You can create email templates using the 'CreateTemplate' operation.
--
--     * The message must be sent from a verified email address or domain.
--
--     * If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html Verifying Email Addresses and Domains> in the /Amazon SES Developer Guide./
--
--     * The maximum message size is 10 MB.
--
--     * Calls to the @SendTemplatedEmail@ operation may only include one @Destination@ parameter. A destination is a set of recipients who will receive the same version of the email. The @Destination@ parameter can include up to 50 recipients, across the To:, CC: and BCC: fields.
--
--     * The @Destination@ parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format /UserName@[SubDomain.]Domain.TopLevelDomain/ ), the entire message will be rejected, even if the message contains other recipients that are valid.
--
--
--
-- /Important:/ If your call to the @SendTemplatedEmail@ operation includes all of the required parameters, Amazon SES accepts it and returns a Message ID. However, if Amazon SES can't render the email because the template contains errors, it doesn't send the email. Additionally, because it already accepted the message, Amazon SES doesn't return a message stating that it was unable to send the email.
--
-- For these reasons, we highly recommend that you set up Amazon SES to send you notifications when Rendering Failure events occur. For more information, see <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html Sending Personalized Email Using the Amazon SES API> in the /Amazon Simple Email Service Developer Guide/ .
module Network.AWS.SES.SendTemplatedEmail
  ( -- * Creating a Request
    sendTemplatedEmail,
    SendTemplatedEmail,

    -- * Request Lenses
    steReturnPath,
    steReturnPathARN,
    steReplyToAddresses,
    steTags,
    steSourceARN,
    steTemplateARN,
    steConfigurationSetName,
    steSource,
    steDestination,
    steTemplate,
    steTemplateData,

    -- * Destructuring the Response
    sendTemplatedEmailResponse,
    SendTemplatedEmailResponse,

    -- * Response Lenses
    sterrsResponseStatus,
    sterrsMessageId,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to send a templated email using Amazon SES. For more information, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html Amazon SES Developer Guide> .
--
--
--
-- /See:/ 'sendTemplatedEmail' smart constructor.
data SendTemplatedEmail = SendTemplatedEmail'
  { _steReturnPath ::
      !(Maybe Text),
    _steReturnPathARN ::
      !(Maybe Text),
    _steReplyToAddresses ::
      !(Maybe [Text]),
    _steTags :: !(Maybe [MessageTag]),
    _steSourceARN :: !(Maybe Text),
    _steTemplateARN :: !(Maybe Text),
    _steConfigurationSetName ::
      !(Maybe Text),
    _steSource :: !Text,
    _steDestination :: !Destination,
    _steTemplate :: !Text,
    _steTemplateData :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SendTemplatedEmail' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'steReturnPath' - The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the @ReturnPath@ parameter. The @ReturnPath@ parameter is never overwritten. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.
--
-- * 'steReturnPathARN' - This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the @ReturnPath@ parameter. For example, if the owner of @example.com@ (which has ARN @arn:aws:ses:us-east-1:123456789012:identity/example.com@ ) attaches a policy to it that authorizes you to use @feedback@example.com@ , then you would specify the @ReturnPathArn@ to be @arn:aws:ses:us-east-1:123456789012:identity/example.com@ , and the @ReturnPath@ to be @feedback@example.com@ . For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
--
-- * 'steReplyToAddresses' - The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply.
--
-- * 'steTags' - A list of tags, in the form of name/value pairs, to apply to an email that you send using @SendTemplatedEmail@ . Tags correspond to characteristics of the email that you define, so that you can publish email sending events.
--
-- * 'steSourceARN' - This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the @Source@ parameter. For example, if the owner of @example.com@ (which has ARN @arn:aws:ses:us-east-1:123456789012:identity/example.com@ ) attaches a policy to it that authorizes you to send from @user@example.com@ , then you would specify the @SourceArn@ to be @arn:aws:ses:us-east-1:123456789012:identity/example.com@ , and the @Source@ to be @user@example.com@ . For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
--
-- * 'steTemplateARN' - The ARN of the template to use when sending this email.
--
-- * 'steConfigurationSetName' - The name of the configuration set to use when you send an email using @SendTemplatedEmail@ .
--
-- * 'steSource' - The email address that is sending the email. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. For information about verifying identities, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html Amazon SES Developer Guide> . If you are sending on behalf of another user and have been permitted to do so by a sending authorization policy, then you must also specify the @SourceArn@ parameter. For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
--
-- * 'steDestination' - The destination for this email, composed of To:, CC:, and BCC: fields. A Destination can include up to 50 recipients across these three fields.
--
-- * 'steTemplate' - The template to use when sending this email.
--
-- * 'steTemplateData' - A list of replacement values to apply to the template. This parameter is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.
sendTemplatedEmail ::
  -- | 'steSource'
  Text ->
  -- | 'steDestination'
  Destination ->
  -- | 'steTemplate'
  Text ->
  -- | 'steTemplateData'
  Text ->
  SendTemplatedEmail
sendTemplatedEmail
  pSource_
  pDestination_
  pTemplate_
  pTemplateData_ =
    SendTemplatedEmail'
      { _steReturnPath = Nothing,
        _steReturnPathARN = Nothing,
        _steReplyToAddresses = Nothing,
        _steTags = Nothing,
        _steSourceARN = Nothing,
        _steTemplateARN = Nothing,
        _steConfigurationSetName = Nothing,
        _steSource = pSource_,
        _steDestination = pDestination_,
        _steTemplate = pTemplate_,
        _steTemplateData = pTemplateData_
      }

-- | The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the @ReturnPath@ parameter. The @ReturnPath@ parameter is never overwritten. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.
steReturnPath :: Lens' SendTemplatedEmail (Maybe Text)
steReturnPath = lens _steReturnPath (\s a -> s {_steReturnPath = a})

-- | This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the @ReturnPath@ parameter. For example, if the owner of @example.com@ (which has ARN @arn:aws:ses:us-east-1:123456789012:identity/example.com@ ) attaches a policy to it that authorizes you to use @feedback@example.com@ , then you would specify the @ReturnPathArn@ to be @arn:aws:ses:us-east-1:123456789012:identity/example.com@ , and the @ReturnPath@ to be @feedback@example.com@ . For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
steReturnPathARN :: Lens' SendTemplatedEmail (Maybe Text)
steReturnPathARN = lens _steReturnPathARN (\s a -> s {_steReturnPathARN = a})

-- | The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply.
steReplyToAddresses :: Lens' SendTemplatedEmail [Text]
steReplyToAddresses = lens _steReplyToAddresses (\s a -> s {_steReplyToAddresses = a}) . _Default . _Coerce

-- | A list of tags, in the form of name/value pairs, to apply to an email that you send using @SendTemplatedEmail@ . Tags correspond to characteristics of the email that you define, so that you can publish email sending events.
steTags :: Lens' SendTemplatedEmail [MessageTag]
steTags = lens _steTags (\s a -> s {_steTags = a}) . _Default . _Coerce

-- | This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the @Source@ parameter. For example, if the owner of @example.com@ (which has ARN @arn:aws:ses:us-east-1:123456789012:identity/example.com@ ) attaches a policy to it that authorizes you to send from @user@example.com@ , then you would specify the @SourceArn@ to be @arn:aws:ses:us-east-1:123456789012:identity/example.com@ , and the @Source@ to be @user@example.com@ . For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
steSourceARN :: Lens' SendTemplatedEmail (Maybe Text)
steSourceARN = lens _steSourceARN (\s a -> s {_steSourceARN = a})

-- | The ARN of the template to use when sending this email.
steTemplateARN :: Lens' SendTemplatedEmail (Maybe Text)
steTemplateARN = lens _steTemplateARN (\s a -> s {_steTemplateARN = a})

-- | The name of the configuration set to use when you send an email using @SendTemplatedEmail@ .
steConfigurationSetName :: Lens' SendTemplatedEmail (Maybe Text)
steConfigurationSetName = lens _steConfigurationSetName (\s a -> s {_steConfigurationSetName = a})

-- | The email address that is sending the email. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. For information about verifying identities, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html Amazon SES Developer Guide> . If you are sending on behalf of another user and have been permitted to do so by a sending authorization policy, then you must also specify the @SourceArn@ parameter. For more information about sending authorization, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide> .
steSource :: Lens' SendTemplatedEmail Text
steSource = lens _steSource (\s a -> s {_steSource = a})

-- | The destination for this email, composed of To:, CC:, and BCC: fields. A Destination can include up to 50 recipients across these three fields.
steDestination :: Lens' SendTemplatedEmail Destination
steDestination = lens _steDestination (\s a -> s {_steDestination = a})

-- | The template to use when sending this email.
steTemplate :: Lens' SendTemplatedEmail Text
steTemplate = lens _steTemplate (\s a -> s {_steTemplate = a})

-- | A list of replacement values to apply to the template. This parameter is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.
steTemplateData :: Lens' SendTemplatedEmail Text
steTemplateData = lens _steTemplateData (\s a -> s {_steTemplateData = a})

instance AWSRequest SendTemplatedEmail where
  type
    Rs SendTemplatedEmail =
      SendTemplatedEmailResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "SendTemplatedEmailResult"
      ( \s h x ->
          SendTemplatedEmailResponse'
            <$> (pure (fromEnum s)) <*> (x .@ "MessageId")
      )

instance Hashable SendTemplatedEmail

instance NFData SendTemplatedEmail

instance ToHeaders SendTemplatedEmail where
  toHeaders = const mempty

instance ToPath SendTemplatedEmail where
  toPath = const "/"

instance ToQuery SendTemplatedEmail where
  toQuery SendTemplatedEmail' {..} =
    mconcat
      [ "Action" =: ("SendTemplatedEmail" :: ByteString),
        "Version" =: ("2010-12-01" :: ByteString),
        "ReturnPath" =: _steReturnPath,
        "ReturnPathArn" =: _steReturnPathARN,
        "ReplyToAddresses"
          =: toQuery
            (toQueryList "member" <$> _steReplyToAddresses),
        "Tags"
          =: toQuery (toQueryList "member" <$> _steTags),
        "SourceArn" =: _steSourceARN,
        "TemplateArn" =: _steTemplateARN,
        "ConfigurationSetName" =: _steConfigurationSetName,
        "Source" =: _steSource,
        "Destination" =: _steDestination,
        "Template" =: _steTemplate,
        "TemplateData" =: _steTemplateData
      ]

-- | /See:/ 'sendTemplatedEmailResponse' smart constructor.
data SendTemplatedEmailResponse = SendTemplatedEmailResponse'
  { _sterrsResponseStatus ::
      !Int,
    _sterrsMessageId ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'SendTemplatedEmailResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sterrsResponseStatus' - -- | The response status code.
--
-- * 'sterrsMessageId' - The unique message identifier returned from the @SendTemplatedEmail@ action.
sendTemplatedEmailResponse ::
  -- | 'sterrsResponseStatus'
  Int ->
  -- | 'sterrsMessageId'
  Text ->
  SendTemplatedEmailResponse
sendTemplatedEmailResponse
  pResponseStatus_
  pMessageId_ =
    SendTemplatedEmailResponse'
      { _sterrsResponseStatus =
          pResponseStatus_,
        _sterrsMessageId = pMessageId_
      }

-- | -- | The response status code.
sterrsResponseStatus :: Lens' SendTemplatedEmailResponse Int
sterrsResponseStatus = lens _sterrsResponseStatus (\s a -> s {_sterrsResponseStatus = a})

-- | The unique message identifier returned from the @SendTemplatedEmail@ action.
sterrsMessageId :: Lens' SendTemplatedEmailResponse Text
sterrsMessageId = lens _sterrsMessageId (\s a -> s {_sterrsMessageId = a})

instance NFData SendTemplatedEmailResponse
