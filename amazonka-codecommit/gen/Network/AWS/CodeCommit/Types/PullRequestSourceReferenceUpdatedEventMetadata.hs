{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CodeCommit.Types.PullRequestSourceReferenceUpdatedEventMetadata
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CodeCommit.Types.PullRequestSourceReferenceUpdatedEventMetadata where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information about an update to the source branch of a pull request.
--
--
--
-- /See:/ 'pullRequestSourceReferenceUpdatedEventMetadata' smart constructor.
data PullRequestSourceReferenceUpdatedEventMetadata = PullRequestSourceReferenceUpdatedEventMetadata'
  { _prsruemRepositoryName ::
      !( Maybe
           Text
       ),
    _prsruemBeforeCommitId ::
      !( Maybe
           Text
       ),
    _prsruemAfterCommitId ::
      !( Maybe
           Text
       ),
    _prsruemMergeBase ::
      !( Maybe
           Text
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

-- | Creates a value of 'PullRequestSourceReferenceUpdatedEventMetadata' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prsruemRepositoryName' - The name of the repository where the pull request was updated.
--
-- * 'prsruemBeforeCommitId' - The full commit ID of the commit in the destination branch that was the tip of the branch at the time the pull request was updated.
--
-- * 'prsruemAfterCommitId' - The full commit ID of the commit in the source branch that was the tip of the branch at the time the pull request was updated.
--
-- * 'prsruemMergeBase' - The commit ID of the most recent commit that the source branch and the destination branch have in common.
pullRequestSourceReferenceUpdatedEventMetadata ::
  PullRequestSourceReferenceUpdatedEventMetadata
pullRequestSourceReferenceUpdatedEventMetadata =
  PullRequestSourceReferenceUpdatedEventMetadata'
    { _prsruemRepositoryName =
        Nothing,
      _prsruemBeforeCommitId =
        Nothing,
      _prsruemAfterCommitId =
        Nothing,
      _prsruemMergeBase = Nothing
    }

-- | The name of the repository where the pull request was updated.
prsruemRepositoryName :: Lens' PullRequestSourceReferenceUpdatedEventMetadata (Maybe Text)
prsruemRepositoryName = lens _prsruemRepositoryName (\s a -> s {_prsruemRepositoryName = a})

-- | The full commit ID of the commit in the destination branch that was the tip of the branch at the time the pull request was updated.
prsruemBeforeCommitId :: Lens' PullRequestSourceReferenceUpdatedEventMetadata (Maybe Text)
prsruemBeforeCommitId = lens _prsruemBeforeCommitId (\s a -> s {_prsruemBeforeCommitId = a})

-- | The full commit ID of the commit in the source branch that was the tip of the branch at the time the pull request was updated.
prsruemAfterCommitId :: Lens' PullRequestSourceReferenceUpdatedEventMetadata (Maybe Text)
prsruemAfterCommitId = lens _prsruemAfterCommitId (\s a -> s {_prsruemAfterCommitId = a})

-- | The commit ID of the most recent commit that the source branch and the destination branch have in common.
prsruemMergeBase :: Lens' PullRequestSourceReferenceUpdatedEventMetadata (Maybe Text)
prsruemMergeBase = lens _prsruemMergeBase (\s a -> s {_prsruemMergeBase = a})

instance
  FromJSON
    PullRequestSourceReferenceUpdatedEventMetadata
  where
  parseJSON =
    withObject
      "PullRequestSourceReferenceUpdatedEventMetadata"
      ( \x ->
          PullRequestSourceReferenceUpdatedEventMetadata'
            <$> (x .:? "repositoryName")
            <*> (x .:? "beforeCommitId")
            <*> (x .:? "afterCommitId")
            <*> (x .:? "mergeBase")
      )

instance
  Hashable
    PullRequestSourceReferenceUpdatedEventMetadata

instance
  NFData
    PullRequestSourceReferenceUpdatedEventMetadata
