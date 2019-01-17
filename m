Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FB5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 07:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E879B20657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 07:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbfAQH1K (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 02:27:10 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:55800 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727180AbfAQH1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 02:27:10 -0500
X-IronPort-AV: E=Sophos;i="5.56,488,1539615600"; 
   d="scan'208";a="5221025"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2019 16:27:09 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 344384034302;
        Thu, 17 Jan 2019 16:27:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: replace udelay() with usleep_range()
Date:   Thu, 17 Jan 2019 16:24:15 +0900
Message-Id: <1547709855-32749-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Documentation/timers/timers-howto.txt, a driver should
use usleep_range() instead of udelay() on NON-ATOMIC CONTEXT if
"SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms)".

Since the .hardware_init() and .power_ctrl() will run on NON-ATOMIC
CONTEXT, this patch replaces udelay() with usleep_range().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/rcar3.c | 2 +-
 drivers/usb/renesas_usbhs/rza.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index aa38204..5e730e9 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -59,7 +59,7 @@ static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 	if (enable) {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
 		/* The controller on R-Car Gen3 needs to wait up to 45 usec */
-		udelay(45);
+		usleep_range(45, 90);
 	} else {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, 0);
 	}
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
index 5b28725..8c739bd 100644
--- a/drivers/usb/renesas_usbhs/rza.c
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -35,7 +35,7 @@ static int usbhs_rza1_hardware_init(struct platform_device *pdev)
 
 	/* Enable USB PLL (NOTE: ch0 controls both ch0 and ch1) */
 	usbhs_bset(priv, SYSCFG, UPLLE, UPLLE);
-	udelay(1000);
+	usleep_range(1000, 2000);
 	usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
 
 	return 0;
-- 
1.9.1

