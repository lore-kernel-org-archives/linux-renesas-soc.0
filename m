Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD55C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 19:38:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED9572077B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 19:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfBUTih (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 14:38:37 -0500
Received: from sauhun.de ([88.99.104.3]:38814 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbfBUTih (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 14:38:37 -0500
Received: from localhost (p54B336C3.dip0.t-ipconnect.de [84.179.54.195])
        by pokefinder.org (Postfix) with ESMTPSA id 960F62C088A;
        Thu, 21 Feb 2019 20:38:34 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH] mmc: tmio: fix access width of Block Count Register
Date:   Thu, 21 Feb 2019 20:38:05 +0100
Message-Id: <20190221193805.1427-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

In R-Car Gen2 or later, the maximum number of transfer blocks are
changed from 0xFFFF to 0xFFFFFFFF. Therefore, Block Count Register
should use iowrite32().

If another system (U-boot, Hypervisor OS, etc) uses bit[31:16], this
value will not be cleared. So, SD/MMC card initialization fails.

So, check for the bigger register and use apropriate write. Also, mark
the register as extended on Gen2.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: use max_blk_count in if(), add Gen2, update commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: stable@kernel.org
---

No Fixes tag because it is hard to point to a specific commit. So, just a
stable tag. I think as long as it applies, we are good to go.

Yamada-san, please check if your driver needs to set max_blk_count, too.

Tested on a Renesas Lager board (R-Car H2) and Salvator-XS (R-Car M3N).
Verified with debug prints that the correct code path was executed, no
regressions encountered when checksumming large files.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 1 +
 drivers/mmc/host/tmio_mmc.h              | 5 +++++
 drivers/mmc/host/tmio_mmc_core.c         | 5 ++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 8471160316e0..02cd878e209f 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -65,6 +65,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.scc_offset	= 0x0300,
 	.taps		= rcar_gen2_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen2_scc_taps),
+	.max_blk_count  = 0xffffffff,
 };
 
 /* Definitions for sampling clocks */
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index c03529e3f01a..2adb0d24360f 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -277,6 +277,11 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 	iowrite16(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
 }
 
+static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
+{
+	iowrite32(val, host->ctl + (addr << host->bus_shift));
+}
+
 static inline void sd_ctrl_write32_rep(struct tmio_mmc_host *host, int addr,
 				       const u32 *buf, int count)
 {
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 085a0fab769c..198c811b478c 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -700,7 +700,10 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 
 	/* Set transfer length / blocksize */
 	sd_ctrl_write16(host, CTL_SD_XFER_LEN, data->blksz);
-	sd_ctrl_write16(host, CTL_XFER_BLK_COUNT, data->blocks);
+	if (host->mmc->max_blk_count >= SZ_64K)
+		sd_ctrl_write32(host, CTL_XFER_BLK_COUNT, data->blocks);
+	else
+		sd_ctrl_write16(host, CTL_XFER_BLK_COUNT, data->blocks);
 
 	tmio_mmc_start_dma(host, data);
 
-- 
2.11.0

