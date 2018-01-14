Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35824 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751837AbeANRwE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 Jan 2018 12:52:04 -0500
Received: by mail-lf0-f66.google.com with SMTP id a204so2559380lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jan 2018 09:52:03 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180114175159.604307495@cogentembedded.com>
Date: Sun, 14 Jan 2018 20:47:43 +0300
To: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: linux-sh@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] sh_eth: gather all TSU init code in one place
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=sh_eth-gather-all-TSU-init-code-in-one-place.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The  sh_eth_cpu_data::chip_reset() method  always resets using ARSTR and
this register is always located at the start of the  TSU register region.
Therefore, we can  only call  this method if we know TSU is there and thus
simplify  the probing code a  bit...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -3222,7 +3222,6 @@ static int sh_eth_drv_probe(struct platf
 		eth_hw_addr_random(ndev);
 	}
 
-	/* ioremap the TSU registers */
 	if (mdp->cd->tsu) {
 		struct resource *rtsu;
 
@@ -3243,6 +3242,7 @@ static int sh_eth_drv_probe(struct platf
 			ret = -EBUSY;
 			goto out_release;
 		}
+		/* ioremap the TSU registers */
 		mdp->tsu_addr = devm_ioremap(&pdev->dev, rtsu->start,
 					     resource_size(rtsu));
 		if (!mdp->tsu_addr) {
@@ -3252,14 +3252,12 @@ static int sh_eth_drv_probe(struct platf
 		}
 		mdp->port = devno % 2;
 		ndev->features = NETIF_F_HW_VLAN_CTAG_FILTER;
-	}
 
-	/* Need to init only the first port of the two sharing a TSU */
-	if (devno % 2 == 0) {
-		if (mdp->cd->chip_reset)
-			mdp->cd->chip_reset(ndev);
+		/* Need to init only the first port of the two sharing a TSU */
+		if (devno % 2 == 0) {
+			if (mdp->cd->chip_reset)
+				mdp->cd->chip_reset(ndev);
 
-		if (mdp->cd->tsu) {
 			/* TSU init (Init only)*/
 			sh_eth_tsu_init(mdp);
 		}
