Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38989 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751338AbeBRPVI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Feb 2018 10:21:08 -0500
Received: by mail-lf0-f66.google.com with SMTP id h78so9900829lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2018 07:21:08 -0800 (PST)
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] sh_eth: simplify sh_eth_check_reset()
Message-ID: <0531592f-d845-d6b6-dbd4-bf01515b308c@cogentembedded.com>
Date: Sun, 18 Feb 2018 18:21:05 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The *while* loop in this function  can be turned into a normal *for* loop.
And getting rid  of the  single return point saves us a few more LoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net-next.git' repo.

 drivers/net/ethernet/renesas/sh_eth.c |   16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -962,20 +962,16 @@ static void sh_eth_set_default_cpu_data(
 
 static int sh_eth_check_reset(struct net_device *ndev)
 {
-	int ret = 0;
-	int cnt = 100;
+	int cnt;
 
-	while (cnt > 0) {
+	for (cnt = 100; cnt > 0; cnt--) {
 		if (!(sh_eth_read(ndev, EDMR) & EDMR_SRST_GETHER))
-			break;
+			return 0;
 		mdelay(1);
-		cnt--;
 	}
-	if (cnt <= 0) {
-		netdev_err(ndev, "Device reset failed\n");
-		ret = -ETIMEDOUT;
-	}
-	return ret;
+
+	netdev_err(ndev, "Device reset failed\n");
+	return -ETIMEDOUT;
 }
 
 static int sh_eth_reset(struct net_device *ndev)
