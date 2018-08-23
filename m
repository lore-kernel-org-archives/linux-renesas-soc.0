Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:8867 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726274AbeHWTDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 15:03:31 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        iommu@lists.linux-foundation.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
Date: Thu, 23 Aug 2018 16:33:04 +0100
Message-Id: <1535038384-27080-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <CAMuHMdUe=p42Bp6xgmvrNwPKs=VHUP2BezDBPPn9KgPawvOtgA@mail.gmail.com>
References: <CAMuHMdUe=p42Bp6xgmvrNwPKs=VHUP2BezDBPPn9KgPawvOtgA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for RZ/G2M (R8A774A1) SoC IPMMUs.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
v1-v2:
* taken out IOMMU_OF_DECLARE

 drivers/iommu/ipmmu-vmsa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 51af2c5..331562f 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -761,6 +761,7 @@ static bool ipmmu_slave_whitelist(struct device *dev)
 }
 
 static const struct soc_device_attribute soc_rcar_gen3[] = {
+	{ .soc_id = "r8a774a1", },
 	{ .soc_id = "r8a7795", },
 	{ .soc_id = "r8a7796", },
 	{ .soc_id = "r8a77965", },
@@ -942,6 +943,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 		.compatible = "renesas,ipmmu-vmsa",
 		.data = &ipmmu_features_default,
 	}, {
+		.compatible = "renesas,ipmmu-r8a774a1",
+		.data = &ipmmu_features_rcar_gen3,
+	}, {
 		.compatible = "renesas,ipmmu-r8a7795",
 		.data = &ipmmu_features_rcar_gen3,
 	}, {
-- 
2.7.4
