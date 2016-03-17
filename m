Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 18 Mar 2016 01:30:05 +0900
Message-Id: <20160317163005.24104.44265.sendpatchset@little-apple>
In-Reply-To: <20160317162909.24104.31682.sendpatchset@little-apple>
References: <20160317162909.24104.31682.sendpatchset@little-apple>
Subject: [PATCH 06/10] iommu/ipmmu-vmsa: Add optional root device feature
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add root device handling to the IPMMU driver by
allowing certain DT compat strings to enable
has_cache_leaf_nodes that in turn will support
both root devices with interrupts and leaf devices
that face the actual IPMMU consumer devices.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   92 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 19 deletions(-)

--- 0019/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-18 00:30:22.270513000 +0900
@@ -35,6 +35,7 @@
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
+	bool has_cache_leaf_nodes;
 };
 
 struct ipmmu_vmsa_device {
@@ -50,10 +51,12 @@ struct ipmmu_vmsa_device {
 	struct dma_iommu_mapping *mapping;
 #endif
 	const struct ipmmu_features *features;
+	bool is_leaf;
 };
 
 struct ipmmu_vmsa_domain {
 	struct ipmmu_vmsa_device *mmu;
+	struct ipmmu_vmsa_device *root;
 	struct iommu_domain io_domain;
 
 	struct io_pgtable_cfg cfg;
@@ -198,6 +201,36 @@ static struct ipmmu_vmsa_domain *to_vmsa
 #define IMUASID_ASID0_SHIFT		0
 
 /* -----------------------------------------------------------------------------
+ * Root device handling
+ */
+
+static bool ipmmu_is_root(struct ipmmu_vmsa_device *mmu)
+{
+	if (mmu->features->has_cache_leaf_nodes)
+		return mmu->is_leaf ? false : true;
+	else
+		return true; /* older IPMMU hardware treated as single root */
+}
+
+static struct ipmmu_vmsa_device *ipmmu_find_root(struct ipmmu_vmsa_device *leaf)
+{
+	struct ipmmu_vmsa_device *mmu = NULL;
+
+	if (ipmmu_is_root(leaf))
+		return leaf;
+
+	spin_lock(&ipmmu_devices_lock);
+
+	list_for_each_entry(mmu, &ipmmu_devices, list) {
+		if (ipmmu_is_root(mmu))
+			break;
+	}
+
+	spin_unlock(&ipmmu_devices_lock);
+	return mmu;
+}
+
+/* -----------------------------------------------------------------------------
  * Read/Write Access
  */
 
@@ -214,13 +247,13 @@ static void ipmmu_write(struct ipmmu_vms
 
 static u32 ipmmu_ctx_read(struct ipmmu_vmsa_domain *domain, unsigned int reg)
 {
-	return ipmmu_read(domain->mmu, domain->context_id * IM_CTX_SIZE + reg);
+	return ipmmu_read(domain->root, domain->context_id * IM_CTX_SIZE + reg);
 }
 
 static void ipmmu_ctx_write(struct ipmmu_vmsa_domain *domain, unsigned int reg,
 			    u32 data)
 {
-	ipmmu_write(domain->mmu, domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_write(domain->root, domain->context_id * IM_CTX_SIZE + reg, data);
 }
 
 /* -----------------------------------------------------------------------------
@@ -334,7 +367,7 @@ static int ipmmu_domain_init_context(str
 	 * TODO: Add support for coherent walk through CCI with DVM and remove
 	 * cache handling. For now, delegate it to the io-pgtable code.
 	 */
-	domain->cfg.iommu_dev = domain->mmu->dev;
+	domain->cfg.iommu_dev = domain->root->dev;
 
 	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
 					   domain);
@@ -344,15 +377,15 @@ static int ipmmu_domain_init_context(str
 	/*
 	 * Find an unused context.
 	 */
-	ret = find_first_zero_bit(domain->mmu->ctx, IPMMU_CTX_MAX);
+	ret = find_first_zero_bit(domain->root->ctx, IPMMU_CTX_MAX);
 	if (ret == IPMMU_CTX_MAX) {
 		free_io_pgtable_ops(domain->iop);
 		return -EBUSY;
 	}
 
 	domain->context_id = ret;
-	domain->mmu->domains[ret] = domain;
-	set_bit(ret, domain->mmu->ctx);
+	domain->root->domains[ret] = domain;
+	set_bit(ret, domain->root->ctx);
 
 	/* TTBR0 */
 	ttbr = domain->cfg.arm_lpae_s1_cfg.ttbr[0];
@@ -396,7 +429,7 @@ static int ipmmu_domain_init_context(str
 
 static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
 {
-	clear_bit(domain->context_id, domain->mmu->ctx);
+	clear_bit(domain->context_id, domain->root->ctx);
 
 	/*
 	 * Disable the context. Flush the TLB as required when modifying the
@@ -524,7 +557,7 @@ static int ipmmu_attach_device(struct io
 			       struct device *dev)
 {
 	struct ipmmu_vmsa_archdata *archdata = dev->archdata.iommu;
-	struct ipmmu_vmsa_device *mmu = archdata->mmu;
+	struct ipmmu_vmsa_device *root, *mmu = archdata->mmu;
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
 	unsigned long flags;
 	unsigned int i;
@@ -535,15 +568,23 @@ static int ipmmu_attach_device(struct io
 		return -ENXIO;
 	}
 
+	root = ipmmu_find_root(archdata->mmu);
+	if (!root) {
+		dev_err(dev, "Unable to locate root IPMMU\n");
+		return -EAGAIN;
+	}
+
 	spin_lock_irqsave(&domain->lock, flags);
 
 	if (!domain->mmu) {
 		/* The domain hasn't been used yet, initialize it. */
 		domain->mmu = mmu;
+		domain->root = root;
 		ret = ipmmu_domain_init_context(domain);
 		if (ret < 0) {
 			dev_err(dev, "Unable to initialize IPMMU context\n");
 			domain->mmu = NULL;
+			domain->root = NULL;
 		} else {
 			dev_info(dev, "Using IPMMU context %u\n",
 				 domain->context_id);
@@ -939,6 +980,7 @@ static void ipmmu_device_reset(struct ip
 
 static const struct ipmmu_features ipmmu_features_default = {
 	.use_ns_alias_offset = true,
+	.has_cache_leaf_nodes = false,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
@@ -998,19 +1040,31 @@ static int ipmmu_probe(struct platform_d
 		mmu->base += IM_NS_ALIAS_OFFSET;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no IRQ found\n");
-		return irq;
-	}
 
-	ret = devm_request_irq(&pdev->dev, irq, ipmmu_irq, 0,
-			       dev_name(&pdev->dev), mmu);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ %d\n", irq);
-		return ret;
-	}
+	/*
+	 * Determine if this IPMMU instance is a leaf device by checking
+	 * if the renesas,ipmmu-main property exists or not.
+	 */
+	if (mmu->features->has_cache_leaf_nodes &&
+	    of_find_property(pdev->dev.of_node, "renesas,ipmmu-main", NULL))
+		mmu->is_leaf = true;
+
+	/* Root devices have mandatory IRQs */
+	if (ipmmu_is_root(mmu)) {
+		if (irq < 0) {
+			dev_err(&pdev->dev, "no IRQ found\n");
+			return irq;
+		}
+
+		ret = devm_request_irq(&pdev->dev, irq, ipmmu_irq, 0,
+				       dev_name(&pdev->dev), mmu);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to request IRQ %d\n", irq);
+			return ret;
+		}
 
-	ipmmu_device_reset(mmu);
+		ipmmu_device_reset(mmu);
+	}
 
 	/*
 	 * We can't create the ARM mapping here as it requires the bus to have
