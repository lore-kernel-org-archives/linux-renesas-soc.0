Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46240 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388279AbeGWTRH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:17:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id 203-v6so1319422ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:14:41 -0700 (PDT)
Subject: [PATCH 4/5] sh_eth: make sh_eth_tsu_write_entry() take 'offset'
 parameter
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Message-ID: <1b60d8c8-e06f-6bff-df06-9b1cbe953340@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:14:38 +0300
MIME-Version: 1.0
In-Reply-To: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We can add the TSU register base address to a TSU register offset right
in sh_eth_tsu_write_entry(),  no need to do it in its callers...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2676,18 +2676,19 @@ static int sh_eth_tsu_busy(struct net_de
 	return 0;
 }
 
-static int sh_eth_tsu_write_entry(struct net_device *ndev, void *reg,
+static int sh_eth_tsu_write_entry(struct net_device *ndev, u16 offset,
 				  const u8 *addr)
 {
+	struct sh_eth_private *mdp = netdev_priv(ndev);
 	u32 val;
 
 	val = addr[0] << 24 | addr[1] << 16 | addr[2] << 8 | addr[3];
-	iowrite32(val, reg);
+	iowrite32(val, mdp->tsu_addr + offset);
 	if (sh_eth_tsu_busy(ndev) < 0)
 		return -EBUSY;
 
 	val = addr[4] << 8 | addr[5];
-	iowrite32(val, reg + 4);
+	iowrite32(val, mdp->tsu_addr + offset + 4);
 	if (sh_eth_tsu_busy(ndev) < 0)
 		return -EBUSY;
 
@@ -2747,9 +2748,7 @@ static int sh_eth_tsu_disable_cam_entry_
 			 ~(1 << (31 - entry)), TSU_TEN);
 
 	memset(blank, 0, sizeof(blank));
-	ret = sh_eth_tsu_write_entry(ndev,
-				     mdp->tsu_addr + reg_offset + entry * 8,
-				     blank);
+	ret = sh_eth_tsu_write_entry(ndev, reg_offset + entry * 8, blank);
 	if (ret < 0)
 		return ret;
 	return 0;
@@ -2770,9 +2769,7 @@ static int sh_eth_tsu_add_entry(struct n
 		i = sh_eth_tsu_find_empty(ndev);
 		if (i < 0)
 			return -ENOMEM;
-		ret = sh_eth_tsu_write_entry(ndev,
-					     mdp->tsu_addr + reg_offset + i * 8,
-					     addr);
+		ret = sh_eth_tsu_write_entry(ndev, reg_offset + i * 8, addr);
 		if (ret < 0)
 			return ret;
 
