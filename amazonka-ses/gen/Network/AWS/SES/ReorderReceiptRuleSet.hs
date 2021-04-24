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
-- Module      : Network.AWS.SES.ReorderReceiptRuleSet
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Reorders the receipt rules within a receipt rule set.
--
--
-- For information about managing receipt rule sets, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html Amazon SES Developer Guide> .
--
-- You can execute this operation no more than once per second.
module Network.AWS.SES.ReorderReceiptRuleSet
  ( -- * Creating a Request
    reorderReceiptRuleSet,
    ReorderReceiptRuleSet,

    -- * Request Lenses
    rrrsRuleSetName,
    rrrsRuleNames,

    -- * Destructuring the Response
    reorderReceiptRuleSetResponse,
    ReorderReceiptRuleSetResponse,

    -- * Response Lenses
    rrrsrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to reorder the receipt rules within a receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html Amazon SES Developer Guide> .
--
--
--
-- /See:/ 'reorderReceiptRuleSet' smart constructor.
data ReorderReceiptRuleSet = ReorderReceiptRuleSet'
  { _rrrsRuleSetName ::
      !Text,
    _rrrsRuleNames :: ![Text]
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ReorderReceiptRuleSet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rrrsRuleSetName' - The name of the receipt rule set to reorder.
--
-- * 'rrrsRuleNames' - A list of the specified receipt rule set's receipt rules in the order that you want to put them.
reorderReceiptRuleSet ::
  -- | 'rrrsRuleSetName'
  Text ->
  ReorderReceiptRuleSet
reorderReceiptRuleSet pRuleSetName_ =
  ReorderReceiptRuleSet'
    { _rrrsRuleSetName =
        pRuleSetName_,
      _rrrsRuleNames = mempty
    }

-- | The name of the receipt rule set to reorder.
rrrsRuleSetName :: Lens' ReorderReceiptRuleSet Text
rrrsRuleSetName = lens _rrrsRuleSetName (\s a -> s {_rrrsRuleSetName = a})

-- | A list of the specified receipt rule set's receipt rules in the order that you want to put them.
rrrsRuleNames :: Lens' ReorderReceiptRuleSet [Text]
rrrsRuleNames = lens _rrrsRuleNames (\s a -> s {_rrrsRuleNames = a}) . _Coerce

instance AWSRequest ReorderReceiptRuleSet where
  type
    Rs ReorderReceiptRuleSet =
      ReorderReceiptRuleSetResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "ReorderReceiptRuleSetResult"
      ( \s h x ->
          ReorderReceiptRuleSetResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable ReorderReceiptRuleSet

instance NFData ReorderReceiptRuleSet

instance ToHeaders ReorderReceiptRuleSet where
  toHeaders = const mempty

instance ToPath ReorderReceiptRuleSet where
  toPath = const "/"

instance ToQuery ReorderReceiptRuleSet where
  toQuery ReorderReceiptRuleSet' {..} =
    mconcat
      [ "Action" =: ("ReorderReceiptRuleSet" :: ByteString),
        "Version" =: ("2010-12-01" :: ByteString),
        "RuleSetName" =: _rrrsRuleSetName,
        "RuleNames" =: toQueryList "member" _rrrsRuleNames
      ]

-- | An empty element returned on a successful request.
--
--
--
-- /See:/ 'reorderReceiptRuleSetResponse' smart constructor.
newtype ReorderReceiptRuleSetResponse = ReorderReceiptRuleSetResponse'
  { _rrrsrrsResponseStatus ::
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

-- | Creates a value of 'ReorderReceiptRuleSetResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rrrsrrsResponseStatus' - -- | The response status code.
reorderReceiptRuleSetResponse ::
  -- | 'rrrsrrsResponseStatus'
  Int ->
  ReorderReceiptRuleSetResponse
reorderReceiptRuleSetResponse pResponseStatus_ =
  ReorderReceiptRuleSetResponse'
    { _rrrsrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
rrrsrrsResponseStatus :: Lens' ReorderReceiptRuleSetResponse Int
rrrsrrsResponseStatus = lens _rrrsrrsResponseStatus (\s a -> s {_rrrsrrsResponseStatus = a})

instance NFData ReorderReceiptRuleSetResponse
