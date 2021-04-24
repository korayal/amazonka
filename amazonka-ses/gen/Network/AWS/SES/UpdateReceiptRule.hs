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
-- Module      : Network.AWS.SES.UpdateReceiptRule
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates a receipt rule.
--
--
-- For information about managing receipt rules, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html Amazon SES Developer Guide> .
--
-- You can execute this operation no more than once per second.
module Network.AWS.SES.UpdateReceiptRule
  ( -- * Creating a Request
    updateReceiptRule,
    UpdateReceiptRule,

    -- * Request Lenses
    urrRuleSetName,
    urrRule,

    -- * Destructuring the Response
    updateReceiptRuleResponse,
    UpdateReceiptRuleResponse,

    -- * Response Lenses
    urrrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to update a receipt rule. You use receipt rules to receive email with Amazon SES. For more information, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html Amazon SES Developer Guide> .
--
--
--
-- /See:/ 'updateReceiptRule' smart constructor.
data UpdateReceiptRule = UpdateReceiptRule'
  { _urrRuleSetName ::
      !Text,
    _urrRule :: !ReceiptRule
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateReceiptRule' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'urrRuleSetName' - The name of the receipt rule set that the receipt rule belongs to.
--
-- * 'urrRule' - A data structure that contains the updated receipt rule information.
updateReceiptRule ::
  -- | 'urrRuleSetName'
  Text ->
  -- | 'urrRule'
  ReceiptRule ->
  UpdateReceiptRule
updateReceiptRule pRuleSetName_ pRule_ =
  UpdateReceiptRule'
    { _urrRuleSetName = pRuleSetName_,
      _urrRule = pRule_
    }

-- | The name of the receipt rule set that the receipt rule belongs to.
urrRuleSetName :: Lens' UpdateReceiptRule Text
urrRuleSetName = lens _urrRuleSetName (\s a -> s {_urrRuleSetName = a})

-- | A data structure that contains the updated receipt rule information.
urrRule :: Lens' UpdateReceiptRule ReceiptRule
urrRule = lens _urrRule (\s a -> s {_urrRule = a})

instance AWSRequest UpdateReceiptRule where
  type Rs UpdateReceiptRule = UpdateReceiptRuleResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "UpdateReceiptRuleResult"
      ( \s h x ->
          UpdateReceiptRuleResponse' <$> (pure (fromEnum s))
      )

instance Hashable UpdateReceiptRule

instance NFData UpdateReceiptRule

instance ToHeaders UpdateReceiptRule where
  toHeaders = const mempty

instance ToPath UpdateReceiptRule where
  toPath = const "/"

instance ToQuery UpdateReceiptRule where
  toQuery UpdateReceiptRule' {..} =
    mconcat
      [ "Action" =: ("UpdateReceiptRule" :: ByteString),
        "Version" =: ("2010-12-01" :: ByteString),
        "RuleSetName" =: _urrRuleSetName,
        "Rule" =: _urrRule
      ]

-- | An empty element returned on a successful request.
--
--
--
-- /See:/ 'updateReceiptRuleResponse' smart constructor.
newtype UpdateReceiptRuleResponse = UpdateReceiptRuleResponse'
  { _urrrrsResponseStatus ::
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

-- | Creates a value of 'UpdateReceiptRuleResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'urrrrsResponseStatus' - -- | The response status code.
updateReceiptRuleResponse ::
  -- | 'urrrrsResponseStatus'
  Int ->
  UpdateReceiptRuleResponse
updateReceiptRuleResponse pResponseStatus_ =
  UpdateReceiptRuleResponse'
    { _urrrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
urrrrsResponseStatus :: Lens' UpdateReceiptRuleResponse Int
urrrrsResponseStatus = lens _urrrrsResponseStatus (\s a -> s {_urrrrsResponseStatus = a})

instance NFData UpdateReceiptRuleResponse
