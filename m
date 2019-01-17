Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6E7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 02:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D322C205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 02:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfAQCoc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 21:44:32 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:2972 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725385AbfAQCoc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 21:44:32 -0500
X-IronPort-AV: E=Sophos;i="5.56,488,1539615600"; 
   d="scan'208";a="5392081"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jan 2019 11:44:29 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8DD74403931F;
        Thu, 17 Jan 2019 11:44:29 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vinod.koul@intel.com
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks explicit
Date:   Thu, 17 Jan 2019 11:41:36 +0900
Message-Id: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phuong Nguyen <phuong.nguyen.xw@renesas.com>

This commit fixes the issue that USB-DMAC hangs silently after system
resumes on R-Car Gen3 hence renesas_usbhs will not work correctly
when using USB-DMAC for bulk transfer e.g. ethernet or serial
gadgets.

The issue can be reproduced by these steps:
 1. modprobe g_serial
 2. Suspend and resume system.
 3. connect a usb cable to host side
 4. Transfer data from Host to Target
 5. cat /dev/ttyGS0 (Target side)
 6. echo "test" > /dev/ttyACM0 (Host side)

The 'cat' will not result anything. However, system still can work
normally.

Currently, USB-DMAC driver does not have system sleep callbacks hence
this driver relies on the PM core to force runtime suspend/resume to
suspend and reinitialize USB-DMAC during system resume. After
the commit 17218e0092f8 ("PM / genpd: Stop/start devices without
pm_runtime_force_suspend/resume()"), PM core will not force
runtime suspend/resume anymore so this issue happens.

To solve this, make system suspend resume explicit by using
pm_runtime_force_{suspend,resume}() as the system sleep callbacks.
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()is used to make sure USB-DMAC suspended
after and initialized before renesas_usbhs."

Signed-off-by: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Cc: <stable@vger.kernel.org> # v4.16+
[shimoda: revise the commit log and add Cc tag]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/dma/sh/usb-dmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 7f7184c..59403f6 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -694,6 +694,8 @@ static int usb_dmac_runtime_resume(struct device *dev)
 #endif /* CONFIG_PM */
 
 static const struct dev_pm_ops usb_dmac_pm = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(usb_dmac_runtime_suspend, usb_dmac_runtime_resume,
 			   NULL)
 };
-- 
1.9.1

