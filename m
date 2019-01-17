Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062F0C43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 11:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8BFF20851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 11:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfAQLIK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:08:10 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15966 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728485AbfAQLIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 06:08:07 -0500
X-IronPort-AV: E=Sophos;i="5.56,488,1539615600"; 
   d="scan'208";a="5246348"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2019 20:08:03 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DC1B544A15FB;
        Thu, 17 Jan 2019 20:08:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3/RFT 2/2] net: phy: assert the phy reset during suspended if phy is not attached
Date:   Thu, 17 Jan 2019 20:05:09 +0900
Message-Id: <1547723109-28792-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1547723109-28792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This phy_device driver deasserts the reset signal in the following
functions (expect error path):
 - phy_device_register()
 - phy_probe()
 - phy_init_hw() that is called by phy_attach_direct()

And, the phy_device asserts the reset signal in the following
functions (expect error path):
 - phy_device_remove()
 - phy_remove()
 - phy_detach()

So, if the following conditions happen, the reset signal keeps to be
deasserted during suspended:
 - The phy driver is probed
 - But a net device doesn't open
 - And then the system enters suspend

So, this patch adds to assert the reset signal in phy_suspend() if
a phy is not attached. Otherwise, R-Car Gen3 Salvator-XS board could
not link up correctly if we do the following method:

 1) Kernel boots by using initramfs.
 2) Kernel enters the suspend.
 3) Kernel returns from suspend.
 4) ifconfig eth0 up
 --> Then, since edge signal of the reset doesn't happen,
     it cannot link up.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/phy/phy_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d86356f..09ab62a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1346,6 +1346,10 @@ int phy_suspend(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	/* Assert the reset signal if the phydev is not attached */
+	if (!phydev->attached_dev)
+		phy_device_reset(phydev, 1);
+
 	phydev->suspended = true;
 
 	return ret;
@@ -1359,6 +1363,10 @@ int __phy_resume(struct phy_device *phydev)
 
 	WARN_ON(!mutex_is_locked(&phydev->lock));
 
+	/* Deassert the reset signal if the phydev is not attached */
+	if (!phydev->attached_dev)
+		phy_device_reset(phydev, 0);
+
 	if (phydev->drv && phydrv->resume)
 		ret = phydrv->resume(phydev);
 
-- 
1.9.1

