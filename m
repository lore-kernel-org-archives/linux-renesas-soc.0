Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33347 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753936AbdFSJSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 05:18:30 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Mon, 19 Jun 2017 18:14:38 +0900
Message-Id: <149786367805.14868.13104785061519090144.sendpatchset@little-apple>
In-Reply-To: <149786362527.14868.2143461703972595839.sendpatchset@little-apple>
References: <149786362527.14868.2143461703972595839.sendpatchset@little-apple>
Subject: [PATCH v4 05/09] iommu/ipmmu-vmsa: IPMMU device is 40-bit bus master
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The r8a7795 IPMMU supports 40-bit bus mastering. Both
the coherent DMA mask and the streaming DMA mask are
set to unlock the 40-bit address space for coherent
allocations and streaming operations.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V3:
 - None

 Changes since V2:
 - Updated the code and commit message to use 40 bits instead of 64 bits

 Changes since V1:
 - Updated the commit message

 drivers/iommu/ipmmu-vmsa.c |    1 +
 1 file changed, 1 insertion(+)

--- 0021/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-06-19 14:05:33.720607110 +0900
@@ -1004,6 +1004,7 @@ static int ipmmu_probe(struct platform_d
 	spin_lock_init(&mmu->lock);
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
 	mmu->features = of_device_get_match_data(&pdev->dev);
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 
 	/* Map I/O memory and request IRQ. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
