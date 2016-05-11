Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:36957 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751769AbcEKMzJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:55:09 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] staging: ks7010: adapt to new trans_start handling
Date: Wed, 11 May 2016 14:54:58 +0200
Message-Id: <1462971298-4042-1-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

trans_start is gone from netdevice, so use the new helper function to
set the mark.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This fixup is needed to build with linux/next because it contains a patch
dropping trans_start. But the new helper is not there in current linux master.

 drivers/staging/ks7010/ks_wlan_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 3e282833372305..ac3354bf6f8c8a 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -3398,7 +3398,7 @@ int ks_wlan_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		netif_stop_queue(dev);
 
 	rc = hostif_data_request(priv, skb);
-	dev->trans_start = jiffies;
+	netif_trans_update(dev);
 
 	DPRINTK(4, "rc=%d\n", rc);
 	if (rc) {
-- 
2.8.1
