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
-- Module      : Network.AWS.Lightsail.PutInstancePublicPorts
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your @PutInstancePublicPorts@ request. Or use the @OpenInstancePublicPorts@ action to open ports without closing currently open ports.
--
--
-- The @PutInstancePublicPorts@ action supports tag-based access control via resource tags applied to the resource identified by @instanceName@ . For more information, see the <https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags Lightsail Dev Guide> .
module Network.AWS.Lightsail.PutInstancePublicPorts
  ( -- * Creating a Request
    putInstancePublicPorts,
    PutInstancePublicPorts,

    -- * Request Lenses
    pippPortInfos,
    pippInstanceName,

    -- * Destructuring the Response
    putInstancePublicPortsResponse,
    PutInstancePublicPortsResponse,

    -- * Response Lenses
    pipprrsOperation,
    pipprrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'putInstancePublicPorts' smart constructor.
data PutInstancePublicPorts = PutInstancePublicPorts'
  { _pippPortInfos ::
      ![PortInfo],
    _pippInstanceName ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'PutInstancePublicPorts' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pippPortInfos' - An array of objects to describe the ports to open for the specified instance.
--
-- * 'pippInstanceName' - The name of the instance for which to open ports.
putInstancePublicPorts ::
  -- | 'pippInstanceName'
  Text ->
  PutInstancePublicPorts
putInstancePublicPorts pInstanceName_ =
  PutInstancePublicPorts'
    { _pippPortInfos = mempty,
      _pippInstanceName = pInstanceName_
    }

-- | An array of objects to describe the ports to open for the specified instance.
pippPortInfos :: Lens' PutInstancePublicPorts [PortInfo]
pippPortInfos = lens _pippPortInfos (\s a -> s {_pippPortInfos = a}) . _Coerce

-- | The name of the instance for which to open ports.
pippInstanceName :: Lens' PutInstancePublicPorts Text
pippInstanceName = lens _pippInstanceName (\s a -> s {_pippInstanceName = a})

instance AWSRequest PutInstancePublicPorts where
  type
    Rs PutInstancePublicPorts =
      PutInstancePublicPortsResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          PutInstancePublicPortsResponse'
            <$> (x .?> "operation") <*> (pure (fromEnum s))
      )

instance Hashable PutInstancePublicPorts

instance NFData PutInstancePublicPorts

instance ToHeaders PutInstancePublicPorts where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.PutInstancePublicPorts" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON PutInstancePublicPorts where
  toJSON PutInstancePublicPorts' {..} =
    object
      ( catMaybes
          [ Just ("portInfos" .= _pippPortInfos),
            Just ("instanceName" .= _pippInstanceName)
          ]
      )

instance ToPath PutInstancePublicPorts where
  toPath = const "/"

instance ToQuery PutInstancePublicPorts where
  toQuery = const mempty

-- | /See:/ 'putInstancePublicPortsResponse' smart constructor.
data PutInstancePublicPortsResponse = PutInstancePublicPortsResponse'
  { _pipprrsOperation ::
      !( Maybe
           Operation
       ),
    _pipprrsResponseStatus ::
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

-- | Creates a value of 'PutInstancePublicPortsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pipprrsOperation' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'pipprrsResponseStatus' - -- | The response status code.
putInstancePublicPortsResponse ::
  -- | 'pipprrsResponseStatus'
  Int ->
  PutInstancePublicPortsResponse
putInstancePublicPortsResponse pResponseStatus_ =
  PutInstancePublicPortsResponse'
    { _pipprrsOperation =
        Nothing,
      _pipprrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
pipprrsOperation :: Lens' PutInstancePublicPortsResponse (Maybe Operation)
pipprrsOperation = lens _pipprrsOperation (\s a -> s {_pipprrsOperation = a})

-- | -- | The response status code.
pipprrsResponseStatus :: Lens' PutInstancePublicPortsResponse Int
pipprrsResponseStatus = lens _pipprrsResponseStatus (\s a -> s {_pipprrsResponseStatus = a})

instance NFData PutInstancePublicPortsResponse
