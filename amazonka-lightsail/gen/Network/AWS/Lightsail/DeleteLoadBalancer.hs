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
-- Module      : Network.AWS.Lightsail.DeleteLoadBalancer
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.
--
--
-- The @delete load balancer@ operation supports tag-based access control via resource tags applied to the resource identified by @load balancer name@ . For more information, see the <https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags Lightsail Dev Guide> .
module Network.AWS.Lightsail.DeleteLoadBalancer
  ( -- * Creating a Request
    deleteLoadBalancer,
    DeleteLoadBalancer,

    -- * Request Lenses
    dlbLoadBalancerName,

    -- * Destructuring the Response
    deleteLoadBalancerResponse,
    DeleteLoadBalancerResponse,

    -- * Response Lenses
    dlbrrsOperations,
    dlbrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteLoadBalancer' smart constructor.
newtype DeleteLoadBalancer = DeleteLoadBalancer'
  { _dlbLoadBalancerName ::
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

-- | Creates a value of 'DeleteLoadBalancer' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlbLoadBalancerName' - The name of the load balancer you want to delete.
deleteLoadBalancer ::
  -- | 'dlbLoadBalancerName'
  Text ->
  DeleteLoadBalancer
deleteLoadBalancer pLoadBalancerName_ =
  DeleteLoadBalancer'
    { _dlbLoadBalancerName =
        pLoadBalancerName_
    }

-- | The name of the load balancer you want to delete.
dlbLoadBalancerName :: Lens' DeleteLoadBalancer Text
dlbLoadBalancerName = lens _dlbLoadBalancerName (\s a -> s {_dlbLoadBalancerName = a})

instance AWSRequest DeleteLoadBalancer where
  type
    Rs DeleteLoadBalancer =
      DeleteLoadBalancerResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          DeleteLoadBalancerResponse'
            <$> (x .?> "operations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable DeleteLoadBalancer

instance NFData DeleteLoadBalancer

instance ToHeaders DeleteLoadBalancer where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.DeleteLoadBalancer" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteLoadBalancer where
  toJSON DeleteLoadBalancer' {..} =
    object
      ( catMaybes
          [Just ("loadBalancerName" .= _dlbLoadBalancerName)]
      )

instance ToPath DeleteLoadBalancer where
  toPath = const "/"

instance ToQuery DeleteLoadBalancer where
  toQuery = const mempty

-- | /See:/ 'deleteLoadBalancerResponse' smart constructor.
data DeleteLoadBalancerResponse = DeleteLoadBalancerResponse'
  { _dlbrrsOperations ::
      !( Maybe
           [Operation]
       ),
    _dlbrrsResponseStatus ::
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

-- | Creates a value of 'DeleteLoadBalancerResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlbrrsOperations' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'dlbrrsResponseStatus' - -- | The response status code.
deleteLoadBalancerResponse ::
  -- | 'dlbrrsResponseStatus'
  Int ->
  DeleteLoadBalancerResponse
deleteLoadBalancerResponse pResponseStatus_ =
  DeleteLoadBalancerResponse'
    { _dlbrrsOperations =
        Nothing,
      _dlbrrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
dlbrrsOperations :: Lens' DeleteLoadBalancerResponse [Operation]
dlbrrsOperations = lens _dlbrrsOperations (\s a -> s {_dlbrrsOperations = a}) . _Default . _Coerce

-- | -- | The response status code.
dlbrrsResponseStatus :: Lens' DeleteLoadBalancerResponse Int
dlbrrsResponseStatus = lens _dlbrrsResponseStatus (\s a -> s {_dlbrrsResponseStatus = a})

instance NFData DeleteLoadBalancerResponse
