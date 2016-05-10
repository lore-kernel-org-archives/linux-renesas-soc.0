Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57065 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751766AbcEJNyr (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:47 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/27] staging: ks7010: really iterate over multicast addresses
Date: Tue, 10 May 2016 15:52:23 +0200
Message-Id: <1462888360-21649-11-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The loop variable was defined but not really used. Fix this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks_hostif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 367d487cef1ba8..b0a0a53d3a00bf 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -2105,7 +2105,7 @@ void hostif_sme_multicast_set(ks_wlan_private *priv)
 	struct netdev_hw_addr *ha;
 	char	set_address[NIC_MAX_MCAST_LIST*ETH_ALEN];
 	unsigned long filter_type;
-	int i;
+	int i = 0;
 
 	DPRINTK(3,"\n");
 
@@ -2128,6 +2128,7 @@ void hostif_sme_multicast_set(ks_wlan_private *priv)
 			mc_count = netdev_mc_count(dev);
 			netdev_for_each_mc_addr(ha, dev) {
 				memcpy(&set_address[i*ETH_ALEN], ha->addr, ETH_ALEN);
+				i++;
 			}
 			priv->sme_i.sme_flag &= ~SME_MULTICAST;
 			hostif_mib_set_request(priv, LOCAL_MULTICAST_ADDRESS,
-- 
2.8.1
