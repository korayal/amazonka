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
-- Module      : Amazonka.EMRServerless.Types.Configuration
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.EMRServerless.Types.Configuration where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Prelude as Prelude

-- | A configuration specification to be used when provisioning an
-- application. A configuration consists of a classification, properties,
-- and optional nested configurations. A classification refers to an
-- application-specific configuration file. Properties are the settings you
-- want to change in that file.
--
-- /See:/ 'newConfiguration' smart constructor.
data Configuration = Configuration'
  { -- | A set of properties specified within a configuration classification.
    properties :: Prelude.Maybe (Core.Sensitive (Prelude.HashMap Prelude.Text Prelude.Text)),
    -- | A list of additional configurations to apply within a configuration
    -- object.
    configurations :: Prelude.Maybe [Configuration],
    -- | The classification within a configuration.
    classification :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'Configuration' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'properties', 'configuration_properties' - A set of properties specified within a configuration classification.
--
-- 'configurations', 'configuration_configurations' - A list of additional configurations to apply within a configuration
-- object.
--
-- 'classification', 'configuration_classification' - The classification within a configuration.
newConfiguration ::
  -- | 'classification'
  Prelude.Text ->
  Configuration
newConfiguration pClassification_ =
  Configuration'
    { properties = Prelude.Nothing,
      configurations = Prelude.Nothing,
      classification = pClassification_
    }

-- | A set of properties specified within a configuration classification.
configuration_properties :: Lens.Lens' Configuration (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
configuration_properties = Lens.lens (\Configuration' {properties} -> properties) (\s@Configuration' {} a -> s {properties = a} :: Configuration) Prelude.. Lens.mapping (Core._Sensitive Prelude.. Lens.coerced)

-- | A list of additional configurations to apply within a configuration
-- object.
configuration_configurations :: Lens.Lens' Configuration (Prelude.Maybe [Configuration])
configuration_configurations = Lens.lens (\Configuration' {configurations} -> configurations) (\s@Configuration' {} a -> s {configurations = a} :: Configuration) Prelude.. Lens.mapping Lens.coerced

-- | The classification within a configuration.
configuration_classification :: Lens.Lens' Configuration Prelude.Text
configuration_classification = Lens.lens (\Configuration' {classification} -> classification) (\s@Configuration' {} a -> s {classification = a} :: Configuration)

instance Core.FromJSON Configuration where
  parseJSON =
    Core.withObject
      "Configuration"
      ( \x ->
          Configuration'
            Prelude.<$> (x Core..:? "properties" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "configurations" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..: "classification")
      )

instance Prelude.Hashable Configuration where
  hashWithSalt _salt Configuration' {..} =
    _salt `Prelude.hashWithSalt` properties
      `Prelude.hashWithSalt` configurations
      `Prelude.hashWithSalt` classification

instance Prelude.NFData Configuration where
  rnf Configuration' {..} =
    Prelude.rnf properties
      `Prelude.seq` Prelude.rnf configurations
      `Prelude.seq` Prelude.rnf classification

instance Core.ToJSON Configuration where
  toJSON Configuration' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("properties" Core..=) Prelude.<$> properties,
            ("configurations" Core..=)
              Prelude.<$> configurations,
            Prelude.Just
              ("classification" Core..= classification)
          ]
      )
