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
-- Module      : Network.AWS.S3.PutObjectLegalHold
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Applies a Legal Hold configuration to the specified object.
--
--
-- This action is not supported by Amazon S3 on Outposts.
--
-- __Related Resources__
--
--     * <https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html Locking Objects>
module Network.AWS.S3.PutObjectLegalHold
  ( -- * Creating a Request
    putObjectLegalHold,
    PutObjectLegalHold,

    -- * Request Lenses
    polhExpectedBucketOwner,
    polhContentMD5,
    polhVersionId,
    polhLegalHold,
    polhRequestPayer,
    polhBucket,
    polhKey,

    -- * Destructuring the Response
    putObjectLegalHoldResponse,
    PutObjectLegalHoldResponse,

    -- * Response Lenses
    polhrrsRequestCharged,
    polhrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.S3.Types

-- | /See:/ 'putObjectLegalHold' smart constructor.
data PutObjectLegalHold = PutObjectLegalHold'
  { _polhExpectedBucketOwner ::
      !(Maybe Text),
    _polhContentMD5 :: !(Maybe Text),
    _polhVersionId ::
      !(Maybe ObjectVersionId),
    _polhLegalHold ::
      !(Maybe ObjectLockLegalHold),
    _polhRequestPayer ::
      !(Maybe RequestPayer),
    _polhBucket :: !BucketName,
    _polhKey :: !ObjectKey
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'PutObjectLegalHold' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'polhExpectedBucketOwner' - The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP @403 (Access Denied)@ error.
--
-- * 'polhContentMD5' - The MD5 hash for the request body. For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.
--
-- * 'polhVersionId' - The version ID of the object that you want to place a Legal Hold on.
--
-- * 'polhLegalHold' - Container element for the Legal Hold configuration you want to apply to the specified object.
--
-- * 'polhRequestPayer' - Undocumented member.
--
-- * 'polhBucket' - The bucket name containing the object that you want to place a Legal Hold on.  When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form /AccessPointName/ -/AccountId/ .s3-accesspoint./Region/ .amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html Using Access Points> in the /Amazon Simple Storage Service Developer Guide/ .
--
-- * 'polhKey' - The key name for the object that you want to place a Legal Hold on.
putObjectLegalHold ::
  -- | 'polhBucket'
  BucketName ->
  -- | 'polhKey'
  ObjectKey ->
  PutObjectLegalHold
putObjectLegalHold pBucket_ pKey_ =
  PutObjectLegalHold'
    { _polhExpectedBucketOwner =
        Nothing,
      _polhContentMD5 = Nothing,
      _polhVersionId = Nothing,
      _polhLegalHold = Nothing,
      _polhRequestPayer = Nothing,
      _polhBucket = pBucket_,
      _polhKey = pKey_
    }

-- | The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP @403 (Access Denied)@ error.
polhExpectedBucketOwner :: Lens' PutObjectLegalHold (Maybe Text)
polhExpectedBucketOwner = lens _polhExpectedBucketOwner (\s a -> s {_polhExpectedBucketOwner = a})

-- | The MD5 hash for the request body. For requests made using the AWS Command Line Interface (CLI) or AWS SDKs, this field is calculated automatically.
polhContentMD5 :: Lens' PutObjectLegalHold (Maybe Text)
polhContentMD5 = lens _polhContentMD5 (\s a -> s {_polhContentMD5 = a})

-- | The version ID of the object that you want to place a Legal Hold on.
polhVersionId :: Lens' PutObjectLegalHold (Maybe ObjectVersionId)
polhVersionId = lens _polhVersionId (\s a -> s {_polhVersionId = a})

-- | Container element for the Legal Hold configuration you want to apply to the specified object.
polhLegalHold :: Lens' PutObjectLegalHold (Maybe ObjectLockLegalHold)
polhLegalHold = lens _polhLegalHold (\s a -> s {_polhLegalHold = a})

-- | Undocumented member.
polhRequestPayer :: Lens' PutObjectLegalHold (Maybe RequestPayer)
polhRequestPayer = lens _polhRequestPayer (\s a -> s {_polhRequestPayer = a})

-- | The bucket name containing the object that you want to place a Legal Hold on.  When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form /AccessPointName/ -/AccountId/ .s3-accesspoint./Region/ .amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html Using Access Points> in the /Amazon Simple Storage Service Developer Guide/ .
polhBucket :: Lens' PutObjectLegalHold BucketName
polhBucket = lens _polhBucket (\s a -> s {_polhBucket = a})

-- | The key name for the object that you want to place a Legal Hold on.
polhKey :: Lens' PutObjectLegalHold ObjectKey
polhKey = lens _polhKey (\s a -> s {_polhKey = a})

instance AWSRequest PutObjectLegalHold where
  type
    Rs PutObjectLegalHold =
      PutObjectLegalHoldResponse
  request = putXML s3
  response =
    receiveEmpty
      ( \s h x ->
          PutObjectLegalHoldResponse'
            <$> (h .#? "x-amz-request-charged")
            <*> (pure (fromEnum s))
      )

instance Hashable PutObjectLegalHold

instance NFData PutObjectLegalHold

instance ToElement PutObjectLegalHold where
  toElement =
    mkElement
      "{http://s3.amazonaws.com/doc/2006-03-01/}LegalHold"
      . _polhLegalHold

instance ToHeaders PutObjectLegalHold where
  toHeaders PutObjectLegalHold' {..} =
    mconcat
      [ "x-amz-expected-bucket-owner"
          =# _polhExpectedBucketOwner,
        "Content-MD5" =# _polhContentMD5,
        "x-amz-request-payer" =# _polhRequestPayer
      ]

instance ToPath PutObjectLegalHold where
  toPath PutObjectLegalHold' {..} =
    mconcat ["/", toBS _polhBucket, "/", toBS _polhKey]

instance ToQuery PutObjectLegalHold where
  toQuery PutObjectLegalHold' {..} =
    mconcat
      ["versionId" =: _polhVersionId, "legal-hold"]

-- | /See:/ 'putObjectLegalHoldResponse' smart constructor.
data PutObjectLegalHoldResponse = PutObjectLegalHoldResponse'
  { _polhrrsRequestCharged ::
      !( Maybe
           RequestCharged
       ),
    _polhrrsResponseStatus ::
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

-- | Creates a value of 'PutObjectLegalHoldResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'polhrrsRequestCharged' - Undocumented member.
--
-- * 'polhrrsResponseStatus' - -- | The response status code.
putObjectLegalHoldResponse ::
  -- | 'polhrrsResponseStatus'
  Int ->
  PutObjectLegalHoldResponse
putObjectLegalHoldResponse pResponseStatus_ =
  PutObjectLegalHoldResponse'
    { _polhrrsRequestCharged =
        Nothing,
      _polhrrsResponseStatus = pResponseStatus_
    }

-- | Undocumented member.
polhrrsRequestCharged :: Lens' PutObjectLegalHoldResponse (Maybe RequestCharged)
polhrrsRequestCharged = lens _polhrrsRequestCharged (\s a -> s {_polhrrsRequestCharged = a})

-- | -- | The response status code.
polhrrsResponseStatus :: Lens' PutObjectLegalHoldResponse Int
polhrrsResponseStatus = lens _polhrrsResponseStatus (\s a -> s {_polhrrsResponseStatus = a})

instance NFData PutObjectLegalHoldResponse
