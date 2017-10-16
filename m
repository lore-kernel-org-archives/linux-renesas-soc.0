Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Mon, 16 Oct 2017 21:29:25 +0900
Message-Id: <150815696545.32763.9995173870577980534.sendpatchset@little-apple>
In-Reply-To: <150815695455.32763.1660214306749693609.sendpatchset@little-apple>
References: <150815695455.32763.1660214306749693609.sendpatchset@little-apple>
Subject: [PATCH v5 01/09] iommu/ipmmu-vmsa: Introduce features, break out alias
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Introduce struct ipmmu_features to track various hardware
and software implementation changes inside the driver for
different kinds of IPMMU hardware. Add use_ns_alias_offset
as a first example of a feature to control if the secure
register bank offset should be used or not.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V4:
 - None

 Changes since V3:
 - Use of_device_get_match_data(), thanks Robin!

 Changes since V2:
 - None

 Changes since V1:
 - Moved patch to front of the series


 drivers/iommu/ipmmu-vmsa.c |   31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-10-12 15:16:43.510607110 +0900
@@ -19,6 +19,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
@@ -33,11 +34,15 @@
 
 #define IPMMU_CTX_MAX 1
 
+struct ipmmu_features {
+	bool use_ns_alias_offset;
+};
+
 struct ipmmu_vmsa_device {
 	struct device *dev;
 	void __iomem *base;
 	struct iommu_device iommu;
-
+	const struct ipmmu_features *features;
 	unsigned int num_utlbs;
 	spinlock_t lock;			/* Protects ctx and domains[] */
 	DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
@@ -910,6 +915,21 @@ static void ipmmu_device_reset(struct ip
 		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
 }
 
+static const struct ipmmu_features ipmmu_features_default = {
+	.use_ns_alias_offset = true,
+};
+
+static const struct of_device_id ipmmu_of_ids[] = {
+	{
+		.compatible = "renesas,ipmmu-vmsa",
+		.data = &ipmmu_features_default,
+	}, {
+		/* Terminator */
+	},
+};
+
+MODULE_DEVICE_TABLE(of, ipmmu_of_ids);
+
 static int ipmmu_probe(struct platform_device *pdev)
 {
 	struct ipmmu_vmsa_device *mmu;
@@ -927,6 +947,7 @@ static int ipmmu_probe(struct platform_d
 	mmu->num_utlbs = 32;
 	spin_lock_init(&mmu->lock);
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
+	mmu->features = of_device_get_match_data(&pdev->dev);
 
 	/* Map I/O memory and request IRQ. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -946,7 +967,8 @@ static int ipmmu_probe(struct platform_d
 	 * Offset the registers base unconditionally to point to the non-secure
 	 * alias space for now.
 	 */
-	mmu->base += IM_NS_ALIAS_OFFSET;
+	if (mmu->features->use_ns_alias_offset)
+		mmu->base += IM_NS_ALIAS_OFFSET;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
@@ -1002,11 +1024,6 @@ static int ipmmu_remove(struct platform_
 	return 0;
 }
 
-static const struct of_device_id ipmmu_of_ids[] = {
-	{ .compatible = "renesas,ipmmu-vmsa", },
-	{ }
-};
-
 static struct platform_driver ipmmu_driver = {
 	.driver = {
 		.name = "ipmmu-vmsa",
