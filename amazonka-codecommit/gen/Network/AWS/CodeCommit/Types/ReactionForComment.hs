{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CodeCommit.Types.ReactionForComment
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CodeCommit.Types.ReactionForComment where

import Network.AWS.CodeCommit.Types.ReactionValueFormats
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information about the reaction values provided by users on a comment.
--
--
--
-- /See:/ 'reactionForComment' smart constructor.
data ReactionForComment = ReactionForComment'
  { _rfcReaction ::
      !(Maybe ReactionValueFormats),
    _rfcReactionUsers ::
      !(Maybe [Text]),
    _rfcReactionsFromDeletedUsersCount ::
      !(Maybe Int)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ReactionForComment' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rfcReaction' - The reaction for a specified comment.
--
-- * 'rfcReactionUsers' - The Amazon Resource Names (ARNs) of users who have provided reactions to the comment.
--
-- * 'rfcReactionsFromDeletedUsersCount' - A numerical count of users who reacted with the specified emoji whose identities have been subsequently deleted from IAM. While these IAM users or roles no longer exist, the reactions might still appear in total reaction counts.
reactionForComment ::
  ReactionForComment
reactionForComment =
  ReactionForComment'
    { _rfcReaction = Nothing,
      _rfcReactionUsers = Nothing,
      _rfcReactionsFromDeletedUsersCount = Nothing
    }

-- | The reaction for a specified comment.
rfcReaction :: Lens' ReactionForComment (Maybe ReactionValueFormats)
rfcReaction = lens _rfcReaction (\s a -> s {_rfcReaction = a})

-- | The Amazon Resource Names (ARNs) of users who have provided reactions to the comment.
rfcReactionUsers :: Lens' ReactionForComment [Text]
rfcReactionUsers = lens _rfcReactionUsers (\s a -> s {_rfcReactionUsers = a}) . _Default . _Coerce

-- | A numerical count of users who reacted with the specified emoji whose identities have been subsequently deleted from IAM. While these IAM users or roles no longer exist, the reactions might still appear in total reaction counts.
rfcReactionsFromDeletedUsersCount :: Lens' ReactionForComment (Maybe Int)
rfcReactionsFromDeletedUsersCount = lens _rfcReactionsFromDeletedUsersCount (\s a -> s {_rfcReactionsFromDeletedUsersCount = a})

instance FromJSON ReactionForComment where
  parseJSON =
    withObject
      "ReactionForComment"
      ( \x ->
          ReactionForComment'
            <$> (x .:? "reaction")
            <*> (x .:? "reactionUsers" .!= mempty)
            <*> (x .:? "reactionsFromDeletedUsersCount")
      )

instance Hashable ReactionForComment

instance NFData ReactionForComment
