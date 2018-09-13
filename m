Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38744 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbeIMT5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 15:57:36 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] mmc: renesas_sdhi_internal_dmac: set scatter/gather max segment size
Date: Thu, 13 Sep 2018 16:47:08 +0200
Message-Id: <20180913144708.12085-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
device_dma_parameters structure and filling in the max segment size. The
size used is the result of a discussion with Renesas hardware engineers
and unfortunately not found in the datasheet.

  renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
  longer than device claims to support [len=126976] [max=65536]

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[wsa: simplified some logic after validating intended dma_parms life cycle
      and added comment]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

After discussing with DMA maintainers [1], this really seems the intended way
of using dma_parms. Took Niklas patch V2 and simplified the logic a bit more
given the information from above (but I'll still tackle the dangling pointer
issue in the DMA core seperately).

[1] https://www.spinics.net/lists/iommu/msg29861.html

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index ca0b43973769..e0823acaa3c2 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -309,12 +309,20 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
+	struct device *dev = &pdev->dev;
 
 	if (!soc)
 		return -ENODEV;
 
 	global_flags |= (unsigned long)soc->data;
 
+	dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
+	if (!dev->dma_parms)
+		return -ENOMEM;
+
+	/* value is max of SD_SECCNT. Confirmed by HW engineers */
+	dma_set_max_seg_size(dev, 0xffffffff);
+
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
 }
 
-- 
2.11.0
