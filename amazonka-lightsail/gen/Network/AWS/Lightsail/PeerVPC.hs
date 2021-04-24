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
-- Module      : Network.AWS.Lightsail.PeerVPC
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Tries to peer the Lightsail VPC with the user's default VPC.
module Network.AWS.Lightsail.PeerVPC
  ( -- * Creating a Request
    peerVPC,
    PeerVPC,

    -- * Destructuring the Response
    peerVPCResponse,
    PeerVPCResponse,

    -- * Response Lenses
    pvrrsOperation,
    pvrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'peerVPC' smart constructor.
data PeerVPC = PeerVPC'
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'PeerVPC' with the minimum fields required to make a request.
peerVPC ::
  PeerVPC
peerVPC = PeerVPC'

instance AWSRequest PeerVPC where
  type Rs PeerVPC = PeerVPCResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          PeerVPCResponse'
            <$> (x .?> "operation") <*> (pure (fromEnum s))
      )

instance Hashable PeerVPC

instance NFData PeerVPC

instance ToHeaders PeerVPC where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("Lightsail_20161128.PeerVpc" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON PeerVPC where
  toJSON = const (Object mempty)

instance ToPath PeerVPC where
  toPath = const "/"

instance ToQuery PeerVPC where
  toQuery = const mempty

-- | /See:/ 'peerVPCResponse' smart constructor.
data PeerVPCResponse = PeerVPCResponse'
  { _pvrrsOperation ::
      !(Maybe Operation),
    _pvrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'PeerVPCResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pvrrsOperation' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'pvrrsResponseStatus' - -- | The response status code.
peerVPCResponse ::
  -- | 'pvrrsResponseStatus'
  Int ->
  PeerVPCResponse
peerVPCResponse pResponseStatus_ =
  PeerVPCResponse'
    { _pvrrsOperation = Nothing,
      _pvrrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
pvrrsOperation :: Lens' PeerVPCResponse (Maybe Operation)
pvrrsOperation = lens _pvrrsOperation (\s a -> s {_pvrrsOperation = a})

-- | -- | The response status code.
pvrrsResponseStatus :: Lens' PeerVPCResponse Int
pvrrsResponseStatus = lens _pvrrsResponseStatus (\s a -> s {_pvrrsResponseStatus = a})

instance NFData PeerVPCResponse
