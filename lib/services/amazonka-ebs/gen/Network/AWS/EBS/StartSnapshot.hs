{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EBS.StartSnapshot
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new Amazon EBS snapshot. The new snapshot enters the @pending@
-- state after the request completes.
--
-- After creating the snapshot, use
-- <https://docs.aws.amazon.com/ebs/latest/APIReference/API_PutSnapshotBlock.html PutSnapshotBlock>
-- to write blocks of data to the snapshot.
module Network.AWS.EBS.StartSnapshot
  ( -- * Creating a Request
    StartSnapshot (..),
    newStartSnapshot,

    -- * Request Lenses
    startSnapshot_kmsKeyArn,
    startSnapshot_clientToken,
    startSnapshot_encrypted,
    startSnapshot_parentSnapshotId,
    startSnapshot_timeout,
    startSnapshot_description,
    startSnapshot_tags,
    startSnapshot_volumeSize,

    -- * Destructuring the Response
    StartSnapshotResponse (..),
    newStartSnapshotResponse,

    -- * Response Lenses
    startSnapshotResponse_blockSize,
    startSnapshotResponse_status,
    startSnapshotResponse_kmsKeyArn,
    startSnapshotResponse_startTime,
    startSnapshotResponse_volumeSize,
    startSnapshotResponse_ownerId,
    startSnapshotResponse_parentSnapshotId,
    startSnapshotResponse_description,
    startSnapshotResponse_tags,
    startSnapshotResponse_snapshotId,
    startSnapshotResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.EBS.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newStartSnapshot' smart constructor.
data StartSnapshot = StartSnapshot'
  { -- | The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
    -- to be used to encrypt the snapshot. If you do not specify a KMS key, the
    -- default Amazon Web Services managed KMS key is used.
    --
    -- If you specify a __ParentSnapshotId__, omit this parameter; the snapshot
    -- will be encrypted using the same KMS key that was used to encrypt the
    -- parent snapshot.
    --
    -- If __Encrypted__ is set to @true@, you must specify a KMS key ARN.
    kmsKeyArn :: Prelude.Maybe (Core.Sensitive Prelude.Text),
    -- | A unique, case-sensitive identifier that you provide to ensure the
    -- idempotency of the request. Idempotency ensures that an API request
    -- completes only once. With an idempotent request, if the original request
    -- completes successfully. The subsequent retries with the same client
    -- token return the result from the original successful request and they
    -- have no additional effect.
    --
    -- If you do not specify a client token, one is automatically generated by
    -- the Amazon Web Services SDK.
    --
    -- For more information, see
    -- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-direct-api-idempotency.html Idempotency for StartSnapshot API>
    -- in the /Amazon Elastic Compute Cloud User Guide/.
    clientToken :: Prelude.Maybe Prelude.Text,
    -- | Indicates whether to encrypt the snapshot. To create an encrypted
    -- snapshot, specify @true@. To create an unencrypted snapshot, omit this
    -- parameter.
    --
    -- If you specify a value for __ParentSnapshotId__, omit this parameter.
    --
    -- If you specify @true@, the snapshot is encrypted using the KMS key
    -- specified using the __KmsKeyArn__ parameter. If no value is specified
    -- for __KmsKeyArn__, the default KMS key for your account is used. If no
    -- default KMS key has been specified for your account, the Amazon Web
    -- Services managed KMS key is used. To set a default KMS key for your
    -- account, use
    -- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyEbsDefaultKmsKeyId.html ModifyEbsDefaultKmsKeyId>.
    --
    -- If your account is enabled for encryption by default, you cannot set
    -- this parameter to @false@. In this case, you can omit this parameter.
    --
    -- For more information, see
    -- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html#ebsapis-using-encryption Using encryption>
    -- in the /Amazon Elastic Compute Cloud User Guide/.
    encrypted :: Prelude.Maybe Prelude.Bool,
    -- | The ID of the parent snapshot. If there is no parent snapshot, or if you
    -- are creating the first snapshot for an on-premises volume, omit this
    -- parameter.
    --
    -- If your account is enabled for encryption by default, you cannot use an
    -- unencrypted snapshot as a parent snapshot. You must first create an
    -- encrypted copy of the parent snapshot using
    -- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CopySnapshot.html CopySnapshot>.
    parentSnapshotId :: Prelude.Maybe Prelude.Text,
    -- | The amount of time (in minutes) after which the snapshot is
    -- automatically cancelled if:
    --
    -- -   No blocks are written to the snapshot.
    --
    -- -   The snapshot is not completed after writing the last block of data.
    --
    -- If no value is specified, the timeout defaults to @60@ minutes.
    timeout :: Prelude.Maybe Prelude.Natural,
    -- | A description for the snapshot.
    description :: Prelude.Maybe Prelude.Text,
    -- | The tags to apply to the snapshot.
    tags :: Prelude.Maybe [Tag],
    -- | The size of the volume, in GiB. The maximum size is @65536@ GiB (64
    -- TiB).
    volumeSize :: Prelude.Natural
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'StartSnapshot' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'kmsKeyArn', 'startSnapshot_kmsKeyArn' - The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
-- to be used to encrypt the snapshot. If you do not specify a KMS key, the
-- default Amazon Web Services managed KMS key is used.
--
-- If you specify a __ParentSnapshotId__, omit this parameter; the snapshot
-- will be encrypted using the same KMS key that was used to encrypt the
-- parent snapshot.
--
-- If __Encrypted__ is set to @true@, you must specify a KMS key ARN.
--
-- 'clientToken', 'startSnapshot_clientToken' - A unique, case-sensitive identifier that you provide to ensure the
-- idempotency of the request. Idempotency ensures that an API request
-- completes only once. With an idempotent request, if the original request
-- completes successfully. The subsequent retries with the same client
-- token return the result from the original successful request and they
-- have no additional effect.
--
-- If you do not specify a client token, one is automatically generated by
-- the Amazon Web Services SDK.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-direct-api-idempotency.html Idempotency for StartSnapshot API>
-- in the /Amazon Elastic Compute Cloud User Guide/.
--
-- 'encrypted', 'startSnapshot_encrypted' - Indicates whether to encrypt the snapshot. To create an encrypted
-- snapshot, specify @true@. To create an unencrypted snapshot, omit this
-- parameter.
--
-- If you specify a value for __ParentSnapshotId__, omit this parameter.
--
-- If you specify @true@, the snapshot is encrypted using the KMS key
-- specified using the __KmsKeyArn__ parameter. If no value is specified
-- for __KmsKeyArn__, the default KMS key for your account is used. If no
-- default KMS key has been specified for your account, the Amazon Web
-- Services managed KMS key is used. To set a default KMS key for your
-- account, use
-- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyEbsDefaultKmsKeyId.html ModifyEbsDefaultKmsKeyId>.
--
-- If your account is enabled for encryption by default, you cannot set
-- this parameter to @false@. In this case, you can omit this parameter.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html#ebsapis-using-encryption Using encryption>
-- in the /Amazon Elastic Compute Cloud User Guide/.
--
-- 'parentSnapshotId', 'startSnapshot_parentSnapshotId' - The ID of the parent snapshot. If there is no parent snapshot, or if you
-- are creating the first snapshot for an on-premises volume, omit this
-- parameter.
--
-- If your account is enabled for encryption by default, you cannot use an
-- unencrypted snapshot as a parent snapshot. You must first create an
-- encrypted copy of the parent snapshot using
-- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CopySnapshot.html CopySnapshot>.
--
-- 'timeout', 'startSnapshot_timeout' - The amount of time (in minutes) after which the snapshot is
-- automatically cancelled if:
--
-- -   No blocks are written to the snapshot.
--
-- -   The snapshot is not completed after writing the last block of data.
--
-- If no value is specified, the timeout defaults to @60@ minutes.
--
-- 'description', 'startSnapshot_description' - A description for the snapshot.
--
-- 'tags', 'startSnapshot_tags' - The tags to apply to the snapshot.
--
-- 'volumeSize', 'startSnapshot_volumeSize' - The size of the volume, in GiB. The maximum size is @65536@ GiB (64
-- TiB).
newStartSnapshot ::
  -- | 'volumeSize'
  Prelude.Natural ->
  StartSnapshot
newStartSnapshot pVolumeSize_ =
  StartSnapshot'
    { kmsKeyArn = Prelude.Nothing,
      clientToken = Prelude.Nothing,
      encrypted = Prelude.Nothing,
      parentSnapshotId = Prelude.Nothing,
      timeout = Prelude.Nothing,
      description = Prelude.Nothing,
      tags = Prelude.Nothing,
      volumeSize = pVolumeSize_
    }

-- | The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
-- to be used to encrypt the snapshot. If you do not specify a KMS key, the
-- default Amazon Web Services managed KMS key is used.
--
-- If you specify a __ParentSnapshotId__, omit this parameter; the snapshot
-- will be encrypted using the same KMS key that was used to encrypt the
-- parent snapshot.
--
-- If __Encrypted__ is set to @true@, you must specify a KMS key ARN.
startSnapshot_kmsKeyArn :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Text)
startSnapshot_kmsKeyArn = Lens.lens (\StartSnapshot' {kmsKeyArn} -> kmsKeyArn) (\s@StartSnapshot' {} a -> s {kmsKeyArn = a} :: StartSnapshot) Prelude.. Lens.mapping Core._Sensitive

-- | A unique, case-sensitive identifier that you provide to ensure the
-- idempotency of the request. Idempotency ensures that an API request
-- completes only once. With an idempotent request, if the original request
-- completes successfully. The subsequent retries with the same client
-- token return the result from the original successful request and they
-- have no additional effect.
--
-- If you do not specify a client token, one is automatically generated by
-- the Amazon Web Services SDK.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-direct-api-idempotency.html Idempotency for StartSnapshot API>
-- in the /Amazon Elastic Compute Cloud User Guide/.
startSnapshot_clientToken :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Text)
startSnapshot_clientToken = Lens.lens (\StartSnapshot' {clientToken} -> clientToken) (\s@StartSnapshot' {} a -> s {clientToken = a} :: StartSnapshot)

-- | Indicates whether to encrypt the snapshot. To create an encrypted
-- snapshot, specify @true@. To create an unencrypted snapshot, omit this
-- parameter.
--
-- If you specify a value for __ParentSnapshotId__, omit this parameter.
--
-- If you specify @true@, the snapshot is encrypted using the KMS key
-- specified using the __KmsKeyArn__ parameter. If no value is specified
-- for __KmsKeyArn__, the default KMS key for your account is used. If no
-- default KMS key has been specified for your account, the Amazon Web
-- Services managed KMS key is used. To set a default KMS key for your
-- account, use
-- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyEbsDefaultKmsKeyId.html ModifyEbsDefaultKmsKeyId>.
--
-- If your account is enabled for encryption by default, you cannot set
-- this parameter to @false@. In this case, you can omit this parameter.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html#ebsapis-using-encryption Using encryption>
-- in the /Amazon Elastic Compute Cloud User Guide/.
startSnapshot_encrypted :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Bool)
startSnapshot_encrypted = Lens.lens (\StartSnapshot' {encrypted} -> encrypted) (\s@StartSnapshot' {} a -> s {encrypted = a} :: StartSnapshot)

