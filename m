Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44438 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388222AbeGWTSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:18:16 -0400
Received: by mail-lj1-f195.google.com with SMTP id q127-v6so1326866ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:15:49 -0700 (PDT)
Subject: [PATCH 5/5] sh_eth: make sh_eth_tsu_{read|write}_entry() prototypes
 symmetric
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Message-ID: <93618d2e-86b6-e467-b577-632a25cb2c4c@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:15:47 +0300
MIME-Version: 1.0
In-Reply-To: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

sh_eth_tsu_read_entry() is still asymmetric with sh_eth_tsu_write_entry()
WRT their prototypes -- make them symmetric by passing to the former a TSU
register offset instead of its address and also adding the (now necessary)
'ndev' parameter...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2695,16 +2695,17 @@ static int sh_eth_tsu_write_entry(struct
 	return 0;
 }
 
-static void sh_eth_tsu_read_entry(void *reg, u8 *addr)
+static void sh_eth_tsu_read_entry(struct net_device *ndev, u16 offset, u8 *addr)
 {
+	struct sh_eth_private *mdp = netdev_priv(ndev);
 	u32 val;
 
-	val = ioread32(reg);
+	val = ioread32(mdp->tsu_addr + offset);
 	addr[0] = (val >> 24) & 0xff;
 	addr[1] = (val >> 16) & 0xff;
 	addr[2] = (val >> 8) & 0xff;
 	addr[3] = val & 0xff;
-	val = ioread32(reg + 4);
+	val = ioread32(mdp->tsu_addr + offset + 4);
 	addr[4] = (val >> 8) & 0xff;
 	addr[5] = val & 0xff;
 }
@@ -2718,7 +2719,7 @@ static int sh_eth_tsu_find_entry(struct
 	u8 c_addr[ETH_ALEN];
 
 	for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES; i++, reg_offset += 8) {
-		sh_eth_tsu_read_entry(mdp->tsu_addr + reg_offset, c_addr);
+		sh_eth_tsu_read_entry(ndev, reg_offset, c_addr);
 		if (ether_addr_equal(addr, c_addr))
 			return i;
 	}
@@ -2839,7 +2840,7 @@ static void sh_eth_tsu_purge_mcast(struc
 		return;
 
 	for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES; i++, reg_offset += 8) {
-		sh_eth_tsu_read_entry(mdp->tsu_addr + reg_offset, addr);
+		sh_eth_tsu_read_entry(ndev, reg_offset, addr);
 		if (is_multicast_ether_addr(addr))
 			sh_eth_tsu_del_entry(ndev, addr);
 	}
