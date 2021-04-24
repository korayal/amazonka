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
-- Module      : Network.AWS.CodeCommit.CreateUnreferencedMergeCommit
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an unreferenced commit that represents the result of merging two branches using a specified merge strategy. This can help you determine the outcome of a potential merge. This API cannot be used with the fast-forward merge strategy because that strategy does not create a merge commit.
module Network.AWS.CodeCommit.CreateUnreferencedMergeCommit
  ( -- * Creating a Request
    createUnreferencedMergeCommit,
    CreateUnreferencedMergeCommit,

    -- * Request Lenses
    cumcCommitMessage,
    cumcAuthorName,
    cumcEmail,
    cumcConflictDetailLevel,
    cumcConflictResolutionStrategy,
    cumcKeepEmptyFolders,
    cumcConflictResolution,
    cumcRepositoryName,
    cumcSourceCommitSpecifier,
    cumcDestinationCommitSpecifier,
    cumcMergeOption,

    -- * Destructuring the Response
    createUnreferencedMergeCommitResponse,
    CreateUnreferencedMergeCommitResponse,

    -- * Response Lenses
    cumcrrsCommitId,
    cumcrrsTreeId,
    cumcrrsResponseStatus,
  )
where

import Network.AWS.CodeCommit.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createUnreferencedMergeCommit' smart constructor.
data CreateUnreferencedMergeCommit = CreateUnreferencedMergeCommit'
  { _cumcCommitMessage ::
      !( Maybe
           Text
       ),
    _cumcAuthorName ::
      !( Maybe
           Text
       ),
    _cumcEmail ::
      !( Maybe
           Text
       ),
    _cumcConflictDetailLevel ::
      !( Maybe
           ConflictDetailLevelTypeEnum
       ),
    _cumcConflictResolutionStrategy ::
      !( Maybe
           ConflictResolutionStrategyTypeEnum
       ),
    _cumcKeepEmptyFolders ::
      !( Maybe
           Bool
       ),
    _cumcConflictResolution ::
      !( Maybe
           ConflictResolution
       ),
    _cumcRepositoryName ::
      !Text,
    _cumcSourceCommitSpecifier ::
      !Text,
    _cumcDestinationCommitSpecifier ::
      !Text,
    _cumcMergeOption ::
      !MergeOptionTypeEnum
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateUnreferencedMergeCommit' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cumcCommitMessage' - The commit message for the unreferenced commit.
--
-- * 'cumcAuthorName' - The name of the author who created the unreferenced commit. This information is used as both the author and committer for the commit.
--
-- * 'cumcEmail' - The email address for the person who created the unreferenced commit.
--
-- * 'cumcConflictDetailLevel' - The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.
--
-- * 'cumcConflictResolutionStrategy' - Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.
--
-- * 'cumcKeepEmptyFolders' - If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The default is false.
--
-- * 'cumcConflictResolution' - If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.
--
-- * 'cumcRepositoryName' - The name of the repository where you want to create the unreferenced merge commit.
--
-- * 'cumcSourceCommitSpecifier' - The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).
--
-- * 'cumcDestinationCommitSpecifier' - The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).
--
-- * 'cumcMergeOption' - The merge option or strategy you want to use to merge the code.
createUnreferencedMergeCommit ::
  -- | 'cumcRepositoryName'
  Text ->
  -- | 'cumcSourceCommitSpecifier'
  Text ->
  -- | 'cumcDestinationCommitSpecifier'
  Text ->
  -- | 'cumcMergeOption'
  MergeOptionTypeEnum ->
  CreateUnreferencedMergeCommit
createUnreferencedMergeCommit
  pRepositoryName_
  pSourceCommitSpecifier_
  pDestinationCommitSpecifier_
  pMergeOption_ =
    CreateUnreferencedMergeCommit'
      { _cumcCommitMessage =
          Nothing,
        _cumcAuthorName = Nothing,
        _cumcEmail = Nothing,
        _cumcConflictDetailLevel = Nothing,
        _cumcConflictResolutionStrategy = Nothing,
        _cumcKeepEmptyFolders = Nothing,
        _cumcConflictResolution = Nothing,
        _cumcRepositoryName = pRepositoryName_,
        _cumcSourceCommitSpecifier =
          pSourceCommitSpecifier_,
        _cumcDestinationCommitSpecifier =
          pDestinationCommitSpecifier_,
        _cumcMergeOption = pMergeOption_
      }

-- | The commit message for the unreferenced commit.
cumcCommitMessage :: Lens' CreateUnreferencedMergeCommit (Maybe Text)
cumcCommitMessage = lens _cumcCommitMessage (\s a -> s {_cumcCommitMessage = a})

-- | The name of the author who created the unreferenced commit. This information is used as both the author and committer for the commit.
cumcAuthorName :: Lens' CreateUnreferencedMergeCommit (Maybe Text)
cumcAuthorName = lens _cumcAuthorName (\s a -> s {_cumcAuthorName = a})

-- | The email address for the person who created the unreferenced commit.
cumcEmail :: Lens' CreateUnreferencedMergeCommit (Maybe Text)
cumcEmail = lens _cumcEmail (\s a -> s {_cumcEmail = a})

-- | The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.
cumcConflictDetailLevel :: Lens' CreateUnreferencedMergeCommit (Maybe ConflictDetailLevelTypeEnum)
cumcConflictDetailLevel = lens _cumcConflictDetailLevel (\s a -> s {_cumcConflictDetailLevel = a})

-- | Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.
cumcConflictResolutionStrategy :: Lens' CreateUnreferencedMergeCommit (Maybe ConflictResolutionStrategyTypeEnum)
cumcConflictResolutionStrategy = lens _cumcConflictResolutionStrategy (\s a -> s {_cumcConflictResolutionStrategy = a})

