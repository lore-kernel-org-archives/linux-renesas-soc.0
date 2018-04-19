Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45608 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753542AbeDSOHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 10:07:15 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 56/61] usb: phy: simplify getting .drvdata
Date: Thu, 19 Apr 2018 16:06:26 +0200
Message-Id: <20180419140641.27926-57-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/usb/phy/phy-am335x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-am335x.c b/drivers/usb/phy/phy-am335x.c
index b36fa8b953d0..27bdb7222527 100644
--- a/drivers/usb/phy/phy-am335x.c
+++ b/drivers/usb/phy/phy-am335x.c
@@ -96,8 +96,7 @@ static int am335x_phy_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int am335x_phy_suspend(struct device *dev)
 {
-	struct platform_device	*pdev = to_platform_device(dev);
-	struct am335x_phy *am_phy = platform_get_drvdata(pdev);
+	struct am335x_phy *am_phy = dev_get_drvdata(dev);
 
 	/*
 	 * Enable phy wakeup only if dev->power.can_wakeup is true.
@@ -117,8 +116,7 @@ static int am335x_phy_suspend(struct device *dev)
 
 static int am335x_phy_resume(struct device *dev)
 {
-	struct platform_device	*pdev = to_platform_device(dev);
-	struct am335x_phy	*am_phy = platform_get_drvdata(pdev);
+	struct am335x_phy	*am_phy = dev_get_drvdata(dev);
 
 	phy_ctrl_power(am_phy->phy_ctrl, am_phy->id, am_phy->dr_mode, true);
 
-- 
2.11.0
