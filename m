Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41179 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388276AbeGWTMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:12:31 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17-v6so1321860ljy.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:10:06 -0700 (PDT)
Subject: [PATCH 1/5] sh_eth: uninline sh_eth_tsu_get_offset()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Message-ID: <837a23c9-38d6-90af-ed0c-3ee2aaaa20f0@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:10:02 +0300
MIME-Version: 1.0
In-Reply-To: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

sh_eth_tsu_get_offset() is called several  times  by the driver, remove
*inline* and move  that function  from the header to the driver  itself
to let gcc decide  whether to expand it inline or not...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    5 +++++
 drivers/net/ethernet/renesas/sh_eth.h |    6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -439,6 +439,11 @@ static void sh_eth_modify(struct net_dev
 		     enum_index);
 }
 
+static void *sh_eth_tsu_get_offset(struct sh_eth_private *mdp, int enum_index)
+{
+	return mdp->tsu_addr + mdp->reg_offset[enum_index];
+}
+
 static void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
 			     int enum_index)
 {
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -558,10 +558,4 @@ struct sh_eth_private {
 	unsigned wol_enabled:1;
 };
 
-static inline void *sh_eth_tsu_get_offset(struct sh_eth_private *mdp,
-					  int enum_index)
-{
-	return mdp->tsu_addr + mdp->reg_offset[enum_index];
-}
-
 #endif	/* #ifndef __SH_ETH_H__ */