-- | The ID of the parent snapshot. If there is no parent snapshot, or if you
-- are creating the first snapshot for an on-premises volume, omit this
-- parameter.
--
-- If your account is enabled for encryption by default, you cannot use an
-- unencrypted snapshot as a parent snapshot. You must first create an
-- encrypted copy of the parent snapshot using
-- <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CopySnapshot.html CopySnapshot>.
startSnapshot_parentSnapshotId :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Text)
startSnapshot_parentSnapshotId = Lens.lens (\StartSnapshot' {parentSnapshotId} -> parentSnapshotId) (\s@StartSnapshot' {} a -> s {parentSnapshotId = a} :: StartSnapshot)

-- | The amount of time (in minutes) after which the snapshot is
-- automatically cancelled if:
--
-- -   No blocks are written to the snapshot.
--
-- -   The snapshot is not completed after writing the last block of data.
--
-- If no value is specified, the timeout defaults to @60@ minutes.
startSnapshot_timeout :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Natural)
startSnapshot_timeout = Lens.lens (\StartSnapshot' {timeout} -> timeout) (\s@StartSnapshot' {} a -> s {timeout = a} :: StartSnapshot)

-- | A description for the snapshot.
startSnapshot_description :: Lens.Lens' StartSnapshot (Prelude.Maybe Prelude.Text)
startSnapshot_description = Lens.lens (\StartSnapshot' {description} -> description) (\s@StartSnapshot' {} a -> s {description = a} :: StartSnapshot)

