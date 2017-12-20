Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:44815 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754337AbdLTMZH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 07:25:07 -0500
Received: by mail-pl0-f65.google.com with SMTP id n13so8895369plp.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Dec 2017 04:25:07 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 21:24:04 +0900
Message-Id: <151377264404.17613.15104906014272414275.sendpatchset@little-apple>
In-Reply-To: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
References: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
Subject: [PATCH/RFC 02/03] iommu/ipmmu-vmsa: Detect r8a77965 compat strings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Match on the r8a77965 SoC in the IPMMU driver. Software wise the same
IPMMU driver can be used as for other R-Car Gen3 SoCs, however the
hardware contains certain changes so using separate SoC compat strings
will allow us more fine grained control of features in the future.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-11-22 13:16:08.600607110 +0900
@@ -763,6 +763,7 @@ static bool ipmmu_slave_whitelist(struct
 static const struct soc_device_attribute soc_rcar_gen3[] = {
 	{ .soc_id = "r8a7795", },
 	{ .soc_id = "r8a7796", },
+	{ .soc_id = "r8a77965", },
 	{ .soc_id = "r8a77970", },
 	{ .soc_id = "r8a77995", },
 	{ /* sentinel */ }
@@ -945,6 +946,9 @@ static const struct of_device_id ipmmu_o
 		.compatible = "renesas,ipmmu-r8a7796",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
+		.compatible = "renesas,ipmmu-r8a77965",
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
 		.compatible = "renesas,ipmmu-r8a77970",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
@@ -1137,6 +1141,8 @@ IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of,
 		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
 		 ipmmu_vmsa_iommu_of_setup);
+IOMMU_OF_DECLARE(ipmmu_r8a77965_iommu_of, "renesas,ipmmu-r8a77965",
+		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a77970_iommu_of, "renesas,ipmmu-r8a77970",
 		 ipmmu_vmsa_iommu_of_setup);
 IOMMU_OF_DECLARE(ipmmu_r8a77995_iommu_of, "renesas,ipmmu-r8a77995",
