Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33932 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdAWMAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:00:20 -0500
Received: by mail-pg0-f66.google.com with SMTP id t6so13612506pgt.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 03:59:05 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be
Date: Mon, 23 Jan 2017 20:52:43 +0900
Message-Id: <148517236353.14544.12595546402748556370.sendpatchset@little-apple>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: Initial R-Car Gen3 VA64 mode support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Here's a prototype that enables IMCTR_VA64 support for the IPMMU driver
on R-Car Gen3 platforms. I've tested it lightly on r8a7796 Salvator-X
with local second serial port code and SYS-DMAC support via DMA Engine.

My goal has been to enable 40 bits or more of IOVA space, but it turns
out that it requires either 64K page size support or support for 4K pages
starting from level 0.

For now this keeps 32-bit IOVA space however the hardware gets configured
to enable IMCTR_VA64 which also seems to require setting up TSZ0[5:0].

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-01-10-v4.10-rc3
 
 drivers/iommu/ipmmu-vmsa.c |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-01-23 20:43:31.200607110 +0900
@@ -39,6 +39,7 @@ struct ipmmu_features {
 	bool has_eight_ctx;
 	bool setup_imbuscr;
 	bool twobit_imttbcr_sl0;
+	bool imctr_va64;
 };
 
 struct ipmmu_vmsa_device {
@@ -117,6 +118,7 @@ static void set_archdata(struct device *
 #define IM_CTX_SIZE			0x40
 
 #define IMCTR				0x0000
+#define IMCTR_VA64			(1 << 29)
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
 #define IMCTR_RTSEL_MASK		(3 << 4)
@@ -430,8 +432,9 @@ static int ipmmu_domain_init_context(str
 	 */
 	domain->cfg.iommu_dev = domain->root->dev;
 
-	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
-					   domain);
+	domain->iop = alloc_io_pgtable_ops(domain->root->features->imctr_va64 ?
+					   ARM_64_LPAE_S1 : ARM_32_LPAE_S1,
+					   &domain->cfg, domain);
 	if (!domain->iop)
 		return -EINVAL;
 
@@ -462,6 +465,12 @@ static int ipmmu_domain_init_context(str
 	else
 		tmp = IMTTBCR_SL0_LVL_1;
 
+	/*
+	 * For IMCTR_VA64 and ARM_64_LPAE_S1 we need lowest bits of TTBCR
+	 */
+	if (domain->root->features->imctr_va64)
+		tmp |= 32;
+
 	ipmmu_ctx_write(domain, IMTTBCR, IMTTBCR_EAE |
 			IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA |
 			IMTTBCR_IRGN0_WB_WA | tmp);
@@ -488,7 +497,8 @@ static int ipmmu_domain_init_context(str
 	 * required when modifying the context registers.
 	 */
 	ipmmu_ctx_write2(domain, IMCTR,
-			 IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
+			 (domain->root->features->imctr_va64 ? IMCTR_VA64 : 0)
+			 | IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
 
 	return 0;
 }
@@ -1098,6 +1108,7 @@ static const struct ipmmu_features ipmmu
 	.has_eight_ctx = false,
 	.setup_imbuscr = true,
 	.twobit_imttbcr_sl0 = false,
+	.imctr_va64 = false,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -1106,6 +1117,7 @@ static const struct ipmmu_features ipmmu
 	.has_eight_ctx = true,
 	.setup_imbuscr = false,
 	.twobit_imttbcr_sl0 = true,
+	.imctr_va64 = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
