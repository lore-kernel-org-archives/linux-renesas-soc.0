Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57101 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751916AbcEJNzL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:55:11 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 27/27] staging: ks7010: fix module annotations
Date: Tue, 10 May 2016 15:52:40 +0200
Message-Id: <1462888360-21649-28-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

List all authors, beautify description, match license to what is stated
in file headers, add firmware information.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 8e8476b52cedbc..8c0d1bb58dcd9c 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1261,9 +1261,7 @@ static void __exit ks7010_sdio_exit(void)
 module_init(ks7010_sdio_init);
 module_exit(ks7010_sdio_exit);
 
-MODULE_AUTHOR("Qi-Hardware based on KeyStream driver");
-MODULE_DESCRIPTION("Driver for KeyStream, KS7010 based SDIO cards. ");
-#ifdef MODULE_LICENSE
-MODULE_LICENSE("GPL");
-#endif
-MODULE_SUPPORTED_DEVICE("KS7910");
+MODULE_AUTHOR("Sang Engineering, Qi-Hardware, KeyStream");
+MODULE_DESCRIPTION("Driver for KeyStream KS7010 based SDIO cards");
+MODULE_LICENSE("GPL v2");
+MODULE_FIRMWARE(ROM_FILE);
-- 
2.8.1
