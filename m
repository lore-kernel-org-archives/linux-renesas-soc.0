Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:22649 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732889AbeHFVXg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 17:23:36 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] mmc: renesas_sdhi: handle 4tap hs400 mode quirk based on SoC revision
Date: Mon,  6 Aug 2018 21:12:26 +0200
Message-Id: <20180806191227.28401-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Latest datasheet makes it clear that not all ES revisions of the H3 and
M3-W have the 4-tap HS400 mode quirk, currently the quirk is set
unconditionally for these two SoCs. Prepare to handle the quirk based on
SoC revision instead of compatibility value by using soc_device_match()
and set the TMIO_MMC_HAVE_4TAP_HS400 flag explicitly.

The reason for adding a new quirks struct instead of just a flag is that
looking ahead it seems more quirks needs to be handled in a SoC revision
basis.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/renesas_sdhi_core.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 66e90f233cefcba5..781a31592330f872 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -35,6 +35,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sys_soc.h>
 
 #include "renesas_sdhi.h"
 #include "tmio_mmc.h"
@@ -48,6 +49,10 @@
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
+struct renesas_sdhi_quirks {
+	bool hs400_4taps;
+};
+
 static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
 {
 	u32 val;
@@ -555,11 +560,25 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w = {
+	.hs400_4taps = true,
+};
+
+static const struct soc_device_attribute sdhi_quirks_match[]  = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w },
+	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_m3w },
+	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w },
+	{ .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w },
+	{ /* Sentinel. */ },
+};
+
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops)
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
+	const struct renesas_sdhi_quirks *quirks = NULL;
 	const struct renesas_sdhi_of_data *of_data;
+	const struct soc_device_attribute *attr;
 	struct tmio_mmc_data *mmc_data;
 	struct tmio_mmc_dma *dma_priv;
 	struct tmio_mmc_host *host;
@@ -569,6 +588,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	of_data = of_device_get_match_data(&pdev->dev);
 
+	attr = soc_device_match(sdhi_quirks_match);
+	if (attr)
+		quirks = attr->data;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -EINVAL;
@@ -634,6 +657,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	host->multi_io_quirk	= renesas_sdhi_multi_io_quirk;
 	host->dma_ops		= dma_ops;
 
+	if (quirks && quirks->hs400_4taps)
+		mmc_data->flags |= TMIO_MMC_HAVE_4TAP_HS400;
+
 	/* For some SoC, we disable internal WP. GPIO may override this */
 	if (mmc_can_gpio_ro(host->mmc))
 		mmc_data->capabilities2 &= ~MMC_CAP2_NO_WRITE_PROTECT;
-- 
2.18.0
