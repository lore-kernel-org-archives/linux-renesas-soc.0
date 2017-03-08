Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33294 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750728AbdCHLKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 06:10:01 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 08 Mar 2017 20:01:53 +0900
Message-Id: <148897091345.16106.2935423334300744039.sendpatchset@little-apple>
In-Reply-To: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
Subject: [PATCH v3 03/09] iommu/ipmmu-vmsa: Enable multi context support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add support for up to 8 contexts. Each context is mapped to one
domain. One domain is assigned one or more slave devices. Contexts
are allocated dynamically and slave devices are grouped together
based on which IPMMU device they are connected to. This makes slave
devices tied to the same IPMMU device share the same IOVA space.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - Updated patch description to reflect code included in:
   [PATCH v7 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V7

 Changes since V1:
 - Support up to 8 contexts instead of 4
 - Use feature flag and runtime handling
 - Default to single context

 drivers/iommu/ipmmu-vmsa.c |   38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

--- 0012/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-08 17:59:19.900607110 +0900
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
@@ -376,11 +378,12 @@ static int ipmmu_domain_allocate_context
 
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
 
@@ -425,9 +428,9 @@ static int ipmmu_domain_init_context(str
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
@@ -562,7 +565,7 @@ static irqreturn_t ipmmu_irq(int irq, vo
 	/*
 	 * Check interrupts for all active contexts.
 	 */
-	for (i = 0; i < IPMMU_CTX_MAX; i++) {
+	for (i = 0; i < mmu->num_ctx; i++) {
 		if (!mmu->domains[i])
 			continue;
 		if (ipmmu_domain_irq(mmu->domains[i]) == IRQ_HANDLED)
@@ -632,6 +635,13 @@ static int ipmmu_attach_device(struct io
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
@@ -1047,13 +1057,14 @@ static void ipmmu_device_reset(struct ip
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
@@ -1112,6 +1123,17 @@ static int ipmmu_probe(struct platform_d
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
