Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49243 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754577AbeFRM6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 08:58:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 2/3] mmc: tmio: add eMMC HS400 mode support
Date: Mon, 18 Jun 2018 14:57:50 +0200
Message-Id: <20180618125751.27615-3-horms+renesas@verge.net.au>
In-Reply-To: <20180618125751.27615-1-horms+renesas@verge.net.au>
References: <20180618125751.27615-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

This patch adds processing for selecting HS400 mode.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v5 [Simon Horman]
* Make new local functions static
* Use new names of new HS400 host ops
* Allow differentiation between 4tap and 8tap support

v4 [Simon Horman]
* Make use of proposed new HS400 host ops

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
 drivers/mmc/host/tmio_mmc.h      |  6 +++++
 drivers/mmc/host/tmio_mmc_core.c | 47 ++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/tmio.h         |  3 +++
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index e7d651352dc9..5d141f79e175 100644
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
@@ -191,6 +192,11 @@ struct tmio_mmc_host {
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
 	unsigned int tap_num;
+	unsigned long tap_set;
+
+	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
+	void (*hs400_downgrade)(struct tmio_mmc_host *host);
+	void (*hs400_complete)(struct tmio_mmc_host *host);
 
 	const struct tmio_mmc_dma_ops *dma_ops;
 };
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 308029930304..416f9e078fda 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -199,6 +199,14 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
 		tmio_mmc_clk_stop(host);
 		return;
 	}
+	/*
+	 * Both HS400 and HS200/SD104 set 200MHz, but some devices need to
+	 * set 400MHz to distinguish the CPG settings in HS400.
+	 */
+	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS400 &&
+	    host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400 &&
+	    new_clock == 200000000)
+		new_clock = 400000000;
 
 	if (host->clk_update)
 		clock = host->clk_update(host, new_clock) / 512;
@@ -209,8 +217,13 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
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
@@ -1087,6 +1100,33 @@ static int tmio_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
+static int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc,
+					 struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->prepare_hs400_tuning)
+		host->prepare_hs400_tuning(host);
+
+	return 0;
+}
+
+static void tmio_mmc_hs400_downgrade(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->hs400_downgrade)
+		host->hs400_downgrade(host);
+}
+
+static void tmio_mmc_hs400_complete(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->hs400_complete)
+		host->hs400_complete(host);
+}
+
 static const struct mmc_host_ops tmio_mmc_ops = {
 	.request	= tmio_mmc_request,
 	.set_ios	= tmio_mmc_set_ios,
@@ -1096,6 +1136,9 @@ static const struct mmc_host_ops tmio_mmc_ops = {
 	.multi_io_quirk	= tmio_multi_io_quirk,
 	.hw_reset	= tmio_mmc_hw_reset,
 	.execute_tuning = tmio_mmc_execute_tuning,
+	.prepare_hs400_tuning = tmio_mmc_prepare_hs400_tuning,
+	.hs400_downgrade = tmio_mmc_hs400_downgrade,
+	.hs400_complete	= tmio_mmc_hs400_complete,
 };
 
 static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 91f92215ca74..77866214ab51 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -90,6 +90,9 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
+/* Some controllers that support HS400 use use 4 taps while others use 8. */
+#define TMIO_MMC_HAVE_4TAP_HS400	BIT(13)
+
 int tmio_core_mmc_enable(void __iomem *cnf, int shift, unsigned long base);
 int tmio_core_mmc_resume(void __iomem *cnf, int shift, unsigned long base);
 void tmio_core_mmc_pwr(void __iomem *cnf, int shift, int state);
-- 
2.11.0
