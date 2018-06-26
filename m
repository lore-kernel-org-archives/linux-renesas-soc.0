Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40715 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752076AbeFZPmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 11:42:36 -0400
Received: by mail-wr0-f196.google.com with SMTP id g18-v6so17741174wro.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jun 2018 08:42:36 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH net-next] sh_eth: fix *enum* {A|M}PR_BIT
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Message-ID: <e67e6256-4ae9-4527-d482-cf3bb50921cf@cogentembedded.com>
Date: Tue, 26 Jun 2018 18:42:33 +0300
MIME-Version: 1.0
In-Reply-To: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The *enum* {A|M}PR_BIT were declared in the commit 86a74ff21a7a ("net:
sh_eth: add support for  Renesas SuperH Ethernet") adding SH771x support,
however the SH771x manual  doesn't have the APR/MPR registers described
and the code writing to them for SH7710 was later removed by the commit
380af9e390ec ("net: sh_eth: CPU dependency code collect to "struct
sh_eth_cpu_data""). All the newer SoC manuals have these registers
documented as having a 16-bit TIME parameter of the PAUSE frame, not
1-bit -- update the *enum* accordingly, fixing up the APR/MPR writes...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against DaveM's 'net-next.git' repo.

 drivers/net/ethernet/renesas/sh_eth.c |    4 ++--
 drivers/net/ethernet/renesas/sh_eth.h |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1521,9 +1521,9 @@ static int sh_eth_dev_init(struct net_de
 
 	/* mask reset */
 	if (mdp->cd->apr)
-		sh_eth_write(ndev, APR_AP, APR);
+		sh_eth_write(ndev, 1, APR);
 	if (mdp->cd->mpr)
-		sh_eth_write(ndev, MPR_MP, MPR);
+		sh_eth_write(ndev, 1, MPR);
 	if (mdp->cd->tpauser)
 		sh_eth_write(ndev, TPAUSER_UNLIMITED, TPAUSER);
 
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -383,12 +383,12 @@ enum ECSIPR_STATUS_MASK_BIT {
 
 /* APR */
 enum APR_BIT {
-	APR_AP = 0x00000001,
+	APR_AP = 0x0000ffff,
 };
 
 /* MPR */
 enum MPR_BIT {
-	MPR_MP = 0x00000001,
+	MPR_MP = 0x0000ffff,
 };
 
 /* TRSCER */
