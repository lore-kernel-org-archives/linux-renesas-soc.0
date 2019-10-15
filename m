Return-Path: <SRS0=Zc5b=YI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C088EECE599
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 11:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1AE721925
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 11:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731669AbfJOLME (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Oct 2019 07:12:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:62224 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731691AbfJOLME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 07:12:04 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="29145957"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 847F14208692;
        Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/6] iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
Date:   Tue, 15 Oct 2019 20:11:57 +0900
Message-Id: <1571137920-15314-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since we will have changed memory mapping of the IPMMU in the future,
This patch adds helper functions ipmmu_ctx_{reg,read,write}()
for MMU "context" registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 35aae24..c60b31d 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -190,29 +190,43 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
 	iowrite32(data, mmu->base + offset);
 }
 
+static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
+				  unsigned int context_id, unsigned int reg)
+{
+	return context_id * IM_CTX_SIZE + reg;
+}
+
+static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
+			  unsigned int context_id, unsigned int reg)
+{
+	return ipmmu_read(mmu, ipmmu_ctx_reg(mmu, context_id, reg));
+}
+
+static void ipmmu_ctx_write(struct ipmmu_vmsa_device *mmu,
+			    unsigned int context_id, unsigned int reg, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_ctx_reg(mmu, context_id, reg), data);
+}
+
 static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
 			       unsigned int reg)
 {
-	return ipmmu_read(domain->mmu->root,
-			  domain->context_id * IM_CTX_SIZE + reg);
+	return ipmmu_ctx_read(domain->mmu->root, domain->context_id, reg);
 }
 
 static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
 				 unsigned int reg, u32 data)
 {
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
 static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 				unsigned int reg, u32 data)
 {
 	if (domain->mmu != domain->mmu->root)
-		ipmmu_write(domain->mmu,
-			    domain->context_id * IM_CTX_SIZE + reg, data);
+		ipmmu_ctx_write(domain->mmu, domain->context_id, reg, data);
 
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
 /* -----------------------------------------------------------------------------
@@ -911,7 +925,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 
 	/* Disable all contexts. */
 	for (i = 0; i < mmu->num_ctx; ++i)
-		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
+		ipmmu_ctx_write(mmu, i, IMCTR, 0);
 }
 
 static const struct ipmmu_features ipmmu_features_default = {
-- 
2.7.4

