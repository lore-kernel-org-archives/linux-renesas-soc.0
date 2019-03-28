Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEADC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 09:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37B152173C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 09:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfC1JYA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 05:24:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33222 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726416AbfC1JYA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 05:24:00 -0400
X-IronPort-AV: E=Sophos;i="5.60,280,1549897200"; 
   d="scan'208";a="11595089"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2019 18:23:57 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CE54740138F4;
        Thu, 28 Mar 2019 18:23:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] mmc: core: retry CMD1 in mmc_send_op_cond() even if the ocr = 0
Date:   Thu, 28 Mar 2019 18:20:07 +0900
Message-Id: <1553764807-5778-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to eMMC specification, we should issue CMD1 repeatidly in
the idle state until the eMMC is ready even if the mmc_attach_mmc()
calls this function with ocr = 0. Otherwise some eMMC devices seems
to enter the inactive mode after mmc_init_card() issued CMD0 when
the eMMC device is busy.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
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

 drivers/mmc/core/mmc_ops.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index c5208fb..d068eed 100644
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
@@ -200,6 +196,17 @@ int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
 		err = -ETIMEDOUT;
 
 		mmc_delay(10);
+
+		/*
+		 * According to eMMC specification, we should issue CMD1
+		 * repeatidly in the idle state until the eMMC is ready even if
+		 * the mmc_attach_mmc() calls this function with ocr = 0.
+		 * Otherwise some eMMC devices seem to enter the inactive mode
+		 * after mmc_init_card() issued CMD0 when the eMMC device is
+		 * busy.
+		 */
+		if (!ocr && !mmc_host_is_spi(host))
+			cmd.arg = cmd.resp[0] | BIT(30);
 	}
 
 	if (rocr && !mmc_host_is_spi(host))
-- 
2.7.4