-- | The tags to apply to the snapshot.
startSnapshot_tags :: Lens.Lens' StartSnapshot (Prelude.Maybe [Tag])
startSnapshot_tags = Lens.lens (\StartSnapshot' {tags} -> tags) (\s@StartSnapshot' {} a -> s {tags = a} :: StartSnapshot) Prelude.. Lens.mapping Lens.coerced

-- | The size of the volume, in GiB. The maximum size is @65536@ GiB (64
-- TiB).
startSnapshot_volumeSize :: Lens.Lens' StartSnapshot Prelude.Natural
startSnapshot_volumeSize = Lens.lens (\StartSnapshot' {volumeSize} -> volumeSize) (\s@StartSnapshot' {} a -> s {volumeSize = a} :: StartSnapshot)

instance Core.AWSRequest StartSnapshot where
  type
    AWSResponse StartSnapshot =
      StartSnapshotResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          StartSnapshotResponse'
            Prelude.<$> (x Core..?> "BlockSize")
            Prelude.<*> (x Core..?> "Status")
            Prelude.<*> (x Core..?> "KmsKeyArn")
            Prelude.<*> (x Core..?> "StartTime")
            Prelude.<*> (x Core..?> "VolumeSize")
            Prelude.<*> (x Core..?> "OwnerId")
            Prelude.<*> (x Core..?> "ParentSnapshotId")
            Prelude.<*> (x Core..?> "Description")
            Prelude.<*> (x Core..?> "Tags" Core..!@ Prelude.mempty)
            Prelude.<*> (x Core..?> "SnapshotId")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable StartSnapshot

