Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41972 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbcEaK5d (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:33 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 12/31] staging: ks7010: fix printk format warnings
Date: Tue, 31 May 2016 12:56:24 +0200
Message-Id: <1464692203-4180-13-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Use proper type for size_t.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_config.c | 2 +-
 drivers/staging/ks7010/ks7010_sdio.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 06ff8852e17f33..4b00d25cd8f575 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -257,7 +257,7 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	if (request_firmware_direct(&fw_entry, cfg_file, dev))
 		return 0;
 
-	DPRINTK(4, "success request_firmware() file=%s size=%d\n", cfg_file, fw_entry->size);
+	DPRINTK(4, "success request_firmware() file=%s size=%zu\n", cfg_file, fw_entry->size);
 	cur_p = fw_entry->data;
 	end_p = cur_p + fw_entry->size;
 	*end_p = '\0';
diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 3fb432c9dd314d..50364909449aec 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -750,7 +750,7 @@ static int ks79xx_upload_firmware(ks_wlan_private *priv, struct ks_sdio_card *ca
 		DPRINTK(1,"error request_firmware() file=%s\n", priv->reg.rom_file);
 		return 1;
 	}
-	DPRINTK(4,"success request_firmware() file=%s size=%d\n", priv->reg.rom_file, fw_entry->size);
+	DPRINTK(4,"success request_firmware() file=%s size=%zu\n", priv->reg.rom_file, fw_entry->size);
 	length = fw_entry->size;
 
 	/* Load Program */
-- 
2.8.1
