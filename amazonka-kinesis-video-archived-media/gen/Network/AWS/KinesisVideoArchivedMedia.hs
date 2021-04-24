{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.KinesisVideoArchivedMedia
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.KinesisVideoArchivedMedia
  ( -- * Service Configuration
    kinesisVideoArchivedMedia,

    -- * Errors
    -- $errors

    -- ** InvalidMediaFrameException
    _InvalidMediaFrameException,

    -- ** ClientLimitExceededException
    _ClientLimitExceededException,

    -- ** InvalidCodecPrivateDataException
    _InvalidCodecPrivateDataException,

    -- ** NoDataRetentionException
    _NoDataRetentionException,

    -- ** UnsupportedStreamMediaTypeException
    _UnsupportedStreamMediaTypeException,

    -- ** ResourceNotFoundException
    _ResourceNotFoundException,

    -- ** MissingCodecPrivateDataException
    _MissingCodecPrivateDataException,

    -- ** NotAuthorizedException
    _NotAuthorizedException,

    -- ** InvalidArgumentException
    _InvalidArgumentException,

    -- * Waiters
    -- $waiters

    -- * Operations
    -- $operations

    -- ** ListFragments (Paginated)
    module Network.AWS.KinesisVideoArchivedMedia.ListFragments,

    -- ** GetMediaForFragmentList
    module Network.AWS.KinesisVideoArchivedMedia.GetMediaForFragmentList,

    -- ** GetClip
    module Network.AWS.KinesisVideoArchivedMedia.GetClip,

    -- ** GetDASHStreamingSessionURL
    module Network.AWS.KinesisVideoArchivedMedia.GetDASHStreamingSessionURL,

    -- ** GetHLSStreamingSessionURL
    module Network.AWS.KinesisVideoArchivedMedia.GetHLSStreamingSessionURL,

    -- * Types

    -- ** ClipFragmentSelectorType
    ClipFragmentSelectorType (..),

    -- ** ContainerFormat
    ContainerFormat (..),

    -- ** DASHDisplayFragmentNumber
    DASHDisplayFragmentNumber (..),

    -- ** DASHDisplayFragmentTimestamp
    DASHDisplayFragmentTimestamp (..),

    -- ** DASHFragmentSelectorType
    DASHFragmentSelectorType (..),

    -- ** DASHPlaybackMode
    DASHPlaybackMode (..),

    -- ** FragmentSelectorType
    FragmentSelectorType (..),

    -- ** HLSDiscontinuityMode
    HLSDiscontinuityMode (..),

    -- ** HLSDisplayFragmentTimestamp
    HLSDisplayFragmentTimestamp (..),

    -- ** HLSFragmentSelectorType
    HLSFragmentSelectorType (..),

    -- ** HLSPlaybackMode
    HLSPlaybackMode (..),

    -- ** ClipFragmentSelector
    ClipFragmentSelector,
    clipFragmentSelector,
    cfsFragmentSelectorType,
    cfsTimestampRange,

    -- ** ClipTimestampRange
    ClipTimestampRange,
    clipTimestampRange,
    ctrStartTimestamp,
    ctrEndTimestamp,

    -- ** DASHFragmentSelector
    DASHFragmentSelector,
    dASHFragmentSelector,
    dashfsFragmentSelectorType,
    dashfsTimestampRange,

    -- ** DASHTimestampRange
    DASHTimestampRange,
    dASHTimestampRange,
    dashtrEndTimestamp,
    dashtrStartTimestamp,

    -- ** Fragment
    Fragment,
    fragment,
    fProducerTimestamp,
    fFragmentNumber,
    fFragmentSizeInBytes,
    fServerTimestamp,
    fFragmentLengthInMilliseconds,

    -- ** FragmentSelector
    FragmentSelector,
    fragmentSelector,
    fsFragmentSelectorType,
    fsTimestampRange,

    -- ** HLSFragmentSelector
    HLSFragmentSelector,
    hLSFragmentSelector,
    hlsfsFragmentSelectorType,
    hlsfsTimestampRange,

    -- ** HLSTimestampRange
    HLSTimestampRange,
    hLSTimestampRange,
    hlstrEndTimestamp,
    hlstrStartTimestamp,

    -- ** TimestampRange
    TimestampRange,
    timestampRange,
    trStartTimestamp,
    trEndTimestamp,
  )
where

import Network.AWS.KinesisVideoArchivedMedia.GetClip
import Network.AWS.KinesisVideoArchivedMedia.GetDASHStreamingSessionURL
import Network.AWS.KinesisVideoArchivedMedia.GetHLSStreamingSessionURL
import Network.AWS.KinesisVideoArchivedMedia.GetMediaForFragmentList
import Network.AWS.KinesisVideoArchivedMedia.ListFragments
import Network.AWS.KinesisVideoArchivedMedia.Types
import Network.AWS.KinesisVideoArchivedMedia.Waiters

-- $errors
-- Error matchers are designed for use with the functions provided by
-- <http://hackage.haskell.org/package/lens/docs/Control-Exception-Lens.html Control.Exception.Lens>.
-- This allows catching (and rethrowing) service specific errors returned
-- by 'KinesisVideoArchivedMedia'.

-- $operations
-- Some AWS operations return results that are incomplete and require subsequent
-- requests in order to obtain the entire result set. The process of sending
-- subsequent requests to continue where a previous request left off is called
-- pagination. For example, the 'ListObjects' operation of Amazon S3 returns up to
-- 1000 objects at a time, and you must send subsequent requests with the
-- appropriate Marker in order to retrieve the next page of results.
--
-- Operations that have an 'AWSPager' instance can transparently perform subsequent
-- requests, correctly setting Markers and other request facets to iterate through
-- the entire result set of a truncated API operation. Operations which support
-- this have an additional note in the documentation.
--
-- Many operations have the ability to filter results on the server side. See the
-- individual operation parameters for details.

-- $waiters
-- Waiters poll by repeatedly sending a request until some remote success condition
-- configured by the 'Wait' specification is fulfilled. The 'Wait' specification
-- determines how many attempts should be made, in addition to delay and retry strategies.
