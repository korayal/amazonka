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
-- Module      : Network.AWS.WAFRegional.ListSqlInjectionMatchSets
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
-- Returns an array of SqlInjectionMatchSet objects.
module Network.AWS.WAFRegional.ListSqlInjectionMatchSets
  ( -- * Creating a Request
    ListSqlInjectionMatchSets (..),
    newListSqlInjectionMatchSets,

    -- * Request Lenses
    listSqlInjectionMatchSets_nextMarker,
    listSqlInjectionMatchSets_limit,

    -- * Destructuring the Response
    ListSqlInjectionMatchSetsResponse (..),
    newListSqlInjectionMatchSetsResponse,

    -- * Response Lenses
    listSqlInjectionMatchSetsResponse_sqlInjectionMatchSets,
    listSqlInjectionMatchSetsResponse_nextMarker,
    listSqlInjectionMatchSetsResponse_httpStatus,
  )
where

import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.WAFRegional.Types
import Network.AWS.WAFRegional.Types.SqlInjectionMatchSetSummary

-- | A request to list the SqlInjectionMatchSet objects created by the
-- current AWS account.
--
-- /See:/ 'newListSqlInjectionMatchSets' smart constructor.
data ListSqlInjectionMatchSets = ListSqlInjectionMatchSets'
  { -- | If you specify a value for @Limit@ and you have more
    -- SqlInjectionMatchSet objects than the value of @Limit@, AWS WAF returns
    -- a @NextMarker@ value in the response that allows you to list another
    -- group of @SqlInjectionMatchSets@. For the second and subsequent
    -- @ListSqlInjectionMatchSets@ requests, specify the value of @NextMarker@
    -- from the previous response to get information about another batch of
    -- @SqlInjectionMatchSets@.
    nextMarker :: Prelude.Maybe Prelude.Text,
    -- | Specifies the number of SqlInjectionMatchSet objects that you want AWS
    -- WAF to return for this request. If you have more @SqlInjectionMatchSet@
    -- objects than the number you specify for @Limit@, the response includes a
    -- @NextMarker@ value that you can use to get another batch of @Rules@.
    limit :: Prelude.Maybe Prelude.Nat
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'ListSqlInjectionMatchSets' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextMarker', 'listSqlInjectionMatchSets_nextMarker' - If you specify a value for @Limit@ and you have more
-- SqlInjectionMatchSet objects than the value of @Limit@, AWS WAF returns
-- a @NextMarker@ value in the response that allows you to list another
-- group of @SqlInjectionMatchSets@. For the second and subsequent
-- @ListSqlInjectionMatchSets@ requests, specify the value of @NextMarker@
-- from the previous response to get information about another batch of
-- @SqlInjectionMatchSets@.
--
-- 'limit', 'listSqlInjectionMatchSets_limit' - Specifies the number of SqlInjectionMatchSet objects that you want AWS
-- WAF to return for this request. If you have more @SqlInjectionMatchSet@
-- objects than the number you specify for @Limit@, the response includes a
-- @NextMarker@ value that you can use to get another batch of @Rules@.
newListSqlInjectionMatchSets ::
  ListSqlInjectionMatchSets
newListSqlInjectionMatchSets =
  ListSqlInjectionMatchSets'
    { nextMarker =
        Prelude.Nothing,
      limit = Prelude.Nothing
    }

-- | If you specify a value for @Limit@ and you have more
-- SqlInjectionMatchSet objects than the value of @Limit@, AWS WAF returns
-- a @NextMarker@ value in the response that allows you to list another
-- group of @SqlInjectionMatchSets@. For the second and subsequent
-- @ListSqlInjectionMatchSets@ requests, specify the value of @NextMarker@
-- from the previous response to get information about another batch of
-- @SqlInjectionMatchSets@.
listSqlInjectionMatchSets_nextMarker :: Lens.Lens' ListSqlInjectionMatchSets (Prelude.Maybe Prelude.Text)
listSqlInjectionMatchSets_nextMarker = Lens.lens (\ListSqlInjectionMatchSets' {nextMarker} -> nextMarker) (\s@ListSqlInjectionMatchSets' {} a -> s {nextMarker = a} :: ListSqlInjectionMatchSets)

-- | Specifies the number of SqlInjectionMatchSet objects that you want AWS
-- WAF to return for this request. If you have more @SqlInjectionMatchSet@
-- objects than the number you specify for @Limit@, the response includes a
-- @NextMarker@ value that you can use to get another batch of @Rules@.
listSqlInjectionMatchSets_limit :: Lens.Lens' ListSqlInjectionMatchSets (Prelude.Maybe Prelude.Natural)
listSqlInjectionMatchSets_limit = Lens.lens (\ListSqlInjectionMatchSets' {limit} -> limit) (\s@ListSqlInjectionMatchSets' {} a -> s {limit = a} :: ListSqlInjectionMatchSets) Prelude.. Lens.mapping Prelude._Nat

instance Prelude.AWSRequest ListSqlInjectionMatchSets where
  type
    Rs ListSqlInjectionMatchSets =
      ListSqlInjectionMatchSetsResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListSqlInjectionMatchSetsResponse'
            Prelude.<$> ( x Prelude..?> "SqlInjectionMatchSets"
                            Prelude..!@ Prelude.mempty
                        )
            Prelude.<*> (x Prelude..?> "NextMarker")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListSqlInjectionMatchSets

instance Prelude.NFData ListSqlInjectionMatchSets

instance Prelude.ToHeaders ListSqlInjectionMatchSets where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Prelude.=# ( "AWSWAF_Regional_20161128.ListSqlInjectionMatchSets" ::
                             Prelude.ByteString
                         ),
            "Content-Type"
              Prelude.=# ( "application/x-amz-json-1.1" ::
                             Prelude.ByteString
                         )
          ]
      )

