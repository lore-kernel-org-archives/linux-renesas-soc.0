Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40231 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755690AbeFYUhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 16:37:10 -0400
Received: by mail-wr0-f196.google.com with SMTP id g18-v6so14957673wro.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jun 2018 13:37:09 -0700 (PDT)
Subject: [PATCH 2/2] sh_eth: remove sh_eth_cpu_data::rpadir_value
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Message-ID: <d2b67329-7bed-80e2-76e8-d0514f8545ae@cogentembedded.com>
Date: Mon, 25 Jun 2018 23:37:06 +0300
MIME-Version: 1.0
In-Reply-To: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If RPADIR exists, the value written to it is always the same for all SoCs
(and derived from NET_IP_ALIGN), so there has not  been any need to store
it in the *struct* sh_eth_cpu_data...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    8 +-------
 drivers/net/ethernet/renesas/sh_eth.h |    1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -622,7 +622,6 @@ static struct sh_eth_cpu_data r7s72100_d
 	.tpauser	= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
-	.rpadir_value   = 2 << 16,
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
@@ -672,7 +671,6 @@ static struct sh_eth_cpu_data r8a7740_da
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
-	.rpadir_value   = 2 << 16,
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
@@ -798,7 +796,6 @@ static struct sh_eth_cpu_data r8a77980_d
 	.hw_swap	= 1,
 	.nbst		= 1,
 	.rpadir		= 1,
-	.rpadir_value   = 2 << 16,
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
@@ -851,7 +848,6 @@ static struct sh_eth_cpu_data sh7724_dat
 	.tpauser	= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
-	.rpadir_value	= 0x00020000, /* NET_IP_ALIGN assumed to be 2 */
 };
 
 static void sh_eth_set_rate_sh7757(struct net_device *ndev)
@@ -898,7 +894,6 @@ static struct sh_eth_cpu_data sh7757_dat
 	.hw_swap	= 1,
 	.no_ade		= 1,
 	.rpadir		= 1,
-	.rpadir_value   = 2 << 16,
 	.rtrate		= 1,
 	.dual_port	= 1,
 };
@@ -978,7 +973,6 @@ static struct sh_eth_cpu_data sh7757_dat
 	.bculr		= 1,
 	.hw_swap	= 1,
 	.rpadir		= 1,
-	.rpadir_value   = 2 << 16,
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
@@ -1467,7 +1461,7 @@ static int sh_eth_dev_init(struct net_de
 	/* Descriptor format */
 	sh_eth_ring_format(ndev);
 	if (mdp->cd->rpadir)
-		sh_eth_write(ndev, mdp->cd->rpadir_value, RPADIR);
+		sh_eth_write(ndev, NET_IP_ALIGN << 16, RPADIR);
 
 	/* all sh_eth int mask */
 	sh_eth_write(ndev, 0, EESIPR);
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -487,7 +487,6 @@ struct sh_eth_cpu_data {
 	u32 ecsipr_value;
 	u32 fdr_value;
 	u32 fcftr_value;
-	u32 rpadir_value;
 
 	/* interrupt checking mask */
 	u32 tx_check;
