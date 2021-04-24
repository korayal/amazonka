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
-- Module      : Network.AWS.CodeCommit.UpdatePullRequestTitle
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Replaces the title of a pull request.
module Network.AWS.CodeCommit.UpdatePullRequestTitle
  ( -- * Creating a Request
    updatePullRequestTitle,
    UpdatePullRequestTitle,

    -- * Request Lenses
    uprtPullRequestId,
    uprtTitle,

    -- * Destructuring the Response
    updatePullRequestTitleResponse,
    UpdatePullRequestTitleResponse,

    -- * Response Lenses
    uprtrrsResponseStatus,
    uprtrrsPullRequest,
  )
where

import Network.AWS.CodeCommit.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updatePullRequestTitle' smart constructor.
data UpdatePullRequestTitle = UpdatePullRequestTitle'
  { _uprtPullRequestId ::
      !Text,
    _uprtTitle :: !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'UpdatePullRequestTitle' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uprtPullRequestId' - The system-generated ID of the pull request. To get this ID, use 'ListPullRequests' .
--
-- * 'uprtTitle' - The updated title of the pull request. This replaces the existing title.
updatePullRequestTitle ::
  -- | 'uprtPullRequestId'
  Text ->
  -- | 'uprtTitle'
  Text ->
  UpdatePullRequestTitle
updatePullRequestTitle pPullRequestId_ pTitle_ =
  UpdatePullRequestTitle'
    { _uprtPullRequestId =
        pPullRequestId_,
      _uprtTitle = pTitle_
    }

-- | The system-generated ID of the pull request. To get this ID, use 'ListPullRequests' .
uprtPullRequestId :: Lens' UpdatePullRequestTitle Text
uprtPullRequestId = lens _uprtPullRequestId (\s a -> s {_uprtPullRequestId = a})

-- | The updated title of the pull request. This replaces the existing title.
uprtTitle :: Lens' UpdatePullRequestTitle Text
uprtTitle = lens _uprtTitle (\s a -> s {_uprtTitle = a})

instance AWSRequest UpdatePullRequestTitle where
  type
    Rs UpdatePullRequestTitle =
      UpdatePullRequestTitleResponse
  request = postJSON codeCommit
  response =
    receiveJSON
      ( \s h x ->
          UpdatePullRequestTitleResponse'
            <$> (pure (fromEnum s)) <*> (x .:> "pullRequest")
      )

instance Hashable UpdatePullRequestTitle

instance NFData UpdatePullRequestTitle

instance ToHeaders UpdatePullRequestTitle where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "CodeCommit_20150413.UpdatePullRequestTitle" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON UpdatePullRequestTitle where
  toJSON UpdatePullRequestTitle' {..} =
    object
      ( catMaybes
          [ Just ("pullRequestId" .= _uprtPullRequestId),
            Just ("title" .= _uprtTitle)
          ]
      )

instance ToPath UpdatePullRequestTitle where
  toPath = const "/"

instance ToQuery UpdatePullRequestTitle where
  toQuery = const mempty

-- | /See:/ 'updatePullRequestTitleResponse' smart constructor.
data UpdatePullRequestTitleResponse = UpdatePullRequestTitleResponse'
  { _uprtrrsResponseStatus ::
      !Int,
    _uprtrrsPullRequest ::
      !PullRequest
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'UpdatePullRequestTitleResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uprtrrsResponseStatus' - -- | The response status code.
--
-- * 'uprtrrsPullRequest' - Information about the updated pull request.
updatePullRequestTitleResponse ::
  -- | 'uprtrrsResponseStatus'
  Int ->
  -- | 'uprtrrsPullRequest'
  PullRequest ->
  UpdatePullRequestTitleResponse
updatePullRequestTitleResponse
  pResponseStatus_
  pPullRequest_ =
    UpdatePullRequestTitleResponse'
      { _uprtrrsResponseStatus =
          pResponseStatus_,
        _uprtrrsPullRequest = pPullRequest_
      }

-- | -- | The response status code.
uprtrrsResponseStatus :: Lens' UpdatePullRequestTitleResponse Int
uprtrrsResponseStatus = lens _uprtrrsResponseStatus (\s a -> s {_uprtrrsResponseStatus = a})

-- | Information about the updated pull request.
uprtrrsPullRequest :: Lens' UpdatePullRequestTitleResponse PullRequest
uprtrrsPullRequest = lens _uprtrrsPullRequest (\s a -> s {_uprtrrsPullRequest = a})

instance NFData UpdatePullRequestTitleResponse
