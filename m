Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37208 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388062AbeGWTPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:15:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id v9-v6so1333354ljk.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:12:40 -0700 (PDT)
Subject: [PATCH 3/5] sh_eth: call sh_eth_tsu_get_offset() from TSU register
 accessors
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Message-ID: <6a15eddc-a30d-a4e8-aa0d-05ee2091e32a@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:12:38 +0300
MIME-Version: 1.0
In-Reply-To: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

With sh_eth_tsu_get_offset() now actually returning TSU register's offset,
we  can at last use it in sh_eth_tsu_{read|write}(). Somehow this saves 248
bytes of object code with AArch64 gcc 4.8.5... :-)

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -447,7 +447,7 @@ static u16 sh_eth_tsu_get_offset(struct
 static void sh_eth_tsu_write(struct sh_eth_private *mdp, u32 data,
 			     int enum_index)
 {
-	u16 offset = mdp->reg_offset[enum_index];
+	u16 offset = sh_eth_tsu_get_offset(mdp, enum_index);
 
 	if (WARN_ON(offset == SH_ETH_OFFSET_INVALID))
 		return;
@@ -457,7 +457,7 @@ static void sh_eth_tsu_write(struct sh_e
 
 static u32 sh_eth_tsu_read(struct sh_eth_private *mdp, int enum_index)
 {
-	u16 offset = mdp->reg_offset[enum_index];
+	u16 offset = sh_eth_tsu_get_offset(mdp, enum_index);
 
 	if (WARN_ON(offset == SH_ETH_OFFSET_INVALID))
 		return ~0U;
