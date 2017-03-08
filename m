Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 08 Mar 2017 20:02:33 +0900
Message-Id: <148897095343.16106.17126859556338057136.sendpatchset@little-apple>
In-Reply-To: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
Subject: [PATCH v3 07/09] iommu/ipmmu-vmsa: Make IMBUSCTR setup optional
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a feature to allow opt-out of setting up
IMBUSCR. The default case is unchanged.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - None

 Changes since V1:
 - Updated the commit message
 - Reworked patch to coexist with the multi context feature

 drivers/iommu/ipmmu-vmsa.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- 0020/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-08 18:32:26.280607110 +0900
@@ -37,6 +37,7 @@ struct ipmmu_features {
 	bool use_ns_alias_offset;
 	bool has_cache_leaf_nodes;
 	bool has_eight_ctx;
+	bool setup_imbuscr;
 };
 
 struct ipmmu_vmsa_device {
@@ -465,10 +466,10 @@ static int ipmmu_domain_init_context(str
 	ipmmu_ctx_write(domain, IMMAIR0, domain->cfg.arm_lpae_s1_cfg.mair[0]);
 
 	/* IMBUSCR */
-	ipmmu_ctx_write(domain, IMBUSCR,
-			ipmmu_ctx_read(domain, IMBUSCR) &
-			~(IMBUSCR_DVM | IMBUSCR_BUSSEL_MASK));
-
+	if (domain->root->features->setup_imbuscr)
+		ipmmu_ctx_write(domain, IMBUSCR,
+				ipmmu_ctx_read(domain, IMBUSCR) &
+				~(IMBUSCR_DVM | IMBUSCR_BUSSEL_MASK));
 	/*
 	 * IMSTR
 	 * Clear all interrupt flags.
@@ -1078,6 +1079,7 @@ static const struct ipmmu_features ipmmu
 	.use_ns_alias_offset = true,
 	.has_cache_leaf_nodes = false,
 	.has_eight_ctx = false,
+	.setup_imbuscr = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