instance Prelude.ToJSON ListSqlInjectionMatchSets where
  toJSON ListSqlInjectionMatchSets' {..} =
    Prelude.object
      ( Prelude.catMaybes
          [ ("NextMarker" Prelude..=) Prelude.<$> nextMarker,
            ("Limit" Prelude..=) Prelude.<$> limit
          ]
      )

instance Prelude.ToPath ListSqlInjectionMatchSets where
  toPath = Prelude.const "/"

instance Prelude.ToQuery ListSqlInjectionMatchSets where
  toQuery = Prelude.const Prelude.mempty

-- | The response to a ListSqlInjectionMatchSets request.
--
-- /See:/ 'newListSqlInjectionMatchSetsResponse' smart constructor.
data ListSqlInjectionMatchSetsResponse = ListSqlInjectionMatchSetsResponse'
  { -- | An array of SqlInjectionMatchSetSummary objects.
    sqlInjectionMatchSets :: Prelude.Maybe [SqlInjectionMatchSetSummary],
    -- | If you have more SqlInjectionMatchSet objects than the number that you
    -- specified for @Limit@ in the request, the response includes a
    -- @NextMarker@ value. To list more @SqlInjectionMatchSet@ objects, submit
    -- another @ListSqlInjectionMatchSets@ request, and specify the
    -- @NextMarker@ value from the response in the @NextMarker@ value in the
    -- next request.
    nextMarker :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Data, Prelude.Typeable, Prelude.Generic)

-- |
-- Create a value of 'ListSqlInjectionMatchSetsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'sqlInjectionMatchSets', 'listSqlInjectionMatchSetsResponse_sqlInjectionMatchSets' - An array of SqlInjectionMatchSetSummary objects.
--
-- 'nextMarker', 'listSqlInjectionMatchSetsResponse_nextMarker' - If you have more SqlInjectionMatchSet objects than the number that you
-- specified for @Limit@ in the request, the response includes a
-- @NextMarker@ value. To list more @SqlInjectionMatchSet@ objects, submit
-- another @ListSqlInjectionMatchSets@ request, and specify the
-- @NextMarker@ value from the response in the @NextMarker@ value in the
-- next request.
--
-- 'httpStatus', 'listSqlInjectionMatchSetsResponse_httpStatus' - The response's http status code.
newListSqlInjectionMatchSetsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListSqlInjectionMatchSetsResponse
newListSqlInjectionMatchSetsResponse pHttpStatus_ =
  ListSqlInjectionMatchSetsResponse'
    { sqlInjectionMatchSets =
        Prelude.Nothing,
      nextMarker = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | An array of SqlInjectionMatchSetSummary objects.
listSqlInjectionMatchSetsResponse_sqlInjectionMatchSets :: Lens.Lens' ListSqlInjectionMatchSetsResponse (Prelude.Maybe [SqlInjectionMatchSetSummary])
listSqlInjectionMatchSetsResponse_sqlInjectionMatchSets = Lens.lens (\ListSqlInjectionMatchSetsResponse' {sqlInjectionMatchSets} -> sqlInjectionMatchSets) (\s@ListSqlInjectionMatchSetsResponse' {} a -> s {sqlInjectionMatchSets = a} :: ListSqlInjectionMatchSetsResponse) Prelude.. Lens.mapping Prelude._Coerce

-- | If you have more SqlInjectionMatchSet objects than the number that you
-- specified for @Limit@ in the request, the response includes a
-- @NextMarker@ value. To list more @SqlInjectionMatchSet@ objects, submit
-- another @ListSqlInjectionMatchSets@ request, and specify the
-- @NextMarker@ value from the response in the @NextMarker@ value in the
-- next request.
listSqlInjectionMatchSetsResponse_nextMarker :: Lens.Lens' ListSqlInjectionMatchSetsResponse (Prelude.Maybe Prelude.Text)
listSqlInjectionMatchSetsResponse_nextMarker = Lens.lens (\ListSqlInjectionMatchSetsResponse' {nextMarker} -> nextMarker) (\s@ListSqlInjectionMatchSetsResponse' {} a -> s {nextMarker = a} :: ListSqlInjectionMatchSetsResponse)

-- | The response's http status code.
listSqlInjectionMatchSetsResponse_httpStatus :: Lens.Lens' ListSqlInjectionMatchSetsResponse Prelude.Int
listSqlInjectionMatchSetsResponse_httpStatus = Lens.lens (\ListSqlInjectionMatchSetsResponse' {httpStatus} -> httpStatus) (\s@ListSqlInjectionMatchSetsResponse' {} a -> s {httpStatus = a} :: ListSqlInjectionMatchSetsResponse)

instance
  Prelude.NFData
    ListSqlInjectionMatchSetsResponse
