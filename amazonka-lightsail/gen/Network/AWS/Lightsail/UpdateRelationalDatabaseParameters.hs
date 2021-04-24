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
-- Module      : Network.AWS.Lightsail.UpdateRelationalDatabaseParameters
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Allows the update of one or more parameters of a database in Amazon Lightsail.
--
--
-- Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: @dynamic@ or @pending-reboot@ . Parameters marked with a @dynamic@ apply type are applied immediately. Parameters marked with a @pending-reboot@ apply type are applied only after the database is rebooted using the @reboot relational database@ operation.
--
-- The @update relational database parameters@ operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags Lightsail Dev Guide> .
module Network.AWS.Lightsail.UpdateRelationalDatabaseParameters
  ( -- * Creating a Request
    updateRelationalDatabaseParameters,
    UpdateRelationalDatabaseParameters,

    -- * Request Lenses
    urdpRelationalDatabaseName,
    urdpParameters,

    -- * Destructuring the Response
    updateRelationalDatabaseParametersResponse,
    UpdateRelationalDatabaseParametersResponse,

    -- * Response Lenses
    urdprrsOperations,
    urdprrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updateRelationalDatabaseParameters' smart constructor.
data UpdateRelationalDatabaseParameters = UpdateRelationalDatabaseParameters'
  { _urdpRelationalDatabaseName ::
      !Text,
    _urdpParameters ::
      ![RelationalDatabaseParameter]
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'UpdateRelationalDatabaseParameters' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'urdpRelationalDatabaseName' - The name of your database for which to update parameters.
--
-- * 'urdpParameters' - The database parameters to update.
updateRelationalDatabaseParameters ::
  -- | 'urdpRelationalDatabaseName'
  Text ->
  UpdateRelationalDatabaseParameters
updateRelationalDatabaseParameters
  pRelationalDatabaseName_ =
    UpdateRelationalDatabaseParameters'
      { _urdpRelationalDatabaseName =
          pRelationalDatabaseName_,
        _urdpParameters = mempty
      }

-- | The name of your database for which to update parameters.
urdpRelationalDatabaseName :: Lens' UpdateRelationalDatabaseParameters Text
urdpRelationalDatabaseName = lens _urdpRelationalDatabaseName (\s a -> s {_urdpRelationalDatabaseName = a})

-- | The database parameters to update.
urdpParameters :: Lens' UpdateRelationalDatabaseParameters [RelationalDatabaseParameter]
urdpParameters = lens _urdpParameters (\s a -> s {_urdpParameters = a}) . _Coerce

instance
  AWSRequest
    UpdateRelationalDatabaseParameters
  where
  type
    Rs UpdateRelationalDatabaseParameters =
      UpdateRelationalDatabaseParametersResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          UpdateRelationalDatabaseParametersResponse'
            <$> (x .?> "operations" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable UpdateRelationalDatabaseParameters

instance NFData UpdateRelationalDatabaseParameters

instance ToHeaders UpdateRelationalDatabaseParameters where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.UpdateRelationalDatabaseParameters" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON UpdateRelationalDatabaseParameters where
  toJSON UpdateRelationalDatabaseParameters' {..} =
    object
      ( catMaybes
          [ Just
              ( "relationalDatabaseName"
                  .= _urdpRelationalDatabaseName
              ),
            Just ("parameters" .= _urdpParameters)
          ]
      )

instance ToPath UpdateRelationalDatabaseParameters where
  toPath = const "/"

instance ToQuery UpdateRelationalDatabaseParameters where
  toQuery = const mempty

-- | /See:/ 'updateRelationalDatabaseParametersResponse' smart constructor.
data UpdateRelationalDatabaseParametersResponse = UpdateRelationalDatabaseParametersResponse'
  { _urdprrsOperations ::
      !( Maybe
           [Operation]
       ),
    _urdprrsResponseStatus ::
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

-- | Creates a value of 'UpdateRelationalDatabaseParametersResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'urdprrsOperations' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'urdprrsResponseStatus' - -- | The response status code.
updateRelationalDatabaseParametersResponse ::
  -- | 'urdprrsResponseStatus'
  Int ->
  UpdateRelationalDatabaseParametersResponse
updateRelationalDatabaseParametersResponse
  pResponseStatus_ =
    UpdateRelationalDatabaseParametersResponse'
      { _urdprrsOperations =
          Nothing,
        _urdprrsResponseStatus =
          pResponseStatus_
      }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
urdprrsOperations :: Lens' UpdateRelationalDatabaseParametersResponse [Operation]
urdprrsOperations = lens _urdprrsOperations (\s a -> s {_urdprrsOperations = a}) . _Default . _Coerce

-- | -- | The response status code.
urdprrsResponseStatus :: Lens' UpdateRelationalDatabaseParametersResponse Int
urdprrsResponseStatus = lens _urdprrsResponseStatus (\s a -> s {_urdprrsResponseStatus = a})

instance
  NFData
    UpdateRelationalDatabaseParametersResponse
