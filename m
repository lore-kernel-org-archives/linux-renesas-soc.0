Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42008 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752252AbcEaK6A (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:58:00 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 29/31] staging: ks7010: simplify module_init/exit
Date: Tue, 31 May 2016 12:56:41 +0200
Message-Id: <1464692203-4180-30-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The printouts are not needed, the driver core has enough debug output
for this if wanted. So, use a helper to save boilerplate code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 8c0d1bb58dcd9c..a8a14f928d421b 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1237,30 +1237,7 @@ static void ks7910_sdio_remove(struct sdio_func *func)
 	return;
 }
 
-static int __init ks7010_sdio_init(void)
-{
-	int status;
-
-	/* register with bus driver core */
-	status = sdio_register_driver(&ks7010_sdio_driver);
-	if (status != 0) {
-		DPRINTK(1,
-			"ks79xx_sdio : failed to register with bus driver, %d\n",
-			status);
-	}
-	return status;
-}
-
-static void __exit ks7010_sdio_exit(void)
-{
-	DPRINTK(5, " \n");
-	sdio_unregister_driver(&ks7010_sdio_driver);
-	return;
-}
-
-module_init(ks7010_sdio_init);
-module_exit(ks7010_sdio_exit);
-
+module_driver(ks7010_sdio_driver, sdio_register_driver, sdio_unregister_driver);
 MODULE_AUTHOR("Sang Engineering, Qi-Hardware, KeyStream");
 MODULE_DESCRIPTION("Driver for KeyStream KS7010 based SDIO cards");
 MODULE_LICENSE("GPL v2");
-- 
2.8.1
