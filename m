Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42012 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751708AbcEaK6B (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:58:01 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 30/31] staging: ks7010: drop counting sd errors
Date: Tue, 31 May 2016 12:56:42 +0200
Message-Id: <1464692203-4180-31-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

They were counted but never really used anywhere. Also change the printk
to a debug print, since it mostly shows on the expected -ENOMEDIUM on
card removal.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 20 ++++++--------------
 drivers/staging/ks7010/ks_wlan.h     |  2 --
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index a8a14f928d421b..c166022b652e3a 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -234,8 +234,8 @@ int ks_wlan_hw_power_save(struct ks_wlan_private *priv)
 static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
 			    unsigned char *buffer, int length)
 {
-	int rc = -1;
 	struct ks_sdio_card *card;
+	int rc;
 
 	card = priv->ks_wlan_hw.sdio_card;
 
@@ -244,12 +244,8 @@ static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
 	else	/* CMD53 multi-block transfer */
 		rc = sdio_memcpy_fromio(card->func, buffer, address, length);
 
-	if (rc != 0) {
-		printk("sdio error erorr=%d size=%d\n", rc, length);
-		++priv->sdio_error_count;
-	} else {
-		priv->sdio_error_count = 0;
-	}
+	if (rc != 0)
+		DPRINTK(1, "sdio error=%d size=%d\n", rc, length);
 
 	return rc;
 }
@@ -257,8 +253,8 @@ static int ks7010_sdio_read(struct ks_wlan_private *priv, unsigned int address,
 static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
 			     unsigned char *buffer, int length)
 {
-	int rc = -1;
 	struct ks_sdio_card *card;
+	int rc;
 
 	card = priv->ks_wlan_hw.sdio_card;
 
@@ -268,12 +264,8 @@ static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
 		rc = sdio_memcpy_toio(card->func, (unsigned int)address, buffer,
 				      length);
 
-	if (rc != 0) {
-		printk("sdio error erorr=%d size=%d\n", rc, length);
-		++priv->sdio_error_count;
-	} else {
-		priv->sdio_error_count = 0;
-	}
+	if (rc != 0)
+		DPRINTK(1, "sdio error=%d size=%d\n", rc, length);
 
 	return rc;
 }
diff --git a/drivers/staging/ks7010/ks_wlan.h b/drivers/staging/ks7010/ks_wlan.h
index f0f9f8ef7d6185..a2126c2e728d2d 100644
--- a/drivers/staging/ks7010/ks_wlan.h
+++ b/drivers/staging/ks7010/ks_wlan.h
@@ -500,9 +500,7 @@ struct ks_wlan_private {
 	unsigned long last_doze;
 	unsigned long last_wakeup;
 
-	uint sdio_error_count;	/* SDIO error */
 	uint wakeup_count;	/* for detect wakeup loop */
-
 };
 
 #endif /* _KS_WLAN_H */
-- 
2.8.1
