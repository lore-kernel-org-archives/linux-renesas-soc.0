Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932843AbeFRM6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 08:58:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 3/3] mmc: renesas_sdhi: add eMMC HS400 mode support
Date: Mon, 18 Jun 2018 14:57:51 +0200
Message-Id: <20180618125751.27615-4-horms+renesas@verge.net.au>
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
* Use new names of new HS400 host ops
* Differentiate between 4tap and 8tap support

v4 [Simon Horman]
* Make use of proposed new HS400 host ops

v3 [Simon Horman]
* Consolidate disable_scc and reset_hs400_mode into reset_hs400_tuning
  callback
* Reuse renesas_sdhi_reset_hs400_mode() in renesas_sdhi_hw_reset()
* Factor out renesas_sdhi_reset_scc()

v2 [Simon Horman]
* Updated to new version from BSP v3.6.0
* Dropped 4 and 8 tap differentiation as all SoCs currently supported
  by the driver in upstream use 4 taps for HS400.

v1 [Simon Horman]
* Combined patched by Ai Kyuse and Masaharu Hayakawa
* Rebase

v0 [Masaharu Hayakawa]
---
 drivers/mmc/host/renesas_sdhi_core.c          | 127 +++++++++++++++++++++-----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  20 +++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  17 +++-
 3 files changed, 138 insertions(+), 26 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 45c015da2e75..384ae6cfa289 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -212,6 +212,7 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_CKSEL	0x006
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
+#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_DTCNTL register */
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -224,6 +225,9 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN	BIT(0)
 /* Definitions for values the SH_MOBILE_SDHI_SCC_RVSREQ register */
 #define SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR	BIT(2)
+/* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT2 register */
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -244,33 +248,30 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	priv = host_to_priv(host);
 
-	/* set sampling clock selection range */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
-		       0x8 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
-
 	/* Initialize SCC */
 	sd_ctrl_write32_as_16_and_16(host, CTL_STATUS, 0x0);
 
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
-		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
-		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
-
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
+	/* set sampling clock selection range */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
+		       0x8 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
 		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
 	/* Read TAPNUM */
 	return (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL) >>
 		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT) &
@@ -286,13 +287,95 @@ static void renesas_sdhi_prepare_tuning(struct tmio_mmc_host *host,
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap);
 }
 
+static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
+		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	/* Set HS400 mode */
+	sd_ctrl_write16(host, CTL_SDIF_MODE, 0x0001 |
+			sd_ctrl_read16(host, CTL_SDIF_MODE));
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
+		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
+			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
+
+	/* Set the sampling clock selection range of HS400 mode */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
+		       0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
+
+
+	if (host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
+			       host->tap_set / 2);
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
+		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
+		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+}
+
+static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
+				   struct renesas_sdhi *priv)
+{
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
+		       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
+		       sd_scc_read32(host, priv,
+				     SH_MOBILE_SDHI_SCC_CKSEL));
+}
+
+static void renesas_sdhi_disable_scc(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	renesas_sdhi_reset_scc(host, priv);
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+		       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
+		       sd_scc_read32(host, priv,
+				     SH_MOBILE_SDHI_SCC_DTCNTL));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+}
+
+static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
+					  struct renesas_sdhi *priv)
+{
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	/* Reset HS400 mode */
+	sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
+			sd_ctrl_read16(host, CTL_SDIF_MODE));
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
+		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
+			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+}
+
+static void renesas_sdhi_prepare_hs400_tuning(struct tmio_mmc_host *host)
+{
+	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
+}
+
 #define SH_MOBILE_SDHI_MAX_TAP 3
 
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned long tap_cnt;  /* counter of tuning success */
-	unsigned long tap_set;  /* tap position */
 	unsigned long tap_start;/* start position of tuning success */
 	unsigned long tap_end;  /* end position of tuning success */
 	unsigned long ntap;     /* temporary counter of tuning success */
@@ -330,12 +413,12 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	}
 
 	if (tap_cnt >= SH_MOBILE_SDHI_MAX_TAP)
-		tap_set = (tap_start + tap_end) / 2 % host->tap_num;
+		host->tap_set = (tap_start + tap_end) / 2 % host->tap_num;
 	else
 		return -EIO;
 
 	/* Set SCC */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap_set);
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, host->tap_set);
 
 	/* Enable auto re-tuning */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
@@ -368,13 +451,8 @@ static void renesas_sdhi_hw_reset(struct tmio_mmc_host *host)
 
 	priv = host_to_priv(host);
 
-	/* Reset SCC */
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
-		       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
-		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
+	renesas_sdhi_reset_scc(host, priv);
+	renesas_sdhi_reset_hs400_mode(host, priv);
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -592,7 +670,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (of_data && of_data->scc_offset &&
 	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
-	     host->mmc->caps2 & MMC_CAP2_HS200_1_8V_SDR)) {
+	     host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
+				 MMC_CAP2_HS400_1_8V))) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
 		bool hit = false;
 
@@ -616,6 +695,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->select_tuning = renesas_sdhi_select_tuning;
 		host->check_scc_error = renesas_sdhi_check_scc_error;
 		host->hw_reset = renesas_sdhi_hw_reset;
+		host->prepare_hs400_tuning =
+			renesas_sdhi_prepare_hs400_tuning;
+		host->hs400_downgrade = renesas_sdhi_disable_scc;
+		host->hs400_complete = renesas_sdhi_hs400_complete;
 	}
 
 	i = 0;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f7f9773d161f..a8ae34c6d446 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -82,6 +82,22 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
+static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_HAVE_4TAP_HS400,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 0xffffffff blk count but only 1 segment */
+	.max_blk_count	= 0xffffffff,
+	.max_segs	= 1,
+};
+
 static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
@@ -98,8 +114,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{},
 };
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 4bb46c489d71..890f192dedbd 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -78,6 +78,19 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
+static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_HAVE_4TAP_HS400,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+};
+
 static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
@@ -104,8 +117,8 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
 	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
-- 
2.11.0
