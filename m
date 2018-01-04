Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33003 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752417AbeADSHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 13:07:01 -0500
Received: by mail-lf0-f67.google.com with SMTP id j143so2660829lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jan 2018 10:07:00 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180104180655.936982989@cogentembedded.com>
Date: Thu, 04 Jan 2018 21:06:49 +0300
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] sh_eth: fix SH7757 GEther initialization
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=sh_eth-fix-SH7757-GEther-initialization.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  SH7757 has 2 Fast and 2 Gigabit Ether controllers, while the
'sh_eth' driver can only reset and initialize TSU of the first controller
pair. Shimoda-san tried to solve that adding the 'needs_init' member to the
'struct sh_eth_plat_data', however the platform code still never sets this
flag. I think  that we can infer this information from the 'devno' variable
(set  to 'platform_device::id') and reset/init the Ether controller pair
only for an even 'devno'; therefore 'sh_eth_plat_data::needs_init' can be
removed...

Fixes: 150647fb2c31 ("net: sh_eth: change the condition of initialization")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net.git' repo.

 drivers/net/ethernet/renesas/sh_eth.c |    4 ++--
 include/linux/sh_eth.h                |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

Index: net/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net/drivers/net/ethernet/renesas/sh_eth.c
@@ -3254,8 +3254,8 @@ static int sh_eth_drv_probe(struct platf
 		ndev->features = NETIF_F_HW_VLAN_CTAG_FILTER;
 	}
 
-	/* initialize first or needed device */
-	if (!devno || pd->needs_init) {
+	/* Need to init only the first port of the two sharing a TSU */
+	if (devno % 2 == 0) {
 		if (mdp->cd->chip_reset)
 			mdp->cd->chip_reset(ndev);
 
Index: net/include/linux/sh_eth.h
===================================================================
--- net.orig/include/linux/sh_eth.h
+++ net/include/linux/sh_eth.h
@@ -17,7 +17,6 @@ struct sh_eth_plat_data {
 	unsigned char mac_addr[ETH_ALEN];
 	unsigned no_ether_link:1;
 	unsigned ether_link_active_low:1;
-	unsigned needs_init:1;
 };
 
 #endif
