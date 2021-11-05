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
-- Module      : Amazonka.NetworkFirewall.UpdateSubnetChangeProtection
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.NetworkFirewall.UpdateSubnetChangeProtection
  ( -- * Creating a Request
    UpdateSubnetChangeProtection (..),
    newUpdateSubnetChangeProtection,

    -- * Request Lenses
    updateSubnetChangeProtection_updateToken,
    updateSubnetChangeProtection_firewallArn,
    updateSubnetChangeProtection_firewallName,
    updateSubnetChangeProtection_subnetChangeProtection,

    -- * Destructuring the Response
    UpdateSubnetChangeProtectionResponse (..),
    newUpdateSubnetChangeProtectionResponse,

    -- * Response Lenses
    updateSubnetChangeProtectionResponse_updateToken,
    updateSubnetChangeProtectionResponse_firewallArn,
    updateSubnetChangeProtectionResponse_subnetChangeProtection,
    updateSubnetChangeProtectionResponse_firewallName,
    updateSubnetChangeProtectionResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import Amazonka.NetworkFirewall.Types
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newUpdateSubnetChangeProtection' smart constructor.
data UpdateSubnetChangeProtection = UpdateSubnetChangeProtection'
  { -- | An optional token that you can use for optimistic locking. Network
    -- Firewall returns a token to your requests that access the firewall. The
    -- token marks the state of the firewall resource at the time of the
    -- request.
    --
    -- To make an unconditional change to the firewall, omit the token in your
    -- update request. Without the token, Network Firewall performs your
    -- updates regardless of whether the firewall has changed since you last
    -- retrieved it.
    --
    -- To make a conditional change to the firewall, provide the token in your
    -- update request. Network Firewall uses the token to ensure that the
    -- firewall hasn\'t changed since you last retrieved it. If it has changed,
    -- the operation fails with an @InvalidTokenException@. If this happens,
    -- retrieve the firewall again to get a current copy of it with a new
    -- token. Reapply your changes as needed, then try the operation again
    -- using the new token.
    updateToken :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the firewall.
    --
    -- You must specify the ARN or the name, and you can specify both.
    firewallArn :: Prelude.Maybe Prelude.Text,
    -- | The descriptive name of the firewall. You can\'t change the name of a
    -- firewall after you create it.
    --
    -- You must specify the ARN or the name, and you can specify both.
    firewallName :: Prelude.Maybe Prelude.Text,
    -- | A setting indicating whether the firewall is protected against changes
    -- to the subnet associations. Use this setting to protect against
    -- accidentally modifying the subnet associations for a firewall that is in
    -- use. When you create a firewall, the operation initializes this setting
    -- to @TRUE@.
    subnetChangeProtection :: Prelude.Bool
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'UpdateSubnetChangeProtection' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'updateToken', 'updateSubnetChangeProtection_updateToken' - An optional token that you can use for optimistic locking. Network
-- Firewall returns a token to your requests that access the firewall. The
-- token marks the state of the firewall resource at the time of the
-- request.
--
-- To make an unconditional change to the firewall, omit the token in your
-- update request. Without the token, Network Firewall performs your
-- updates regardless of whether the firewall has changed since you last
-- retrieved it.
--
-- To make a conditional change to the firewall, provide the token in your
-- update request. Network Firewall uses the token to ensure that the
-- firewall hasn\'t changed since you last retrieved it. If it has changed,
-- the operation fails with an @InvalidTokenException@. If this happens,
-- retrieve the firewall again to get a current copy of it with a new
-- token. Reapply your changes as needed, then try the operation again
-- using the new token.
--
-- 'firewallArn', 'updateSubnetChangeProtection_firewallArn' - The Amazon Resource Name (ARN) of the firewall.
--
-- You must specify the ARN or the name, and you can specify both.
--
-- 'firewallName', 'updateSubnetChangeProtection_firewallName' - The descriptive name of the firewall. You can\'t change the name of a
-- firewall after you create it.
--
-- You must specify the ARN or the name, and you can specify both.
--
-- 'subnetChangeProtection', 'updateSubnetChangeProtection_subnetChangeProtection' - A setting indicating whether the firewall is protected against changes
-- to the subnet associations. Use this setting to protect against
-- accidentally modifying the subnet associations for a firewall that is in
-- use. When you create a firewall, the operation initializes this setting
-- to @TRUE@.
newUpdateSubnetChangeProtection ::
  -- | 'subnetChangeProtection'
  Prelude.Bool ->
  UpdateSubnetChangeProtection
newUpdateSubnetChangeProtection
  pSubnetChangeProtection_ =
    UpdateSubnetChangeProtection'
      { updateToken =
          Prelude.Nothing,
        firewallArn = Prelude.Nothing,
        firewallName = Prelude.Nothing,
        subnetChangeProtection =
          pSubnetChangeProtection_
      }

-- | An optional token that you can use for optimistic locking. Network
-- Firewall returns a token to your requests that access the firewall. The
-- token marks the state of the firewall resource at the time of the
-- request.
--
-- To make an unconditional change to the firewall, omit the token in your
-- update request. Without the token, Network Firewall performs your
-- updates regardless of whether the firewall has changed since you last
-- retrieved it.
--
-- To make a conditional change to the firewall, provide the token in your
-- update request. Network Firewall uses the token to ensure that the
-- firewall hasn\'t changed since you last retrieved it. If it has changed,
-- the operation fails with an @InvalidTokenException@. If this happens,
-- retrieve the firewall again to get a current copy of it with a new
-- token. Reapply your changes as needed, then try the operation again
-- using the new token.
updateSubnetChangeProtection_updateToken :: Lens.Lens' UpdateSubnetChangeProtection (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtection_updateToken = Lens.lens (\UpdateSubnetChangeProtection' {updateToken} -> updateToken) (\s@UpdateSubnetChangeProtection' {} a -> s {updateToken = a} :: UpdateSubnetChangeProtection)

-- | The Amazon Resource Name (ARN) of the firewall.
--
-- You must specify the ARN or the name, and you can specify both.
updateSubnetChangeProtection_firewallArn :: Lens.Lens' UpdateSubnetChangeProtection (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtection_firewallArn = Lens.lens (\UpdateSubnetChangeProtection' {firewallArn} -> firewallArn) (\s@UpdateSubnetChangeProtection' {} a -> s {firewallArn = a} :: UpdateSubnetChangeProtection)

-- | The descriptive name of the firewall. You can\'t change the name of a
-- firewall after you create it.
--
-- You must specify the ARN or the name, and you can specify both.
updateSubnetChangeProtection_firewallName :: Lens.Lens' UpdateSubnetChangeProtection (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtection_firewallName = Lens.lens (\UpdateSubnetChangeProtection' {firewallName} -> firewallName) (\s@UpdateSubnetChangeProtection' {} a -> s {firewallName = a} :: UpdateSubnetChangeProtection)

-- | A setting indicating whether the firewall is protected against changes
-- to the subnet associations. Use this setting to protect against
-- accidentally modifying the subnet associations for a firewall that is in
-- use. When you create a firewall, the operation initializes this setting
-- to @TRUE@.
updateSubnetChangeProtection_subnetChangeProtection :: Lens.Lens' UpdateSubnetChangeProtection Prelude.Bool
updateSubnetChangeProtection_subnetChangeProtection = Lens.lens (\UpdateSubnetChangeProtection' {subnetChangeProtection} -> subnetChangeProtection) (\s@UpdateSubnetChangeProtection' {} a -> s {subnetChangeProtection = a} :: UpdateSubnetChangeProtection)

instance Core.AWSRequest UpdateSubnetChangeProtection where
  type
    AWSResponse UpdateSubnetChangeProtection =
      UpdateSubnetChangeProtectionResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          UpdateSubnetChangeProtectionResponse'
            Prelude.<$> (x Core..?> "UpdateToken")
            Prelude.<*> (x Core..?> "FirewallArn")
            Prelude.<*> (x Core..?> "SubnetChangeProtection")
            Prelude.<*> (x Core..?> "FirewallName")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    UpdateSubnetChangeProtection

instance Prelude.NFData UpdateSubnetChangeProtection

instance Core.ToHeaders UpdateSubnetChangeProtection where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "NetworkFirewall_20201112.UpdateSubnetChangeProtection" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.0" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON UpdateSubnetChangeProtection where
  toJSON UpdateSubnetChangeProtection' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("UpdateToken" Core..=) Prelude.<$> updateToken,
            ("FirewallArn" Core..=) Prelude.<$> firewallArn,
            ("FirewallName" Core..=) Prelude.<$> firewallName,
            Prelude.Just
              ( "SubnetChangeProtection"
                  Core..= subnetChangeProtection
              )
          ]
      )

