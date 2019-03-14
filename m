Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B939CC10F06
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86FF321019
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfCNWcD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 18:32:03 -0400
Received: from sauhun.de ([88.99.104.3]:60972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727495AbfCNWcD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 18:32:03 -0400
Received: from localhost (p54B33449.dip0.t-ipconnect.de [84.179.52.73])
        by pokefinder.org (Postfix) with ESMTPSA id 1536E3E430A;
        Thu, 14 Mar 2019 23:32:01 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for max_req_size
Date:   Thu, 14 Mar 2019 23:31:30 +0100
Message-Id: <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

max_req_size is calculated by 'max_blk_size * max_blk_count' in the TMIO
core. So, specifying U32_MAX as max_blk_count will overflow this
calculation. It will cause no harm in practice because the immense high
number will overflow into another immense high number. However, it is
not good coding practice, so calculate max_blk_count so that
max_req_size will fit into unsigned int on ARM32/64.

Thanks to the Renesas BSP team for the bug report!

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 ++++----
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 9dfafa2a90a3..af0288f04200 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -95,8 +95,8 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
 	.scc_offset	= 0 - 0x1000,
 	.taps		= rcar_gen3_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-	/* DMAC can handle 0xffffffff blk count but only 1 segment */
-	.max_blk_count	= 0xffffffff,
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 };
 
@@ -110,8 +110,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.scc_offset	= 0x1000,
 	.taps		= rcar_gen3_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-	/* DMAC can handle 0xffffffff blk count but only 1 segment */
-	.max_blk_count	= 0xffffffff,
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 02cd878e209f..bfbf36634faa 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -65,7 +65,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.scc_offset	= 0x0300,
 	.taps		= rcar_gen2_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen2_scc_taps),
-	.max_blk_count  = 0xffffffff,
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 };
 
 /* Definitions for sampling clocks */
-- 
2.11.0

