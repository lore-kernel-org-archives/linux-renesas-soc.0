Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Mon, 19 Jun 2017 18:14:58 +0900
Message-Id: <149786369896.14868.6954404224843797586.sendpatchset@little-apple>
In-Reply-To: <149786362527.14868.2143461703972595839.sendpatchset@little-apple>
References: <149786362527.14868.2143461703972595839.sendpatchset@little-apple>
Subject: [PATCH v4 07/09] iommu/ipmmu-vmsa: Make IMBUSCTR setup optional
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a feature to allow opt-out of setting up
IMBUSCR. The default case is unchanged.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V3:
 - None

 Changes since V2:
 - None

 Changes since V1:
 - Updated the commit message
 - Reworked patch to coexist with the multi context feature

 drivers/iommu/ipmmu-vmsa.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- 0025/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-06-19 14:07:06.850607110 +0900
@@ -39,6 +39,7 @@ struct ipmmu_features {
 	bool use_ns_alias_offset;
 	bool has_cache_leaf_nodes;
 	unsigned int number_of_contexts;
+	bool setup_imbuscr;
 };
 
 struct ipmmu_vmsa_device {
@@ -453,9 +454,10 @@ static int ipmmu_domain_init_context(str
 			     domain->cfg.arm_lpae_s1_cfg.mair[0]);
 
 	/* IMBUSCR */
-	ipmmu_ctx_write_root(domain, IMBUSCR,
-			     ipmmu_ctx_read_root(domain, IMBUSCR) &
-			     ~(IMBUSCR_DVM | IMBUSCR_BUSSEL_MASK));
+	if (domain->root->features->setup_imbuscr)
+		ipmmu_ctx_write_root(domain, IMBUSCR,
+				     ipmmu_ctx_read_root(domain, IMBUSCR) &
+				     ~(IMBUSCR_DVM | IMBUSCR_BUSSEL_MASK));
 
 	/*
 	 * IMSTR
@@ -986,6 +988,7 @@ static const struct ipmmu_features ipmmu
 	.use_ns_alias_offset = true,
 	.has_cache_leaf_nodes = false,
 	.number_of_contexts = 1, /* software only tested with one context */
+	.setup_imbuscr = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
