Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:9772 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727232AbeHaBnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 21:43:43 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather max segment size
Date: Thu, 30 Aug 2018 23:38:43 +0200
Message-Id: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
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

* Changes since v1
- Use devm_kzalloc() instead of a custom remove function to clean up.
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index c9dab9ce1ed55174..715e0c5dc30e4ebf 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -308,12 +308,23 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
+	struct device *dev = &pdev->dev;
 
 	if (!soc)
 		return -ENODEV;
 
 	global_flags |= (unsigned long)soc->data;
 
+	if (!dev->dma_parms) {
+		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
+					      GFP_KERNEL);
+		if (!dev->dma_parms)
+			return -ENOMEM;
+	}
+
+	if (dma_set_max_seg_size(dev, 0xffffffff))
+		dev_warn(dev, "Unable to set seg size\n");
+
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
 }
 
-- 
2.18.0
