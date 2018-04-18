Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36181 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbeDRJ5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 05:57:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 3/4] mmc: tmio: add eMMC HS400 mode support
Date: Wed, 18 Apr 2018 11:56:59 +0200
Message-Id: <20180418095700.29948-4-horms+renesas@verge.net.au>
In-Reply-To: <20180418095700.29948-1-horms+renesas@verge.net.au>
References: <20180418095700.29948-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

This patch adds processing for selecting HS400 mode.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4 [Simon Horman]
* Make use of proposed new HS400 host operations

v3 [Simon Horman]
* Consolidate disable_scc and reset_hs400_mode into reset_hs400_tuning
  callback

v2 [Simon Horman]
* Updated to new version of BSP patch from BSP v3.6.0
* Dropped 4 and 8 tap differentiation as all SoCs currently supported
  by the driver in upstream use 4 taps for HS400.
* Minor cleanup

v1 [Simon Horman]
* Combined patches by Ai Kyuse and Masaharu Hayakawa.
* Rebase
* Minor clean-up

v0 [Masaharu Hayakawa]
---
 drivers/mmc/host/tmio_mmc.h      |  9 ++++++++
 drivers/mmc/host/tmio_mmc_core.c | 49 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index e7d651352dc9..4fffcd1d96da 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -46,6 +46,7 @@
 #define CTL_DMA_ENABLE 0xd8
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
+#define CTL_SDIF_MODE 0xe6
 #define CTL_SDIO_REGS 0x100
 #define CTL_CLK_AND_WAIT_CTL 0x138
 #define CTL_RESET_SDIO 0x1e0
@@ -191,6 +192,14 @@ struct tmio_mmc_host {
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
 	unsigned int tap_num;
+	unsigned long tap_set;
+
+	void (*prepare_hs400_tuning_downgrade)(struct tmio_mmc_host *host,
+					       struct mmc_ios *ios);
+	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host,
+				     struct mmc_ios *ios);
+	void (*complete_hs400_tuning)(struct tmio_mmc_host *host,
+				      struct mmc_ios *ios);
 
 	const struct tmio_mmc_dma_ops *dma_ops;
 };
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 308029930304..4a8332077795 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -199,6 +199,13 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
 		tmio_mmc_clk_stop(host);
 		return;
 	}
+	/*
+	 * Both HS400 and HS200/SD104 set 200MHz, but some devices need to
+	 * set 400MHz to distinguish the CPG settings in HS400.
+	 */
+	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
+	    new_clock == 200000000)
+		new_clock = 400000000;
 
 	if (host->clk_update)
 		clock = host->clk_update(host, new_clock) / 512;
@@ -209,8 +216,13 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
 		clock <<= 1;
 
 	/* 1/1 clock is option */
-	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1))
-		clk |= 0xff;
+	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) &&
+	    ((clk >> 22) & 0x1)) {
+		if (!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
+			clk |= 0xff;
+		else
+			clk &= ~0xff;
+	}
 
 	if (host->set_clk_div)
 		host->set_clk_div(host->pdev, (clk >> 22) & 1);
@@ -1053,6 +1065,7 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 			"%s.%d: IOS interrupted: clk %u, mode %u",
 			current->comm, task_pid_nr(current),
 			ios->clock, ios->power_mode);
+
 	host->mrq = NULL;
 
 	host->clk_cache = ios->clock;
@@ -1087,6 +1100,34 @@ static int tmio_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
+int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->prepare_hs400_tuning)
+		host->prepare_hs400_tuning(host, ios);
+
+	return 0;
+}
+
+void tmio_mmc_prepare_hs400_tuning_downgrade(struct mmc_host *mmc,
+					     struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->prepare_hs400_tuning_downgrade)
+		host->prepare_hs400_tuning_downgrade(host, ios);
+}
+
+void tmio_mmc_complete_hs400_tuning(struct mmc_host *mmc,
+				    struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->complete_hs400_tuning)
+		host->complete_hs400_tuning(host, ios);
+}
+
 static const struct mmc_host_ops tmio_mmc_ops = {
 	.request	= tmio_mmc_request,
 	.set_ios	= tmio_mmc_set_ios,
@@ -1096,6 +1137,10 @@ static const struct mmc_host_ops tmio_mmc_ops = {
 	.multi_io_quirk	= tmio_multi_io_quirk,
 	.hw_reset	= tmio_mmc_hw_reset,
 	.execute_tuning = tmio_mmc_execute_tuning,
+	.prepare_hs400_tuning_downgrade =
+		tmio_mmc_prepare_hs400_tuning_downgrade,
+	.prepare_hs400_tuning = tmio_mmc_prepare_hs400_tuning,
+	.complete_hs400_tuning = tmio_mmc_complete_hs400_tuning,
 };
 
 static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
-- 
2.11.0
