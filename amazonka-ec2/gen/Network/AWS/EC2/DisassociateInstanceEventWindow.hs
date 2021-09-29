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
-- Module      : Network.AWS.EC2.DisassociateInstanceEventWindow
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Disassociates one or more targets from an event window.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html Define event windows for scheduled events>
-- in the /Amazon EC2 User Guide/.
module Network.AWS.EC2.DisassociateInstanceEventWindow
  ( -- * Creating a Request
    DisassociateInstanceEventWindow (..),
    newDisassociateInstanceEventWindow,

    -- * Request Lenses
    disassociateInstanceEventWindow_dryRun,
    disassociateInstanceEventWindow_instanceEventWindowId,
    disassociateInstanceEventWindow_associationTarget,

    -- * Destructuring the Response
    DisassociateInstanceEventWindowResponse (..),
    newDisassociateInstanceEventWindowResponse,

    -- * Response Lenses
    disassociateInstanceEventWindowResponse_instanceEventWindow,
    disassociateInstanceEventWindowResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import Network.AWS.EC2.Types
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDisassociateInstanceEventWindow' smart constructor.
data DisassociateInstanceEventWindow = DisassociateInstanceEventWindow'
  { -- | Checks whether you have the required permissions for the action, without
    -- actually making the request, and provides an error response. If you have
    -- the required permissions, the error response is @DryRunOperation@.
    -- Otherwise, it is @UnauthorizedOperation@.
    dryRun :: Prelude.Maybe Prelude.Bool,
    -- | The ID of the event window.
    instanceEventWindowId :: Prelude.Text,
    -- | One or more targets to disassociate from the specified event window.
    associationTarget :: InstanceEventWindowDisassociationRequest
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DisassociateInstanceEventWindow' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'dryRun', 'disassociateInstanceEventWindow_dryRun' - Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
--
-- 'instanceEventWindowId', 'disassociateInstanceEventWindow_instanceEventWindowId' - The ID of the event window.
--
-- 'associationTarget', 'disassociateInstanceEventWindow_associationTarget' - One or more targets to disassociate from the specified event window.
newDisassociateInstanceEventWindow ::
  -- | 'instanceEventWindowId'
  Prelude.Text ->
  -- | 'associationTarget'
  InstanceEventWindowDisassociationRequest ->
  DisassociateInstanceEventWindow
newDisassociateInstanceEventWindow
  pInstanceEventWindowId_
  pAssociationTarget_ =
    DisassociateInstanceEventWindow'
      { dryRun =
          Prelude.Nothing,
        instanceEventWindowId =
          pInstanceEventWindowId_,
        associationTarget = pAssociationTarget_
      }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
disassociateInstanceEventWindow_dryRun :: Lens.Lens' DisassociateInstanceEventWindow (Prelude.Maybe Prelude.Bool)
disassociateInstanceEventWindow_dryRun = Lens.lens (\DisassociateInstanceEventWindow' {dryRun} -> dryRun) (\s@DisassociateInstanceEventWindow' {} a -> s {dryRun = a} :: DisassociateInstanceEventWindow)

-- | The ID of the event window.
disassociateInstanceEventWindow_instanceEventWindowId :: Lens.Lens' DisassociateInstanceEventWindow Prelude.Text
disassociateInstanceEventWindow_instanceEventWindowId = Lens.lens (\DisassociateInstanceEventWindow' {instanceEventWindowId} -> instanceEventWindowId) (\s@DisassociateInstanceEventWindow' {} a -> s {instanceEventWindowId = a} :: DisassociateInstanceEventWindow)

-- | One or more targets to disassociate from the specified event window.
disassociateInstanceEventWindow_associationTarget :: Lens.Lens' DisassociateInstanceEventWindow InstanceEventWindowDisassociationRequest
disassociateInstanceEventWindow_associationTarget = Lens.lens (\DisassociateInstanceEventWindow' {associationTarget} -> associationTarget) (\s@DisassociateInstanceEventWindow' {} a -> s {associationTarget = a} :: DisassociateInstanceEventWindow)

instance
  Core.AWSRequest
    DisassociateInstanceEventWindow
  where
  type
    AWSResponse DisassociateInstanceEventWindow =
      DisassociateInstanceEventWindowResponse
  request = Request.postQuery defaultService
  response =
    Response.receiveXML
      ( \s h x ->
          DisassociateInstanceEventWindowResponse'
            Prelude.<$> (x Core..@? "instanceEventWindow")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    DisassociateInstanceEventWindow

instance
  Prelude.NFData
    DisassociateInstanceEventWindow

instance
  Core.ToHeaders
    DisassociateInstanceEventWindow
  where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToPath DisassociateInstanceEventWindow where
  toPath = Prelude.const "/"

instance Core.ToQuery DisassociateInstanceEventWindow where
  toQuery DisassociateInstanceEventWindow' {..} =
    Prelude.mconcat
      [ "Action"
          Core.=: ( "DisassociateInstanceEventWindow" ::
                      Prelude.ByteString
                  ),
        "Version"
          Core.=: ("2016-11-15" :: Prelude.ByteString),
        "DryRun" Core.=: dryRun,
        "InstanceEventWindowId"
          Core.=: instanceEventWindowId,
        "AssociationTarget" Core.=: associationTarget
      ]

-- | /See:/ 'newDisassociateInstanceEventWindowResponse' smart constructor.
data DisassociateInstanceEventWindowResponse = DisassociateInstanceEventWindowResponse'
  { -- | Information about the event window.
    instanceEventWindow :: Prelude.Maybe InstanceEventWindow,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DisassociateInstanceEventWindowResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'instanceEventWindow', 'disassociateInstanceEventWindowResponse_instanceEventWindow' - Information about the event window.
--
-- 'httpStatus', 'disassociateInstanceEventWindowResponse_httpStatus' - The response's http status code.
newDisassociateInstanceEventWindowResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  DisassociateInstanceEventWindowResponse
newDisassociateInstanceEventWindowResponse
  pHttpStatus_ =
    DisassociateInstanceEventWindowResponse'
      { instanceEventWindow =
          Prelude.Nothing,
        httpStatus = pHttpStatus_
      }

-- | Information about the event window.
disassociateInstanceEventWindowResponse_instanceEventWindow :: Lens.Lens' DisassociateInstanceEventWindowResponse (Prelude.Maybe InstanceEventWindow)
disassociateInstanceEventWindowResponse_instanceEventWindow = Lens.lens (\DisassociateInstanceEventWindowResponse' {instanceEventWindow} -> instanceEventWindow) (\s@DisassociateInstanceEventWindowResponse' {} a -> s {instanceEventWindow = a} :: DisassociateInstanceEventWindowResponse)

-- | The response's http status code.
disassociateInstanceEventWindowResponse_httpStatus :: Lens.Lens' DisassociateInstanceEventWindowResponse Prelude.Int
disassociateInstanceEventWindowResponse_httpStatus = Lens.lens (\DisassociateInstanceEventWindowResponse' {httpStatus} -> httpStatus) (\s@DisassociateInstanceEventWindowResponse' {} a -> s {httpStatus = a} :: DisassociateInstanceEventWindowResponse)

instance
  Prelude.NFData
    DisassociateInstanceEventWindowResponse
