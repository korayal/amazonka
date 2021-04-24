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
-- Module      : Network.AWS.CodeCommit.DeleteCommentContent
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the content of a comment made on a change, file, or commit in a repository.
module Network.AWS.CodeCommit.DeleteCommentContent
  ( -- * Creating a Request
    deleteCommentContent,
    DeleteCommentContent,

    -- * Request Lenses
    dccCommentId,

    -- * Destructuring the Response
    deleteCommentContentResponse,
    DeleteCommentContentResponse,

    -- * Response Lenses
    dccrrsComment,
    dccrrsResponseStatus,
  )
where

import Network.AWS.CodeCommit.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteCommentContent' smart constructor.
newtype DeleteCommentContent = DeleteCommentContent'
  { _dccCommentId ::
      Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeleteCommentContent' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dccCommentId' - The unique, system-generated ID of the comment. To get this ID, use 'GetCommentsForComparedCommit' or 'GetCommentsForPullRequest' .
deleteCommentContent ::
  -- | 'dccCommentId'
  Text ->
  DeleteCommentContent
deleteCommentContent pCommentId_ =
  DeleteCommentContent' {_dccCommentId = pCommentId_}

-- | The unique, system-generated ID of the comment. To get this ID, use 'GetCommentsForComparedCommit' or 'GetCommentsForPullRequest' .
dccCommentId :: Lens' DeleteCommentContent Text
dccCommentId = lens _dccCommentId (\s a -> s {_dccCommentId = a})

instance AWSRequest DeleteCommentContent where
  type
    Rs DeleteCommentContent =
      DeleteCommentContentResponse
  request = postJSON codeCommit
  response =
    receiveJSON
      ( \s h x ->
          DeleteCommentContentResponse'
            <$> (x .?> "comment") <*> (pure (fromEnum s))
      )

instance Hashable DeleteCommentContent

instance NFData DeleteCommentContent

instance ToHeaders DeleteCommentContent where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "CodeCommit_20150413.DeleteCommentContent" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteCommentContent where
  toJSON DeleteCommentContent' {..} =
    object
      (catMaybes [Just ("commentId" .= _dccCommentId)])

instance ToPath DeleteCommentContent where
  toPath = const "/"

instance ToQuery DeleteCommentContent where
  toQuery = const mempty

-- | /See:/ 'deleteCommentContentResponse' smart constructor.
data DeleteCommentContentResponse = DeleteCommentContentResponse'
  { _dccrrsComment ::
      !( Maybe
           Comment
       ),
    _dccrrsResponseStatus ::
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

-- | Creates a value of 'DeleteCommentContentResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dccrrsComment' - Information about the comment you just deleted.
--
-- * 'dccrrsResponseStatus' - -- | The response status code.
deleteCommentContentResponse ::
  -- | 'dccrrsResponseStatus'
  Int ->
  DeleteCommentContentResponse
deleteCommentContentResponse pResponseStatus_ =
  DeleteCommentContentResponse'
    { _dccrrsComment =
        Nothing,
      _dccrrsResponseStatus = pResponseStatus_
    }

-- | Information about the comment you just deleted.
dccrrsComment :: Lens' DeleteCommentContentResponse (Maybe Comment)
dccrrsComment = lens _dccrrsComment (\s a -> s {_dccrrsComment = a})

-- | -- | The response status code.
dccrrsResponseStatus :: Lens' DeleteCommentContentResponse Int
dccrrsResponseStatus = lens _dccrrsResponseStatus (\s a -> s {_dccrrsResponseStatus = a})

instance NFData DeleteCommentContentResponse
