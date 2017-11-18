Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:46100 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161520AbdKRE2F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 23:28:05 -0500
Received: by mail-pg0-f67.google.com with SMTP id z184so3390357pgd.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2017 20:28:05 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Sat, 18 Nov 2017 13:26:35 +0900
Message-Id: <151097919585.24365.16075586703973802217.sendpatchset@little-apple>
In-Reply-To: <151097915979.24365.675151091819205104.sendpatchset@little-apple>
References: <151097915979.24365.675151091819205104.sendpatchset@little-apple>
Subject: [PATCH/RFC 04/04] iommu/ipmmu-vmsa: VA64 mode with 30-bit IOVA
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hack up the IPMMU driver to enable VM64 mode with 30-bit IOVA.

For this configuration the IPMMU hardware is configured with IMTTBCR.SL=0
and TSZ0 bits set to 0x22. This will enable a 30-bit IOVA space and use
"Initial lookup level 2" (in Table D4-13 of armv8_arm.pdf) also known as
"Start at second level" in IPMMU documentation.

Not for upstream merge. Tested on ULCB with r8a7796 ES1.0.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   40 +++++++++++++++++++++++++++-------------
 1 files changed, 27 insertions(+), 13 deletions(-)

--- 0009/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-11-17 13:46:17.670607110 +0900
@@ -42,6 +42,7 @@ struct ipmmu_features {
 	unsigned int number_of_contexts;
 	bool setup_imbuscr;
 	bool twobit_imttbcr_sl0;
+	bool imctr_va64;
 };
 
 struct ipmmu_vmsa_device {
@@ -97,6 +98,7 @@ static struct ipmmu_vmsa_iommu_priv *to_
 #define IM_CTX_SIZE			0x40
 
 #define IMCTR				0x0000
+#define IMCTR_VA64			(1 << 29)
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
 #define IMCTR_RTSEL_MASK		(3 << 4)
@@ -422,10 +424,10 @@ static int ipmmu_domain_init_context(str
 	 */
 	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
 	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
-	domain->cfg.ias = 32;
+	domain->cfg.ias = 30;
 	domain->cfg.oas = 40;
 	domain->cfg.tlb = &ipmmu_gather_ops;
-	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
+	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(30);
 	domain->io_domain.geometry.force_aperture = true;
 	/*
 	 * TODO: Add support for coherent walk through CCI with DVM and remove
@@ -442,8 +444,9 @@ static int ipmmu_domain_init_context(str
 
 	domain->context_id = ret;
 
-	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
-					   domain);
+	domain->iop = alloc_io_pgtable_ops(domain->mmu->features->imctr_va64 ?
+					   ARM_64_LPAE_S1 : ARM_32_LPAE_S1,
+					   &domain->cfg, domain);
 	if (!domain->iop) {
 		ipmmu_domain_free_context(domain->mmu->root,
 					  domain->context_id);
@@ -456,14 +459,22 @@ static int ipmmu_domain_init_context(str
 	ipmmu_ctx_write_root(domain, IMTTUBR0, ttbr >> 32);
 
 	/*
-	 * TTBCR
-	 * We use long descriptors with inner-shareable WBWA tables and allocate
-	 * the whole 32-bit VA space to TTBR0.
-	 */
-	if (domain->mmu->features->twobit_imttbcr_sl0)
-		tmp = IMTTBCR_SL0_TWOBIT_LVL_1;
-	else
-		tmp = IMTTBCR_SL0_LVL_1;
+	 * For IMCTR_VA64 and ARM_64_LPAE_S1 we need lowest bits of TTBCR
+	 */
+	if (domain->mmu->features->imctr_va64) {
+		tmp = (0 << 6) | 0x22;
+	} else {
+		/*
+		 * TTBCR
+		 * We use long descriptors with inner-shareable WBWA tables
+		 * and allocate the whole 32-bit VA space to TTBR0.
+		 */
+
+		if (domain->mmu->features->twobit_imttbcr_sl0)
+			tmp = IMTTBCR_SL0_TWOBIT_LVL_1;
+		else
+			tmp = IMTTBCR_SL0_LVL_1;
+	}
 
 	ipmmu_ctx_write_root(domain, IMTTBCR, IMTTBCR_EAE |
 			     IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA |
@@ -493,7 +504,8 @@ static int ipmmu_domain_init_context(str
 	 * required when modifying the context registers.
 	 */
 	ipmmu_ctx_write_all(domain, IMCTR,
-			    IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
+			 (domain->mmu->features->imctr_va64 ? IMCTR_VA64 : 0)
+			 | IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
 
 	return 0;
 }
@@ -1018,6 +1030,7 @@ static const struct ipmmu_features ipmmu
 	.number_of_contexts = 1, /* software only tested with one context */
 	.setup_imbuscr = true,
 	.twobit_imttbcr_sl0 = false,
+	.imctr_va64 = false,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -1026,6 +1039,7 @@ static const struct ipmmu_features ipmmu
 	.number_of_contexts = 8,
 	.setup_imbuscr = false,
 	.twobit_imttbcr_sl0 = true,
+	.imctr_va64 = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
