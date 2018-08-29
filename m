Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:62777 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727320AbeH3CZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 22:25:35 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: set scatter/gather max segment size
Date: Thu, 30 Aug 2018 00:25:48 +0200
Message-Id: <20180829222548.24399-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
device_dma_parameters structure and filling in the max segment size. The
size used is the result of a discussion with Renesas hardware engineers
and unfortunately not found in the datasheet.

  renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
  longer than device claims to support [len=126976] [max=65536A]

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 225af5389599108a..13a286e2a247042d 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -292,15 +292,38 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
+	struct device *dev = &pdev->dev;
 
 	if (!soc)
 		return -ENODEV;
 
 	global_flags |= (unsigned long)soc->data;
 
+	if (!dev->dma_parms) {
+		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
+		if (!dev->dma_parms)
+			return -ENOMEM;
+	}
+
+	if (dma_set_max_seg_size(dev, 0xffffffff))
+		dev_warn(dev, "Unable to set seg size\n");
+
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
 }
 
+static int renesas_sdhi_internal_dmac_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = renesas_sdhi_remove(pdev);
+
+	kfree(dev->dma_parms);
+	dev->dma_parms = NULL;
+
+	return ret;
+}
+
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
@@ -316,7 +339,7 @@ static struct platform_driver renesas_internal_dmac_sdhi_driver = {
 		.of_match_table = renesas_sdhi_internal_dmac_of_match,
 	},
 	.probe		= renesas_sdhi_internal_dmac_probe,
-	.remove		= renesas_sdhi_remove,
+	.remove		= renesas_sdhi_internal_dmac_remove,
 };
 
 module_platform_driver(renesas_internal_dmac_sdhi_driver);
-- 
2.18.0
