{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.NetworkFirewall.Types
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.NetworkFirewall.Types
  ( -- * Service Configuration
    defaultService,

    -- * Errors
    _LogDestinationPermissionException,
    _InvalidRequestException,
    _UnsupportedOperationException,
    _ResourceOwnerCheckException,
    _InvalidResourcePolicyException,
    _ThrottlingException,
    _InternalServerError,
    _InvalidTokenException,
    _InvalidOperationException,
    _InsufficientCapacityException,
    _ResourceNotFoundException,
    _LimitExceededException,

    -- * AttachmentStatus
    AttachmentStatus (..),

    -- * ConfigurationSyncState
    ConfigurationSyncState (..),

    -- * FirewallStatusValue
    FirewallStatusValue (..),

    -- * GeneratedRulesType
    GeneratedRulesType (..),

    -- * LogDestinationType
    LogDestinationType (..),

    -- * LogType
    LogType (..),

    -- * PerObjectSyncStatus
    PerObjectSyncStatus (..),

    -- * ResourceStatus
    ResourceStatus (..),

    -- * RuleGroupType
    RuleGroupType (..),

    -- * RuleOrder
    RuleOrder (..),

    -- * StatefulAction
    StatefulAction (..),

    -- * StatefulRuleDirection
    StatefulRuleDirection (..),

    -- * StatefulRuleProtocol
    StatefulRuleProtocol (..),

    -- * TCPFlag
    TCPFlag (..),

    -- * TargetType
    TargetType (..),

    -- * ActionDefinition
    ActionDefinition (..),
    newActionDefinition,
    actionDefinition_publishMetricAction,

    -- * Address
    Address (..),
    newAddress,
    address_addressDefinition,

    -- * Attachment
    Attachment (..),
    newAttachment,
    attachment_status,
    attachment_subnetId,
    attachment_endpointId,

    -- * CustomAction
    CustomAction (..),
    newCustomAction,
    customAction_actionName,
    customAction_actionDefinition,

    -- * Dimension
    Dimension (..),
    newDimension,
    dimension_value,

    -- * Firewall
    Firewall (..),
    newFirewall,
    firewall_firewallArn,
    firewall_firewallPolicyChangeProtection,
    firewall_subnetChangeProtection,
    firewall_deleteProtection,
    firewall_description,
    firewall_tags,
    firewall_firewallName,
    firewall_firewallPolicyArn,
    firewall_vpcId,
    firewall_subnetMappings,
    firewall_firewallId,

    -- * FirewallMetadata
    FirewallMetadata (..),
    newFirewallMetadata,
    firewallMetadata_firewallArn,
    firewallMetadata_firewallName,

    -- * FirewallPolicy
    FirewallPolicy (..),
    newFirewallPolicy,
    firewallPolicy_statefulEngineOptions,
    firewallPolicy_statefulRuleGroupReferences,
    firewallPolicy_statelessRuleGroupReferences,
    firewallPolicy_statelessCustomActions,
    firewallPolicy_statefulDefaultActions,
    firewallPolicy_statelessDefaultActions,
    firewallPolicy_statelessFragmentDefaultActions,

    -- * FirewallPolicyMetadata
    FirewallPolicyMetadata (..),
    newFirewallPolicyMetadata,
    firewallPolicyMetadata_arn,
    firewallPolicyMetadata_name,

    -- * FirewallPolicyResponse
    FirewallPolicyResponse (..),
    newFirewallPolicyResponse,
    firewallPolicyResponse_consumedStatelessRuleCapacity,
    firewallPolicyResponse_numberOfAssociations,
    firewallPolicyResponse_firewallPolicyStatus,
    firewallPolicyResponse_consumedStatefulRuleCapacity,
    firewallPolicyResponse_description,
    firewallPolicyResponse_tags,
    firewallPolicyResponse_firewallPolicyName,
    firewallPolicyResponse_firewallPolicyArn,
    firewallPolicyResponse_firewallPolicyId,

    -- * FirewallStatus
    FirewallStatus (..),
    newFirewallStatus,
    firewallStatus_syncStates,
    firewallStatus_status,
    firewallStatus_configurationSyncStateSummary,

    -- * Header
    Header (..),
    newHeader,
    header_protocol,
    header_source,
    header_sourcePort,
    header_direction,
    header_destination,
    header_destinationPort,

    -- * IPSet
    IPSet (..),
    newIPSet,
    iPSet_definition,

    -- * LogDestinationConfig
    LogDestinationConfig (..),
    newLogDestinationConfig,
    logDestinationConfig_logType,
    logDestinationConfig_logDestinationType,
    logDestinationConfig_logDestination,

    -- * LoggingConfiguration
    LoggingConfiguration (..),
    newLoggingConfiguration,
    loggingConfiguration_logDestinationConfigs,

    -- * MatchAttributes
    MatchAttributes (..),
    newMatchAttributes,
    matchAttributes_protocols,
    matchAttributes_tCPFlags,
    matchAttributes_destinationPorts,
    matchAttributes_sources,
    matchAttributes_sourcePorts,
    matchAttributes_destinations,

    -- * PerObjectStatus
    PerObjectStatus (..),
    newPerObjectStatus,
    perObjectStatus_updateToken,
    perObjectStatus_syncStatus,

    -- * PortRange
    PortRange (..),
    newPortRange,
    portRange_fromPort,
    portRange_toPort,

    -- * PortSet
    PortSet (..),
    newPortSet,
    portSet_definition,

    -- * PublishMetricAction
    PublishMetricAction (..),
    newPublishMetricAction,
    publishMetricAction_dimensions,

    -- * RuleDefinition
    RuleDefinition (..),
    newRuleDefinition,
    ruleDefinition_matchAttributes,
    ruleDefinition_actions,

    -- * RuleGroup
    RuleGroup (..),
    newRuleGroup,
    ruleGroup_statefulRuleOptions,
    ruleGroup_ruleVariables,
    ruleGroup_rulesSource,

    -- * RuleGroupMetadata
    RuleGroupMetadata (..),
    newRuleGroupMetadata,
    ruleGroupMetadata_arn,
    ruleGroupMetadata_name,

    -- * RuleGroupResponse
    RuleGroupResponse (..),
    newRuleGroupResponse,
    ruleGroupResponse_numberOfAssociations,
    ruleGroupResponse_capacity,
    ruleGroupResponse_consumedCapacity,
    ruleGroupResponse_ruleGroupStatus,
    ruleGroupResponse_type,
    ruleGroupResponse_description,
    ruleGroupResponse_tags,
    ruleGroupResponse_ruleGroupArn,
    ruleGroupResponse_ruleGroupName,
    ruleGroupResponse_ruleGroupId,

    -- * RuleOption
    RuleOption (..),
    newRuleOption,
    ruleOption_settings,
    ruleOption_keyword,

    -- * RuleVariables
    RuleVariables (..),
    newRuleVariables,
    ruleVariables_portSets,
    ruleVariables_iPSets,

    -- * RulesSource
    RulesSource (..),
    newRulesSource,
    rulesSource_rulesString,
    rulesSource_rulesSourceList,
    rulesSource_statefulRules,
    rulesSource_statelessRulesAndCustomActions,

    -- * RulesSourceList
    RulesSourceList (..),
    newRulesSourceList,
    rulesSourceList_targets,
    rulesSourceList_targetTypes,
    rulesSourceList_generatedRulesType,

    -- * StatefulEngineOptions
    StatefulEngineOptions (..),
    newStatefulEngineOptions,
    statefulEngineOptions_ruleOrder,

    -- * StatefulRule
    StatefulRule (..),
    newStatefulRule,
    statefulRule_action,
    statefulRule_header,
    statefulRule_ruleOptions,

    -- * StatefulRuleGroupReference
    StatefulRuleGroupReference (..),
    newStatefulRuleGroupReference,
    statefulRuleGroupReference_priority,
    statefulRuleGroupReference_resourceArn,

    -- * StatefulRuleOptions
    StatefulRuleOptions (..),
    newStatefulRuleOptions,
    statefulRuleOptions_ruleOrder,

    -- * StatelessRule
    StatelessRule (..),
    newStatelessRule,
    statelessRule_ruleDefinition,
    statelessRule_priority,

    -- * StatelessRuleGroupReference
    StatelessRuleGroupReference (..),
    newStatelessRuleGroupReference,
    statelessRuleGroupReference_resourceArn,
    statelessRuleGroupReference_priority,

    -- * StatelessRulesAndCustomActions
    StatelessRulesAndCustomActions (..),
    newStatelessRulesAndCustomActions,
    statelessRulesAndCustomActions_customActions,
    statelessRulesAndCustomActions_statelessRules,

    -- * SubnetMapping
    SubnetMapping (..),
    newSubnetMapping,
    subnetMapping_subnetId,

    -- * SyncState
    SyncState (..),
    newSyncState,
    syncState_config,
    syncState_attachment,

    -- * TCPFlagField
    TCPFlagField (..),
    newTCPFlagField,
    tCPFlagField_masks,
    tCPFlagField_flags,

    -- * Tag
    Tag (..),
    newTag,
    tag_key,
    tag_value,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import Amazonka.NetworkFirewall.Types.ActionDefinition
import Amazonka.NetworkFirewall.Types.Address
import Amazonka.NetworkFirewall.Types.Attachment
import Amazonka.NetworkFirewall.Types.AttachmentStatus
import Amazonka.NetworkFirewall.Types.ConfigurationSyncState
import Amazonka.NetworkFirewall.Types.CustomAction
import Amazonka.NetworkFirewall.Types.Dimension
import Amazonka.NetworkFirewall.Types.Firewall
import Amazonka.NetworkFirewall.Types.FirewallMetadata
import Amazonka.NetworkFirewall.Types.FirewallPolicy
import Amazonka.NetworkFirewall.Types.FirewallPolicyMetadata
import Amazonka.NetworkFirewall.Types.FirewallPolicyResponse
import Amazonka.NetworkFirewall.Types.FirewallStatus
import Amazonka.NetworkFirewall.Types.FirewallStatusValue
import Amazonka.NetworkFirewall.Types.GeneratedRulesType
import Amazonka.NetworkFirewall.Types.Header
import Amazonka.NetworkFirewall.Types.IPSet
import Amazonka.NetworkFirewall.Types.LogDestinationConfig
import Amazonka.NetworkFirewall.Types.LogDestinationType
import Amazonka.NetworkFirewall.Types.LogType
import Amazonka.NetworkFirewall.Types.LoggingConfiguration
import Amazonka.NetworkFirewall.Types.MatchAttributes
import Amazonka.NetworkFirewall.Types.PerObjectStatus
import Amazonka.NetworkFirewall.Types.PerObjectSyncStatus
import Amazonka.NetworkFirewall.Types.PortRange
import Amazonka.NetworkFirewall.Types.PortSet
import Amazonka.NetworkFirewall.Types.PublishMetricAction
import Amazonka.NetworkFirewall.Types.ResourceStatus
import Amazonka.NetworkFirewall.Types.RuleDefinition
import Amazonka.NetworkFirewall.Types.RuleGroup
import Amazonka.NetworkFirewall.Types.RuleGroupMetadata
import Amazonka.NetworkFirewall.Types.RuleGroupResponse
import Amazonka.NetworkFirewall.Types.RuleGroupType
import Amazonka.NetworkFirewall.Types.RuleOption
import Amazonka.NetworkFirewall.Types.RuleOrder
import Amazonka.NetworkFirewall.Types.RuleVariables
import Amazonka.NetworkFirewall.Types.RulesSource
import Amazonka.NetworkFirewall.Types.RulesSourceList
import Amazonka.NetworkFirewall.Types.StatefulAction
import Amazonka.NetworkFirewall.Types.StatefulEngineOptions
import Amazonka.NetworkFirewall.Types.StatefulRule
import Amazonka.NetworkFirewall.Types.StatefulRuleDirection
import Amazonka.NetworkFirewall.Types.StatefulRuleGroupReference
import Amazonka.NetworkFirewall.Types.StatefulRuleOptions
import Amazonka.NetworkFirewall.Types.StatefulRuleProtocol
import Amazonka.NetworkFirewall.Types.StatelessRule
import Amazonka.NetworkFirewall.Types.StatelessRuleGroupReference
import Amazonka.NetworkFirewall.Types.StatelessRulesAndCustomActions
import Amazonka.NetworkFirewall.Types.SubnetMapping
import Amazonka.NetworkFirewall.Types.SyncState
import Amazonka.NetworkFirewall.Types.TCPFlag
import Amazonka.NetworkFirewall.Types.TCPFlagField
import Amazonka.NetworkFirewall.Types.Tag
import Amazonka.NetworkFirewall.Types.TargetType
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Sign.V4 as Sign

-- | API version @2020-11-12@ of the Amazon Network Firewall SDK configuration.
defaultService :: Core.Service
defaultService =
  Core.Service
    { Core._serviceAbbrev =
        "NetworkFirewall",
      Core._serviceSigner = Sign.v4,
      Core._serviceEndpointPrefix = "network-firewall",
      Core._serviceSigningName = "network-firewall",
      Core._serviceVersion = "2020-11-12",
      Core._serviceEndpoint =
        Core.defaultEndpoint defaultService,
      Core._serviceTimeout = Prelude.Just 70,
      Core._serviceCheck = Core.statusSuccess,
      Core._serviceError =
        Core.parseJSONError "NetworkFirewall",
      Core._serviceRetry = retry
    }
  where
    retry =
      Core.Exponential
        { Core._retryBase = 5.0e-2,
          Core._retryGrowth = 2,
          Core._retryAttempts = 5,
          Core._retryCheck = check
        }
    check e
      | Lens.has
          ( Core.hasCode "ThrottledException"
              Prelude.. Core.hasStatus 400
          )
          e =
        Prelude.Just "throttled_exception"
      | Lens.has (Core.hasStatus 429) e =
        Prelude.Just "too_many_requests"
      | Lens.has
          ( Core.hasCode "ThrottlingException"
              Prelude.. Core.hasStatus 400
          )
          e =
        Prelude.Just "throttling_exception"
      | Lens.has
          ( Core.hasCode "Throttling"
              Prelude.. Core.hasStatus 400
          )
          e =
        Prelude.Just "throttling"
      | Lens.has
          ( Core.hasCode
              "ProvisionedThroughputExceededException"
              Prelude.. Core.hasStatus 400
          )
          e =
        Prelude.Just "throughput_exceeded"
      | Lens.has (Core.hasStatus 504) e =
        Prelude.Just "gateway_timeout"
      | Lens.has
          ( Core.hasCode "RequestThrottledException"
              Prelude.. Core.hasStatus 400
          )
          e =
        Prelude.Just "request_throttled_exception"
      | Lens.has (Core.hasStatus 502) e =
        Prelude.Just "bad_gateway"
      | Lens.has (Core.hasStatus 503) e =
        Prelude.Just "service_unavailable"
      | Lens.has (Core.hasStatus 500) e =
        Prelude.Just "general_server_error"
      | Lens.has (Core.hasStatus 509) e =
        Prelude.Just "limit_exceeded"
      | Prelude.otherwise = Prelude.Nothing

-- | Unable to send logs to a configured logging destination.
_LogDestinationPermissionException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_LogDestinationPermissionException =
  Core._MatchServiceError
    defaultService
    "LogDestinationPermissionException"

-- | The operation failed because of a problem with your request. Examples
-- include:
--
-- -   You specified an unsupported parameter name or value.
--
-- -   You tried to update a property with a value that isn\'t among the
--     available types.
--
-- -   Your request references an ARN that is malformed, or corresponds to
--     a resource that isn\'t valid in the context of the request.
_InvalidRequestException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InvalidRequestException =
  Core._MatchServiceError
    defaultService
    "InvalidRequestException"

-- | The operation you requested isn\'t supported by Network Firewall.
_UnsupportedOperationException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_UnsupportedOperationException =
  Core._MatchServiceError
    defaultService
    "UnsupportedOperationException"

-- | Unable to change the resource because your account doesn\'t own it.
_ResourceOwnerCheckException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_ResourceOwnerCheckException =
  Core._MatchServiceError
    defaultService
    "ResourceOwnerCheckException"

-- | The policy statement failed validation.
_InvalidResourcePolicyException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InvalidResourcePolicyException =
  Core._MatchServiceError
    defaultService
    "InvalidResourcePolicyException"

-- | Unable to process the request due to throttling limitations.
_ThrottlingException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_ThrottlingException =
  Core._MatchServiceError
    defaultService
    "ThrottlingException"

-- | Your request is valid, but Network Firewall couldn’t perform the
-- operation because of a system problem. Retry your request.
_InternalServerError :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InternalServerError =
  Core._MatchServiceError
    defaultService
    "InternalServerError"

-- | The token you provided is stale or isn\'t valid for the operation.
_InvalidTokenException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InvalidTokenException =
  Core._MatchServiceError
    defaultService
    "InvalidTokenException"

-- | The operation failed because it\'s not valid. For example, you might
-- have tried to delete a rule group or firewall policy that\'s in use.
_InvalidOperationException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InvalidOperationException =
  Core._MatchServiceError
    defaultService
    "InvalidOperationException"

-- | AWS doesn\'t currently have enough available capacity to fulfill your
-- request. Try your request later.
_InsufficientCapacityException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_InsufficientCapacityException =
  Core._MatchServiceError
    defaultService
    "InsufficientCapacityException"

-- | Unable to locate a resource using the parameters that you provided.
_ResourceNotFoundException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_ResourceNotFoundException =
  Core._MatchServiceError
    defaultService
    "ResourceNotFoundException"

-- | Unable to perform the operation because doing so would violate a limit
-- setting.
_LimitExceededException :: Core.AsError a => Lens.Getting (Prelude.First Core.ServiceError) a Core.ServiceError
_LimitExceededException =
  Core._MatchServiceError
    defaultService
    "LimitExceededException"
