Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34518 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753580AbdFSLIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 07:08:35 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Mon, 19 Jun 2017 20:04:47 +0900
Message-Id: <149787028779.32495.1462495100153656335.sendpatchset@little-apple>
In-Reply-To: <149787025647.32495.1584960416060100962.sendpatchset@little-apple>
References: <149787025647.32495.1584960416060100962.sendpatchset@little-apple>
Subject: [PATCH v4 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Support the r8a7796 IPMMU by sharing feature flags between
r8a7795 and r8a7796. Also update IOMMU_OF_DECLARE to hook
up the updated compat string.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Changes since V3:
 - Added Reviewed-by from Geert - thanks!

 Changes since V2:
 - Updated to include white list suppport

 Changes since V1:
 - None

 drivers/iommu/ipmmu-vmsa.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

--- 0016/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-06-19 19:48:27.430607110 +0900
@@ -755,8 +755,9 @@ static bool ipmmu_slave_whitelist(struct
 	return false;
 }
 
-static const struct soc_device_attribute soc_r8a7795[] = {
+static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a7795", },
+	{ .soc_id = "r8a7796", },
 	{ /* sentinel */ }
 };
 
@@ -772,7 +773,7 @@ static int ipmmu_of_xlate(struct device
 	}
 
 	/* For R-Car Gen3 use a white list to opt-in slave devices */
-	if (soc_device_match(soc_r8a7795) && !ipmmu_slave_whitelist(dev))
+	if (soc_device_match(soc_rcar_gen3) && !ipmmu_slave_whitelist(dev))
 		return -ENODEV;
 
 	iommu_fwspec_add_ids(dev, spec->args, 1);
@@ -1034,7 +1035,7 @@ static const struct ipmmu_features ipmmu
 	.twobit_imttbcr_sl0 = false,
 };
 
-static const struct ipmmu_features ipmmu_features_r8a7795 = {
+static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.use_ns_alias_offset = false,
 	.has_cache_leaf_nodes = true,
 	.number_of_contexts = 8,
@@ -1048,7 +1049,10 @@ static const struct of_device_id ipmmu_o
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
@@ -1229,6 +1233,8 @@ IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "r
 		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
 		 ipmmu_vmsa_iommu_of_setup);
+IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
+		 ipmmu_vmsa_iommu_of_setup);
 #endif
 
 MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
