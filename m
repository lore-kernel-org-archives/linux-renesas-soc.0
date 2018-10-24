Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24935 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbeJXWT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Oct 2018 18:19:58 -0400
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-pm@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: Remove dummy runtime PM callbacks
Date: Wed, 24 Oct 2018 16:51:34 +0300
Message-Id: <20181024135134.28456-4-jarkko.nikula@linux.intel.com>
In-Reply-To: <20181024135134.28456-1-jarkko.nikula@linux.intel.com>
References: <20181024135134.28456-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Platform drivers don't need dummy runtime PM callbacks that just return
success in order to have runtime PM happening. This has changed since
following commits:

05aa55dddb9e ("PM / Runtime: Lenient generic runtime pm callbacks")
543f2503a956 ("PM / platform_bus: Allow runtime PM by default")
8b313a38ecff ("PM / Platform: Use generic runtime PM callbacks directly")

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Only build tested.
---
 drivers/usb/renesas_usbhs/common.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index a3e1290d682d..0e760f228dd8 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -874,23 +874,9 @@ static int usbhsc_resume(struct device *dev)
 	return 0;
 }
 
-static int usbhsc_runtime_nop(struct device *dev)
-{
-	/* Runtime PM callback shared between ->runtime_suspend()
-	 * and ->runtime_resume(). Simply returns success.
-	 *
-	 * This driver re-initializes all registers after
-	 * pm_runtime_get_sync() anyway so there is no need
-	 * to save and restore registers here.
-	 */
-	return 0;
-}
-
 static const struct dev_pm_ops usbhsc_pm_ops = {
 	.suspend		= usbhsc_suspend,
 	.resume			= usbhsc_resume,
-	.runtime_suspend	= usbhsc_runtime_nop,
-	.runtime_resume		= usbhsc_runtime_nop,
 };
 
 static struct platform_driver renesas_usbhs_driver = {
-- 
2.19.1
