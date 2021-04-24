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
-- Module      : Network.AWS.SES.CreateConfigurationSetTrackingOptions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an association between a configuration set and a custom domain for open and click event tracking.
--
--
-- By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html Amazon SES Developer Guide> .
module Network.AWS.SES.CreateConfigurationSetTrackingOptions
  ( -- * Creating a Request
    createConfigurationSetTrackingOptions,
    CreateConfigurationSetTrackingOptions,

    -- * Request Lenses
    ccstoConfigurationSetName,
    ccstoTrackingOptions,

    -- * Destructuring the Response
    createConfigurationSetTrackingOptionsResponse,
    CreateConfigurationSetTrackingOptionsResponse,

    -- * Response Lenses
    ccstorrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SES.Types

-- | Represents a request to create an open and click tracking option object in a configuration set.
--
--
--
-- /See:/ 'createConfigurationSetTrackingOptions' smart constructor.
data CreateConfigurationSetTrackingOptions = CreateConfigurationSetTrackingOptions'
  { _ccstoConfigurationSetName ::
      !Text,
    _ccstoTrackingOptions ::
      !TrackingOptions
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateConfigurationSetTrackingOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccstoConfigurationSetName' - The name of the configuration set that the tracking options should be associated with.
--
-- * 'ccstoTrackingOptions' - Undocumented member.
createConfigurationSetTrackingOptions ::
  -- | 'ccstoConfigurationSetName'
  Text ->
  -- | 'ccstoTrackingOptions'
  TrackingOptions ->
  CreateConfigurationSetTrackingOptions
createConfigurationSetTrackingOptions
  pConfigurationSetName_
  pTrackingOptions_ =
    CreateConfigurationSetTrackingOptions'
      { _ccstoConfigurationSetName =
          pConfigurationSetName_,
        _ccstoTrackingOptions =
          pTrackingOptions_
      }

-- | The name of the configuration set that the tracking options should be associated with.
ccstoConfigurationSetName :: Lens' CreateConfigurationSetTrackingOptions Text
ccstoConfigurationSetName = lens _ccstoConfigurationSetName (\s a -> s {_ccstoConfigurationSetName = a})

-- | Undocumented member.
ccstoTrackingOptions :: Lens' CreateConfigurationSetTrackingOptions TrackingOptions
ccstoTrackingOptions = lens _ccstoTrackingOptions (\s a -> s {_ccstoTrackingOptions = a})

instance
  AWSRequest
    CreateConfigurationSetTrackingOptions
  where
  type
    Rs CreateConfigurationSetTrackingOptions =
      CreateConfigurationSetTrackingOptionsResponse
  request = postQuery ses
  response =
    receiveXMLWrapper
      "CreateConfigurationSetTrackingOptionsResult"
      ( \s h x ->
          CreateConfigurationSetTrackingOptionsResponse'
            <$> (pure (fromEnum s))
      )

instance
  Hashable
    CreateConfigurationSetTrackingOptions

instance NFData CreateConfigurationSetTrackingOptions

instance
  ToHeaders
    CreateConfigurationSetTrackingOptions
  where
  toHeaders = const mempty

instance ToPath CreateConfigurationSetTrackingOptions where
  toPath = const "/"

instance
  ToQuery
    CreateConfigurationSetTrackingOptions
  where
  toQuery CreateConfigurationSetTrackingOptions' {..} =
    mconcat
      [ "Action"
          =: ( "CreateConfigurationSetTrackingOptions" ::
                 ByteString
             ),
        "Version" =: ("2010-12-01" :: ByteString),
        "ConfigurationSetName" =: _ccstoConfigurationSetName,
        "TrackingOptions" =: _ccstoTrackingOptions
      ]

-- | An empty element returned on a successful request.
--
--
--
-- /See:/ 'createConfigurationSetTrackingOptionsResponse' smart constructor.
newtype CreateConfigurationSetTrackingOptionsResponse = CreateConfigurationSetTrackingOptionsResponse'
  { _ccstorrsResponseStatus ::
      Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateConfigurationSetTrackingOptionsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccstorrsResponseStatus' - -- | The response status code.
createConfigurationSetTrackingOptionsResponse ::
  -- | 'ccstorrsResponseStatus'
  Int ->
  CreateConfigurationSetTrackingOptionsResponse
createConfigurationSetTrackingOptionsResponse
  pResponseStatus_ =
    CreateConfigurationSetTrackingOptionsResponse'
      { _ccstorrsResponseStatus =
          pResponseStatus_
      }

-- | -- | The response status code.
ccstorrsResponseStatus :: Lens' CreateConfigurationSetTrackingOptionsResponse Int
ccstorrsResponseStatus = lens _ccstorrsResponseStatus (\s a -> s {_ccstorrsResponseStatus = a})

instance
  NFData
    CreateConfigurationSetTrackingOptionsResponse
