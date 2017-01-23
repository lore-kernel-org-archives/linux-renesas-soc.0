Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 23 Jan 2017 20:40:38 +0900
Message-Id: <148517163800.13306.4525529383838653751.sendpatchset@little-apple>
In-Reply-To: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
References: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
Subject: [PATCH v2 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Support the r8a7796 IPMMU by sharing feature flags between
r8a7795 and r8a7796. Also update IOMMU_OF_DECLARE to hook
up the updated compat string.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - None

 drivers/iommu/ipmmu-vmsa.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

--- 0031/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 11:19:40.210607110 +0900
@@ -1074,7 +1074,7 @@ static const struct ipmmu_features ipmmu
 	.twobit_imttbcr_sl0 = false,
 };
 
-static const struct ipmmu_features ipmmu_features_r8a7795 = {
+static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.use_ns_alias_offset = false,
 	.has_cache_leaf_nodes = true,
 	.has_eight_ctx = true,
@@ -1088,7 +1088,10 @@ static const struct of_device_id ipmmu_o
 		.data = &ipmmu_features_default,
 	}, {
 		.compatible = "renesas,ipmmu-r8a7795",
-		.data = &ipmmu_features_r8a7795,
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
+		.compatible = "renesas,ipmmu-r8a7796",
+		.data = &ipmmu_features_rcar_gen3,
 	}, {
 		/* Terminator */
 	},
@@ -1268,6 +1271,8 @@ IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "r
 		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
 		 ipmmu_vmsa_iommu_of_setup);
+IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
+		 ipmmu_vmsa_iommu_of_setup);
 #endif
 
 MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
