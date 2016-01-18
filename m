Return-Path: <SRS0+ku8b=NS=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Mon, 18 Jan 2016 14:48:26 +0900
Message-Id: <20160118054826.22156.70507.sendpatchset@little-apple>
In-Reply-To: <20160118054817.22156.6531.sendpatchset@little-apple>
References: <20160118054817.22156.6531.sendpatchset@little-apple>
Subject: [PATCH/RFC 01/02] iommu/ipmmu-vmsa: Use 64-bit masks
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The IPMMU hardware is able to use page tables from anywhere
in the memory, so set masks to 64-bits. Required to be able
to use the IPMMU driver with 4 GiB of memory. Without this
patch with 4 GiB enabled the following error message is spit
out on the console during boot:

ipmmu-vmsa e67b0000.mmu: Cannot accommodate DMA translation
                         for IOMMU page tables

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    2 ++
 1 file changed, 2 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-01-18 14:22:22.730513000 +0900
@@ -1043,6 +1043,8 @@ static int ipmmu_probe(struct platform_d
 		return -ENOMEM;
 	}
 
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	
 	mmu->dev = &pdev->dev;
 	mmu->num_utlbs = 32;
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
