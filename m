Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:46351 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752517AbeAFV06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jan 2018 16:26:58 -0500
Received: by mail-lf0-f68.google.com with SMTP id a12so8478485lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 06 Jan 2018 13:26:57 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180106212652.818833413@cogentembedded.com>
Date: Sun, 07 Jan 2018 00:26:47 +0300
To: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: linux-sh@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] sh_eth: fix TXALCR1 offsets
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=sh_eth-fix-TXALCR1-offsets.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The  TXALCR1 offsets are incorrect in the register offset tables, most
probably due to copy&paste error.  Luckily, the driver never uses this
register. :-)

Fixes: 4a55530f38e4 ("net: sh_eth: modify the definitions of register")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -147,7 +147,7 @@ static const u16 sh_eth_offset_gigabit[S
 	[FWNLCR0]	= 0x0090,
 	[FWALCR0]	= 0x0094,
 	[TXNLCR1]	= 0x00a0,
-	[TXALCR1]	= 0x00a0,
+	[TXALCR1]	= 0x00a4,
 	[RXNLCR1]	= 0x00a8,
 	[RXALCR1]	= 0x00ac,
 	[FWNLCR1]	= 0x00b0,
@@ -399,7 +399,7 @@ static const u16 sh_eth_offset_fast_sh3_
 	[FWNLCR0]	= 0x0090,
 	[FWALCR0]	= 0x0094,
 	[TXNLCR1]	= 0x00a0,
-	[TXALCR1]	= 0x00a0,
+	[TXALCR1]	= 0x00a4,
 	[RXNLCR1]	= 0x00a8,
 	[RXALCR1]	= 0x00ac,
 	[FWNLCR1]	= 0x00b0,
