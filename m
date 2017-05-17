Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        sricharan@codeaurora.org, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 17 May 2017 19:06:59 +0900
Message-Id: <149501561966.21593.14282344872401796559.sendpatchset@little-apple>
In-Reply-To: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
References: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
Subject: [PATCH v8 04/08] iommu/ipmmu-vmsa: Break out domain allocation code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Break out the domain allocation code into a separate function.

This is preparation for future code sharing.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Changes since V7:
 - Added Reviewed-by from Geert - Thanks!

 drivers/iommu/ipmmu-vmsa.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

--- 0006/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-05-17 16:39:05.380607110 +0900
@@ -509,13 +509,10 @@ static irqreturn_t ipmmu_irq(int irq, vo
  * IOMMU Operations
  */
 
-static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
+static struct iommu_domain *__ipmmu_domain_alloc(unsigned type)
 {
 	struct ipmmu_vmsa_domain *domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -525,6 +522,14 @@ static struct iommu_domain *ipmmu_domain
 	return &domain->io_domain;
 }
 
+static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
+{
+	if (type != IOMMU_DOMAIN_UNMANAGED)
+		return NULL;
+
+	return __ipmmu_domain_alloc(type);
+}
+
 static void ipmmu_domain_free(struct iommu_domain *io_domain)
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
