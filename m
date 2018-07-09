Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7198 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932437AbeGICyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Jul 2018 22:54:36 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Cc: magnus.damm@gmail.com, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] iommu/ipmmu-vmsa: IMUCTRn.TTSEL needs a special usage on R-Car Gen3
Date: Mon,  9 Jul 2018 11:53:31 +0900
Message-Id: <1531104811-23417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The TTSEL bit of IMUCTRn register of R-Car Gen3 needs to be set
unused MMU context number even if uTLBs are disabled
(The MMUEN bit of IMUCTRn register = 0).
Since initial values of IMUCTRn.TTSEL on all IPMMU-domains are 0,
this patch adds a new feature "reserved_context" to reserve IPMMU
context number 0 as the unused MMU context.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 6a0e714..6cbd2bd 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -47,6 +47,7 @@ struct ipmmu_features {
 	unsigned int number_of_contexts;
 	bool setup_imbuscr;
 	bool twobit_imttbcr_sl0;
+	bool reserved_context;
 };
 
 struct ipmmu_vmsa_device {
@@ -925,6 +926,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 	.number_of_contexts = 1, /* software only tested with one context */
 	.setup_imbuscr = true,
 	.twobit_imttbcr_sl0 = false,
+	.reserved_context = false,
 };
 
 static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
@@ -933,6 +935,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 	.number_of_contexts = 8,
 	.setup_imbuscr = false,
 	.twobit_imttbcr_sl0 = true,
+	.reserved_context = true,
 };
 
 static const struct of_device_id ipmmu_of_ids[] = {
@@ -1038,6 +1041,11 @@ static int ipmmu_probe(struct platform_device *pdev)
 		}
 
 		ipmmu_device_reset(mmu);
+
+		if (mmu->features->reserved_context) {
+			dev_info(&pdev->dev, "IPMMU context 0 is reserved\n");
+			set_bit(0, mmu->ctx);
+		}
 	}
 
 	/*
-- 
1.9.1
