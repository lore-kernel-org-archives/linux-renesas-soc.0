Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CD5C19F38
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29FB361058
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhIAK2R (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 06:28:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:19304 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234640AbhIAK2R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 06:28:17 -0400
X-IronPort-AV: E=Sophos;i="5.84,368,1620658800"; 
   d="scan'208";a="92650963"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2021 19:27:19 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3088B4000914;
        Wed,  1 Sep 2021 19:27:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Date:   Wed,  1 Sep 2021 19:27:05 +0900
Message-Id: <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
of this SoC differs than others. So, add a new ipmmu_features for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d38ff29a76e8..c46951367f93 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -36,7 +36,7 @@
 #define IPMMU_CTX_MAX		8U
 #define IPMMU_CTX_INVALID	-1
 
-#define IPMMU_UTLB_MAX		48U
+#define IPMMU_UTLB_MAX		64U
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
@@ -922,6 +922,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
 	.utlb_offset_base = 0,
 };
 
+static const struct ipmmu_features ipmmu_features_r8a779a0 = {
+	.use_ns_alias_offset = false,
+	.has_cache_leaf_nodes = true,
+	.number_of_contexts = 8,
+	.num_utlbs = 64,
+	.setup_imbuscr = false,
+	.twobit_imttbcr_sl0 = true,
+	.reserved_context = true,
+	.cache_snoop = false,
+	.ctx_offset_base = 0x10000,
+	.ctx_offset_stride = 0x1040,
+	.utlb_offset_base = 0x3000,
+};
+
 static const struct of_device_id ipmmu_of_ids[] = {
 	{
 		.compatible = "renesas,ipmmu-vmsa",
@@ -959,6 +973,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
 	}, {
 		.compatible = "renesas,ipmmu-r8a77995",
 		.data = &ipmmu_features_rcar_gen3,
+	}, {
+		.compatible = "renesas,ipmmu-r8a779a0",
+		.data = &ipmmu_features_r8a779a0,
 	}, {
 		/* Terminator */
 	},
-- 
2.25.1

