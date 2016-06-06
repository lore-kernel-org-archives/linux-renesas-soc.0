Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 06 Jun 2016 12:58:49 +0900
Message-Id: <20160606035849.31763.15348.sendpatchset@little-apple>
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
Subject: [PATCH v2 09/11] iommu/ipmmu-vmsa: Make IMBUSCTR setup optional
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a feature to allow opt-out of setting up
IMBUSCR. The default case is unchanged.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Updated the commit message
 - Reworked patch to coexist with the multi context feature

 drivers/iommu/ipmmu-vmsa.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- 0023/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 11:04:39.800607110 +0900
@@ -37,6 +37,7 @@ struct ipmmu_features {
 	bool use_ns_alias_offset;
 	bool has_cache_leaf_nodes;
 	bool has_eight_ctx;
+	bool setup_imbuscr;
 };
 
 struct ipmmu_vmsa_device {
@@ -438,10 +439,10 @@ static int ipmmu_domain_init_context(str
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
@@ -1057,6 +1058,7 @@ static const struct ipmmu_features ipmmu
 	.use_ns_alias_offset = true,
 	.has_cache_leaf_nodes = false,
 	.has_eight_ctx = false,
+	.setup_imbuscr = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
