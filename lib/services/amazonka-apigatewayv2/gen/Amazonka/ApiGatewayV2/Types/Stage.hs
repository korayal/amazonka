{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.ApiGatewayV2.Types.Stage
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ApiGatewayV2.Types.Stage where

import Amazonka.ApiGatewayV2.Types.AccessLogSettings
import Amazonka.ApiGatewayV2.Types.RouteSettings
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Represents an API stage.
--
-- /See:/ 'newStage' smart constructor.
data Stage = Stage'
  { -- | The collection of tags. Each tag element is associated with a given
    -- resource.
    tags :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | Settings for logging access in this stage.
    accessLogSettings :: Prelude.Maybe AccessLogSettings,
    -- | The identifier of the Deployment that the Stage is associated with.
    -- Can\'t be updated if autoDeploy is enabled.
    deploymentId :: Prelude.Maybe Prelude.Text,
    -- | Specifies whether updates to an API automatically trigger a new
    -- deployment. The default value is false.
    autoDeploy :: Prelude.Maybe Prelude.Bool,
    -- | The timestamp when the stage was last updated.
    lastUpdatedDate :: Prelude.Maybe Core.POSIX,
    -- | A map that defines the stage variables for a stage resource. Variable
    -- names can have alphanumeric and underscore characters, and the values
    -- must match [A-Za-z0-9-._~:\/?#&=,]+.
    stageVariables :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | The description of the stage.
    description :: Prelude.Maybe Prelude.Text,
    -- | The identifier of a client certificate for a Stage. Supported only for
    -- WebSocket APIs.
    clientCertificateId :: Prelude.Maybe Prelude.Text,
    -- | Describes the status of the last deployment of a stage. Supported only
    -- for stages with autoDeploy enabled.
    lastDeploymentStatusMessage :: Prelude.Maybe Prelude.Text,
    -- | Default route settings for the stage.
    defaultRouteSettings :: Prelude.Maybe RouteSettings,
    -- | The timestamp when the stage was created.
    createdDate :: Prelude.Maybe Core.POSIX,
    -- | Specifies whether a stage is managed by API Gateway. If you created an
    -- API using quick create, the $default stage is managed by API Gateway.
    -- You can\'t modify the $default stage.
    apiGatewayManaged :: Prelude.Maybe Prelude.Bool,
    -- | Route settings for the stage, by routeKey.
    routeSettings :: Prelude.Maybe (Prelude.HashMap Prelude.Text RouteSettings),
    -- | The name of the stage.
    stageName :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'Stage' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'tags', 'stage_tags' - The collection of tags. Each tag element is associated with a given
-- resource.
--
-- 'accessLogSettings', 'stage_accessLogSettings' - Settings for logging access in this stage.
--
-- 'deploymentId', 'stage_deploymentId' - The identifier of the Deployment that the Stage is associated with.
-- Can\'t be updated if autoDeploy is enabled.
--
-- 'autoDeploy', 'stage_autoDeploy' - Specifies whether updates to an API automatically trigger a new
-- deployment. The default value is false.
--
-- 'lastUpdatedDate', 'stage_lastUpdatedDate' - The timestamp when the stage was last updated.
--
-- 'stageVariables', 'stage_stageVariables' - A map that defines the stage variables for a stage resource. Variable
-- names can have alphanumeric and underscore characters, and the values
-- must match [A-Za-z0-9-._~:\/?#&=,]+.
--
-- 'description', 'stage_description' - The description of the stage.
--
-- 'clientCertificateId', 'stage_clientCertificateId' - The identifier of a client certificate for a Stage. Supported only for
-- WebSocket APIs.
--
-- 'lastDeploymentStatusMessage', 'stage_lastDeploymentStatusMessage' - Describes the status of the last deployment of a stage. Supported only
-- for stages with autoDeploy enabled.
--
-- 'defaultRouteSettings', 'stage_defaultRouteSettings' - Default route settings for the stage.
--
-- 'createdDate', 'stage_createdDate' - The timestamp when the stage was created.
--
-- 'apiGatewayManaged', 'stage_apiGatewayManaged' - Specifies whether a stage is managed by API Gateway. If you created an
-- API using quick create, the $default stage is managed by API Gateway.
-- You can\'t modify the $default stage.
--
-- 'routeSettings', 'stage_routeSettings' - Route settings for the stage, by routeKey.
--
-- 'stageName', 'stage_stageName' - The name of the stage.
newStage ::
  -- | 'stageName'
  Prelude.Text ->
  Stage
newStage pStageName_ =
  Stage'
    { tags = Prelude.Nothing,
      accessLogSettings = Prelude.Nothing,
      deploymentId = Prelude.Nothing,
      autoDeploy = Prelude.Nothing,
      lastUpdatedDate = Prelude.Nothing,
      stageVariables = Prelude.Nothing,
      description = Prelude.Nothing,
      clientCertificateId = Prelude.Nothing,
      lastDeploymentStatusMessage = Prelude.Nothing,
      defaultRouteSettings = Prelude.Nothing,
      createdDate = Prelude.Nothing,
      apiGatewayManaged = Prelude.Nothing,
      routeSettings = Prelude.Nothing,
      stageName = pStageName_
    }

-- | The collection of tags. Each tag element is associated with a given
-- resource.
stage_tags :: Lens.Lens' Stage (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
stage_tags = Lens.lens (\Stage' {tags} -> tags) (\s@Stage' {} a -> s {tags = a} :: Stage) Prelude.. Lens.mapping Lens.coerced

-- | Settings for logging access in this stage.
stage_accessLogSettings :: Lens.Lens' Stage (Prelude.Maybe AccessLogSettings)
stage_accessLogSettings = Lens.lens (\Stage' {accessLogSettings} -> accessLogSettings) (\s@Stage' {} a -> s {accessLogSettings = a} :: Stage)

-- | The identifier of the Deployment that the Stage is associated with.
-- Can\'t be updated if autoDeploy is enabled.
stage_deploymentId :: Lens.Lens' Stage (Prelude.Maybe Prelude.Text)
stage_deploymentId = Lens.lens (\Stage' {deploymentId} -> deploymentId) (\s@Stage' {} a -> s {deploymentId = a} :: Stage)

-- | Specifies whether updates to an API automatically trigger a new
-- deployment. The default value is false.
stage_autoDeploy :: Lens.Lens' Stage (Prelude.Maybe Prelude.Bool)
stage_autoDeploy = Lens.lens (\Stage' {autoDeploy} -> autoDeploy) (\s@Stage' {} a -> s {autoDeploy = a} :: Stage)

-- | The timestamp when the stage was last updated.
stage_lastUpdatedDate :: Lens.Lens' Stage (Prelude.Maybe Prelude.UTCTime)
stage_lastUpdatedDate = Lens.lens (\Stage' {lastUpdatedDate} -> lastUpdatedDate) (\s@Stage' {} a -> s {lastUpdatedDate = a} :: Stage) Prelude.. Lens.mapping Core._Time

-- | A map that defines the stage variables for a stage resource. Variable
-- names can have alphanumeric and underscore characters, and the values
-- must match [A-Za-z0-9-._~:\/?#&=,]+.
stage_stageVariables :: Lens.Lens' Stage (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
stage_stageVariables = Lens.lens (\Stage' {stageVariables} -> stageVariables) (\s@Stage' {} a -> s {stageVariables = a} :: Stage) Prelude.. Lens.mapping Lens.coerced

-- | The description of the stage.
stage_description :: Lens.Lens' Stage (Prelude.Maybe Prelude.Text)
stage_description = Lens.lens (\Stage' {description} -> description) (\s@Stage' {} a -> s {description = a} :: Stage)

-- | The identifier of a client certificate for a Stage. Supported only for
-- WebSocket APIs.
stage_clientCertificateId :: Lens.Lens' Stage (Prelude.Maybe Prelude.Text)
stage_clientCertificateId = Lens.lens (\Stage' {clientCertificateId} -> clientCertificateId) (\s@Stage' {} a -> s {clientCertificateId = a} :: Stage)

-- | Describes the status of the last deployment of a stage. Supported only
-- for stages with autoDeploy enabled.
stage_lastDeploymentStatusMessage :: Lens.Lens' Stage (Prelude.Maybe Prelude.Text)
stage_lastDeploymentStatusMessage = Lens.lens (\Stage' {lastDeploymentStatusMessage} -> lastDeploymentStatusMessage) (\s@Stage' {} a -> s {lastDeploymentStatusMessage = a} :: Stage)

-- | Default route settings for the stage.
stage_defaultRouteSettings :: Lens.Lens' Stage (Prelude.Maybe RouteSettings)
stage_defaultRouteSettings = Lens.lens (\Stage' {defaultRouteSettings} -> defaultRouteSettings) (\s@Stage' {} a -> s {defaultRouteSettings = a} :: Stage)

-- | The timestamp when the stage was created.
stage_createdDate :: Lens.Lens' Stage (Prelude.Maybe Prelude.UTCTime)
stage_createdDate = Lens.lens (\Stage' {createdDate} -> createdDate) (\s@Stage' {} a -> s {createdDate = a} :: Stage) Prelude.. Lens.mapping Core._Time

-- | Specifies whether a stage is managed by API Gateway. If you created an
-- API using quick create, the $default stage is managed by API Gateway.
-- You can\'t modify the $default stage.
stage_apiGatewayManaged :: Lens.Lens' Stage (Prelude.Maybe Prelude.Bool)
stage_apiGatewayManaged = Lens.lens (\Stage' {apiGatewayManaged} -> apiGatewayManaged) (\s@Stage' {} a -> s {apiGatewayManaged = a} :: Stage)

-- | Route settings for the stage, by routeKey.
stage_routeSettings :: Lens.Lens' Stage (Prelude.Maybe (Prelude.HashMap Prelude.Text RouteSettings))
stage_routeSettings = Lens.lens (\Stage' {routeSettings} -> routeSettings) (\s@Stage' {} a -> s {routeSettings = a} :: Stage) Prelude.. Lens.mapping Lens.coerced

-- | The name of the stage.
stage_stageName :: Lens.Lens' Stage Prelude.Text
stage_stageName = Lens.lens (\Stage' {stageName} -> stageName) (\s@Stage' {} a -> s {stageName = a} :: Stage)

instance Core.FromJSON Stage where
  parseJSON =
    Core.withObject
      "Stage"
      ( \x ->
          Stage'
            Prelude.<$> (x Core..:? "tags" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "accessLogSettings")
            Prelude.<*> (x Core..:? "deploymentId")
            Prelude.<*> (x Core..:? "autoDeploy")
            Prelude.<*> (x Core..:? "lastUpdatedDate")
            Prelude.<*> (x Core..:? "stageVariables" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "description")
            Prelude.<*> (x Core..:? "clientCertificateId")
            Prelude.<*> (x Core..:? "lastDeploymentStatusMessage")
            Prelude.<*> (x Core..:? "defaultRouteSettings")
            Prelude.<*> (x Core..:? "createdDate")
            Prelude.<*> (x Core..:? "apiGatewayManaged")
            Prelude.<*> (x Core..:? "routeSettings" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..: "stageName")
      )

instance Prelude.Hashable Stage where
  hashWithSalt _salt Stage' {..} =
    _salt `Prelude.hashWithSalt` tags
      `Prelude.hashWithSalt` accessLogSettings
      `Prelude.hashWithSalt` deploymentId
      `Prelude.hashWithSalt` autoDeploy
      `Prelude.hashWithSalt` lastUpdatedDate
      `Prelude.hashWithSalt` stageVariables
      `Prelude.hashWithSalt` description
      `Prelude.hashWithSalt` clientCertificateId
      `Prelude.hashWithSalt` lastDeploymentStatusMessage
      `Prelude.hashWithSalt` defaultRouteSettings
      `Prelude.hashWithSalt` createdDate
      `Prelude.hashWithSalt` apiGatewayManaged
      `Prelude.hashWithSalt` routeSettings
      `Prelude.hashWithSalt` stageName

instance Prelude.NFData Stage where
  rnf Stage' {..} =
    Prelude.rnf tags
      `Prelude.seq` Prelude.rnf accessLogSettings
      `Prelude.seq` Prelude.rnf deploymentId
      `Prelude.seq` Prelude.rnf autoDeploy
      `Prelude.seq` Prelude.rnf lastUpdatedDate
      `Prelude.seq` Prelude.rnf stageVariables
      `Prelude.seq` Prelude.rnf description
      `Prelude.seq` Prelude.rnf clientCertificateId
      `Prelude.seq` Prelude.rnf lastDeploymentStatusMessage
      `Prelude.seq` Prelude.rnf defaultRouteSettings
      `Prelude.seq` Prelude.rnf createdDate
      `Prelude.seq` Prelude.rnf apiGatewayManaged
      `Prelude.seq` Prelude.rnf routeSettings
      `Prelude.seq` Prelude.rnf stageName
