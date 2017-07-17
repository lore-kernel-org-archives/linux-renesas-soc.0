Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34914 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751309AbdGQNJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 09:09:14 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        robin.murphy@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, sricharan@codeaurora.org,
        m.szyprowski@samsung.com
Date: Mon, 17 Jul 2017 22:05:51 +0900
Message-Id: <150029675199.22030.3050963235267091212.sendpatchset@little-apple>
In-Reply-To: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
References: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
Subject: [PATCH v2 05/05] iommu/ipmmu-vmsa: Clean up device tracking
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Robin Murphy <robin.murphy@arm.com>

Get rid of now unused device tracking code. Future code should instead
be able to use driver_for_each_device() for this purpose.

This is a simplified version of the following patch from Robin
[PATCH] iommu/ipmmu-vmsa: Clean up group allocation

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Change since V1:
 - New patch

 drivers/iommu/ipmmu-vmsa.c |   12 ------------
 1 file changed, 12 deletions(-)

--- 0008/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-07-17 21:35:26.690607110 +0900
@@ -37,7 +37,6 @@ struct ipmmu_vmsa_device {
 	struct device *dev;
 	void __iomem *base;
 	struct iommu_device iommu;
-	struct list_head list;
 
 	unsigned int num_utlbs;
 	spinlock_t lock;			/* Protects ctx and domains[] */
@@ -64,9 +63,6 @@ struct ipmmu_vmsa_iommu_priv {
 	struct list_head list;
 };
 
-static DEFINE_SPINLOCK(ipmmu_devices_lock);
-static LIST_HEAD(ipmmu_devices);
-
 static struct ipmmu_vmsa_domain *to_vmsa_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct ipmmu_vmsa_domain, io_domain);
@@ -970,10 +966,6 @@ static int ipmmu_probe(struct platform_d
 	 * ipmmu_init() after the probe function returns.
 	 */
 
-	spin_lock(&ipmmu_devices_lock);
-	list_add(&mmu->list, &ipmmu_devices);
-	spin_unlock(&ipmmu_devices_lock);
-
 	platform_set_drvdata(pdev, mmu);
 
 	return 0;
@@ -983,10 +975,6 @@ static int ipmmu_remove(struct platform_
 {
 	struct ipmmu_vmsa_device *mmu = platform_get_drvdata(pdev);
 
-	spin_lock(&ipmmu_devices_lock);
-	list_del(&mmu->list);
-	spin_unlock(&ipmmu_devices_lock);
-
 	iommu_device_unregister(&mmu->iommu);
 
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
