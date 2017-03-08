Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34237 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752260AbdCHLQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 06:16:23 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 08 Mar 2017 20:02:23 +0900
Message-Id: <148897094380.16106.17145886836361556040.sendpatchset@little-apple>
In-Reply-To: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
Subject: [PATCH v3 06/09] iommu/ipmmu-vmsa: Write IMCTR twice
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Write IMCTR both in the root device and the leaf node.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - None

 Changes since V1:
 - None

 drivers/iommu/ipmmu-vmsa.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

--- 0018/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-08 18:30:36.870607110 +0900
@@ -286,6 +286,16 @@ static void ipmmu_ctx_write(struct ipmmu
 	ipmmu_write(domain->root, domain->context_id * IM_CTX_SIZE + reg, data);
 }
 
+static void ipmmu_ctx_write2(struct ipmmu_vmsa_domain *domain, unsigned int reg,
+			     u32 data)
+{
+	if (domain->mmu != domain->root)
+		ipmmu_write(domain->mmu,
+			    domain->context_id * IM_CTX_SIZE + reg, data);
+
+	ipmmu_write(domain->root, domain->context_id * IM_CTX_SIZE + reg, data);
+}
+
 /* -----------------------------------------------------------------------------
  * TLB and microTLB Management
  */
@@ -312,7 +322,7 @@ static void ipmmu_tlb_invalidate(struct
 
 	reg = ipmmu_ctx_read(domain, IMCTR);
 	reg |= IMCTR_FLUSH;
-	ipmmu_ctx_write(domain, IMCTR, reg);
+	ipmmu_ctx_write2(domain, IMCTR, reg);
 
 	ipmmu_tlb_sync(domain);
 }
@@ -472,7 +482,8 @@ static int ipmmu_domain_init_context(str
 	 * software management as we have no use for it. Flush the TLB as
 	 * required when modifying the context registers.
 	 */
-	ipmmu_ctx_write(domain, IMCTR, IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
+	ipmmu_ctx_write2(domain, IMCTR,
+			 IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
 
 	return 0;
 }
@@ -498,7 +509,7 @@ static void ipmmu_domain_destroy_context
 	 *
 	 * TODO: Is TLB flush really needed ?
 	 */
-	ipmmu_ctx_write(domain, IMCTR, IMCTR_FLUSH);
+	ipmmu_ctx_write2(domain, IMCTR, IMCTR_FLUSH);
 	ipmmu_tlb_sync(domain);
 	ipmmu_domain_free_context(domain->root, domain->context_id);
 }
