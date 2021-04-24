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
-- Module      : Network.AWS.SES.ListCustomVerificationEmailTemplates
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists the existing custom verification email templates for your account in the current AWS Region.
--
--
-- For more information about custom verification email templates, see <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html Using Custom Verification Email Templates> in the /Amazon SES Developer Guide/ .
--
-- You can execute this operation no more than once per second.
--
--
-- This operation returns paginated results.
module Network.AWS.SES.ListCustomVerificationEmailTemplates
  ( -- * Creating a Request
    listCustomVerificationEmailTemplates,
    ListCustomVerificationEmailTemplates,

    -- * Request Lenses
    lcvetNextToken,
    lcvetMaxResults,

    -- * Destructuring the Response
    listCustomVerificationEmailTemplatesResponse,
    ListCustomVerificationEmailTemplatesResponse,

    -- * Response Lenses
    lcvetrrsNextToken,
    lcvetrrsCustomVerificationEmailTemplates,
    lcvetrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to list the existing custom verification email templates for your account.
--
--
-- For more information about custom verification email templates, see <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html Using Custom Verification Email Templates> in the /Amazon SES Developer Guide/ .
--
--
-- /See:/ 'listCustomVerificationEmailTemplates' smart constructor.
data ListCustomVerificationEmailTemplates = ListCustomVerificationEmailTemplates'
  { _lcvetNextToken ::
      !( Maybe
           Text
       ),
    _lcvetMaxResults ::
      !( Maybe
           Nat
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ListCustomVerificationEmailTemplates' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcvetNextToken' - An array the contains the name and creation time stamp for each template in your Amazon SES account.
--
-- * 'lcvetMaxResults' - The maximum number of custom verification email templates to return. This value must be at least 1 and less than or equal to 50. If you do not specify a value, or if you specify a value less than 1 or greater than 50, the operation will return up to 50 results.
listCustomVerificationEmailTemplates ::
  ListCustomVerificationEmailTemplates
listCustomVerificationEmailTemplates =
  ListCustomVerificationEmailTemplates'
    { _lcvetNextToken =
        Nothing,
      _lcvetMaxResults = Nothing
    }

-- | An array the contains the name and creation time stamp for each template in your Amazon SES account.
lcvetNextToken :: Lens' ListCustomVerificationEmailTemplates (Maybe Text)
lcvetNextToken = lens _lcvetNextToken (\s a -> s {_lcvetNextToken = a})

-- | The maximum number of custom verification email templates to return. This value must be at least 1 and less than or equal to 50. If you do not specify a value, or if you specify a value less than 1 or greater than 50, the operation will return up to 50 results.
lcvetMaxResults :: Lens' ListCustomVerificationEmailTemplates (Maybe Natural)
lcvetMaxResults = lens _lcvetMaxResults (\s a -> s {_lcvetMaxResults = a}) . mapping _Nat

instance
  AWSPager
    ListCustomVerificationEmailTemplates
  where
  page rq rs
    | stop (rs ^. lcvetrrsNextToken) = Nothing
    | stop
        (rs ^. lcvetrrsCustomVerificationEmailTemplates) =
      Nothing
    | otherwise =
      Just $ rq & lcvetNextToken .~ rs ^. lcvetrrsNextToken

instance
  AWSRequest
    ListCustomVerificationEmailTemplates
  where
  type
    Rs ListCustomVerificationEmailTemplates =
      ListCustomVerificationEmailTemplatesResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "ListCustomVerificationEmailTemplatesResult"
      ( \s h x ->
          ListCustomVerificationEmailTemplatesResponse'
            <$> (x .@? "NextToken")
            <*> ( x .@? "CustomVerificationEmailTemplates" .!@ mempty
                    >>= may (parseXMLList "member")
                )
            <*> (pure (fromEnum s))
      )

instance
  Hashable
    ListCustomVerificationEmailTemplates

instance NFData ListCustomVerificationEmailTemplates

instance
  ToHeaders
    ListCustomVerificationEmailTemplates
  where
  toHeaders = const mempty

instance ToPath ListCustomVerificationEmailTemplates where
  toPath = const "/"

instance ToQuery ListCustomVerificationEmailTemplates where
  toQuery ListCustomVerificationEmailTemplates' {..} =
    mconcat
      [ "Action"
          =: ( "ListCustomVerificationEmailTemplates" ::
                 ByteString
             ),
        "Version" =: ("2010-12-01" :: ByteString),
        "NextToken" =: _lcvetNextToken,
        "MaxResults" =: _lcvetMaxResults
      ]

-- | A paginated list of custom verification email templates.
--
--
--
-- /See:/ 'listCustomVerificationEmailTemplatesResponse' smart constructor.
data ListCustomVerificationEmailTemplatesResponse = ListCustomVerificationEmailTemplatesResponse'
  { _lcvetrrsNextToken ::
      !( Maybe
           Text
       ),
    _lcvetrrsCustomVerificationEmailTemplates ::
      !( Maybe
           [CustomVerificationEmailTemplate]
       ),
    _lcvetrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ListCustomVerificationEmailTemplatesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lcvetrrsNextToken' - A token indicating that there are additional custom verification email templates available to be listed. Pass this token to a subsequent call to @ListTemplates@ to retrieve the next 50 custom verification email templates.
--
-- * 'lcvetrrsCustomVerificationEmailTemplates' - A list of the custom verification email templates that exist in your account.
--
-- * 'lcvetrrsResponseStatus' - -- | The response status code.
listCustomVerificationEmailTemplatesResponse ::
  -- | 'lcvetrrsResponseStatus'
  Int ->
  ListCustomVerificationEmailTemplatesResponse
listCustomVerificationEmailTemplatesResponse
  pResponseStatus_ =
    ListCustomVerificationEmailTemplatesResponse'
      { _lcvetrrsNextToken =
          Nothing,
        _lcvetrrsCustomVerificationEmailTemplates =
          Nothing,
        _lcvetrrsResponseStatus =
          pResponseStatus_
      }

-- | A token indicating that there are additional custom verification email templates available to be listed. Pass this token to a subsequent call to @ListTemplates@ to retrieve the next 50 custom verification email templates.
lcvetrrsNextToken :: Lens' ListCustomVerificationEmailTemplatesResponse (Maybe Text)
lcvetrrsNextToken = lens _lcvetrrsNextToken (\s a -> s {_lcvetrrsNextToken = a})

-- | A list of the custom verification email templates that exist in your account.
lcvetrrsCustomVerificationEmailTemplates :: Lens' ListCustomVerificationEmailTemplatesResponse [CustomVerificationEmailTemplate]
lcvetrrsCustomVerificationEmailTemplates = lens _lcvetrrsCustomVerificationEmailTemplates (\s a -> s {_lcvetrrsCustomVerificationEmailTemplates = a}) . _Default . _Coerce

-- | -- | The response status code.
lcvetrrsResponseStatus :: Lens' ListCustomVerificationEmailTemplatesResponse Int
lcvetrrsResponseStatus = lens _lcvetrrsResponseStatus (\s a -> s {_lcvetrrsResponseStatus = a})

instance
  NFData
    ListCustomVerificationEmailTemplatesResponse
