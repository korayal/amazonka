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
-- Module      : Amazonka.ElasticSearch.Types.CompatibleVersionsMap
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ElasticSearch.Types.CompatibleVersionsMap where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

-- | A map from an @ ElasticsearchVersion @ to a list of compatible
-- @ ElasticsearchVersion @ s to which the domain can be upgraded.
--
-- /See:/ 'newCompatibleVersionsMap' smart constructor.
data CompatibleVersionsMap = CompatibleVersionsMap'
  { targetVersions :: Prelude.Maybe [Prelude.Text],
    -- | The current version of Elasticsearch on which a domain is.
    sourceVersion :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CompatibleVersionsMap' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'targetVersions', 'compatibleVersionsMap_targetVersions' - Undocumented member.
--
-- 'sourceVersion', 'compatibleVersionsMap_sourceVersion' - The current version of Elasticsearch on which a domain is.
newCompatibleVersionsMap ::
  CompatibleVersionsMap
newCompatibleVersionsMap =
  CompatibleVersionsMap'
    { targetVersions =
        Prelude.Nothing,
      sourceVersion = Prelude.Nothing
    }

-- | Undocumented member.
compatibleVersionsMap_targetVersions :: Lens.Lens' CompatibleVersionsMap (Prelude.Maybe [Prelude.Text])
compatibleVersionsMap_targetVersions = Lens.lens (\CompatibleVersionsMap' {targetVersions} -> targetVersions) (\s@CompatibleVersionsMap' {} a -> s {targetVersions = a} :: CompatibleVersionsMap) Prelude.. Lens.mapping Lens.coerced

-- | The current version of Elasticsearch on which a domain is.
compatibleVersionsMap_sourceVersion :: Lens.Lens' CompatibleVersionsMap (Prelude.Maybe Prelude.Text)
compatibleVersionsMap_sourceVersion = Lens.lens (\CompatibleVersionsMap' {sourceVersion} -> sourceVersion) (\s@CompatibleVersionsMap' {} a -> s {sourceVersion = a} :: CompatibleVersionsMap)

instance Data.FromJSON CompatibleVersionsMap where
  parseJSON =
    Data.withObject
      "CompatibleVersionsMap"
      ( \x ->
          CompatibleVersionsMap'
            Prelude.<$> (x Data..:? "TargetVersions" Data..!= Prelude.mempty)
            Prelude.<*> (x Data..:? "SourceVersion")
      )

instance Prelude.Hashable CompatibleVersionsMap where
  hashWithSalt _salt CompatibleVersionsMap' {..} =
    _salt `Prelude.hashWithSalt` targetVersions
      `Prelude.hashWithSalt` sourceVersion

instance Prelude.NFData CompatibleVersionsMap where
  rnf CompatibleVersionsMap' {..} =
    Prelude.rnf targetVersions
      `Prelude.seq` Prelude.rnf sourceVersion
