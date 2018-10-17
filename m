Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44961 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbeJQRIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:08:20 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] iommu/ipmmu-vmsa: Hook up r8a77990 DT matching code
Date: Wed, 17 Oct 2018 11:13:22 +0200
Message-Id: <20181017091322.15177-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hai Nguyen Pham <hai.pham.ud@renesas.com>

Support the R-Car E3 (r8a77990) IPMMU.

Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
[simon: rebased; dropped no longer required IOMMU_OF_DECLARE hunk]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2 [Simon Horman]
* Update changelog
---
 drivers/iommu/ipmmu-vmsa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index b98a03189580..e0adf5d6c13c 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -762,6 +762,7 @@ static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a7796", },
 	{ .soc_id = "r8a77965", },
 	{ .soc_id = "r8a77970", },
+	{ .soc_id = "r8a77990", },
 	{ .soc_id = "r8a77995", },
 	{ /* sentinel */ }
 };
@@ -950,6 +951,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 		.compatible = "renesas,ipmmu-r8a77970",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
+		.compatible = "renesas,ipmmu-r8a77990",
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
 		.compatible = "renesas,ipmmu-r8a77995",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
-- 
2.11.0
