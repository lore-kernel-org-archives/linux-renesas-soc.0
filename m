Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Sun, 12 Mar 2017 14:38:51 +0900
Message-Id: <148929713106.20744.12985371298983384075.sendpatchset@little-apple>
In-Reply-To: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
References: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
Subject: [PATCH v3 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Support the r8a7796 IPMMU by sharing feature flags between
r8a7795 and r8a7796. Also update IOMMU_OF_DECLARE to hook
up the updated compat string.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - Updated to include white list suppport

 Changes since V1:
 - None

 drivers/iommu/ipmmu-vmsa.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

--- 0024/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-12 14:14:32.550607110 +0900
@@ -1058,8 +1058,9 @@ static bool ipmmu_slave_whitelist(struct
 	return false;
 }
 
-static const struct soc_device_attribute soc_r8a7795[] = {
+static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a7795", },
+	{ .soc_id = "r8a7796", },
 	{ /* sentinel */ }
 };
 
@@ -1082,7 +1083,7 @@ static int ipmmu_of_xlate_dma(struct dev
 	}
 
 	/* For R-Car Gen3 use a white list to opt-in slave devices */
-	if (soc_device_match(soc_r8a7795) && !ipmmu_slave_whitelist(dev))
+	if (soc_device_match(soc_rcar_gen3) && !ipmmu_slave_whitelist(dev))
 		return -ENODEV;
 
 	return ipmmu_init_platform_device(dev);
@@ -1127,7 +1128,7 @@ static const struct ipmmu_features ipmmu
 	.twobit_imttbcr_sl0 = false,
 };
 
-static const struct ipmmu_features ipmmu_features_r8a7795 = {
+static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.use_ns_alias_offset = false,
 	.has_cache_leaf_nodes = true,
 	.has_eight_ctx = true,
@@ -1141,7 +1142,10 @@ static const struct of_device_id ipmmu_o
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
@@ -1333,6 +1337,8 @@ IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "r
 		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
 		 ipmmu_vmsa_iommu_of_setup);
+IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
+		 ipmmu_vmsa_iommu_of_setup);
 #endif
 
 MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
