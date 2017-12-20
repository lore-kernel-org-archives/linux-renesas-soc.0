Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34346 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754660AbdLTMxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 07:53:07 -0500
Received: by mail-pf0-f194.google.com with SMTP id a90so12533909pfk.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Dec 2017 04:53:07 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 21:52:04 +0900
Message-Id: <151377432422.17706.8422856982773690996.sendpatchset@little-apple>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: 2-stage translation hack using PMB
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Test code for r8a77964 IPMMU in a special 2-stage translation mode
where PMB entries and page tables are used together.

The goal is to experiment with the SYS-DMAC and IPMMU to figure out
the number of address bits hooked up between them. In case only 32-bits
are supported regardless of descriptor mode or regular A/B mode, try
to use some other hardware like the PMB to generate 40-bit accesses.

With this patch 32-bit addresses are converted to 40-bit addresses via
the PMB and the result are generated traps. With the current SYS-DMAC
it is possible to extend this code into supporting some 32-bit window
at any offset in 40-bit address space, however with limited address space
it is unclear what the merit of a larger IOVA space would be.

Further testing shows that 40-bit addresses with the PMB seems to work
just fine. The code also includes some random VA64 and TTBR1 stuff that
may or may not be needed depending on the selected IOVA size. And desired
IOVA size depends on the number of bits the on-chip devices use for hooking
up to the IPMMU. We are currently still on the number 32.

My apologies for ugly code. Obviously not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |  103 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 11 deletions(-)

