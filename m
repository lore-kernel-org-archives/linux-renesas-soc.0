Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57070 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751656AbcEJNys (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:48 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/27] staging: ks7010: make loading config file optional
Date: Tue, 10 May 2016 15:52:24 +0200
Message-Id: <1462888360-21649-12-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We have sane defaults, so we don't need to bail out if there is no
config file. Note that the config file should go away completely in
favour of configuration mechanisms already upstream.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_config.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 7f273dafaf3583..06ff8852e17f33 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -203,7 +203,6 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 
 	const struct firmware *fw_entry;
 	struct device *dev = NULL;
-	int retval;
 	char cfg_file[]=CFG_FILE;
 	char *cur_p, *end_p;
 	char wk_buff[256], *wk_p;
@@ -254,10 +253,9 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	priv->reg.rate_set.size = 12;
 
 	dev = &priv->ks_wlan_hw.sdio_card->func->dev;
-	if((retval = request_firmware(&fw_entry, cfg_file, dev)) !=0 ){
-		DPRINTK(1, "error request_firmware() file=%s ret=%d\n", cfg_file, retval);
-		return 1;
-	}
+	/* If no cfg file, stay with the defaults */
+	if (request_firmware_direct(&fw_entry, cfg_file, dev))
+		return 0;
 
 	DPRINTK(4, "success request_firmware() file=%s size=%d\n", cfg_file, fw_entry->size);
 	cur_p = fw_entry->data;
-- 
2.8.1
