Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:39448 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbdJDMP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:15:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dmaengine: nbpfaxi: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:15:23 +0200
Message-Id: <1507119323-12421-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.
Note that when used with DT, there's always a valid match.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/nbpfaxi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index d3f918a9ee7627ae..50559338239b6ec5 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1286,7 +1286,6 @@ MODULE_DEVICE_TABLE(of, nbpf_match);
 static int nbpf_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id = of_match_device(nbpf_match, dev);
 	struct device_node *np = dev->of_node;
 	struct nbpf_device *nbpf;
 	struct dma_device *dma_dev;
@@ -1300,10 +1299,10 @@ static int nbpf_probe(struct platform_device *pdev)
 	BUILD_BUG_ON(sizeof(struct nbpf_desc_page) > PAGE_SIZE);
 
 	/* DT only */
-	if (!np || !of_id || !of_id->data)
+	if (!np)
 		return -ENODEV;
 
-	cfg = of_id->data;
+	cfg = of_device_get_match_data(dev);
 	num_channels = cfg->num_channels;
 
 	nbpf = devm_kzalloc(dev, sizeof(*nbpf) + num_channels *
-- 
2.7.4
