Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:53953 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731453AbeKAIPP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:15:15 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/3] mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.x
Date: Thu,  1 Nov 2018 00:13:40 +0100
Message-Id: <20181031231340.1958-4-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The Renesas BSP confirms that H3 ES1.x and M3-W ES1.x do not properly
support HS400. Add a quirk to indicate this and disable HS400 in the MMC
capabilities if the quirk is set.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 19d89b4dda64c13c..ed2c406fd62b5c7d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -47,6 +47,7 @@
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
 struct renesas_sdhi_quirks {
+	bool hs400_disabled;
 	bool hs400_4taps;
 };
 
@@ -607,15 +608,21 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
-static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w = {
+static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w_es1 = {
+	.hs400_disabled = true,
+	.hs400_4taps = true,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_h3_es2 = {
+	.hs400_disabled = false,
 	.hs400_4taps = true,
 };
 
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w },
-	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_m3w },
-	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w },
-	{ .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w },
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
+	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
+	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w_es1 },
+	{ .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w_es1 },
 	{ /* Sentinel. */ },
 };
 
@@ -704,6 +711,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	host->multi_io_quirk	= renesas_sdhi_multi_io_quirk;
 	host->dma_ops		= dma_ops;
 
+	if (quirks && quirks->hs400_disabled)
+		host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
+
 	if (quirks && quirks->hs400_4taps)
 		mmc_data->flags |= TMIO_MMC_HAVE_4TAP_HS400;
 
-- 
2.19.1
