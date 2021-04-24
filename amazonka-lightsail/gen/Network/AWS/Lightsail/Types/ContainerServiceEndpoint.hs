{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.Types.ContainerServiceEndpoint
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Lightsail.Types.ContainerServiceEndpoint where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types.ContainerServiceHealthCheckConfig
import Network.AWS.Prelude

-- | Describes the public endpoint configuration of a deployment of an Amazon Lightsail container service.
--
--
--
-- /See:/ 'containerServiceEndpoint' smart constructor.
data ContainerServiceEndpoint = ContainerServiceEndpoint'
  { _cseContainerPort ::
      !(Maybe Int),
    _cseContainerName ::
      !(Maybe Text),
    _cseHealthCheck ::
      !( Maybe
           ContainerServiceHealthCheckConfig
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ContainerServiceEndpoint' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cseContainerPort' - The port of the specified container to which traffic is forwarded to.
--
-- * 'cseContainerName' - The name of the container entry of the deployment that the endpoint configuration applies to.
--
-- * 'cseHealthCheck' - An object that describes the health check configuration of the container.
containerServiceEndpoint ::
  ContainerServiceEndpoint
containerServiceEndpoint =
  ContainerServiceEndpoint'
    { _cseContainerPort =
        Nothing,
      _cseContainerName = Nothing,
      _cseHealthCheck = Nothing
    }

-- | The port of the specified container to which traffic is forwarded to.
cseContainerPort :: Lens' ContainerServiceEndpoint (Maybe Int)
cseContainerPort = lens _cseContainerPort (\s a -> s {_cseContainerPort = a})

-- | The name of the container entry of the deployment that the endpoint configuration applies to.
cseContainerName :: Lens' ContainerServiceEndpoint (Maybe Text)
cseContainerName = lens _cseContainerName (\s a -> s {_cseContainerName = a})

-- | An object that describes the health check configuration of the container.
cseHealthCheck :: Lens' ContainerServiceEndpoint (Maybe ContainerServiceHealthCheckConfig)
cseHealthCheck = lens _cseHealthCheck (\s a -> s {_cseHealthCheck = a})

instance FromJSON ContainerServiceEndpoint where
  parseJSON =
    withObject
      "ContainerServiceEndpoint"
      ( \x ->
          ContainerServiceEndpoint'
            <$> (x .:? "containerPort")
            <*> (x .:? "containerName")
            <*> (x .:? "healthCheck")
      )

instance Hashable ContainerServiceEndpoint

instance NFData ContainerServiceEndpoint
