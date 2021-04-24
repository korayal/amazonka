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
-- Module      : Network.AWS.KMS.RevokeGrant
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Revokes the specified grant for the specified customer master key (CMK). You can revoke a grant to actively deny operations that depend on it.
--
--
-- __Cross-account use__ : Yes. To perform this operation on a CMK in a different AWS account, specify the key ARN in the value of the @KeyId@ parameter.
--
-- __Required permissions__ : <https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html kms:RevokeGrant> (key policy)
--
-- __Related operations:__
--
--     * 'CreateGrant'
--
--     * 'ListGrants'
--
--     * 'ListRetirableGrants'
--
--     * 'RetireGrant'
module Network.AWS.KMS.RevokeGrant
  ( -- * Creating a Request
    revokeGrant,
    RevokeGrant,

    -- * Request Lenses
    rgKeyId,
    rgGrantId,

    -- * Destructuring the Response
    revokeGrantResponse,
    RevokeGrantResponse,
  )
where

import Network.AWS.KMS.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'revokeGrant' smart constructor.
data RevokeGrant = RevokeGrant'
  { _rgKeyId :: !Text,
    _rgGrantId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'RevokeGrant' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rgKeyId' - A unique identifier for the customer master key associated with the grant. Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN. For example:     * Key ID: @1234abcd-12ab-34cd-56ef-1234567890ab@      * Key ARN: @arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab@  To get the key ID and key ARN for a CMK, use 'ListKeys' or 'DescribeKey' .
--
-- * 'rgGrantId' - Identifier of the grant to be revoked.
revokeGrant ::
  -- | 'rgKeyId'
  Text ->
  -- | 'rgGrantId'
  Text ->
  RevokeGrant
revokeGrant pKeyId_ pGrantId_ =
  RevokeGrant'
    { _rgKeyId = pKeyId_,
      _rgGrantId = pGrantId_
    }

-- | A unique identifier for the customer master key associated with the grant. Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To specify a CMK in a different AWS account, you must use the key ARN. For example:     * Key ID: @1234abcd-12ab-34cd-56ef-1234567890ab@      * Key ARN: @arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab@  To get the key ID and key ARN for a CMK, use 'ListKeys' or 'DescribeKey' .
rgKeyId :: Lens' RevokeGrant Text
rgKeyId = lens _rgKeyId (\s a -> s {_rgKeyId = a})

-- | Identifier of the grant to be revoked.
rgGrantId :: Lens' RevokeGrant Text
rgGrantId = lens _rgGrantId (\s a -> s {_rgGrantId = a})

instance AWSRequest RevokeGrant where
  type Rs RevokeGrant = RevokeGrantResponse
  request = postJSON kms
  response = receiveNull RevokeGrantResponse'

instance Hashable RevokeGrant

instance NFData RevokeGrant

instance ToHeaders RevokeGrant where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("TrentService.RevokeGrant" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON RevokeGrant where
  toJSON RevokeGrant' {..} =
    object
      ( catMaybes
          [ Just ("KeyId" .= _rgKeyId),
            Just ("GrantId" .= _rgGrantId)
          ]
      )

instance ToPath RevokeGrant where
  toPath = const "/"

instance ToQuery RevokeGrant where
  toQuery = const mempty

-- | /See:/ 'revokeGrantResponse' smart constructor.
data RevokeGrantResponse = RevokeGrantResponse'
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'RevokeGrantResponse' with the minimum fields required to make a request.
revokeGrantResponse ::
  RevokeGrantResponse
revokeGrantResponse = RevokeGrantResponse'

instance NFData RevokeGrantResponse