-- | If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The default is false.
cumcKeepEmptyFolders :: Lens' CreateUnreferencedMergeCommit (Maybe Bool)
cumcKeepEmptyFolders = lens _cumcKeepEmptyFolders (\s a -> s {_cumcKeepEmptyFolders = a})

-- | If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.
cumcConflictResolution :: Lens' CreateUnreferencedMergeCommit (Maybe ConflictResolution)
cumcConflictResolution = lens _cumcConflictResolution (\s a -> s {_cumcConflictResolution = a})

-- | The name of the repository where you want to create the unreferenced merge commit.
cumcRepositoryName :: Lens' CreateUnreferencedMergeCommit Text
cumcRepositoryName = lens _cumcRepositoryName (\s a -> s {_cumcRepositoryName = a})

-- | The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).
cumcSourceCommitSpecifier :: Lens' CreateUnreferencedMergeCommit Text
cumcSourceCommitSpecifier = lens _cumcSourceCommitSpecifier (\s a -> s {_cumcSourceCommitSpecifier = a})

-- | The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).
cumcDestinationCommitSpecifier :: Lens' CreateUnreferencedMergeCommit Text
cumcDestinationCommitSpecifier = lens _cumcDestinationCommitSpecifier (\s a -> s {_cumcDestinationCommitSpecifier = a})

-- | The merge option or strategy you want to use to merge the code.
cumcMergeOption :: Lens' CreateUnreferencedMergeCommit MergeOptionTypeEnum
cumcMergeOption = lens _cumcMergeOption (\s a -> s {_cumcMergeOption = a})

instance AWSRequest CreateUnreferencedMergeCommit where
  type
    Rs CreateUnreferencedMergeCommit =
      CreateUnreferencedMergeCommitResponse
  request = postJSON codeCommit
  response =
    receiveJSON
      ( \s h x ->
          CreateUnreferencedMergeCommitResponse'
            <$> (x .?> "commitId")
            <*> (x .?> "treeId")
            <*> (pure (fromEnum s))
      )

instance Hashable CreateUnreferencedMergeCommit

instance NFData CreateUnreferencedMergeCommit

instance ToHeaders CreateUnreferencedMergeCommit where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "CodeCommit_20150413.CreateUnreferencedMergeCommit" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateUnreferencedMergeCommit where
  toJSON CreateUnreferencedMergeCommit' {..} =
    object
      ( catMaybes
          [ ("commitMessage" .=) <$> _cumcCommitMessage,
            ("authorName" .=) <$> _cumcAuthorName,
            ("email" .=) <$> _cumcEmail,
            ("conflictDetailLevel" .=)
              <$> _cumcConflictDetailLevel,
            ("conflictResolutionStrategy" .=)
              <$> _cumcConflictResolutionStrategy,
            ("keepEmptyFolders" .=) <$> _cumcKeepEmptyFolders,
            ("conflictResolution" .=)
              <$> _cumcConflictResolution,
            Just ("repositoryName" .= _cumcRepositoryName),
            Just
              ( "sourceCommitSpecifier"
                  .= _cumcSourceCommitSpecifier
              ),
            Just
              ( "destinationCommitSpecifier"
                  .= _cumcDestinationCommitSpecifier
              ),
            Just ("mergeOption" .= _cumcMergeOption)
          ]
      )

instance ToPath CreateUnreferencedMergeCommit where
  toPath = const "/"

instance ToQuery CreateUnreferencedMergeCommit where
  toQuery = const mempty

-- | /See:/ 'createUnreferencedMergeCommitResponse' smart constructor.
data CreateUnreferencedMergeCommitResponse = CreateUnreferencedMergeCommitResponse'
  { _cumcrrsCommitId ::
      !( Maybe
           Text
       ),
    _cumcrrsTreeId ::
      !( Maybe
           Text
       ),
    _cumcrrsResponseStatus ::
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

-- | Creates a value of 'CreateUnreferencedMergeCommitResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cumcrrsCommitId' - The full commit ID of the commit that contains your merge results.
--
-- * 'cumcrrsTreeId' - The full SHA-1 pointer of the tree information for the commit that contains the merge results.
--
-- * 'cumcrrsResponseStatus' - -- | The response status code.
createUnreferencedMergeCommitResponse ::
  -- | 'cumcrrsResponseStatus'
  Int ->
  CreateUnreferencedMergeCommitResponse
createUnreferencedMergeCommitResponse
  pResponseStatus_ =
    CreateUnreferencedMergeCommitResponse'
      { _cumcrrsCommitId =
          Nothing,
        _cumcrrsTreeId = Nothing,
        _cumcrrsResponseStatus =
          pResponseStatus_
      }

-- | The full commit ID of the commit that contains your merge results.
cumcrrsCommitId :: Lens' CreateUnreferencedMergeCommitResponse (Maybe Text)
cumcrrsCommitId = lens _cumcrrsCommitId (\s a -> s {_cumcrrsCommitId = a})

-- | The full SHA-1 pointer of the tree information for the commit that contains the merge results.
cumcrrsTreeId :: Lens' CreateUnreferencedMergeCommitResponse (Maybe Text)
cumcrrsTreeId = lens _cumcrrsTreeId (\s a -> s {_cumcrrsTreeId = a})

-- | -- | The response status code.
cumcrrsResponseStatus :: Lens' CreateUnreferencedMergeCommitResponse Int
cumcrrsResponseStatus = lens _cumcrrsResponseStatus (\s a -> s {_cumcrrsResponseStatus = a})

instance NFData CreateUnreferencedMergeCommitResponse
