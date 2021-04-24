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
-- Module      : Network.AWS.Lightsail.GetDomain
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns information about a specific domain recordset.
module Network.AWS.Lightsail.GetDomain
  ( -- * Creating a Request
    getDomain,
    GetDomain,

    -- * Request Lenses
    gdDomainName,

    -- * Destructuring the Response
    getDomainResponse,
    GetDomainResponse,

    -- * Response Lenses
    getdomainresponseersDomain,
    getdomainresponseersResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getDomain' smart constructor.
newtype GetDomain = GetDomain' {_gdDomainName :: Text}
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetDomain' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gdDomainName' - The domain name for which your want to return information about.
getDomain ::
  -- | 'gdDomainName'
  Text ->
  GetDomain
getDomain pDomainName_ =
  GetDomain' {_gdDomainName = pDomainName_}

-- | The domain name for which your want to return information about.
gdDomainName :: Lens' GetDomain Text
gdDomainName = lens _gdDomainName (\s a -> s {_gdDomainName = a})

instance AWSRequest GetDomain where
  type Rs GetDomain = GetDomainResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          GetDomainResponse'
            <$> (x .?> "domain") <*> (pure (fromEnum s))
      )

instance Hashable GetDomain

instance NFData GetDomain

instance ToHeaders GetDomain where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("Lightsail_20161128.GetDomain" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON GetDomain where
  toJSON GetDomain' {..} =
    object
      (catMaybes [Just ("domainName" .= _gdDomainName)])

instance ToPath GetDomain where
  toPath = const "/"

instance ToQuery GetDomain where
  toQuery = const mempty

-- | /See:/ 'getDomainResponse' smart constructor.
data GetDomainResponse = GetDomainResponse'
  { _getdomainresponseersDomain ::
      !(Maybe Domain),
    _getdomainresponseersResponseStatus ::
      !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetDomainResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'getdomainresponseersDomain' - An array of key-value pairs containing information about your get domain request.
--
-- * 'getdomainresponseersResponseStatus' - -- | The response status code.
getDomainResponse ::
  -- | 'getdomainresponseersResponseStatus'
  Int ->
  GetDomainResponse
getDomainResponse pResponseStatus_ =
  GetDomainResponse'
    { _getdomainresponseersDomain =
        Nothing,
      _getdomainresponseersResponseStatus =
        pResponseStatus_
    }

-- | An array of key-value pairs containing information about your get domain request.
getdomainresponseersDomain :: Lens' GetDomainResponse (Maybe Domain)
getdomainresponseersDomain = lens _getdomainresponseersDomain (\s a -> s {_getdomainresponseersDomain = a})

-- | -- | The response status code.
getdomainresponseersResponseStatus :: Lens' GetDomainResponse Int
getdomainresponseersResponseStatus = lens _getdomainresponseersResponseStatus (\s a -> s {_getdomainresponseersResponseStatus = a})

instance NFData GetDomainResponse