instance Prelude.NFData StartSnapshot

instance Core.ToHeaders StartSnapshot where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON StartSnapshot where
  toJSON StartSnapshot' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("KmsKeyArn" Core..=) Prelude.<$> kmsKeyArn,
            ("ClientToken" Core..=) Prelude.<$> clientToken,
            ("Encrypted" Core..=) Prelude.<$> encrypted,
            ("ParentSnapshotId" Core..=)
              Prelude.<$> parentSnapshotId,
            ("Timeout" Core..=) Prelude.<$> timeout,
            ("Description" Core..=) Prelude.<$> description,
            ("Tags" Core..=) Prelude.<$> tags,
            Prelude.Just ("VolumeSize" Core..= volumeSize)
          ]
      )

instance Core.ToPath StartSnapshot where
  toPath = Prelude.const "/snapshots"

instance Core.ToQuery StartSnapshot where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newStartSnapshotResponse' smart constructor.
data StartSnapshotResponse = StartSnapshotResponse'
  { -- | The size of the blocks in the snapshot, in bytes.
    blockSize :: Prelude.Maybe Prelude.Int,
    -- | The status of the snapshot.
    status :: Prelude.Maybe Status,
    -- | The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
    -- used to encrypt the snapshot.
    kmsKeyArn :: Prelude.Maybe (Core.Sensitive Prelude.Text),
    -- | The timestamp when the snapshot was created.
    startTime :: Prelude.Maybe Core.POSIX,
    -- | The size of the volume, in GiB.
    volumeSize :: Prelude.Maybe Prelude.Natural,
    -- | The Amazon Web Services account ID of the snapshot owner.
    ownerId :: Prelude.Maybe Prelude.Text,
    -- | The ID of the parent snapshot.
    parentSnapshotId :: Prelude.Maybe Prelude.Text,
    -- | The description of the snapshot.
    description :: Prelude.Maybe Prelude.Text,
    -- | The tags applied to the snapshot. You can specify up to 50 tags per
    -- snapshot. For more information, see
    -- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html Tagging your Amazon EC2 resources>
    -- in the /Amazon Elastic Compute Cloud User Guide/.
    tags :: Prelude.Maybe [Tag],
    -- | The ID of the snapshot.
    snapshotId :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'StartSnapshotResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'blockSize', 'startSnapshotResponse_blockSize' - The size of the blocks in the snapshot, in bytes.
--
-- 'status', 'startSnapshotResponse_status' - The status of the snapshot.
--
-- 'kmsKeyArn', 'startSnapshotResponse_kmsKeyArn' - The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
-- used to encrypt the snapshot.
--
-- 'startTime', 'startSnapshotResponse_startTime' - The timestamp when the snapshot was created.
--
-- 'volumeSize', 'startSnapshotResponse_volumeSize' - The size of the volume, in GiB.
--
-- 'ownerId', 'startSnapshotResponse_ownerId' - The Amazon Web Services account ID of the snapshot owner.
--
-- 'parentSnapshotId', 'startSnapshotResponse_parentSnapshotId' - The ID of the parent snapshot.
--
-- 'description', 'startSnapshotResponse_description' - The description of the snapshot.
--
-- 'tags', 'startSnapshotResponse_tags' - The tags applied to the snapshot. You can specify up to 50 tags per
-- snapshot. For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html Tagging your Amazon EC2 resources>
-- in the /Amazon Elastic Compute Cloud User Guide/.
--
-- 'snapshotId', 'startSnapshotResponse_snapshotId' - The ID of the snapshot.
--
-- 'httpStatus', 'startSnapshotResponse_httpStatus' - The response's http status code.
newStartSnapshotResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  StartSnapshotResponse
newStartSnapshotResponse pHttpStatus_ =
  StartSnapshotResponse'
    { blockSize = Prelude.Nothing,
      status = Prelude.Nothing,
      kmsKeyArn = Prelude.Nothing,
      startTime = Prelude.Nothing,
      volumeSize = Prelude.Nothing,
      ownerId = Prelude.Nothing,
      parentSnapshotId = Prelude.Nothing,
      description = Prelude.Nothing,
      tags = Prelude.Nothing,
      snapshotId = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The size of the blocks in the snapshot, in bytes.
startSnapshotResponse_blockSize :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Int)
startSnapshotResponse_blockSize = Lens.lens (\StartSnapshotResponse' {blockSize} -> blockSize) (\s@StartSnapshotResponse' {} a -> s {blockSize = a} :: StartSnapshotResponse)

-- | The status of the snapshot.
startSnapshotResponse_status :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Status)
startSnapshotResponse_status = Lens.lens (\StartSnapshotResponse' {status} -> status) (\s@StartSnapshotResponse' {} a -> s {status = a} :: StartSnapshotResponse)

