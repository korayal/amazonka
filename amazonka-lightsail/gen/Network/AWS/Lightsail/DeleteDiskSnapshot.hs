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
-- Module      : Network.AWS.Lightsail.DeleteDiskSnapshot
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified disk snapshot.
--
--
-- When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.
--
-- The @delete disk snapshot@ operation supports tag-based access control via resource tags applied to the resource identified by @disk snapshot name@ . For more information, see the <https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags Lightsail Dev Guide> .
module Network.AWS.Lightsail.DeleteDiskSnapshot
  ( -- * Creating a Request
    deleteDiskSnapshot,
    DeleteDiskSnapshot,

    -- * Request Lenses
    ddsDiskSnapshotName,

    -- * Destructuring the Response
    deleteDiskSnapshotResponse,
    DeleteDiskSnapshotResponse,

    -- * Response Lenses
    ddsrrsOperations,
    ddsrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteDiskSnapshot' smart constructor.
newtype DeleteDiskSnapshot = DeleteDiskSnapshot'
  { _ddsDiskSnapshotName ::
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

-- | Creates a value of 'DeleteDiskSnapshot' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddsDiskSnapshotName' - The name of the disk snapshot you want to delete (e.g., @my-disk-snapshot@ ).
deleteDiskSnapshot ::
  -- | 'ddsDiskSnapshotName'
  Text ->
  DeleteDiskSnapshot
deleteDiskSnapshot pDiskSnapshotName_ =
  DeleteDiskSnapshot'
    { _ddsDiskSnapshotName =
        pDiskSnapshotName_
    }

-- | The name of the disk snapshot you want to delete (e.g., @my-disk-snapshot@ ).
ddsDiskSnapshotName :: Lens' DeleteDiskSnapshot Text
ddsDiskSnapshotName = lens _ddsDiskSnapshotName (\s a -> s {_ddsDiskSnapshotName = a})

instance AWSRequest DeleteDiskSnapshot where
  type
    Rs DeleteDiskSnapshot =
      DeleteDiskSnapshotResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          DeleteDiskSnapshotResponse'
            <$> (x .?> "operations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable DeleteDiskSnapshot

instance NFData DeleteDiskSnapshot

instance ToHeaders DeleteDiskSnapshot where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.DeleteDiskSnapshot" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteDiskSnapshot where
  toJSON DeleteDiskSnapshot' {..} =
    object
      ( catMaybes
          [Just ("diskSnapshotName" .= _ddsDiskSnapshotName)]
      )

instance ToPath DeleteDiskSnapshot where
  toPath = const "/"

instance ToQuery DeleteDiskSnapshot where
  toQuery = const mempty

-- | /See:/ 'deleteDiskSnapshotResponse' smart constructor.
data DeleteDiskSnapshotResponse = DeleteDiskSnapshotResponse'
  { _ddsrrsOperations ::
      !( Maybe
           [Operation]
       ),
    _ddsrrsResponseStatus ::
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

-- | Creates a value of 'DeleteDiskSnapshotResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ddsrrsOperations' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'ddsrrsResponseStatus' - -- | The response status code.
deleteDiskSnapshotResponse ::
  -- | 'ddsrrsResponseStatus'
  Int ->
  DeleteDiskSnapshotResponse
deleteDiskSnapshotResponse pResponseStatus_ =
  DeleteDiskSnapshotResponse'
    { _ddsrrsOperations =
        Nothing,
      _ddsrrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
ddsrrsOperations :: Lens' DeleteDiskSnapshotResponse [Operation]
ddsrrsOperations = lens _ddsrrsOperations (\s a -> s {_ddsrrsOperations = a}) . _Default . _Coerce

-- | -- | The response status code.
ddsrrsResponseStatus :: Lens' DeleteDiskSnapshotResponse Int
ddsrrsResponseStatus = lens _ddsrrsResponseStatus (\s a -> s {_ddsrrsResponseStatus = a})

instance NFData DeleteDiskSnapshotResponse
