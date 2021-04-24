{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaPackage
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- AWS Elemental MediaPackage
module Network.AWS.MediaPackage
  ( -- * Service Configuration
    mediaPackage,

    -- * Errors
    -- $errors

    -- ** NotFoundException
    _NotFoundException,

    -- ** ServiceUnavailableException
    _ServiceUnavailableException,

    -- ** InternalServerErrorException
    _InternalServerErrorException,

    -- ** ForbiddenException
    _ForbiddenException,

    -- ** UnprocessableEntityException
    _UnprocessableEntityException,

    -- ** TooManyRequestsException
    _TooManyRequestsException,

    -- * Waiters
    -- $waiters

    -- * Operations
    -- $operations

    -- ** CreateChannel
    module Network.AWS.MediaPackage.CreateChannel,

    -- ** CreateHarvestJob
    module Network.AWS.MediaPackage.CreateHarvestJob,

    -- ** UpdateOriginEndpoint
    module Network.AWS.MediaPackage.UpdateOriginEndpoint,

    -- ** DeleteOriginEndpoint
    module Network.AWS.MediaPackage.DeleteOriginEndpoint,

    -- ** ListOriginEndpoints (Paginated)
    module Network.AWS.MediaPackage.ListOriginEndpoints,

    -- ** CreateOriginEndpoint
    module Network.AWS.MediaPackage.CreateOriginEndpoint,

    -- ** UntagResource
    module Network.AWS.MediaPackage.UntagResource,

    -- ** TagResource
    module Network.AWS.MediaPackage.TagResource,

    -- ** DescribeOriginEndpoint
    module Network.AWS.MediaPackage.DescribeOriginEndpoint,

    -- ** ListChannels (Paginated)
    module Network.AWS.MediaPackage.ListChannels,

    -- ** ConfigureLogs
    module Network.AWS.MediaPackage.ConfigureLogs,

    -- ** ListHarvestJobs (Paginated)
    module Network.AWS.MediaPackage.ListHarvestJobs,

    -- ** DescribeChannel
    module Network.AWS.MediaPackage.DescribeChannel,

    -- ** RotateIngestEndpointCredentials
    module Network.AWS.MediaPackage.RotateIngestEndpointCredentials,

    -- ** DescribeHarvestJob
    module Network.AWS.MediaPackage.DescribeHarvestJob,

    -- ** ListTagsForResource
    module Network.AWS.MediaPackage.ListTagsForResource,

    -- ** DeleteChannel
    module Network.AWS.MediaPackage.DeleteChannel,

    -- ** UpdateChannel
    module Network.AWS.MediaPackage.UpdateChannel,

    -- * Types

    -- ** AdMarkers
    AdMarkers (..),

    -- ** AdTriggersElement
    AdTriggersElement (..),

    -- ** AdsOnDeliveryRestrictions
    AdsOnDeliveryRestrictions (..),

    -- ** EncryptionMethod
    EncryptionMethod (..),

    -- ** ManifestLayout
    ManifestLayout (..),

    -- ** Origination
    Origination (..),

    -- ** PeriodTriggersElement
    PeriodTriggersElement (..),

    -- ** PlaylistType
    PlaylistType (..),

    -- ** Profile
    Profile (..),

    -- ** SegmentTemplateFormat
    SegmentTemplateFormat (..),

    -- ** Status
    Status (..),

    -- ** StreamOrder
    StreamOrder (..),

    -- ** UtcTiming
    UtcTiming (..),

    -- ** Authorization
    Authorization,
    authorization,
    aSecretsRoleARN,
    aCdnIdentifierSecret,

    -- ** Channel
    Channel,
    channel,
    cEgressAccessLogs,
    cHlsIngest,
    cARN,
    cId,
    cIngressAccessLogs,
    cTags,
    cDescription,

    -- ** CmafEncryption
    CmafEncryption,
    cmafEncryption,
    ceKeyRotationIntervalSeconds,
    ceSpekeKeyProvider,

    -- ** CmafPackage
    CmafPackage,
    cmafPackage,
    cpStreamSelection,
    cpHlsManifests,
    cpSegmentPrefix,
    cpEncryption,
    cpSegmentDurationSeconds,

    -- ** CmafPackageCreateOrUpdateParameters
    CmafPackageCreateOrUpdateParameters,
    cmafPackageCreateOrUpdateParameters,
    cpcoupStreamSelection,
    cpcoupHlsManifests,
    cpcoupSegmentPrefix,
    cpcoupEncryption,
    cpcoupSegmentDurationSeconds,

    -- ** DashEncryption
    DashEncryption,
    dashEncryption,
    deKeyRotationIntervalSeconds,
    deSpekeKeyProvider,

    -- ** DashPackage
    DashPackage,
    dashPackage,
    dpMinBufferTimeSeconds,
    dpStreamSelection,
    dpPeriodTriggers,
    dpAdTriggers,
    dpManifestWindowSeconds,
    dpManifestLayout,
    dpMinUpdatePeriodSeconds,
    dpEncryption,
    dpAdsOnDeliveryRestrictions,
    dpUtcTimingURI,
    dpSegmentDurationSeconds,
    dpProfile,
    dpSegmentTemplateFormat,
    dpSuggestedPresentationDelaySeconds,
    dpUtcTiming,

    -- ** EgressAccessLogs
    EgressAccessLogs,
    egressAccessLogs,
    ealLogGroupName,

    -- ** HarvestJob
    HarvestJob,
    harvestJob,
    hjStatus,
    hjS3Destination,
    hjChannelId,
    hjStartTime,
    hjARN,
    hjId,
    hjCreatedAt,
    hjOriginEndpointId,
    hjEndTime,

    -- ** HlsEncryption
    HlsEncryption,
    hlsEncryption,
    heRepeatExtXKey,
    heEncryptionMethod,
    heConstantInitializationVector,
    heKeyRotationIntervalSeconds,
    heSpekeKeyProvider,

    -- ** HlsIngest
    HlsIngest,
    hlsIngest,
    hiIngestEndpoints,

    -- ** HlsManifest
    HlsManifest,
    hlsManifest,
    hmAdMarkers,
    hmProgramDateTimeIntervalSeconds,
    hmPlaylistWindowSeconds,
    hmIncludeIframeOnlyStream,
    hmManifestName,
    hmPlaylistType,
    hmURL,
    hmId,

    -- ** HlsManifestCreateOrUpdateParameters
    HlsManifestCreateOrUpdateParameters,
    hlsManifestCreateOrUpdateParameters,
    hmcoupAdMarkers,
    hmcoupProgramDateTimeIntervalSeconds,
    hmcoupPlaylistWindowSeconds,
    hmcoupAdTriggers,
    hmcoupIncludeIframeOnlyStream,
    hmcoupManifestName,
    hmcoupAdsOnDeliveryRestrictions,
    hmcoupPlaylistType,
    hmcoupId,

    -- ** HlsPackage
    HlsPackage,
    hlsPackage,
    hpAdMarkers,
    hpStreamSelection,
    hpProgramDateTimeIntervalSeconds,
    hpPlaylistWindowSeconds,
    hpAdTriggers,
    hpIncludeIframeOnlyStream,
    hpUseAudioRenditionGroup,
    hpEncryption,
    hpAdsOnDeliveryRestrictions,
    hpSegmentDurationSeconds,
    hpPlaylistType,

    -- ** IngestEndpoint
    IngestEndpoint,
    ingestEndpoint,
    ieId,
    iePassword,
    ieUsername,
    ieURL,

    -- ** IngressAccessLogs
    IngressAccessLogs,
    ingressAccessLogs,
    ialLogGroupName,

    -- ** MssEncryption
    MssEncryption,
    mssEncryption,
    meSpekeKeyProvider,

    -- ** MssPackage
    MssPackage,
    mssPackage,
    mpStreamSelection,
    mpManifestWindowSeconds,
    mpEncryption,
    mpSegmentDurationSeconds,

    -- ** OriginEndpoint
    OriginEndpoint,
    originEndpoint,
    oeDashPackage,
    oeStartoverWindowSeconds,
    oeOrigination,
    oeChannelId,
    oeCmafPackage,
    oeManifestName,
    oeARN,
    oeId,
    oeWhitelist,
    oeMssPackage,
    oeTags,
    oeDescription,
    oeTimeDelaySeconds,
    oeAuthorization,
    oeURL,
    oeHlsPackage,

    -- ** S3Destination
    S3Destination,
    s3Destination,
    sdManifestKey,
    sdBucketName,
    sdRoleARN,

    -- ** SpekeKeyProvider
    SpekeKeyProvider,
    spekeKeyProvider,
    skpCertificateARN,
    skpResourceId,
    skpSystemIds,
    skpURL,
    skpRoleARN,

    -- ** StreamSelection
    StreamSelection,
    streamSelection,
    ssMinVideoBitsPerSecond,
    ssMaxVideoBitsPerSecond,
    ssStreamOrder,
  )
where

import Network.AWS.MediaPackage.ConfigureLogs
import Network.AWS.MediaPackage.CreateChannel
import Network.AWS.MediaPackage.CreateHarvestJob
import Network.AWS.MediaPackage.CreateOriginEndpoint
import Network.AWS.MediaPackage.DeleteChannel
import Network.AWS.MediaPackage.DeleteOriginEndpoint
import Network.AWS.MediaPackage.DescribeChannel
import Network.AWS.MediaPackage.DescribeHarvestJob
import Network.AWS.MediaPackage.DescribeOriginEndpoint
import Network.AWS.MediaPackage.ListChannels
import Network.AWS.MediaPackage.ListHarvestJobs
import Network.AWS.MediaPackage.ListOriginEndpoints
import Network.AWS.MediaPackage.ListTagsForResource
import Network.AWS.MediaPackage.RotateIngestEndpointCredentials
import Network.AWS.MediaPackage.TagResource
import Network.AWS.MediaPackage.Types
import Network.AWS.MediaPackage.UntagResource
import Network.AWS.MediaPackage.UpdateChannel
import Network.AWS.MediaPackage.UpdateOriginEndpoint
import Network.AWS.MediaPackage.Waiters

-- $errors
-- Error matchers are designed for use with the functions provided by
-- <http://hackage.haskell.org/package/lens/docs/Control-Exception-Lens.html Control.Exception.Lens>.
-- This allows catching (and rethrowing) service specific errors returned
-- by 'MediaPackage'.

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
