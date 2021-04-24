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
-- Module      : Network.AWS.KMS.ScheduleKeyDeletion
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Schedules the deletion of a customer master key (CMK). You may provide a waiting period, specified in days, before deletion occurs. If you do not provide a waiting period, the default period of 30 days is used. When this operation is successful, the key state of the CMK changes to @PendingDeletion@ . Before the waiting period ends, you can use 'CancelKeyDeletion' to cancel the deletion of the CMK. After the waiting period ends, AWS KMS deletes the CMK and all AWS KMS data associated with it, including all aliases that refer to it.
--
--
-- /Important:/ Deleting a CMK is a destructive and potentially dangerous operation. When a CMK is deleted, all data that was encrypted under the CMK is unrecoverable. To prevent the use of a CMK without deleting it, use 'DisableKey' .
--
-- If you schedule deletion of a CMK from a <https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html custom key store> , when the waiting period expires, @ScheduleKeyDeletion@ deletes the CMK from AWS KMS. Then AWS KMS makes a best effort to delete the key material from the associated AWS CloudHSM cluster. However, you might need to manually <https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key delete the orphaned key material> from the cluster and its backups.
--
-- For more information about scheduling a CMK for deletion, see <https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html Deleting Customer Master Keys> in the /AWS Key Management Service Developer Guide/ .
--
-- The CMK that you use for this operation must be in a compatible key state. For details, see <https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html How Key State Affects Use of a Customer Master Key> in the /AWS Key Management Service Developer Guide/ .
--
-- __Cross-account use__ : No. You cannot perform this operation on a CMK in a different AWS account.
--
-- __Required permissions__ : <https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html kms:ScheduleKeyDeletion> (key policy)
--
-- __Related operations__
--
--     * 'CancelKeyDeletion'
--
--     * 'DisableKey'
module Network.AWS.KMS.ScheduleKeyDeletion
  ( -- * Creating a Request
    scheduleKeyDeletion,
    ScheduleKeyDeletion,

    -- * Request Lenses
    skdPendingWindowInDays,
    skdKeyId,

    -- * Destructuring the Response
    scheduleKeyDeletionResponse,
    ScheduleKeyDeletionResponse,

    -- * Response Lenses
    skdrrsDeletionDate,
    skdrrsKeyId,
    skdrrsResponseStatus,
  )
where

import Network.AWS.KMS.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'scheduleKeyDeletion' smart constructor.
data ScheduleKeyDeletion = ScheduleKeyDeletion'
  { _skdPendingWindowInDays ::
      !(Maybe Nat),
    _skdKeyId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ScheduleKeyDeletion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'skdPendingWindowInDays' - The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the customer master key (CMK). This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30.
--
-- * 'skdKeyId' - The unique identifier of the customer master key (CMK) to delete. Specify the key ID or the Amazon Resource Name (ARN) of the CMK. For example:     * Key ID: @1234abcd-12ab-34cd-56ef-1234567890ab@      * Key ARN: @arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab@  To get the key ID and key ARN for a CMK, use 'ListKeys' or 'DescribeKey' .
scheduleKeyDeletion ::
  -- | 'skdKeyId'
  Text ->
  ScheduleKeyDeletion
scheduleKeyDeletion pKeyId_ =
  ScheduleKeyDeletion'
    { _skdPendingWindowInDays =
        Nothing,
      _skdKeyId = pKeyId_
    }

-- | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the customer master key (CMK). This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30.
skdPendingWindowInDays :: Lens' ScheduleKeyDeletion (Maybe Natural)
skdPendingWindowInDays = lens _skdPendingWindowInDays (\s a -> s {_skdPendingWindowInDays = a}) . mapping _Nat

-- | The unique identifier of the customer master key (CMK) to delete. Specify the key ID or the Amazon Resource Name (ARN) of the CMK. For example:     * Key ID: @1234abcd-12ab-34cd-56ef-1234567890ab@      * Key ARN: @arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab@  To get the key ID and key ARN for a CMK, use 'ListKeys' or 'DescribeKey' .
skdKeyId :: Lens' ScheduleKeyDeletion Text
skdKeyId = lens _skdKeyId (\s a -> s {_skdKeyId = a})

instance AWSRequest ScheduleKeyDeletion where
  type
    Rs ScheduleKeyDeletion =
      ScheduleKeyDeletionResponse
  request = postJSON kms
  response =
    receiveJSON
      ( \s h x ->
          ScheduleKeyDeletionResponse'
            <$> (x .?> "DeletionDate")
            <*> (x .?> "KeyId")
            <*> (pure (fromEnum s))
      )

instance Hashable ScheduleKeyDeletion

instance NFData ScheduleKeyDeletion

instance ToHeaders ScheduleKeyDeletion where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("TrentService.ScheduleKeyDeletion" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ScheduleKeyDeletion where
  toJSON ScheduleKeyDeletion' {..} =
    object
      ( catMaybes
          [ ("PendingWindowInDays" .=)
              <$> _skdPendingWindowInDays,
            Just ("KeyId" .= _skdKeyId)
          ]
      )

instance ToPath ScheduleKeyDeletion where
  toPath = const "/"

instance ToQuery ScheduleKeyDeletion where
  toQuery = const mempty

-- | /See:/ 'scheduleKeyDeletionResponse' smart constructor.
data ScheduleKeyDeletionResponse = ScheduleKeyDeletionResponse'
  { _skdrrsDeletionDate ::
      !(Maybe POSIX),
    _skdrrsKeyId ::
      !(Maybe Text),
    _skdrrsResponseStatus ::
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

-- | Creates a value of 'ScheduleKeyDeletionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'skdrrsDeletionDate' - The date and time after which AWS KMS deletes the customer master key (CMK).
--
-- * 'skdrrsKeyId' - The Amazon Resource Name (<https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN key ARN> ) of the CMK whose deletion is scheduled.
--
-- * 'skdrrsResponseStatus' - -- | The response status code.
scheduleKeyDeletionResponse ::
  -- | 'skdrrsResponseStatus'
  Int ->
  ScheduleKeyDeletionResponse
scheduleKeyDeletionResponse pResponseStatus_ =
  ScheduleKeyDeletionResponse'
    { _skdrrsDeletionDate =
        Nothing,
      _skdrrsKeyId = Nothing,
      _skdrrsResponseStatus = pResponseStatus_
    }

-- | The date and time after which AWS KMS deletes the customer master key (CMK).
skdrrsDeletionDate :: Lens' ScheduleKeyDeletionResponse (Maybe UTCTime)
skdrrsDeletionDate = lens _skdrrsDeletionDate (\s a -> s {_skdrrsDeletionDate = a}) . mapping _Time

-- | The Amazon Resource Name (<https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN key ARN> ) of the CMK whose deletion is scheduled.
skdrrsKeyId :: Lens' ScheduleKeyDeletionResponse (Maybe Text)
skdrrsKeyId = lens _skdrrsKeyId (\s a -> s {_skdrrsKeyId = a})

-- | -- | The response status code.
skdrrsResponseStatus :: Lens' ScheduleKeyDeletionResponse Int
skdrrsResponseStatus = lens _skdrrsResponseStatus (\s a -> s {_skdrrsResponseStatus = a})

instance NFData ScheduleKeyDeletionResponse
