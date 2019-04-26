Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F15BC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 513FF2089E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbfDZFXN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 01:23:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58411 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728573AbfDZFXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 01:23:12 -0400
X-IronPort-AV: E=Sophos;i="5.60,396,1549897200"; 
   d="scan'208";a="14381047"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2019 14:23:09 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AD16A41AF7F8;
        Fri, 26 Apr 2019 14:23:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi_internal_dmac: use multiple segments if possible
Date:   Fri, 26 Apr 2019 14:18:50 +0900
Message-Id: <1556255930-18188-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In IOMMU environment, since it's possible to merge scatter gather
buffers of memory requests to one iova, this patch changes
the max_segs value when init_card of mmc_host timing. Notes that
an sdio card may be possible to use scatter gather buffers with
non page aligned size, so that this driver will not use multiple
segments to avoid any trouble.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c          |  8 ++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e9e36e..e27cc24 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -601,6 +601,13 @@ static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
+static void renesas_sdhi_init_card(struct tmio_mmc_host *host,
+				   struct mmc_card *card)
+{
+	if (host->dma_ops->init_card)
+		host->dma_ops->init_card(host, card);
+}
+
 static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	/* Iff regs are 8 byte apart, sdbuf is 64 bit. Otherwise always 32. */
@@ -712,6 +719,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	host->clk_disable	= renesas_sdhi_clk_disable;
 	host->set_clock		= renesas_sdhi_set_clock;
 	host->multi_io_quirk	= renesas_sdhi_multi_io_quirk;
+	host->init_card		= renesas_sdhi_init_card;
 	host->dma_ops		= dma_ops;
 
 	if (quirks && quirks->hs400_disabled)
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 751fe91..0cf14c9 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -285,6 +285,17 @@ renesas_sdhi_internal_dmac_release_dma(struct tmio_mmc_host *host)
 	host->chan_rx = host->chan_tx = NULL;
 }
 
+static void
+renesas_sdhi_internal_dmac_init_card(struct tmio_mmc_host *host,
+				     struct mmc_card *card)
+{
+	if (host->pdev->dev.iommu_group &&
+	    (mmc_card_mmc(card) || mmc_card_sd(card)))
+		host->mmc->max_segs = 512;
+	else
+		host->mmc->max_segs = host->pdata->max_segs;
+}
+
 static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 	.start = renesas_sdhi_internal_dmac_start_dma,
 	.enable = renesas_sdhi_internal_dmac_enable_dma,
@@ -292,6 +303,7 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 	.release = renesas_sdhi_internal_dmac_release_dma,
 	.abort = renesas_sdhi_internal_dmac_abort_dma,
 	.dataend = renesas_sdhi_internal_dmac_dataend_dma,
+	.init_card = renesas_sdhi_internal_dmac_init_card,
 };
 
 /*
-- 
2.7.4

