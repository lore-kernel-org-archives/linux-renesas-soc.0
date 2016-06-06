Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 06 Jun 2016 12:57:52 +0900
Message-Id: <20160606035752.31763.99685.sendpatchset@little-apple>
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
Subject: [PATCH v2 03/11] iommu/ipmmu-vmsa: Enable multi context support
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add support for up to 8 contexts. Each context is mapped
to one domain. One domain is associated with each device,
however one or more uTLBs for a single device are kept
in the same domain.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Support up to 8 contexts instead of 4
 - Use feature flag and runtime handling
 - Default to single context
 
 drivers/iommu/ipmmu-vmsa.c |   38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

--- 0011/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 10:34:37.680607110 +0900
@@ -30,11 +30,12 @@
 
 #include "io-pgtable.h"
 
-#define IPMMU_CTX_MAX 1
+#define IPMMU_CTX_MAX 8
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
 	bool has_cache_leaf_nodes;
+	bool has_eight_ctx;
 };
 
 struct ipmmu_vmsa_device {
@@ -44,6 +45,7 @@ struct ipmmu_vmsa_device {
 	const struct ipmmu_features *features;
 	bool is_leaf;
 	unsigned int num_utlbs;
+	unsigned int num_ctx;
 	spinlock_t lock;			/* Protects ctx and domains[] */
 	DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
 	struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
@@ -347,11 +349,12 @@ static int ipmmu_domain_allocate_context
 
 	spin_lock_irqsave(&mmu->lock, flags);
 
-	ret = find_first_zero_bit(mmu->ctx, IPMMU_CTX_MAX);
-	if (ret != IPMMU_CTX_MAX) {
+	ret = find_first_zero_bit(mmu->ctx, mmu->num_ctx);
+	if (ret != mmu->num_ctx) {
 		mmu->domains[ret] = domain;
 		set_bit(ret, mmu->ctx);
-	}
+	} else
+		ret = -EBUSY;
 
 	spin_unlock_irqrestore(&mmu->lock, flags);
 
@@ -394,9 +397,9 @@ static int ipmmu_domain_init_context(str
 	 * Find an unused context.
 	 */
 	ret = ipmmu_domain_allocate_context(domain->root, domain);
-	if (ret == IPMMU_CTX_MAX) {
+	if (ret < 0) {
 		free_io_pgtable_ops(domain->iop);
-		return -EBUSY;
+		return ret;
 	}
 
 	domain->context_id = ret;
@@ -531,7 +534,7 @@ static irqreturn_t ipmmu_irq(int irq, vo
 	/*
 	 * Check interrupts for all active contexts.
 	 */
-	for (i = 0; i < IPMMU_CTX_MAX; i++) {
+	for (i = 0; i < mmu->num_ctx; i++) {
 		if (!mmu->domains[i])
 			continue;
 		if (ipmmu_domain_irq(mmu->domains[i]) == IRQ_HANDLED)
@@ -601,6 +604,13 @@ static int ipmmu_attach_device(struct io
 		domain->mmu = mmu;
 		domain->root = root;
 		ret = ipmmu_domain_init_context(domain);
+		if (ret < 0) {
+			dev_err(dev, "Unable to initialize IPMMU context\n");
+			domain->mmu = NULL;
+		} else {
+			dev_info(dev, "Using IPMMU context %u\n",
+				 domain->context_id);
+		}
 	} else if (domain->mmu != mmu) {
 		/*
 		 * Something is wrong, we can't attach two devices using
@@ -969,13 +979,14 @@ static void ipmmu_device_reset(struct ip
 	unsigned int i;
 
 	/* Disable all contexts. */
-	for (i = 0; i < 4; ++i)
+	for (i = 0; i < mmu->num_ctx; ++i)
 		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
 }
 
 static const struct ipmmu_features ipmmu_features_default = {
 	.use_ns_alias_offset = true,
 	.has_cache_leaf_nodes = false,
+	.has_eight_ctx = false,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
@@ -1034,6 +1045,17 @@ static int ipmmu_probe(struct platform_d
 	if (mmu->features->use_ns_alias_offset)
 		mmu->base += IM_NS_ALIAS_OFFSET;
 
+	/*
+	 * The number of contexts varies with generation and instance.
+	 * Newer SoCs get a total of 8 contexts enabled, older ones just one.
+	 */
+	if (mmu->features->has_eight_ctx)
+		mmu->num_ctx = 8;
+	else
+		mmu->num_ctx = 1;
+
+	WARN_ON(mmu->num_ctx > IPMMU_CTX_MAX);
+
 	irq = platform_get_irq(pdev, 0);
 
 	/*
