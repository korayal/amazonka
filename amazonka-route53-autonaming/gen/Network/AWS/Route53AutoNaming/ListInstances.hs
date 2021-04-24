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
-- Module      : Network.AWS.Route53AutoNaming.ListInstances
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists summary information about the instances that you registered by using a specified service.
--
--
--
-- This operation returns paginated results.
module Network.AWS.Route53AutoNaming.ListInstances
  ( -- * Creating a Request
    listInstances,
    ListInstances,

    -- * Request Lenses
    liNextToken,
    liMaxResults,
    liServiceId,

    -- * Destructuring the Response
    listInstancesResponse,
    ListInstancesResponse,

    -- * Response Lenses
    lirrsNextToken,
    lirrsInstances,
    lirrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Route53AutoNaming.Types

-- | /See:/ 'listInstances' smart constructor.
data ListInstances = ListInstances'
  { _liNextToken ::
      !(Maybe Text),
    _liMaxResults :: !(Maybe Nat),
    _liServiceId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListInstances' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'liNextToken' - For the first @ListInstances@ request, omit this value. If more than @MaxResults@ instances match the specified criteria, you can submit another @ListInstances@ request to get the next group of results. Specify the value of @NextToken@ from the previous response in the next request.
--
-- * 'liMaxResults' - The maximum number of instances that you want AWS Cloud Map to return in the response to a @ListInstances@ request. If you don't specify a value for @MaxResults@ , AWS Cloud Map returns up to 100 instances.
--
-- * 'liServiceId' - The ID of the service that you want to list instances for.
listInstances ::
  -- | 'liServiceId'
  Text ->
  ListInstances
listInstances pServiceId_ =
  ListInstances'
    { _liNextToken = Nothing,
      _liMaxResults = Nothing,
      _liServiceId = pServiceId_
    }

-- | For the first @ListInstances@ request, omit this value. If more than @MaxResults@ instances match the specified criteria, you can submit another @ListInstances@ request to get the next group of results. Specify the value of @NextToken@ from the previous response in the next request.
liNextToken :: Lens' ListInstances (Maybe Text)
liNextToken = lens _liNextToken (\s a -> s {_liNextToken = a})

-- | The maximum number of instances that you want AWS Cloud Map to return in the response to a @ListInstances@ request. If you don't specify a value for @MaxResults@ , AWS Cloud Map returns up to 100 instances.
liMaxResults :: Lens' ListInstances (Maybe Natural)
liMaxResults = lens _liMaxResults (\s a -> s {_liMaxResults = a}) . mapping _Nat

-- | The ID of the service that you want to list instances for.
liServiceId :: Lens' ListInstances Text
liServiceId = lens _liServiceId (\s a -> s {_liServiceId = a})

instance AWSPager ListInstances where
  page rq rs
    | stop (rs ^. lirrsNextToken) = Nothing
    | stop (rs ^. lirrsInstances) = Nothing
    | otherwise =
      Just $ rq & liNextToken .~ rs ^. lirrsNextToken

instance AWSRequest ListInstances where
  type Rs ListInstances = ListInstancesResponse
  request = postJSON route53AutoNaming
  response =
    receiveJSON
      ( \s h x ->
          ListInstancesResponse'
            <$> (x .?> "NextToken")
            <*> (x .?> "Instances" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListInstances

instance NFData ListInstances

instance ToHeaders ListInstances where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Route53AutoNaming_v20170314.ListInstances" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ListInstances where
  toJSON ListInstances' {..} =
    object
      ( catMaybes
          [ ("NextToken" .=) <$> _liNextToken,
            ("MaxResults" .=) <$> _liMaxResults,
            Just ("ServiceId" .= _liServiceId)
          ]
      )

instance ToPath ListInstances where
  toPath = const "/"

instance ToQuery ListInstances where
  toQuery = const mempty

-- | /See:/ 'listInstancesResponse' smart constructor.
data ListInstancesResponse = ListInstancesResponse'
  { _lirrsNextToken ::
      !(Maybe Text),
    _lirrsInstances ::
      !(Maybe [InstanceSummary]),
    _lirrsResponseStatus ::
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

-- | Creates a value of 'ListInstancesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lirrsNextToken' - If more than @MaxResults@ instances match the specified criteria, you can submit another @ListInstances@ request to get the next group of results. Specify the value of @NextToken@ from the previous response in the next request.
--
-- * 'lirrsInstances' - Summary information about the instances that are associated with the specified service.
--
-- * 'lirrsResponseStatus' - -- | The response status code.
listInstancesResponse ::
  -- | 'lirrsResponseStatus'
  Int ->
  ListInstancesResponse
listInstancesResponse pResponseStatus_ =
  ListInstancesResponse'
    { _lirrsNextToken = Nothing,
      _lirrsInstances = Nothing,
      _lirrsResponseStatus = pResponseStatus_
    }

-- | If more than @MaxResults@ instances match the specified criteria, you can submit another @ListInstances@ request to get the next group of results. Specify the value of @NextToken@ from the previous response in the next request.
lirrsNextToken :: Lens' ListInstancesResponse (Maybe Text)
lirrsNextToken = lens _lirrsNextToken (\s a -> s {_lirrsNextToken = a})

-- | Summary information about the instances that are associated with the specified service.
lirrsInstances :: Lens' ListInstancesResponse [InstanceSummary]
lirrsInstances = lens _lirrsInstances (\s a -> s {_lirrsInstances = a}) . _Default . _Coerce

-- | -- | The response status code.
lirrsResponseStatus :: Lens' ListInstancesResponse Int
lirrsResponseStatus = lens _lirrsResponseStatus (\s a -> s {_lirrsResponseStatus = a})

instance NFData ListInstancesResponse
