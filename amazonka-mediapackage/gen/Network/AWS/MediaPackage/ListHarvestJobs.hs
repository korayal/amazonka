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
-- Module      : Network.AWS.MediaPackage.ListHarvestJobs
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a collection of HarvestJob records.
--
-- This operation returns paginated results.
module Network.AWS.MediaPackage.ListHarvestJobs
  ( -- * Creating a Request
    listHarvestJobs,
    ListHarvestJobs,

    -- * Request Lenses
    lhjNextToken,
    lhjMaxResults,
    lhjIncludeStatus,
    lhjIncludeChannelId,

    -- * Destructuring the Response
    listHarvestJobsResponse,
    ListHarvestJobsResponse,

    -- * Response Lenses
    lhjrrsNextToken,
    lhjrrsHarvestJobs,
    lhjrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.MediaPackage.Types
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listHarvestJobs' smart constructor.
data ListHarvestJobs = ListHarvestJobs'
  { _lhjNextToken ::
      !(Maybe Text),
    _lhjMaxResults :: !(Maybe Nat),
    _lhjIncludeStatus :: !(Maybe Text),
    _lhjIncludeChannelId :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ListHarvestJobs' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lhjNextToken' - A token used to resume pagination from the end of a previous request.
--
-- * 'lhjMaxResults' - The upper bound on the number of records to return.
--
-- * 'lhjIncludeStatus' - When specified, the request will return only HarvestJobs in the given status.
--
-- * 'lhjIncludeChannelId' - When specified, the request will return only HarvestJobs associated with the given Channel ID.
listHarvestJobs ::
  ListHarvestJobs
listHarvestJobs =
  ListHarvestJobs'
    { _lhjNextToken = Nothing,
      _lhjMaxResults = Nothing,
      _lhjIncludeStatus = Nothing,
      _lhjIncludeChannelId = Nothing
    }

-- | A token used to resume pagination from the end of a previous request.
lhjNextToken :: Lens' ListHarvestJobs (Maybe Text)
lhjNextToken = lens _lhjNextToken (\s a -> s {_lhjNextToken = a})

-- | The upper bound on the number of records to return.
lhjMaxResults :: Lens' ListHarvestJobs (Maybe Natural)
lhjMaxResults = lens _lhjMaxResults (\s a -> s {_lhjMaxResults = a}) . mapping _Nat

-- | When specified, the request will return only HarvestJobs in the given status.
lhjIncludeStatus :: Lens' ListHarvestJobs (Maybe Text)
lhjIncludeStatus = lens _lhjIncludeStatus (\s a -> s {_lhjIncludeStatus = a})

-- | When specified, the request will return only HarvestJobs associated with the given Channel ID.
lhjIncludeChannelId :: Lens' ListHarvestJobs (Maybe Text)
lhjIncludeChannelId = lens _lhjIncludeChannelId (\s a -> s {_lhjIncludeChannelId = a})

instance AWSPager ListHarvestJobs where
  page rq rs
    | stop (rs ^. lhjrrsNextToken) = Nothing
    | stop (rs ^. lhjrrsHarvestJobs) = Nothing
    | otherwise =
      Just $ rq & lhjNextToken .~ rs ^. lhjrrsNextToken

instance AWSRequest ListHarvestJobs where
  type Rs ListHarvestJobs = ListHarvestJobsResponse
  request = get mediaPackage
  response =
    receiveJSON
      ( \s h x ->
          ListHarvestJobsResponse'
            <$> (x .?> "nextToken")
            <*> (x .?> "harvestJobs" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable ListHarvestJobs

instance NFData ListHarvestJobs

instance ToHeaders ListHarvestJobs where
  toHeaders =
    const
      ( mconcat
          [ "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToPath ListHarvestJobs where
  toPath = const "/harvest_jobs"

instance ToQuery ListHarvestJobs where
  toQuery ListHarvestJobs' {..} =
    mconcat
      [ "nextToken" =: _lhjNextToken,
        "maxResults" =: _lhjMaxResults,
        "includeStatus" =: _lhjIncludeStatus,
        "includeChannelId" =: _lhjIncludeChannelId
      ]

-- | /See:/ 'listHarvestJobsResponse' smart constructor.
data ListHarvestJobsResponse = ListHarvestJobsResponse'
  { _lhjrrsNextToken ::
      !(Maybe Text),
    _lhjrrsHarvestJobs ::
      !(Maybe [HarvestJob]),
    _lhjrrsResponseStatus ::
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

-- | Creates a value of 'ListHarvestJobsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lhjrrsNextToken' - A token that can be used to resume pagination from the end of the collection.
--
-- * 'lhjrrsHarvestJobs' - A list of HarvestJob records.
--
-- * 'lhjrrsResponseStatus' - -- | The response status code.
listHarvestJobsResponse ::
  -- | 'lhjrrsResponseStatus'
  Int ->
  ListHarvestJobsResponse
listHarvestJobsResponse pResponseStatus_ =
  ListHarvestJobsResponse'
    { _lhjrrsNextToken =
        Nothing,
      _lhjrrsHarvestJobs = Nothing,
      _lhjrrsResponseStatus = pResponseStatus_
    }

-- | A token that can be used to resume pagination from the end of the collection.
lhjrrsNextToken :: Lens' ListHarvestJobsResponse (Maybe Text)
lhjrrsNextToken = lens _lhjrrsNextToken (\s a -> s {_lhjrrsNextToken = a})

-- | A list of HarvestJob records.
lhjrrsHarvestJobs :: Lens' ListHarvestJobsResponse [HarvestJob]
lhjrrsHarvestJobs = lens _lhjrrsHarvestJobs (\s a -> s {_lhjrrsHarvestJobs = a}) . _Default . _Coerce

-- | -- | The response status code.
lhjrrsResponseStatus :: Lens' ListHarvestJobsResponse Int
lhjrrsResponseStatus = lens _lhjrrsResponseStatus (\s a -> s {_lhjrrsResponseStatus = a})

instance NFData ListHarvestJobsResponse