-- | The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
-- used to encrypt the snapshot.
startSnapshotResponse_kmsKeyArn :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Text)
startSnapshotResponse_kmsKeyArn = Lens.lens (\StartSnapshotResponse' {kmsKeyArn} -> kmsKeyArn) (\s@StartSnapshotResponse' {} a -> s {kmsKeyArn = a} :: StartSnapshotResponse) Prelude.. Lens.mapping Core._Sensitive

-- | The timestamp when the snapshot was created.
startSnapshotResponse_startTime :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.UTCTime)
startSnapshotResponse_startTime = Lens.lens (\StartSnapshotResponse' {startTime} -> startTime) (\s@StartSnapshotResponse' {} a -> s {startTime = a} :: StartSnapshotResponse) Prelude.. Lens.mapping Core._Time

-- | The size of the volume, in GiB.
startSnapshotResponse_volumeSize :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Natural)
startSnapshotResponse_volumeSize = Lens.lens (\StartSnapshotResponse' {volumeSize} -> volumeSize) (\s@StartSnapshotResponse' {} a -> s {volumeSize = a} :: StartSnapshotResponse)

-- | The Amazon Web Services account ID of the snapshot owner.
startSnapshotResponse_ownerId :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Text)
startSnapshotResponse_ownerId = Lens.lens (\StartSnapshotResponse' {ownerId} -> ownerId) (\s@StartSnapshotResponse' {} a -> s {ownerId = a} :: StartSnapshotResponse)

-- | The ID of the parent snapshot.
startSnapshotResponse_parentSnapshotId :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Text)
startSnapshotResponse_parentSnapshotId = Lens.lens (\StartSnapshotResponse' {parentSnapshotId} -> parentSnapshotId) (\s@StartSnapshotResponse' {} a -> s {parentSnapshotId = a} :: StartSnapshotResponse)

-- | The description of the snapshot.
startSnapshotResponse_description :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Text)
startSnapshotResponse_description = Lens.lens (\StartSnapshotResponse' {description} -> description) (\s@StartSnapshotResponse' {} a -> s {description = a} :: StartSnapshotResponse)

-- | The tags applied to the snapshot. You can specify up to 50 tags per
-- snapshot. For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html Tagging your Amazon EC2 resources>
-- in the /Amazon Elastic Compute Cloud User Guide/.
startSnapshotResponse_tags :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe [Tag])
startSnapshotResponse_tags = Lens.lens (\StartSnapshotResponse' {tags} -> tags) (\s@StartSnapshotResponse' {} a -> s {tags = a} :: StartSnapshotResponse) Prelude.. Lens.mapping Lens.coerced

-- | The ID of the snapshot.
startSnapshotResponse_snapshotId :: Lens.Lens' StartSnapshotResponse (Prelude.Maybe Prelude.Text)
startSnapshotResponse_snapshotId = Lens.lens (\StartSnapshotResponse' {snapshotId} -> snapshotId) (\s@StartSnapshotResponse' {} a -> s {snapshotId = a} :: StartSnapshotResponse)

-- | The response's http status code.
startSnapshotResponse_httpStatus :: Lens.Lens' StartSnapshotResponse Prelude.Int
startSnapshotResponse_httpStatus = Lens.lens (\StartSnapshotResponse' {httpStatus} -> httpStatus) (\s@StartSnapshotResponse' {} a -> s {httpStatus = a} :: StartSnapshotResponse)

instance Prelude.NFData StartSnapshotResponse
