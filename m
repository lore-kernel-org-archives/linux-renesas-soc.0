Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41961 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbcEaK52 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:28 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 07/31] staging: ks7010: use long preamble as default
Date: Tue, 31 May 2016 12:56:19 +0200
Message-Id: <1464692203-4180-8-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

I had a problem connecting to a network with a short preamble, so let's
make the safer option the default.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks7010_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 7d33070b3428e7..abe99a52ae1ad8 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -193,7 +193,7 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 		{8,"WepIndex","1"},				/* 13 */
 		{7,"WepType","STRING"},				/* 14 */
 		{3,"Wep","OFF"},				/* 15 */
-		{13,"PREAMBLE_TYPE","SHORT"},			/* 16 */
+		{13,"PREAMBLE_TYPE","LONG"},			/* 16 */
 		{8,"ScanType","ACTIVE_SCAN"},			/* 17 */
 		{8,"ROM_FILE", ROM_FILE},			/* 18 */
 		{7,"PhyType", "BG_MODE"},			/* 19 */
@@ -216,7 +216,7 @@ int ks_wlan_read_config_file(ks_wlan_private *priv)
 	priv->reg.ssid.body[0] = '\0';		        /* SSID */
 	priv->reg.ssid.size = 0;		        /* SSID size */
 	priv->reg.tx_rate = TX_RATE_AUTO;		/* TxRate Fully Auto */
-	priv->reg.preamble = SHORT_PREAMBLE;		/* Preamble = SHORT */
+	priv->reg.preamble = LONG_PREAMBLE;		/* Preamble = LONG */
 	priv->reg.powermgt = POWMGT_ACTIVE_MODE;        /* POWMGT_ACTIVE_MODE */
 	priv->reg.scan_type = ACTIVE_SCAN;              /* Active */
 	priv->reg.beacon_lost_count = 20;	        /* Beacon Lost Count */
-- 
2.8.1
