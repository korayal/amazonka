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
-- Module      : Network.AWS.Rekognition.GetLabelDetection
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets the label detection results of a Amazon Rekognition Video analysis started by 'StartLabelDetection' .
--
--
-- The label detection operation is started by a call to 'StartLabelDetection' which returns a job identifier (@JobId@ ). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to @StartlabelDetection@ . To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is @SUCCEEDED@ . If so, call 'GetLabelDetection' and pass the job identifier (@JobId@ ) from the initial call to @StartLabelDetection@ .
--
-- @GetLabelDetection@ returns an array of detected labels (@Labels@ ) sorted by the time the labels were detected. You can also sort by the label name by specifying @NAME@ for the @SortBy@ input parameter.
--
-- The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.
--
-- The returned labels also include bounding box information for common objects, a hierarchical taxonomy of detected labels, and the version of the label model used for detection.
--
-- Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in @MaxResults@ , the value of @NextToken@ in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call @GetlabelDetection@ and populate the @NextToken@ request parameter with the token value returned from the previous call to @GetLabelDetection@ .
module Network.AWS.Rekognition.GetLabelDetection
  ( -- * Creating a Request
    getLabelDetection,
    GetLabelDetection,

    -- * Request Lenses
    gldNextToken,
    gldMaxResults,
    gldSortBy,
    gldJobId,

    -- * Destructuring the Response
    getLabelDetectionResponse,
    GetLabelDetectionResponse,

    -- * Response Lenses
    gldrrsStatusMessage,
    gldrrsVideoMetadata,
    gldrrsNextToken,
    gldrrsLabelModelVersion,
    gldrrsJobStatus,
    gldrrsLabels,
    gldrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Rekognition.Types
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getLabelDetection' smart constructor.
data GetLabelDetection = GetLabelDetection'
  { _gldNextToken ::
      !(Maybe Text),
    _gldMaxResults :: !(Maybe Nat),
    _gldSortBy ::
      !(Maybe LabelDetectionSortBy),
    _gldJobId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetLabelDetection' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gldNextToken' - If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of labels.
--
-- * 'gldMaxResults' - Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.
--
-- * 'gldSortBy' - Sort to use for elements in the @Labels@ array. Use @TIMESTAMP@ to sort array elements by the time labels are detected. Use @NAME@ to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by @TIMESTAMP@ .
--
-- * 'gldJobId' - Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to @StartlabelDetection@ .
getLabelDetection ::
  -- | 'gldJobId'
  Text ->
  GetLabelDetection
getLabelDetection pJobId_ =
  GetLabelDetection'
    { _gldNextToken = Nothing,
      _gldMaxResults = Nothing,
      _gldSortBy = Nothing,
      _gldJobId = pJobId_
    }

-- | If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of labels.
gldNextToken :: Lens' GetLabelDetection (Maybe Text)
gldNextToken = lens _gldNextToken (\s a -> s {_gldNextToken = a})

-- | Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.
gldMaxResults :: Lens' GetLabelDetection (Maybe Natural)
gldMaxResults = lens _gldMaxResults (\s a -> s {_gldMaxResults = a}) . mapping _Nat

-- | Sort to use for elements in the @Labels@ array. Use @TIMESTAMP@ to sort array elements by the time labels are detected. Use @NAME@ to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by @TIMESTAMP@ .
gldSortBy :: Lens' GetLabelDetection (Maybe LabelDetectionSortBy)
gldSortBy = lens _gldSortBy (\s a -> s {_gldSortBy = a})

-- | Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to @StartlabelDetection@ .
gldJobId :: Lens' GetLabelDetection Text
gldJobId = lens _gldJobId (\s a -> s {_gldJobId = a})

instance AWSRequest GetLabelDetection where
  type Rs GetLabelDetection = GetLabelDetectionResponse
  request = postJSON rekognition
  response =
    receiveJSON
      ( \s h x ->
          GetLabelDetectionResponse'
            <$> (x .?> "StatusMessage")
            <*> (x .?> "VideoMetadata")
            <*> (x .?> "NextToken")
            <*> (x .?> "LabelModelVersion")
            <*> (x .?> "JobStatus")
            <*> (x .?> "Labels" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable GetLabelDetection

instance NFData GetLabelDetection

instance ToHeaders GetLabelDetection where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "RekognitionService.GetLabelDetection" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON GetLabelDetection where
  toJSON GetLabelDetection' {..} =
    object
      ( catMaybes
          [ ("NextToken" .=) <$> _gldNextToken,
            ("MaxResults" .=) <$> _gldMaxResults,
            ("SortBy" .=) <$> _gldSortBy,
            Just ("JobId" .= _gldJobId)
          ]
      )

instance ToPath GetLabelDetection where
  toPath = const "/"

instance ToQuery GetLabelDetection where
  toQuery = const mempty

-- | /See:/ 'getLabelDetectionResponse' smart constructor.
data GetLabelDetectionResponse = GetLabelDetectionResponse'
  { _gldrrsStatusMessage ::
      !(Maybe Text),
    _gldrrsVideoMetadata ::
      !( Maybe
           VideoMetadata
       ),
    _gldrrsNextToken ::
      !(Maybe Text),
    _gldrrsLabelModelVersion ::
      !(Maybe Text),
    _gldrrsJobStatus ::
      !( Maybe
           VideoJobStatus
       ),
    _gldrrsLabels ::
      !( Maybe
           [LabelDetection]
       ),
    _gldrrsResponseStatus ::
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

-- | Creates a value of 'GetLabelDetectionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gldrrsStatusMessage' - If the job fails, @StatusMessage@ provides a descriptive error message.
--
-- * 'gldrrsVideoMetadata' - Information about a video that Amazon Rekognition Video analyzed. @Videometadata@ is returned in every page of paginated responses from a Amazon Rekognition video operation.
--
-- * 'gldrrsNextToken' - If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of labels.
--
-- * 'gldrrsLabelModelVersion' - Version number of the label detection model that was used to detect labels.
--
-- * 'gldrrsJobStatus' - The current status of the label detection job.
--
-- * 'gldrrsLabels' - An array of labels detected in the video. Each element contains the detected label and the time, in milliseconds from the start of the video, that the label was detected.
--
-- * 'gldrrsResponseStatus' - -- | The response status code.
getLabelDetectionResponse ::
  -- | 'gldrrsResponseStatus'
  Int ->
  GetLabelDetectionResponse
getLabelDetectionResponse pResponseStatus_ =
  GetLabelDetectionResponse'
    { _gldrrsStatusMessage =
        Nothing,
      _gldrrsVideoMetadata = Nothing,
      _gldrrsNextToken = Nothing,
      _gldrrsLabelModelVersion = Nothing,
      _gldrrsJobStatus = Nothing,
      _gldrrsLabels = Nothing,
      _gldrrsResponseStatus = pResponseStatus_
    }

-- | If the job fails, @StatusMessage@ provides a descriptive error message.
gldrrsStatusMessage :: Lens' GetLabelDetectionResponse (Maybe Text)
gldrrsStatusMessage = lens _gldrrsStatusMessage (\s a -> s {_gldrrsStatusMessage = a})

-- | Information about a video that Amazon Rekognition Video analyzed. @Videometadata@ is returned in every page of paginated responses from a Amazon Rekognition video operation.
gldrrsVideoMetadata :: Lens' GetLabelDetectionResponse (Maybe VideoMetadata)
gldrrsVideoMetadata = lens _gldrrsVideoMetadata (\s a -> s {_gldrrsVideoMetadata = a})

-- | If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of labels.
gldrrsNextToken :: Lens' GetLabelDetectionResponse (Maybe Text)
gldrrsNextToken = lens _gldrrsNextToken (\s a -> s {_gldrrsNextToken = a})

-- | Version number of the label detection model that was used to detect labels.
gldrrsLabelModelVersion :: Lens' GetLabelDetectionResponse (Maybe Text)
gldrrsLabelModelVersion = lens _gldrrsLabelModelVersion (\s a -> s {_gldrrsLabelModelVersion = a})

-- | The current status of the label detection job.
gldrrsJobStatus :: Lens' GetLabelDetectionResponse (Maybe VideoJobStatus)
gldrrsJobStatus = lens _gldrrsJobStatus (\s a -> s {_gldrrsJobStatus = a})

-- | An array of labels detected in the video. Each element contains the detected label and the time, in milliseconds from the start of the video, that the label was detected.
gldrrsLabels :: Lens' GetLabelDetectionResponse [LabelDetection]
gldrrsLabels = lens _gldrrsLabels (\s a -> s {_gldrrsLabels = a}) . _Default . _Coerce

-- | -- | The response status code.
gldrrsResponseStatus :: Lens' GetLabelDetectionResponse Int
gldrrsResponseStatus = lens _gldrrsResponseStatus (\s a -> s {_gldrrsResponseStatus = a})

instance NFData GetLabelDetectionResponse
