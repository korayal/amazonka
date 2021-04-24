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
-- Module      : Network.AWS.CloudWatchLogs.GetQueryResults
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the results from the specified query.
--
--
-- Only the fields requested in the query are returned, along with a @@ptr@ field, which is the identifier for the log record. You can use the value of @@ptr@ in a <https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html GetLogRecord> operation to get the full log record.
--
-- @GetQueryResults@ does not start a query execution. To run a query, use <https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html StartQuery> .
--
-- If the value of the @Status@ field in the output is @Running@ , this operation returns only partial results. If you see a value of @Scheduled@ or @Running@ for the status, you can retry the operation later to see the final results.
module Network.AWS.CloudWatchLogs.GetQueryResults
  ( -- * Creating a Request
    getQueryResults,
    GetQueryResults,

    -- * Request Lenses
    gqrQueryId,

    -- * Destructuring the Response
    getQueryResultsResponse,
    GetQueryResultsResponse,

    -- * Response Lenses
    gqrrrsStatus,
    gqrrrsStatistics,
    gqrrrsResults,
    gqrrrsResponseStatus,
  )
where

import Network.AWS.CloudWatchLogs.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getQueryResults' smart constructor.
newtype GetQueryResults = GetQueryResults'
  { _gqrQueryId ::
      Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetQueryResults' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gqrQueryId' - The ID number of the query.
getQueryResults ::
  -- | 'gqrQueryId'
  Text ->
  GetQueryResults
getQueryResults pQueryId_ =
  GetQueryResults' {_gqrQueryId = pQueryId_}

-- | The ID number of the query.
gqrQueryId :: Lens' GetQueryResults Text
gqrQueryId = lens _gqrQueryId (\s a -> s {_gqrQueryId = a})

instance AWSRequest GetQueryResults where
  type Rs GetQueryResults = GetQueryResultsResponse
  request = postJSON cloudWatchLogs
  response =
    receiveJSON
      ( \s h x ->
          GetQueryResultsResponse'
            <$> (x .?> "status")
            <*> (x .?> "statistics")
            <*> (x .?> "results" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable GetQueryResults

instance NFData GetQueryResults

instance ToHeaders GetQueryResults where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("Logs_20140328.GetQueryResults" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON GetQueryResults where
  toJSON GetQueryResults' {..} =
    object
      (catMaybes [Just ("queryId" .= _gqrQueryId)])

instance ToPath GetQueryResults where
  toPath = const "/"

instance ToQuery GetQueryResults where
  toQuery = const mempty

-- | /See:/ 'getQueryResultsResponse' smart constructor.
data GetQueryResultsResponse = GetQueryResultsResponse'
  { _gqrrrsStatus ::
      !(Maybe QueryStatus),
    _gqrrrsStatistics ::
      !( Maybe
           QueryStatistics
       ),
    _gqrrrsResults ::
      !( Maybe
           [[ResultField]]
       ),
    _gqrrrsResponseStatus ::
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

-- | Creates a value of 'GetQueryResultsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gqrrrsStatus' - The status of the most recent running of the query. Possible values are @Cancelled@ , @Complete@ , @Failed@ , @Running@ , @Scheduled@ , @Timeout@ , and @Unknown@ . Queries time out after 15 minutes of execution. To avoid having your queries time out, reduce the time range being searched or partition your query into a number of queries.
--
-- * 'gqrrrsStatistics' - Includes the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned. These values reflect the full raw results of the query.
--
-- * 'gqrrrsResults' - The log events that matched the query criteria during the most recent time it ran. The @results@ value is an array of arrays. Each log event is one object in the top-level array. Each of these log event objects is an array of @field@ /@value@ pairs.
--
-- * 'gqrrrsResponseStatus' - -- | The response status code.
getQueryResultsResponse ::
  -- | 'gqrrrsResponseStatus'
  Int ->
  GetQueryResultsResponse
getQueryResultsResponse pResponseStatus_ =
  GetQueryResultsResponse'
    { _gqrrrsStatus = Nothing,
      _gqrrrsStatistics = Nothing,
      _gqrrrsResults = Nothing,
      _gqrrrsResponseStatus = pResponseStatus_
    }

-- | The status of the most recent running of the query. Possible values are @Cancelled@ , @Complete@ , @Failed@ , @Running@ , @Scheduled@ , @Timeout@ , and @Unknown@ . Queries time out after 15 minutes of execution. To avoid having your queries time out, reduce the time range being searched or partition your query into a number of queries.
gqrrrsStatus :: Lens' GetQueryResultsResponse (Maybe QueryStatus)
gqrrrsStatus = lens _gqrrrsStatus (\s a -> s {_gqrrrsStatus = a})

-- | Includes the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned. These values reflect the full raw results of the query.
gqrrrsStatistics :: Lens' GetQueryResultsResponse (Maybe QueryStatistics)
gqrrrsStatistics = lens _gqrrrsStatistics (\s a -> s {_gqrrrsStatistics = a})

-- | The log events that matched the query criteria during the most recent time it ran. The @results@ value is an array of arrays. Each log event is one object in the top-level array. Each of these log event objects is an array of @field@ /@value@ pairs.
gqrrrsResults :: Lens' GetQueryResultsResponse [[ResultField]]
gqrrrsResults = lens _gqrrrsResults (\s a -> s {_gqrrrsResults = a}) . _Default . _Coerce

-- | -- | The response status code.
gqrrrsResponseStatus :: Lens' GetQueryResultsResponse Int
gqrrrsResponseStatus = lens _gqrrrsResponseStatus (\s a -> s {_gqrrrsResponseStatus = a})

instance NFData GetQueryResultsResponse
