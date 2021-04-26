{-# LANGUAGE DeriveDataTypeable #-}
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
-- Module      : Network.AWS.WAF.ListWebACLs
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- This is __AWS WAF Classic__ documentation. For more information, see
-- <https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html AWS WAF Classic>
-- in the developer guide.
--
-- __For the latest version of AWS WAF__, use the AWS WAFV2 API and see the
-- <https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html AWS WAF Developer Guide>.
-- With the latest version, AWS WAF has a single set of endpoints for
-- regional and global use.
--
-- Returns an array of WebACLSummary objects in the response.
--
-- This operation returns paginated results.
module Network.AWS.WAF.ListWebACLs
  ( -- * Creating a Request
    ListWebACLs (..),
    newListWebACLs,

    -- * Request Lenses
    listWebACLs_nextMarker,
    listWebACLs_limit,

    -- * Destructuring the Response
    ListWebACLsResponse (..),
    newListWebACLsResponse,

    -- * Response Lenses
    listWebACLsResponse_nextMarker,
    listWebACLsResponse_webACLs,
    listWebACLsResponse_httpStatus,
  )
where

import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Pager as Pager
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.WAF.Types
import Network.AWS.WAF.Types.WebACLSummary

-- | /See:/ 'newListWebACLs' smart constructor.
data ListWebACLs = ListWebACLs'
  { -- | If you specify a value for @Limit@ and you have more @WebACL@ objects
    -- than the number that you specify for @Limit@, AWS WAF returns a
    -- @NextMarker@ value in the response that allows you to list another group
    -- of @WebACL@ objects. For the second and subsequent @ListWebACLs@
    -- requests, specify the value of @NextMarker@ from the previous response
    -- to get information about another batch of @WebACL@ objects.
    nextMarker :: Prelude.Maybe Prelude.Text,
    -- | Specifies the number of @WebACL@ objects that you want AWS WAF to return
    -- for this request. If you have more @WebACL@ objects than the number that
    -- you specify for @Limit@, the response includes a @NextMarker@ value that
    -- you can use to get another batch of @WebACL@ objects.
    limit :: Prelude.Maybe Prelude.Nat
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'ListWebACLs' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextMarker', 'listWebACLs_nextMarker' - If you specify a value for @Limit@ and you have more @WebACL@ objects
-- than the number that you specify for @Limit@, AWS WAF returns a
-- @NextMarker@ value in the response that allows you to list another group
-- of @WebACL@ objects. For the second and subsequent @ListWebACLs@
-- requests, specify the value of @NextMarker@ from the previous response
-- to get information about another batch of @WebACL@ objects.
--
-- 'limit', 'listWebACLs_limit' - Specifies the number of @WebACL@ objects that you want AWS WAF to return
-- for this request. If you have more @WebACL@ objects than the number that
-- you specify for @Limit@, the response includes a @NextMarker@ value that
-- you can use to get another batch of @WebACL@ objects.
newListWebACLs ::
  ListWebACLs
newListWebACLs =
  ListWebACLs'
    { nextMarker = Prelude.Nothing,
      limit = Prelude.Nothing
    }

-- | If you specify a value for @Limit@ and you have more @WebACL@ objects
-- than the number that you specify for @Limit@, AWS WAF returns a
-- @NextMarker@ value in the response that allows you to list another group
-- of @WebACL@ objects. For the second and subsequent @ListWebACLs@
-- requests, specify the value of @NextMarker@ from the previous response
-- to get information about another batch of @WebACL@ objects.
listWebACLs_nextMarker :: Lens.Lens' ListWebACLs (Prelude.Maybe Prelude.Text)
listWebACLs_nextMarker = Lens.lens (\ListWebACLs' {nextMarker} -> nextMarker) (\s@ListWebACLs' {} a -> s {nextMarker = a} :: ListWebACLs)

-- | Specifies the number of @WebACL@ objects that you want AWS WAF to return
-- for this request. If you have more @WebACL@ objects than the number that
-- you specify for @Limit@, the response includes a @NextMarker@ value that
-- you can use to get another batch of @WebACL@ objects.
listWebACLs_limit :: Lens.Lens' ListWebACLs (Prelude.Maybe Prelude.Natural)
listWebACLs_limit = Lens.lens (\ListWebACLs' {limit} -> limit) (\s@ListWebACLs' {} a -> s {limit = a} :: ListWebACLs) Prelude.. Lens.mapping Prelude._Nat

instance Pager.AWSPager ListWebACLs where
  page rq rs
    | Pager.stop
        ( rs
            Lens.^? listWebACLsResponse_nextMarker Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Pager.stop
        ( rs
            Lens.^? listWebACLsResponse_webACLs Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Lens.& listWebACLs_nextMarker
          Lens..~ rs
          Lens.^? listWebACLsResponse_nextMarker Prelude.. Lens._Just

instance Prelude.AWSRequest ListWebACLs where
  type Rs ListWebACLs = ListWebACLsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListWebACLsResponse'
            Prelude.<$> (x Prelude..?> "NextMarker")
            Prelude.<*> (x Prelude..?> "WebACLs" Prelude..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListWebACLs

instance Prelude.NFData ListWebACLs

instance Prelude.ToHeaders ListWebACLs where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Prelude.=# ( "AWSWAF_20150824.ListWebACLs" ::
                             Prelude.ByteString
                         ),
            "Content-Type"
              Prelude.=# ( "application/x-amz-json-1.1" ::
                             Prelude.ByteString
                         )
          ]
      )

instance Prelude.ToJSON ListWebACLs where
  toJSON ListWebACLs' {..} =
    Prelude.object
      ( Prelude.catMaybes
          [ ("NextMarker" Prelude..=) Prelude.<$> nextMarker,
            ("Limit" Prelude..=) Prelude.<$> limit
          ]
      )

instance Prelude.ToPath ListWebACLs where
  toPath = Prelude.const "/"

instance Prelude.ToQuery ListWebACLs where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newListWebACLsResponse' smart constructor.
data ListWebACLsResponse = ListWebACLsResponse'
  { -- | If you have more @WebACL@ objects than the number that you specified for
    -- @Limit@ in the request, the response includes a @NextMarker@ value. To
    -- list more @WebACL@ objects, submit another @ListWebACLs@ request, and
    -- specify the @NextMarker@ value from the response in the @NextMarker@
    -- value in the next request.
    nextMarker :: Prelude.Maybe Prelude.Text,
    -- | An array of WebACLSummary objects.
    webACLs :: Prelude.Maybe [WebACLSummary],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'ListWebACLsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextMarker', 'listWebACLsResponse_nextMarker' - If you have more @WebACL@ objects than the number that you specified for
-- @Limit@ in the request, the response includes a @NextMarker@ value. To
-- list more @WebACL@ objects, submit another @ListWebACLs@ request, and
-- specify the @NextMarker@ value from the response in the @NextMarker@
-- value in the next request.
--
-- 'webACLs', 'listWebACLsResponse_webACLs' - An array of WebACLSummary objects.
--
-- 'httpStatus', 'listWebACLsResponse_httpStatus' - The response's http status code.
newListWebACLsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListWebACLsResponse
newListWebACLsResponse pHttpStatus_ =
  ListWebACLsResponse'
    { nextMarker = Prelude.Nothing,
      webACLs = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | If you have more @WebACL@ objects than the number that you specified for
-- @Limit@ in the request, the response includes a @NextMarker@ value. To
-- list more @WebACL@ objects, submit another @ListWebACLs@ request, and
-- specify the @NextMarker@ value from the response in the @NextMarker@
-- value in the next request.
listWebACLsResponse_nextMarker :: Lens.Lens' ListWebACLsResponse (Prelude.Maybe Prelude.Text)
listWebACLsResponse_nextMarker = Lens.lens (\ListWebACLsResponse' {nextMarker} -> nextMarker) (\s@ListWebACLsResponse' {} a -> s {nextMarker = a} :: ListWebACLsResponse)

-- | An array of WebACLSummary objects.
listWebACLsResponse_webACLs :: Lens.Lens' ListWebACLsResponse (Prelude.Maybe [WebACLSummary])
listWebACLsResponse_webACLs = Lens.lens (\ListWebACLsResponse' {webACLs} -> webACLs) (\s@ListWebACLsResponse' {} a -> s {webACLs = a} :: ListWebACLsResponse) Prelude.. Lens.mapping Prelude._Coerce

-- | The response's http status code.
listWebACLsResponse_httpStatus :: Lens.Lens' ListWebACLsResponse Prelude.Int
listWebACLsResponse_httpStatus = Lens.lens (\ListWebACLsResponse' {httpStatus} -> httpStatus) (\s@ListWebACLsResponse' {} a -> s {httpStatus = a} :: ListWebACLsResponse)

instance Prelude.NFData ListWebACLsResponse
