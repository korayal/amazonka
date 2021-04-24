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
-- Module      : Network.AWS.Rekognition.SearchFacesByImage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection.
--
--
-- You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file.
--
-- The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a @similarity@ indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image.
--
-- For an example, Searching for a Face Using an Image in the Amazon Rekognition Developer Guide.
--
-- The @QualityFilter@ input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use @QualityFilter@ to set the quality bar for filtering by specifying @LOW@ , @MEDIUM@ , or @HIGH@ . If you do not want to filter detected faces, specify @NONE@ . The default value is @NONE@ .
--
-- This operation requires permissions to perform the @rekognition:SearchFacesByImage@ action.
module Network.AWS.Rekognition.SearchFacesByImage
  ( -- * Creating a Request
    searchFacesByImage,
    SearchFacesByImage,

    -- * Request Lenses
    sfbiQualityFilter,
    sfbiMaxFaces,
    sfbiFaceMatchThreshold,
    sfbiCollectionId,
    sfbiImage,

    -- * Destructuring the Response
    searchFacesByImageResponse,
    SearchFacesByImageResponse,

    -- * Response Lenses
    sfbirrsFaceModelVersion,
    sfbirrsFaceMatches,
    sfbirrsSearchedFaceBoundingBox,
    sfbirrsSearchedFaceConfidence,
    sfbirrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Rekognition.Types
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'searchFacesByImage' smart constructor.
data SearchFacesByImage = SearchFacesByImage'
  { _sfbiQualityFilter ::
      !(Maybe QualityFilter),
    _sfbiMaxFaces :: !(Maybe Nat),
    _sfbiFaceMatchThreshold ::
      !(Maybe Double),
    _sfbiCollectionId :: !Text,
    _sfbiImage :: !Image
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SearchFacesByImage' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sfbiQualityFilter' - A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't searched for in the collection. If you specify @AUTO@ , Amazon Rekognition chooses the quality bar. If you specify @LOW@ , @MEDIUM@ , or @HIGH@ , filtering removes all faces that don’t meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify @NONE@ , no filtering is performed. The default value is @NONE@ .  To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.
--
-- * 'sfbiMaxFaces' - Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.
--
-- * 'sfbiFaceMatchThreshold' - (Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.
--
-- * 'sfbiCollectionId' - ID of the collection to search.
--
-- * 'sfbiImage' - The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported.  If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the @Bytes@ field. For more information, see Images in the Amazon Rekognition developer guide.
searchFacesByImage ::
  -- | 'sfbiCollectionId'
  Text ->
  -- | 'sfbiImage'
  Image ->
  SearchFacesByImage
searchFacesByImage pCollectionId_ pImage_ =
  SearchFacesByImage'
    { _sfbiQualityFilter = Nothing,
      _sfbiMaxFaces = Nothing,
      _sfbiFaceMatchThreshold = Nothing,
      _sfbiCollectionId = pCollectionId_,
      _sfbiImage = pImage_
    }

-- | A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't searched for in the collection. If you specify @AUTO@ , Amazon Rekognition chooses the quality bar. If you specify @LOW@ , @MEDIUM@ , or @HIGH@ , filtering removes all faces that don’t meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify @NONE@ , no filtering is performed. The default value is @NONE@ .  To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.
sfbiQualityFilter :: Lens' SearchFacesByImage (Maybe QualityFilter)
sfbiQualityFilter = lens _sfbiQualityFilter (\s a -> s {_sfbiQualityFilter = a})

-- | Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.
sfbiMaxFaces :: Lens' SearchFacesByImage (Maybe Natural)
sfbiMaxFaces = lens _sfbiMaxFaces (\s a -> s {_sfbiMaxFaces = a}) . mapping _Nat

-- | (Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.
sfbiFaceMatchThreshold :: Lens' SearchFacesByImage (Maybe Double)
sfbiFaceMatchThreshold = lens _sfbiFaceMatchThreshold (\s a -> s {_sfbiFaceMatchThreshold = a})

-- | ID of the collection to search.
sfbiCollectionId :: Lens' SearchFacesByImage Text
sfbiCollectionId = lens _sfbiCollectionId (\s a -> s {_sfbiCollectionId = a})

-- | The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported.  If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the @Bytes@ field. For more information, see Images in the Amazon Rekognition developer guide.
sfbiImage :: Lens' SearchFacesByImage Image
sfbiImage = lens _sfbiImage (\s a -> s {_sfbiImage = a})

instance AWSRequest SearchFacesByImage where
  type
    Rs SearchFacesByImage =
      SearchFacesByImageResponse
  request = postJSON rekognition
  response =
    receiveJSON
      ( \s h x ->
          SearchFacesByImageResponse'
            <$> (x .?> "FaceModelVersion")
            <*> (x .?> "FaceMatches" .!@ mempty)
            <*> (x .?> "SearchedFaceBoundingBox")
            <*> (x .?> "SearchedFaceConfidence")
            <*> (pure (fromEnum s))
      )

instance Hashable SearchFacesByImage

instance NFData SearchFacesByImage

instance ToHeaders SearchFacesByImage where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "RekognitionService.SearchFacesByImage" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON SearchFacesByImage where
  toJSON SearchFacesByImage' {..} =
    object
      ( catMaybes
          [ ("QualityFilter" .=) <$> _sfbiQualityFilter,
            ("MaxFaces" .=) <$> _sfbiMaxFaces,
            ("FaceMatchThreshold" .=)
              <$> _sfbiFaceMatchThreshold,
            Just ("CollectionId" .= _sfbiCollectionId),
            Just ("Image" .= _sfbiImage)
          ]
      )

instance ToPath SearchFacesByImage where
  toPath = const "/"

instance ToQuery SearchFacesByImage where
  toQuery = const mempty

-- | /See:/ 'searchFacesByImageResponse' smart constructor.
data SearchFacesByImageResponse = SearchFacesByImageResponse'
  { _sfbirrsFaceModelVersion ::
      !(Maybe Text),
    _sfbirrsFaceMatches ::
      !( Maybe
           [FaceMatch]
       ),
    _sfbirrsSearchedFaceBoundingBox ::
      !( Maybe
           BoundingBox
       ),
    _sfbirrsSearchedFaceConfidence ::
      !(Maybe Double),
    _sfbirrsResponseStatus ::
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

-- | Creates a value of 'SearchFacesByImageResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'sfbirrsFaceModelVersion' - Version number of the face detection model associated with the input collection (@CollectionId@ ).
--
-- * 'sfbirrsFaceMatches' - An array of faces that match the input face, along with the confidence in the match.
--
-- * 'sfbirrsSearchedFaceBoundingBox' - The bounding box around the face in the input image that Amazon Rekognition used for the search.
--
-- * 'sfbirrsSearchedFaceConfidence' - The level of confidence that the @searchedFaceBoundingBox@ , contains a face.
--
-- * 'sfbirrsResponseStatus' - -- | The response status code.
searchFacesByImageResponse ::
  -- | 'sfbirrsResponseStatus'
  Int ->
  SearchFacesByImageResponse
searchFacesByImageResponse pResponseStatus_ =
  SearchFacesByImageResponse'
    { _sfbirrsFaceModelVersion =
        Nothing,
      _sfbirrsFaceMatches = Nothing,
      _sfbirrsSearchedFaceBoundingBox = Nothing,
      _sfbirrsSearchedFaceConfidence = Nothing,
      _sfbirrsResponseStatus = pResponseStatus_
    }

-- | Version number of the face detection model associated with the input collection (@CollectionId@ ).
sfbirrsFaceModelVersion :: Lens' SearchFacesByImageResponse (Maybe Text)
sfbirrsFaceModelVersion = lens _sfbirrsFaceModelVersion (\s a -> s {_sfbirrsFaceModelVersion = a})

-- | An array of faces that match the input face, along with the confidence in the match.
sfbirrsFaceMatches :: Lens' SearchFacesByImageResponse [FaceMatch]
sfbirrsFaceMatches = lens _sfbirrsFaceMatches (\s a -> s {_sfbirrsFaceMatches = a}) . _Default . _Coerce

-- | The bounding box around the face in the input image that Amazon Rekognition used for the search.
sfbirrsSearchedFaceBoundingBox :: Lens' SearchFacesByImageResponse (Maybe BoundingBox)
sfbirrsSearchedFaceBoundingBox = lens _sfbirrsSearchedFaceBoundingBox (\s a -> s {_sfbirrsSearchedFaceBoundingBox = a})

-- | The level of confidence that the @searchedFaceBoundingBox@ , contains a face.
sfbirrsSearchedFaceConfidence :: Lens' SearchFacesByImageResponse (Maybe Double)
sfbirrsSearchedFaceConfidence = lens _sfbirrsSearchedFaceConfidence (\s a -> s {_sfbirrsSearchedFaceConfidence = a})

-- | -- | The response status code.
sfbirrsResponseStatus :: Lens' SearchFacesByImageResponse Int
sfbirrsResponseStatus = lens _sfbirrsResponseStatus (\s a -> s {_sfbirrsResponseStatus = a})

instance NFData SearchFacesByImageResponse
