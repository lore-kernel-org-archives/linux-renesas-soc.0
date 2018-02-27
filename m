Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:45261 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752176AbeB0L6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 06:58:19 -0500
Received: by mail-lf0-f67.google.com with SMTP id x196so27080718lfd.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 03:58:19 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH net-next] sh_eth: uninline TSU register accessors
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <ed6bd038-fc53-b6ce-b987-a752f2be8335@cogentembedded.com>
Date: Tue, 27 Feb 2018 14:58:16 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We have uninlined the sh_eth_{read|write}() functions introduced in the
commit 4a55530f38e ("net: sh_eth: modify the definitions of register").
Now remove *inline* from sh_eth_tsu_{read|write}() as  well and move
these functions from the header to the driver itself. This saves 684
more bytes of object code (ARM gcc 4.8.5)...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   11 +++++++++++
 drivers/net/ethernet/renesas/sh_eth.h |   11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -439,6 +439,17 @@ static void sh_eth_modify(struct net_dev
 		     enum_index);
 }
 
+static void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
+			     int enum_index)
+{
+	iowrite32(data, mdp->tsu_addr + mdp->reg_offset[enum_index]);
+}
+
+static u32 sh_eth_tsu_read(struct sh_eth_private *mdp, int enum_index)
+{
+	return ioread32(mdp->tsu_addr + mdp->reg_offset[enum_index]);
+}
+
 static bool sh_eth_is_gether(struct sh_eth_private *mdp)
 {
 	return mdp->reg_offset == sh_eth_offset_gigabit;
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -568,15 +568,4 @@ static inline void *sh_eth_tsu_get_offse
 	return mdp->tsu_addr + mdp->reg_offset[enum_index];
 }
 
-static inline void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
-				    int enum_index)
-{
-	iowrite32(data, mdp->tsu_addr + mdp->reg_offset[enum_index]);
-}
-
-static inline u32 sh_eth_tsu_read(struct sh_eth_private *mdp, int enum_index)
-{
-	return ioread32(mdp->tsu_addr + mdp->reg_offset[enum_index]);
-}
-
 #endif	/* #ifndef __SH_ETH_H__ */
