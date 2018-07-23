Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37544 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387907AbeGWTNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:13:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id j8-v6so1138136lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:11:21 -0700 (PDT)
Subject: [PATCH 2/5] sh_eth: make sh_eth_tsu_get_offset() match its name
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Message-ID: <ccec4eaa-89e8-76be-e5c2-874fcde0b223@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:11:19 +0300
MIME-Version: 1.0
In-Reply-To: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

sh_eth_tsu_get_offset(), despite its name, returns a TSU register's address,
not its offset.  Make this  function match its name and return a register's
offset  from the TSU  registers base address instead.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -439,9 +439,9 @@ static void sh_eth_modify(struct net_dev
 		     enum_index);
 }
 
-static void *sh_eth_tsu_get_offset(struct sh_eth_private *mdp, int enum_index)
+static u16 sh_eth_tsu_get_offset(struct sh_eth_private *mdp, int enum_index)
 {
-	return mdp->tsu_addr + mdp->reg_offset[enum_index];
+	return mdp->reg_offset[enum_index];
 }
 
 static void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
@@ -2712,12 +2712,12 @@ static void sh_eth_tsu_read_entry(void *
 static int sh_eth_tsu_find_entry(struct net_device *ndev, const u8 *addr)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
-	void *reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
+	u16 reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
 	int i;
 	u8 c_addr[ETH_ALEN];
 
 	for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES; i++, reg_offset += 8) {
-		sh_eth_tsu_read_entry(reg_offset, c_addr);
+		sh_eth_tsu_read_entry(mdp->tsu_addr + reg_offset, c_addr);
 		if (ether_addr_equal(addr, c_addr))
 			return i;
 	}
@@ -2739,7 +2739,7 @@ static int sh_eth_tsu_disable_cam_entry_
 					      int entry)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
-	void *reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
+	u16 reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
 	int ret;
 	u8 blank[ETH_ALEN];
 
@@ -2747,7 +2747,9 @@ static int sh_eth_tsu_disable_cam_entry_
 			 ~(1 << (31 - entry)), TSU_TEN);
 
 	memset(blank, 0, sizeof(blank));
-	ret = sh_eth_tsu_write_entry(ndev, reg_offset + entry * 8, blank);
+	ret = sh_eth_tsu_write_entry(ndev,
+				     mdp->tsu_addr + reg_offset + entry * 8,
+				     blank);
 	if (ret < 0)
 		return ret;
 	return 0;
@@ -2756,7 +2758,7 @@ static int sh_eth_tsu_disable_cam_entry_
 static int sh_eth_tsu_add_entry(struct net_device *ndev, const u8 *addr)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
-	void *reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
+	u16 reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
 	int i, ret;
 
 	if (!mdp->cd->tsu)
@@ -2768,7 +2770,9 @@ static int sh_eth_tsu_add_entry(struct n
 		i = sh_eth_tsu_find_empty(ndev);
 		if (i < 0)
 			return -ENOMEM;
-		ret = sh_eth_tsu_write_entry(ndev, reg_offset + i * 8, addr);
+		ret = sh_eth_tsu_write_entry(ndev,
+					     mdp->tsu_addr + reg_offset + i * 8,
+					     addr);
 		if (ret < 0)
 			return ret;
 
@@ -2830,15 +2834,15 @@ static int sh_eth_tsu_purge_all(struct n
 static void sh_eth_tsu_purge_mcast(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
+	u16 reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
 	u8 addr[ETH_ALEN];
-	void *reg_offset = sh_eth_tsu_get_offset(mdp, TSU_ADRH0);
 	int i;
 
 	if (!mdp->cd->tsu)
 		return;
 
 	for (i = 0; i < SH_ETH_TSU_CAM_ENTRIES; i++, reg_offset += 8) {
-		sh_eth_tsu_read_entry(reg_offset, addr);
+		sh_eth_tsu_read_entry(mdp->tsu_addr + reg_offset, addr);
 		if (is_multicast_ether_addr(addr))
 			sh_eth_tsu_del_entry(ndev, addr);
 	}
