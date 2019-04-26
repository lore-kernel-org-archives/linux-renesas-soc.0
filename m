Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CFAC4321B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49FA22084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfDZFXN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 01:23:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24967 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728605AbfDZFXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 01:23:13 -0400
X-IronPort-AV: E=Sophos;i="5.60,396,1549897200"; 
   d="scan'208";a="14174584"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2019 14:23:09 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8718841AF7FC;
        Fri, 26 Apr 2019 14:23:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on IOMMU
Date:   Fri, 26 Apr 2019 14:18:49 +0900
Message-Id: <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a condition to avoid memory size limitaion of
swiotlb if the driver runs on IOMMU.

Tested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 6019628..0474337 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1203,9 +1203,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	 * Since swiotlb has memory size limitation, this will calculate
 	 * the maximum size locally (because we don't have any APIs for it now)
 	 * and check the current max_req_size. And then, this will update
-	 * the max_req_size if needed as a workaround.
+	 * the max_req_size if needed as a workaround. However, if the driver
+	 * runs on IOMMU, this workaround doesn't need.
 	 */
-	if (swiotlb_max_segment()) {
+	if (swiotlb_max_segment() && !pdev->dev.iommu_group) {
 		unsigned int max_size = (1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
 
 		if (mmc->max_req_size > max_size)
-- 
2.7.4