--- 0029/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-11-30 20:05:44.170607110 +0900
@@ -47,6 +47,7 @@ struct ipmmu_features {
 	unsigned int number_of_contexts;
 	bool setup_imbuscr;
 	bool twobit_imttbcr_sl0;
+	bool imctr_va64;
 };
 
 struct ipmmu_vmsa_device {
@@ -97,6 +98,7 @@ static struct ipmmu_vmsa_device *to_ipmm
 #define IM_CTX_SIZE			0x40
 
 #define IMCTR				0x0000
+#define IMCTR_VA64			(1 << 29)
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
 #define IMCTR_RTSEL_MASK		(3 << 4)
@@ -144,7 +146,7 @@ static struct ipmmu_vmsa_device *to_ipmm
 #define IMTTBCR_SL0_LVL_2		(0 << 4)
 #define IMTTBCR_SL0_LVL_1		(1 << 4)
 #define IMTTBCR_TSZ0_MASK		(7 << 0)
-#define IMTTBCR_TSZ0_SHIFT		O
+#define IMTTBCR_TSZ0_SHIFT		0
 
 #define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)
 #define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)
@@ -329,13 +331,21 @@ static void ipmmu_utlb_enable(struct ipm
 	 * TODO: Reference-count the microTLB as several bus masters can be
 	 * connected to the same microTLB.
 	 */
-
 	/* TODO: What should we set the ASID to ? */
 	ipmmu_write(mmu, IMUASID(utlb), 0);
+
+#if 1
+	/* Select PMB for translation */
+	/* Also try to use FIXADDR feature to fix upper 8 bits of IOVA */
+	ipmmu_write(mmu, IMUCTR(utlb),
+		    IMUCTR_FIXADDEN | (3 << IMUCTR_FIXADD_SHIFT) |
+		    IMUCTR_TTSEL_PMB | IMUCTR_FLUSH | IMUCTR_MMUEN);
+#else	
 	/* TODO: Do we need to flush the microTLB ? */
 	ipmmu_write(mmu, IMUCTR(utlb),
 		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
 		    IMUCTR_MMUEN);
+#endif
 }
 
 /*
@@ -407,6 +417,7 @@ static void ipmmu_domain_free_context(st
 
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
+	struct iommu_domain_geometry *g;
 	u64 ttbr;
 	u32 tmp;
 	int ret;
@@ -424,11 +435,18 @@ static int ipmmu_domain_init_context(str
 	 */
 	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
 	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
-	domain->cfg.ias = 32;
+	domain->cfg.ias = domain->mmu->features->imctr_va64 ? 33 : 32;
 	domain->cfg.oas = 40;
 	domain->cfg.tlb = &ipmmu_gather_ops;
-	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
-	domain->io_domain.geometry.force_aperture = true;
+	g = &domain->io_domain.geometry;
+
+	if (domain->mmu->features->imctr_va64) {
+		g->aperture_start = (unsigned long)1 << 32;
+		g->aperture_end = DMA_BIT_MASK(33);
+	} else
+		g->aperture_end = DMA_BIT_MASK(domain->cfg.ias);
+
+	g->force_aperture = true;
 	/*
 	 * TODO: Add support for coherent walk through CCI with DVM and remove
 	 * cache handling. For now, delegate it to the io-pgtable code.
@@ -444,8 +462,9 @@ static int ipmmu_domain_init_context(str
 
 	domain->context_id = ret;
 
-	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
-					   domain);
+	domain->iop = alloc_io_pgtable_ops(domain->mmu->features->imctr_va64 ?
+					   ARM_64_LPAE_S1 : ARM_32_LPAE_S1,
+					   &domain->cfg, domain);
 	if (!domain->iop) {
 		ipmmu_domain_free_context(domain->mmu->root,
 					  domain->context_id);
@@ -456,7 +475,20 @@ static int ipmmu_domain_init_context(str
 	ttbr = domain->cfg.arm_lpae_s1_cfg.ttbr[0];
 	ipmmu_ctx_write_root(domain, IMTTLBR0, ttbr);
 	ipmmu_ctx_write_root(domain, IMTTUBR0, ttbr >> 32);
+#if 0
+	/*
+	 * With enabling IMCTR_VA64 we need to setup TTBR1 as well
+	 */
+	if (domain->mmu->features->imctr_va64) {
+		ipmmu_ctx_write_root(domain, IMTTLBR1, ttbr);
+		ipmmu_ctx_write_root(domain, IMTTUBR1, ttbr >> 32);
+	}
+#endif
 
+	if (domain->mmu->features->imctr_va64) {
+	  tmp = 1 << 6;
+	}
+	else {
 	/*
 	 * TTBCR
 	 * We use long descriptors with inner-shareable WBWA tables and allocate
@@ -466,13 +498,28 @@ static int ipmmu_domain_init_context(str
 		tmp = IMTTBCR_SL0_TWOBIT_LVL_1;
 	else
 		tmp = IMTTBCR_SL0_LVL_1;
+	}
+	/*
+	 * As we are going to use TTBR1 we need to setup attributes for the memory
+	 * associated with the translation table walks using TTBR1.
+	 * Also for using IMCTR_VA64 mode we need to calculate and setup
+	 * TTBR0/TTBR1 addressed regions.
+	 */
+	if (domain->mmu->features->imctr_va64) {
+#if 0	  
+		tmp |= IMTTBCR_SH1_INNER_SHAREABLE | IMTTBCR_ORGN1_WB_WA |
+				IMTTBCR_IRGN1_WB_WA;
+		tmp |= (64ULL - domain->cfg.ias) << IMTTBCR_TSZ1_SHIFT;
+#endif		
+		tmp |= (64ULL - domain->cfg.ias) << IMTTBCR_TSZ0_SHIFT;
+	}
 
 	tmp |= IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA;
 	tmp |= IMTTBCR_IRGN0_WB_WA;
+	tmp |= IMTTBCR_EAE;
 	
 	printk("ipmmu: xxx ttbcr 0x%08x\n", tmp);
 	ipmmu_ctx_write_root(domain, IMTTBCR, tmp);
-
 	
 	/* MAIR0 */
 	ipmmu_ctx_write_root(domain, IMMAIR0,
@@ -490,6 +537,24 @@ static int ipmmu_domain_init_context(str
 	 */
 	ipmmu_ctx_write_root(domain, IMSTR, ipmmu_ctx_read_root(domain, IMSTR));
 
+#if 1
+	/* PMB configuration */
+
+	/* fix top 8 bits to 0x02 via upper PPN in PMB */
+#define PMB_SETUP(arg, idx, av, dv)	   \
+	ipmmu_write(arg, IMPMBA(idx), av); \
+	ipmmu_write(arg, IMPMBD(idx), dv | 0x00020000)
+
+	PMB_SETUP(domain->mmu, 0, 0x00000100, 0x00000190);
+	PMB_SETUP(domain->mmu, 1, 0x20000100, 0x20000190);
+	PMB_SETUP(domain->mmu, 2, 0x40000100, 0x40000190);
+	PMB_SETUP(domain->mmu, 3, 0x60000100, 0x60000190);
+	PMB_SETUP(domain->mmu, 4, 0x80000100, 0x80000190);
+	PMB_SETUP(domain->mmu, 5, 0xa0000100, 0xa0000190);
+	PMB_SETUP(domain->mmu, 6, 0xc0000100, 0xc0000190);
+	PMB_SETUP(domain->mmu, 7, 0xe0000100, 0xe0000190);
+#endif
+	
 	/*
 	 * IMCTR
 	 * Enable the MMU and interrupt generation. The long-descriptor
@@ -498,7 +563,8 @@ static int ipmmu_domain_init_context(str
 	 * required when modifying the context registers.
 	 */
 	ipmmu_ctx_write_all(domain, IMCTR,
-			    IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
+			 (domain->mmu->features->imctr_va64 ? IMCTR_VA64 : 0)
+			 | IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
 
 	return 0;
 }
@@ -524,12 +590,17 @@ static irqreturn_t ipmmu_domain_irq(stru
 {
 	const u32 err_mask = IMSTR_MHIT | IMSTR_ABORT | IMSTR_PF | IMSTR_TF;
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
-	u32 status;
+	u32 status, status2;
 	unsigned long iova;
 
 	status = ipmmu_ctx_read_root(domain, IMSTR);
-	if (!(status & err_mask))
+	status2 = ipmmu_read(domain->mmu, IMPSTR);
+
+	if (!(status & err_mask) && (!status2))
 		return IRQ_NONE;
+
+	printk("ipmmu: xxx pmb status2 0x%08x ear 0x%08x\n", status2,
+	       ipmmu_read(domain->mmu, IMPEAR));
 #if 1
 	iova = ipmmu_ctx_read_root(domain, IMEUAR);
 	printk("ipmmu: xxx ctx %d, uar 0x%08lx\n", domain->context_id, iova);
@@ -539,6 +610,7 @@ static irqreturn_t ipmmu_domain_irq(stru
 #else
 	iova = ipmmu_ctx_read_root(domain, IMEAR);
 #endif	
+
 	/*
 	 * Clear the error status flags. Unlike traditional interrupt flag
 	 * registers that must be cleared by writing 1, this status register
@@ -546,6 +618,7 @@ static irqreturn_t ipmmu_domain_irq(stru
 	 * otherwise its value will be 0.
 	 */
 	ipmmu_ctx_write_root(domain, IMSTR, 0);
+	ipmmu_write(domain->mmu, IMPSTR, 0);
 
 	/* Log fatal errors. */
 	if (status & IMSTR_MHIT)
@@ -694,6 +767,12 @@ static int ipmmu_attach_device(struct io
 	if (ret < 0)
 		return ret;
 
+#if 1
+	/* enable PMB + IRQ and translation with TTEN + TTSEL*/
+	ipmmu_write(domain->mmu, IMPCTR,
+		    (domain->context_id << 4) | (1 << 3) |
+		    0x05); 
+#endif
 	for (i = 0; i < fwspec->num_ids; ++i)
 		ipmmu_utlb_enable(domain, fwspec->ids[i]);
 
@@ -943,6 +1022,7 @@ static const struct ipmmu_features ipmmu
 	.number_of_contexts = 1, /* software only tested with one context */
 	.setup_imbuscr = true,
 	.twobit_imttbcr_sl0 = false,
+	.imctr_va64 = false,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -951,6 +1031,7 @@ static const struct ipmmu_features ipmmu
 	.number_of_contexts = 8,
 	.setup_imbuscr = false,
 	.twobit_imttbcr_sl0 = true,
+	.imctr_va64 = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
