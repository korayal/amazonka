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
-- Module      : Network.AWS.Lightsail.CreateCertificate
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution and a container service.
--
--
-- After the certificate is valid, use the @AttachCertificateToDistribution@ action to use the certificate and its domains with your distribution. Or use the @UpdateContainerService@ action to use the certificate and its domains with your container service.
--
-- /Important:/ Only certificates created in the @us-east-1@ AWS Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any AWS Region, and distribute its content globally. However, all distributions are located in the @us-east-1@ Region.
module Network.AWS.Lightsail.CreateCertificate
  ( -- * Creating a Request
    createCertificate,
    CreateCertificate,

    -- * Request Lenses
    ccSubjectAlternativeNames,
    ccTags,
    ccCertificateName,
    ccDomainName,

    -- * Destructuring the Response
    createCertificateResponse,
    CreateCertificateResponse,

    -- * Response Lenses
    ccrrsOperations,
    ccrrsCertificate,
    ccrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createCertificate' smart constructor.
data CreateCertificate = CreateCertificate'
  { _ccSubjectAlternativeNames ::
      !(Maybe [Text]),
    _ccTags :: !(Maybe [Tag]),
    _ccCertificateName :: !Text,
    _ccDomainName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateCertificate' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccSubjectAlternativeNames' - An array of strings that specify the alternate domains (e.g., @example2.com@ ) and subdomains (e.g., @blog.example.com@ ) for the certificate. You can specify a maximum of nine alternate domains (in addition to the primary domain name). Wildcard domain entries (e.g., @*.example.com@ ) are not supported.
--
-- * 'ccTags' - The tag keys and optional values to add to the certificate during create. Use the @TagResource@ action to tag a resource after it's created.
--
-- * 'ccCertificateName' - The name for the certificate.
--
-- * 'ccDomainName' - The domain name (e.g., @example.com@ ) for the certificate.
createCertificate ::
  -- | 'ccCertificateName'
  Text ->
  -- | 'ccDomainName'
  Text ->
  CreateCertificate
createCertificate pCertificateName_ pDomainName_ =
  CreateCertificate'
    { _ccSubjectAlternativeNames =
        Nothing,
      _ccTags = Nothing,
      _ccCertificateName = pCertificateName_,
      _ccDomainName = pDomainName_
    }

-- | An array of strings that specify the alternate domains (e.g., @example2.com@ ) and subdomains (e.g., @blog.example.com@ ) for the certificate. You can specify a maximum of nine alternate domains (in addition to the primary domain name). Wildcard domain entries (e.g., @*.example.com@ ) are not supported.
ccSubjectAlternativeNames :: Lens' CreateCertificate [Text]
ccSubjectAlternativeNames = lens _ccSubjectAlternativeNames (\s a -> s {_ccSubjectAlternativeNames = a}) . _Default . _Coerce

-- | The tag keys and optional values to add to the certificate during create. Use the @TagResource@ action to tag a resource after it's created.
ccTags :: Lens' CreateCertificate [Tag]
ccTags = lens _ccTags (\s a -> s {_ccTags = a}) . _Default . _Coerce

-- | The name for the certificate.
ccCertificateName :: Lens' CreateCertificate Text
ccCertificateName = lens _ccCertificateName (\s a -> s {_ccCertificateName = a})

-- | The domain name (e.g., @example.com@ ) for the certificate.
ccDomainName :: Lens' CreateCertificate Text
ccDomainName = lens _ccDomainName (\s a -> s {_ccDomainName = a})

instance AWSRequest CreateCertificate where
  type Rs CreateCertificate = CreateCertificateResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          CreateCertificateResponse'
            <$> (x .?> "operations" .!@ mempty)
            <*> (x .?> "certificate")
            <*> (pure (fromEnum s))
      )

instance Hashable CreateCertificate

instance NFData CreateCertificate

instance ToHeaders CreateCertificate where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.CreateCertificate" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateCertificate where
  toJSON CreateCertificate' {..} =
    object
      ( catMaybes
          [ ("subjectAlternativeNames" .=)
              <$> _ccSubjectAlternativeNames,
            ("tags" .=) <$> _ccTags,
            Just ("certificateName" .= _ccCertificateName),
            Just ("domainName" .= _ccDomainName)
          ]
      )

instance ToPath CreateCertificate where
  toPath = const "/"

instance ToQuery CreateCertificate where
  toQuery = const mempty

-- | /See:/ 'createCertificateResponse' smart constructor.
data CreateCertificateResponse = CreateCertificateResponse'
  { _ccrrsOperations ::
      !( Maybe
           [Operation]
       ),
    _ccrrsCertificate ::
      !( Maybe
           CertificateSummary
       ),
    _ccrrsResponseStatus ::
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

-- | Creates a value of 'CreateCertificateResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccrrsOperations' - An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
--
-- * 'ccrrsCertificate' - An object that describes the certificate created.
--
-- * 'ccrrsResponseStatus' - -- | The response status code.
createCertificateResponse ::
  -- | 'ccrrsResponseStatus'
  Int ->
  CreateCertificateResponse
createCertificateResponse pResponseStatus_ =
  CreateCertificateResponse'
    { _ccrrsOperations =
        Nothing,
      _ccrrsCertificate = Nothing,
      _ccrrsResponseStatus = pResponseStatus_
    }

-- | An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.
ccrrsOperations :: Lens' CreateCertificateResponse [Operation]
ccrrsOperations = lens _ccrrsOperations (\s a -> s {_ccrrsOperations = a}) . _Default . _Coerce

-- | An object that describes the certificate created.
ccrrsCertificate :: Lens' CreateCertificateResponse (Maybe CertificateSummary)
ccrrsCertificate = lens _ccrrsCertificate (\s a -> s {_ccrrsCertificate = a})

-- | -- | The response status code.
ccrrsResponseStatus :: Lens' CreateCertificateResponse Int
ccrrsResponseStatus = lens _ccrrsResponseStatus (\s a -> s {_ccrrsResponseStatus = a})

instance NFData CreateCertificateResponse
