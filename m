Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44286 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750948AbeEBTyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 15:54:51 -0400
Received: by mail-lf0-f68.google.com with SMTP id h197-v6so22593098lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 12:54:50 -0700 (PDT)
Subject: [PATCH 1/2] sh_eth: use TSU register accessors for TSU_POST<n>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Message-ID: <297c4665-de06-ddf2-5c97-4d56c781b299@cogentembedded.com>
Date: Wed, 2 May 2018 22:54:48 +0300
MIME-Version: 1.0
In-Reply-To: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There's no particularly good reason TSU_POST<n> registers get accessed
circumventing sh_eth_tsu_{read|write}() -- start using those, removing
(badly named) sh_eth_tsu_get_post_reg_offset(),  while at it...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -2610,12 +2610,6 @@ static int sh_eth_change_mtu(struct net_
 }
 
 /* For TSU_POSTn. Please refer to the manual about this (strange) bitfields */
-static void *sh_eth_tsu_get_post_reg_offset(struct sh_eth_private *mdp,
-					    int entry)
-{
-	return sh_eth_tsu_get_offset(mdp, TSU_POST1) + (entry / 8 * 4);
-}
-
 static u32 sh_eth_tsu_get_post_mask(int entry)
 {
 	return 0x0f << (28 - ((entry % 8) * 4));
@@ -2630,27 +2624,25 @@ static void sh_eth_tsu_enable_cam_entry_
 					     int entry)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
+	int reg = TSU_POST1 + entry / 8;
 	u32 tmp;
-	void *reg_offset;
 
-	reg_offset = sh_eth_tsu_get_post_reg_offset(mdp, entry);
-	tmp = ioread32(reg_offset);
-	iowrite32(tmp | sh_eth_tsu_get_post_bit(mdp, entry), reg_offset);
+	tmp = sh_eth_tsu_read(mdp, reg);
+	sh_eth_tsu_write(mdp, tmp | sh_eth_tsu_get_post_bit(mdp, entry), reg);
 }
 
 static bool sh_eth_tsu_disable_cam_entry_post(struct net_device *ndev,
 					      int entry)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
+	int reg = TSU_POST1 + entry / 8;
 	u32 post_mask, ref_mask, tmp;
-	void *reg_offset;
 
-	reg_offset = sh_eth_tsu_get_post_reg_offset(mdp, entry);
 	post_mask = sh_eth_tsu_get_post_mask(entry);
 	ref_mask = sh_eth_tsu_get_post_bit(mdp, entry) & ~post_mask;
 
-	tmp = ioread32(reg_offset);
-	iowrite32(tmp & ~post_mask, reg_offset);
+	tmp = sh_eth_tsu_read(mdp, reg);
+	sh_eth_tsu_write(mdp, tmp & ~post_mask, reg);
 
 	/* If other port enables, the function returns "true" */
 	return tmp & ref_mask;
