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
-- Module      : Network.AWS.Lightsail.CreateDiskSnapshot
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.
--
--
-- You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.
--
-- You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the @instance name@ parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.
--
-- The @create disk snapshot@ operation supports tag-based access control via request tags. For more information, see the <https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags Lightsail Dev Guide> .
module Network.AWS.Lightsail.CreateDiskSnapshot
  ( -- * Creating a Request
    createDiskSnapshot,
    CreateDiskSnapshot,

    -- * Request Lenses
    cdsInstanceName,
    cdsTags,
    cdsDiskName,
    cdsDiskSnapshotName,

    -- * Destructuring the Response
    createDiskSnapshotResponse,
    CreateDiskSnapshotResponse,

    -- * Response Lenses
    cdsrrsOperations,
    cdsrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createDiskSnapshot' smart constructor.
data CreateDiskSnapshot = CreateDiskSnapshot'
  { _cdsInstanceName ::
      !(Maybe Text),
    _cdsTags :: !(Maybe [Tag]),
    _cdsDiskName :: !(Maybe Text),
    _cdsDiskSnapshotName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateDiskSnapshot' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsInstanceName' - The unique name of the source instance (e.g., @Amazon_Linux-512MB-Virginia-1@ ). When this is defined, a snapshot of the instance's system volume is created.
--
-- * 'cdsTags' - The tag keys and optional values to add to the resource during create. Use the @TagResource@ action to tag a resource after it's created.
--
-- * 'cdsDiskName' - The unique name of the source disk (e.g., @Disk-Virginia-1@ ).
--
-- * 'cdsDiskSnapshotName' - The name of the destination disk snapshot (e.g., @my-disk-snapshot@ ) based on the source disk.
createDiskSnapshot ::
  -- | 'cdsDiskSnapshotName'
  Text ->
  CreateDiskSnapshot
createDiskSnapshot pDiskSnapshotName_ =
  CreateDiskSnapshot'
    { _cdsInstanceName = Nothing,
      _cdsTags = Nothing,
      _cdsDiskName = Nothing,
      _cdsDiskSnapshotName = pDiskSnapshotName_
    }

-- | The unique name of the source instance (e.g., @Amazon_Linux-512MB-Virginia-1@ ). When this is defined, a snapshot of the instance's system volume is created.
cdsInstanceName :: Lens' CreateDiskSnapshot (Maybe Text)
cdsInstanceName = lens _cdsInstanceName (\s a -> s {_cdsInstanceName = a})

-- | The tag keys and optional values to add to the resource during create. Use the @TagResource@ action to tag a resource after it's created.
cdsTags :: Lens' CreateDiskSnapshot [Tag]
cdsTags = lens _cdsTags (\s a -> s {_cdsTags = a}) . _Default . _Coerce

-- | The unique name of the source disk (e.g., @Disk-Virginia-1@ ).
cdsDiskName :: Lens' CreateDiskSnapshot (Maybe Text)
cdsDiskName = lens _cdsDiskName (\s a -> s {_cdsDiskName = a})

-- | The name of the destination disk snapshot (e.g., @my-disk-snapshot@ ) based on the source disk.
cdsDiskSnapshotName :: Lens' CreateDiskSnapshot Text
cdsDiskSnapshotName = lens _cdsDiskSnapshotName (\s a -> s {_cdsDiskSnapshotName = a})

instance AWSRequest CreateDiskSnapshot where
  type
    Rs CreateDiskSnapshot =
      CreateDiskSnapshotResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          CreateDiskSnapshotResponse'
            <$> (x .?> "operations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable CreateDiskSnapshot

instance NFData CreateDiskSnapshot

instance ToHeaders CreateDiskSnapshot where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.CreateDiskSnapshot" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateDiskSnapshot where
  toJSON CreateDiskSnapshot' {..} =
    object
      ( catMaybes
          [ ("instanceName" .=) <$> _cdsInstanceName,
            ("tags" .=) <$> _cdsTags,
            ("diskName" .=) <$> _cdsDiskName,
            Just ("diskSnapshotName" .= _cdsDiskSnapshotName)
          ]
      )

instance ToPath CreateDiskSnapshot where
  toPath = const "/"

instance ToQuery CreateDiskSnapshot where
  toQuery = const mempty

-- | /See:/ 'createDiskSnapshotResponse' smart constructor.
data CreateDiskSnapshotResponse = CreateDiskSnapshotResponse'
  { _cdsrrsOperations ::
      !( Maybe
           [Operation]
       ),
    _cdsrrsResponseStatus ::
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

-- | Creates a value of 'CreateDiskSnapshotResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsrrsOperations' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'cdsrrsResponseStatus' - -- | The response status code.
createDiskSnapshotResponse ::
  -- | 'cdsrrsResponseStatus'
  Int ->
  CreateDiskSnapshotResponse
createDiskSnapshotResponse pResponseStatus_ =
  CreateDiskSnapshotResponse'
    { _cdsrrsOperations =
        Nothing,
      _cdsrrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
cdsrrsOperations :: Lens' CreateDiskSnapshotResponse [Operation]
cdsrrsOperations = lens _cdsrrsOperations (\s a -> s {_cdsrrsOperations = a}) . _Default . _Coerce

-- | -- | The response status code.
cdsrrsResponseStatus :: Lens' CreateDiskSnapshotResponse Int
cdsrrsResponseStatus = lens _cdsrrsResponseStatus (\s a -> s {_cdsrrsResponseStatus = a})

instance NFData CreateDiskSnapshotResponse
