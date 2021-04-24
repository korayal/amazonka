{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SES.Types.TrackingOptions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.SES.Types.TrackingOptions where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | A domain that is used to redirect email recipients to an Amazon SES-operated domain. This domain captures open and click events generated by Amazon SES emails.
--
--
-- For more information, see <https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html Configuring Custom Domains to Handle Open and Click Tracking> in the /Amazon SES Developer Guide/ .
--
--
-- /See:/ 'trackingOptions' smart constructor.
newtype TrackingOptions = TrackingOptions'
  { _toCustomRedirectDomain ::
      Maybe Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'TrackingOptions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'toCustomRedirectDomain' - The custom subdomain that will be used to redirect email recipients to the Amazon SES event tracking domain.
trackingOptions ::
  TrackingOptions
trackingOptions =
  TrackingOptions' {_toCustomRedirectDomain = Nothing}

-- | The custom subdomain that will be used to redirect email recipients to the Amazon SES event tracking domain.
toCustomRedirectDomain :: Lens' TrackingOptions (Maybe Text)
toCustomRedirectDomain = lens _toCustomRedirectDomain (\s a -> s {_toCustomRedirectDomain = a})

instance FromXML TrackingOptions where
  parseXML x =
    TrackingOptions' <$> (x .@? "CustomRedirectDomain")

instance Hashable TrackingOptions

instance NFData TrackingOptions

instance ToQuery TrackingOptions where
  toQuery TrackingOptions' {..} =
    mconcat
      ["CustomRedirectDomain" =: _toCustomRedirectDomain]
