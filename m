Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C69C64E7A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 19:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF982222F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 19:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405211AbgKZTL7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 26 Nov 2020 14:11:59 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:38352 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405176AbgKZTL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 14:11:59 -0500
X-IronPort-AV: E=Sophos;i="5.78,372,1599490800"; 
   d="scan'208";a="63792998"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2020 04:11:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 509E740F8AE0;
        Fri, 27 Nov 2020 04:11:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 2/5] memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in rpcif_{enable,disable}_rpm
Date:   Thu, 26 Nov 2020 19:11:43 +0000
Message-Id: <20201126191146.8753-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

rpcif_enable_rpm calls pm_runtime_enable, so rpcif_disable_rpm needs to
call pm_runtime_disable and not pm_runtime_put_sync.

Fixes: ca7d8b980b67f ("memory: add Renesas RPC-IF driver")
Reported-by: Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: stable@vger.kernel.org
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 69f2e2b4cd50..a8d0ba368625 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -212,7 +212,7 @@ EXPORT_SYMBOL(rpcif_enable_rpm);
 
 void rpcif_disable_rpm(struct rpcif *rpc)
 {
-	pm_runtime_put_sync(rpc->dev);
+	pm_runtime_disable(rpc->dev);
 }
 EXPORT_SYMBOL(rpcif_disable_rpm);
 
-- 
2.25.1

