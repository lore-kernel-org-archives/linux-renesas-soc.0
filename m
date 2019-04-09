Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72588C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 400D4206C0
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfDILJK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:09:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29290 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726387AbfDILJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:09:09 -0400
X-IronPort-AV: E=Sophos;i="5.60,329,1549897200"; 
   d="scan'208";a="12738844"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2019 20:09:07 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A9E6740C2F8A;
        Tue,  9 Apr 2019 20:09:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] mmc: core: retry CMD1 in mmc_send_op_cond() even if the ocr = 0
Date:   Tue,  9 Apr 2019 20:05:06 +0900
Message-Id: <1554807906-9704-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to eMMC specification v5.1 section 6.4.3, we should issue
CMD1 repeatedly in the idle state until the eMMC is ready even if
the mmc_attach_mmc() calls this function with ocr = 0. Otherwise
some eMMC devices seems to enter the inactive mode after
mmc_init_card() issued CMD0 when the eMMC device is busy.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1 (https://patchwork.kernel.org/patch/10874619/):
 - Revise the comment on the source code.

 We can reproduce this issue if:
  - we add no-sd and no-sdio property into sdhi2 node of salvator-common.dtsi,
  - the renesas_sdhi driver is kernel module,
  - Using a Salvator-XS board that has Samsung eMMC device,
  - enter suspend and exit it,
  - and then insmod renesas_sdhi_{core,internal_dmac}.ko.

 After that, the following error happened and any partitions are not detected.
  mmc1: error -110 whilst initialising MMC card

 I tested this patch on:
  - M3-N Salvator-XS with a Samsung eMMC device,
  - M3-W Salvator-X with SiliconMotion eMMC device,
  - and M3-W Starter Kit with Micron eMMC device.

 drivers/mmc/core/mmc_ops.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index c5208fb..a533cab 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -184,11 +184,7 @@ int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
 		if (err)
 			break;
 
-		/* if we're just probing, do a single pass */
-		if (ocr == 0)
-			break;
-
-		/* otherwise wait until reset completes */
+		/* wait until reset completes */
 		if (mmc_host_is_spi(host)) {
 			if (!(cmd.resp[0] & R1_SPI_IDLE))
 				break;
@@ -200,6 +196,16 @@ int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
 		err = -ETIMEDOUT;
 
 		mmc_delay(10);
+
+		/*
+		 * According to eMMC specification v5.1 section 6.4.3, we
+		 * should issue CMD1 repeatedly in the idle state until
+		 * the eMMC is ready. Otherwise some eMMC devices seem to enter
+		 * the inactive mode after mmc_init_card() issued CMD0 when
+		 * the eMMC device is busy.
+		 */
+		if (!ocr && !mmc_host_is_spi(host))
+			cmd.arg = cmd.resp[0] | BIT(30);
 	}
 
 	if (rocr && !mmc_host_is_spi(host))
-- 
2.7.4