instance Core.ToPath UpdateSubnetChangeProtection where
  toPath = Prelude.const "/"

instance Core.ToQuery UpdateSubnetChangeProtection where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newUpdateSubnetChangeProtectionResponse' smart constructor.
data UpdateSubnetChangeProtectionResponse = UpdateSubnetChangeProtectionResponse'
  { -- | An optional token that you can use for optimistic locking. Network
    -- Firewall returns a token to your requests that access the firewall. The
    -- token marks the state of the firewall resource at the time of the
    -- request.
    --
    -- To make an unconditional change to the firewall, omit the token in your
    -- update request. Without the token, Network Firewall performs your
    -- updates regardless of whether the firewall has changed since you last
    -- retrieved it.
    --
    -- To make a conditional change to the firewall, provide the token in your
    -- update request. Network Firewall uses the token to ensure that the
    -- firewall hasn\'t changed since you last retrieved it. If it has changed,
    -- the operation fails with an @InvalidTokenException@. If this happens,
    -- retrieve the firewall again to get a current copy of it with a new
    -- token. Reapply your changes as needed, then try the operation again
    -- using the new token.
    updateToken :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the firewall.
    firewallArn :: Prelude.Maybe Prelude.Text,
    -- | A setting indicating whether the firewall is protected against changes
    -- to the subnet associations. Use this setting to protect against
    -- accidentally modifying the subnet associations for a firewall that is in
    -- use. When you create a firewall, the operation initializes this setting
    -- to @TRUE@.
    subnetChangeProtection :: Prelude.Maybe Prelude.Bool,
    -- | The descriptive name of the firewall. You can\'t change the name of a
    -- firewall after you create it.
    firewallName :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'UpdateSubnetChangeProtectionResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'updateToken', 'updateSubnetChangeProtectionResponse_updateToken' - An optional token that you can use for optimistic locking. Network
-- Firewall returns a token to your requests that access the firewall. The
-- token marks the state of the firewall resource at the time of the
-- request.
--
-- To make an unconditional change to the firewall, omit the token in your
-- update request. Without the token, Network Firewall performs your
-- updates regardless of whether the firewall has changed since you last
-- retrieved it.
--
-- To make a conditional change to the firewall, provide the token in your
-- update request. Network Firewall uses the token to ensure that the
-- firewall hasn\'t changed since you last retrieved it. If it has changed,
-- the operation fails with an @InvalidTokenException@. If this happens,
-- retrieve the firewall again to get a current copy of it with a new
-- token. Reapply your changes as needed, then try the operation again
-- using the new token.
--
-- 'firewallArn', 'updateSubnetChangeProtectionResponse_firewallArn' - The Amazon Resource Name (ARN) of the firewall.
--
-- 'subnetChangeProtection', 'updateSubnetChangeProtectionResponse_subnetChangeProtection' - A setting indicating whether the firewall is protected against changes
-- to the subnet associations. Use this setting to protect against
-- accidentally modifying the subnet associations for a firewall that is in
-- use. When you create a firewall, the operation initializes this setting
-- to @TRUE@.
--
-- 'firewallName', 'updateSubnetChangeProtectionResponse_firewallName' - The descriptive name of the firewall. You can\'t change the name of a
-- firewall after you create it.
--
-- 'httpStatus', 'updateSubnetChangeProtectionResponse_httpStatus' - The response's http status code.
newUpdateSubnetChangeProtectionResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  UpdateSubnetChangeProtectionResponse
newUpdateSubnetChangeProtectionResponse pHttpStatus_ =
  UpdateSubnetChangeProtectionResponse'
    { updateToken =
        Prelude.Nothing,
      firewallArn = Prelude.Nothing,
      subnetChangeProtection =
        Prelude.Nothing,
      firewallName = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | An optional token that you can use for optimistic locking. Network
-- Firewall returns a token to your requests that access the firewall. The
-- token marks the state of the firewall resource at the time of the
-- request.
--
-- To make an unconditional change to the firewall, omit the token in your
-- update request. Without the token, Network Firewall performs your
-- updates regardless of whether the firewall has changed since you last
-- retrieved it.
--
-- To make a conditional change to the firewall, provide the token in your
-- update request. Network Firewall uses the token to ensure that the
-- firewall hasn\'t changed since you last retrieved it. If it has changed,
-- the operation fails with an @InvalidTokenException@. If this happens,
-- retrieve the firewall again to get a current copy of it with a new
-- token. Reapply your changes as needed, then try the operation again
-- using the new token.
updateSubnetChangeProtectionResponse_updateToken :: Lens.Lens' UpdateSubnetChangeProtectionResponse (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtectionResponse_updateToken = Lens.lens (\UpdateSubnetChangeProtectionResponse' {updateToken} -> updateToken) (\s@UpdateSubnetChangeProtectionResponse' {} a -> s {updateToken = a} :: UpdateSubnetChangeProtectionResponse)

-- | The Amazon Resource Name (ARN) of the firewall.
updateSubnetChangeProtectionResponse_firewallArn :: Lens.Lens' UpdateSubnetChangeProtectionResponse (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtectionResponse_firewallArn = Lens.lens (\UpdateSubnetChangeProtectionResponse' {firewallArn} -> firewallArn) (\s@UpdateSubnetChangeProtectionResponse' {} a -> s {firewallArn = a} :: UpdateSubnetChangeProtectionResponse)

-- | A setting indicating whether the firewall is protected against changes
-- to the subnet associations. Use this setting to protect against
-- accidentally modifying the subnet associations for a firewall that is in
-- use. When you create a firewall, the operation initializes this setting
-- to @TRUE@.
updateSubnetChangeProtectionResponse_subnetChangeProtection :: Lens.Lens' UpdateSubnetChangeProtectionResponse (Prelude.Maybe Prelude.Bool)
updateSubnetChangeProtectionResponse_subnetChangeProtection = Lens.lens (\UpdateSubnetChangeProtectionResponse' {subnetChangeProtection} -> subnetChangeProtection) (\s@UpdateSubnetChangeProtectionResponse' {} a -> s {subnetChangeProtection = a} :: UpdateSubnetChangeProtectionResponse)

-- | The descriptive name of the firewall. You can\'t change the name of a
-- firewall after you create it.
updateSubnetChangeProtectionResponse_firewallName :: Lens.Lens' UpdateSubnetChangeProtectionResponse (Prelude.Maybe Prelude.Text)
updateSubnetChangeProtectionResponse_firewallName = Lens.lens (\UpdateSubnetChangeProtectionResponse' {firewallName} -> firewallName) (\s@UpdateSubnetChangeProtectionResponse' {} a -> s {firewallName = a} :: UpdateSubnetChangeProtectionResponse)

-- | The response's http status code.
updateSubnetChangeProtectionResponse_httpStatus :: Lens.Lens' UpdateSubnetChangeProtectionResponse Prelude.Int
updateSubnetChangeProtectionResponse_httpStatus = Lens.lens (\UpdateSubnetChangeProtectionResponse' {httpStatus} -> httpStatus) (\s@UpdateSubnetChangeProtectionResponse' {} a -> s {httpStatus = a} :: UpdateSubnetChangeProtectionResponse)

instance
  Prelude.NFData
    UpdateSubnetChangeProtectionResponse
