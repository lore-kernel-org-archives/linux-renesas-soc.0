Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 18 Mar 2016 01:30:23 +0900
Message-Id: <20160317163023.24104.41969.sendpatchset@little-apple>
In-Reply-To: <20160317162909.24104.31682.sendpatchset@little-apple>
References: <20160317162909.24104.31682.sendpatchset@little-apple>
Subject: [PATCH 08/10] iommu/ipmmu-vmsa: Make IMBUSCTR setup optional
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Allow certain DT compat strings to opt-out of setting up
IMBUSCR. The default case is unchanged.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- 0023/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-18 00:32:45.550513000 +0900
@@ -36,6 +36,7 @@
 struct ipmmu_features {
 	bool use_ns_alias_offset;
 	bool has_cache_leaf_nodes;
+	bool setup_imbuscr;
 };
 
 struct ipmmu_vmsa_device {
@@ -415,10 +416,10 @@ static int ipmmu_domain_init_context(str
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
@@ -992,6 +993,7 @@ static void ipmmu_device_reset(struct ip
 static const struct ipmmu_features ipmmu_features_default = {
 	.use_ns_alias_offset = true,
 	.has_cache_leaf_nodes = false,
+	.setup_imbuscr = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
