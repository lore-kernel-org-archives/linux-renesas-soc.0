Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 18 Mar 2016 01:29:46 +0900
Message-Id: <20160317162946.24104.73567.sendpatchset@little-apple>
In-Reply-To: <20160317162909.24104.31682.sendpatchset@little-apple>
References: <20160317162909.24104.31682.sendpatchset@little-apple>
Subject: [PATCH 04/10] iommu/ipmmu-vmsa: IPMMU device is 64-bit bus master
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The r8a7795 IPMMU supports 64-bit bus mastering and
coherency for page tables.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    1 +
 1 file changed, 1 insertion(+)

--- 0020/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-18 00:22:09.830513000 +0900
@@ -948,6 +948,7 @@ static int ipmmu_probe(struct platform_d
 	mmu->dev = &pdev->dev;
 	mmu->num_utlbs = 32;
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 
 	/* Map I/O memory and request IRQ. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
