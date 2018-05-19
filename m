Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33390 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752608AbeESVFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:05:05 -0400
Received: by mail-lf0-f65.google.com with SMTP id u9-v6so1577394lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 May 2018 14:05:05 -0700 (PDT)
Subject: [PATCH 3/3] sh_eth: fix typo in comment to BCULR write
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Message-ID: <fcde85a9-50fa-adf1-1fe2-17574a9bc0b1@cogentembedded.com>
Date: Sun, 20 May 2018 00:05:02 +0300
MIME-Version: 1.0
In-Reply-To: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Simon has noticed a typo in the comment accompaining the BCULR write --
fix it and move the comment before the write (following the style of
the other comments), while at it...

Reported-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1481,8 +1481,9 @@ static int sh_eth_dev_init(struct net_de
 	if (mdp->cd->nbst)
 		sh_eth_modify(ndev, EDMR, EDMR_NBST, EDMR_NBST);
 
+	/* Burst cycle count upper-limit */
 	if (mdp->cd->bculr)
-		sh_eth_write(ndev, 0x800, BCULR);	/* Burst sycle set */
+		sh_eth_write(ndev, 0x800, BCULR);
 
 	sh_eth_write(ndev, mdp->cd->fcftr_value, FCFTR);
 
