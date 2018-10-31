Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:53928 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732413AbeKAIPO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:15:14 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: align compatibility properties for H3 and M3-W
Date: Thu,  1 Nov 2018 00:13:39 +0100
Message-Id: <20181031231340.1958-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

It was though all ES revisions of H3 and M3-W SoCs required the
TMIO_MMC_HAVE_4TAP_HS400 flag. Recent datasheet updates tells us this is
not true, only early ES revisions of the SoC do.

Since quirk matching based on ES revisions is now used to handle the
flag it's possible to align all Gen3 compatibility properties. This will
allow later ES revisions of H3 and M3-W to use the correct 8-tap HS400
mode.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 ++-----------------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 20 +++----------------
 2 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b6f54102bfdd3a76..68abe042e9f765ad 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -81,22 +81,6 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
-static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
-	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
-			  TMIO_MMC_HAVE_4TAP_HS400,
-	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
-	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
-	.bus_shift	= 2,
-	.scc_offset	= 0x1000,
-	.taps		= rcar_gen3_scc_taps,
-	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-	/* DMAC can handle 0xffffffff blk count but only 1 segment */
-	.max_blk_count	= 0xffffffff,
-	.max_segs	= 1,
-};
-
 static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
@@ -114,8 +98,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{},
 };
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 1a4016f635d398c2..8471160316e073c5 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -75,19 +75,6 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
-static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
-	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
-			  TMIO_MMC_HAVE_4TAP_HS400,
-	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
-	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
-	.bus_shift	= 2,
-	.scc_offset	= 0x1000,
-	.taps		= rcar_gen3_scc_taps,
-	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-};
-
 static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
@@ -114,8 +101,8 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
 	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
@@ -493,8 +480,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 
 static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 {
-	if ((of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible ||
-	    of_device_get_match_data(&pdev->dev) == &of_rcar_r8a7795_compatible) &&
+	if (of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible &&
 	    !soc_device_match(gen3_soc_whitelist))
 		return -ENODEV;
 
-- 
2.19.1
