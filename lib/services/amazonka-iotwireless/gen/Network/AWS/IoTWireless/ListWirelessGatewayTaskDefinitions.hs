{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.IoTWireless.ListWirelessGatewayTaskDefinitions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- List the wireless gateway tasks definitions registered to your AWS
-- account.
module Amazonka.IoTWireless.ListWirelessGatewayTaskDefinitions
  ( -- * Creating a Request
    ListWirelessGatewayTaskDefinitions (..),
    newListWirelessGatewayTaskDefinitions,

    -- * Request Lenses
    listWirelessGatewayTaskDefinitions_taskDefinitionType,
    listWirelessGatewayTaskDefinitions_nextToken,
    listWirelessGatewayTaskDefinitions_maxResults,

    -- * Destructuring the Response
    ListWirelessGatewayTaskDefinitionsResponse (..),
    newListWirelessGatewayTaskDefinitionsResponse,

    -- * Response Lenses
    listWirelessGatewayTaskDefinitionsResponse_taskDefinitions,
    listWirelessGatewayTaskDefinitionsResponse_nextToken,
    listWirelessGatewayTaskDefinitionsResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import Amazonka.IoTWireless.Types
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newListWirelessGatewayTaskDefinitions' smart constructor.
data ListWirelessGatewayTaskDefinitions = ListWirelessGatewayTaskDefinitions'
  { -- | A filter to list only the wireless gateway task definitions that use
    -- this task definition type.
    taskDefinitionType :: Prelude.Maybe WirelessGatewayTaskDefinitionType,
    -- | To retrieve the next set of results, the @nextToken@ value from a
    -- previous response; otherwise __null__ to receive the first set of
    -- results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to return in this operation.
    maxResults :: Prelude.Maybe Prelude.Natural
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListWirelessGatewayTaskDefinitions' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'taskDefinitionType', 'listWirelessGatewayTaskDefinitions_taskDefinitionType' - A filter to list only the wireless gateway task definitions that use
-- this task definition type.
--
-- 'nextToken', 'listWirelessGatewayTaskDefinitions_nextToken' - To retrieve the next set of results, the @nextToken@ value from a
-- previous response; otherwise __null__ to receive the first set of
-- results.
--
-- 'maxResults', 'listWirelessGatewayTaskDefinitions_maxResults' - The maximum number of results to return in this operation.
newListWirelessGatewayTaskDefinitions ::
  ListWirelessGatewayTaskDefinitions
newListWirelessGatewayTaskDefinitions =
  ListWirelessGatewayTaskDefinitions'
    { taskDefinitionType =
        Prelude.Nothing,
      nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing
    }

-- | A filter to list only the wireless gateway task definitions that use
-- this task definition type.
listWirelessGatewayTaskDefinitions_taskDefinitionType :: Lens.Lens' ListWirelessGatewayTaskDefinitions (Prelude.Maybe WirelessGatewayTaskDefinitionType)
listWirelessGatewayTaskDefinitions_taskDefinitionType = Lens.lens (\ListWirelessGatewayTaskDefinitions' {taskDefinitionType} -> taskDefinitionType) (\s@ListWirelessGatewayTaskDefinitions' {} a -> s {taskDefinitionType = a} :: ListWirelessGatewayTaskDefinitions)

-- | To retrieve the next set of results, the @nextToken@ value from a
-- previous response; otherwise __null__ to receive the first set of
-- results.
listWirelessGatewayTaskDefinitions_nextToken :: Lens.Lens' ListWirelessGatewayTaskDefinitions (Prelude.Maybe Prelude.Text)
listWirelessGatewayTaskDefinitions_nextToken = Lens.lens (\ListWirelessGatewayTaskDefinitions' {nextToken} -> nextToken) (\s@ListWirelessGatewayTaskDefinitions' {} a -> s {nextToken = a} :: ListWirelessGatewayTaskDefinitions)

-- | The maximum number of results to return in this operation.
listWirelessGatewayTaskDefinitions_maxResults :: Lens.Lens' ListWirelessGatewayTaskDefinitions (Prelude.Maybe Prelude.Natural)
listWirelessGatewayTaskDefinitions_maxResults = Lens.lens (\ListWirelessGatewayTaskDefinitions' {maxResults} -> maxResults) (\s@ListWirelessGatewayTaskDefinitions' {} a -> s {maxResults = a} :: ListWirelessGatewayTaskDefinitions)

instance
  Core.AWSRequest
    ListWirelessGatewayTaskDefinitions
  where
  type
    AWSResponse ListWirelessGatewayTaskDefinitions =
      ListWirelessGatewayTaskDefinitionsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListWirelessGatewayTaskDefinitionsResponse'
            Prelude.<$> ( x Core..?> "TaskDefinitions"
                            Core..!@ Prelude.mempty
                        )
              Prelude.<*> (x Core..?> "NextToken")
              Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    ListWirelessGatewayTaskDefinitions

instance
  Prelude.NFData
    ListWirelessGatewayTaskDefinitions

instance
  Core.ToHeaders
    ListWirelessGatewayTaskDefinitions
  where
  toHeaders = Prelude.const Prelude.mempty

instance
  Core.ToPath
    ListWirelessGatewayTaskDefinitions
  where
  toPath =
    Prelude.const "/wireless-gateway-task-definitions"

instance
  Core.ToQuery
    ListWirelessGatewayTaskDefinitions
  where
  toQuery ListWirelessGatewayTaskDefinitions' {..} =
    Prelude.mconcat
      [ "taskDefinitionType" Core.=: taskDefinitionType,
        "nextToken" Core.=: nextToken,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newListWirelessGatewayTaskDefinitionsResponse' smart constructor.
data ListWirelessGatewayTaskDefinitionsResponse = ListWirelessGatewayTaskDefinitionsResponse'
  { -- | The list of task definitions.
    taskDefinitions :: Prelude.Maybe [UpdateWirelessGatewayTaskEntry],
    -- | The token to use to get the next set of results, or __null__ if there
    -- are no additional results.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListWirelessGatewayTaskDefinitionsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'taskDefinitions', 'listWirelessGatewayTaskDefinitionsResponse_taskDefinitions' - The list of task definitions.
--
-- 'nextToken', 'listWirelessGatewayTaskDefinitionsResponse_nextToken' - The token to use to get the next set of results, or __null__ if there
-- are no additional results.
--
-- 'httpStatus', 'listWirelessGatewayTaskDefinitionsResponse_httpStatus' - The response's http status code.
newListWirelessGatewayTaskDefinitionsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListWirelessGatewayTaskDefinitionsResponse
newListWirelessGatewayTaskDefinitionsResponse
  pHttpStatus_ =
    ListWirelessGatewayTaskDefinitionsResponse'
      { taskDefinitions =
          Prelude.Nothing,
        nextToken = Prelude.Nothing,
        httpStatus = pHttpStatus_
      }

-- | The list of task definitions.
listWirelessGatewayTaskDefinitionsResponse_taskDefinitions :: Lens.Lens' ListWirelessGatewayTaskDefinitionsResponse (Prelude.Maybe [UpdateWirelessGatewayTaskEntry])
listWirelessGatewayTaskDefinitionsResponse_taskDefinitions = Lens.lens (\ListWirelessGatewayTaskDefinitionsResponse' {taskDefinitions} -> taskDefinitions) (\s@ListWirelessGatewayTaskDefinitionsResponse' {} a -> s {taskDefinitions = a} :: ListWirelessGatewayTaskDefinitionsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The token to use to get the next set of results, or __null__ if there
-- are no additional results.
listWirelessGatewayTaskDefinitionsResponse_nextToken :: Lens.Lens' ListWirelessGatewayTaskDefinitionsResponse (Prelude.Maybe Prelude.Text)
listWirelessGatewayTaskDefinitionsResponse_nextToken = Lens.lens (\ListWirelessGatewayTaskDefinitionsResponse' {nextToken} -> nextToken) (\s@ListWirelessGatewayTaskDefinitionsResponse' {} a -> s {nextToken = a} :: ListWirelessGatewayTaskDefinitionsResponse)

-- | The response's http status code.
listWirelessGatewayTaskDefinitionsResponse_httpStatus :: Lens.Lens' ListWirelessGatewayTaskDefinitionsResponse Prelude.Int
listWirelessGatewayTaskDefinitionsResponse_httpStatus = Lens.lens (\ListWirelessGatewayTaskDefinitionsResponse' {httpStatus} -> httpStatus) (\s@ListWirelessGatewayTaskDefinitionsResponse' {} a -> s {httpStatus = a} :: ListWirelessGatewayTaskDefinitionsResponse)

instance
  Prelude.NFData
    ListWirelessGatewayTaskDefinitionsResponse
