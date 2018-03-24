Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40917 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753322AbeCXUM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Mar 2018 16:12:58 -0400
Received: by mail-lf0-f67.google.com with SMTP id e5-v6so22906020lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Mar 2018 13:12:57 -0700 (PDT)
Subject: [PATCH 5/5] sh_eth: add sh_eth_cpu_data::cexcr flag
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Message-ID: <58a630fa-0e76-dea7-bf11-ad872a4de061@cogentembedded.com>
Date: Sat, 24 Mar 2018 23:12:54 +0300
MIME-Version: 1.0
In-Reply-To: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

GEther controllers have CERCR/CEECR instead of CNDCR on the others.
Currently we are calling sh_eth_is_gether() in order to check for this,
however it would be simpler  to check the new 'cexcr' bitfield in the
'struct sh_eth_cpu_data';  then we'd be able to remove sh_eth_is_gether()
as there would be no callers left...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   11 +++++------
 drivers/net/ethernet/renesas/sh_eth.h |    1 +
 2 files changed, 6 insertions(+), 6 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -450,11 +450,6 @@ static u32 sh_eth_tsu_read(struct sh_eth
 	return ioread32(mdp->tsu_addr + mdp->reg_offset[enum_index]);
 }
 
-static bool sh_eth_is_gether(struct sh_eth_private *mdp)
-{
-	return mdp->reg_offset == sh_eth_offset_gigabit;
-}
-
 static void sh_eth_select_mii(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -661,6 +656,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.tsu		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
+	.cexcr		= 1,
 };
 
 /* There is CPU dependent code */
@@ -918,6 +914,7 @@ static struct sh_eth_cpu_data sh7757_dat
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.tsu		= 1,
+	.cexcr		= 1,
 	.dual_port	= 1,
 };
 
@@ -959,6 +956,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.hw_checksum	= 1,
 	.select_mii	= 1,
 	.magic		= 1,
+	.cexcr		= 1,
 };
 
 /* SH7763 */
@@ -997,6 +995,7 @@ static struct sh_eth_cpu_data sh7763_dat
 	.tsu		= 1,
 	.irq_flags	= IRQF_SHARED,
 	.magic		= 1,
+	.cexcr		= 1,
 	.dual_port	= 1,
 };
 
@@ -2540,7 +2539,7 @@ static struct net_device_stats *sh_eth_g
 	sh_eth_update_stat(ndev, &ndev->stats.collisions, CDCR);
 	sh_eth_update_stat(ndev, &ndev->stats.tx_carrier_errors, LCCR);
 
-	if (sh_eth_is_gether(mdp)) {
+	if (mdp->cd->cexcr) {
 		sh_eth_update_stat(ndev, &ndev->stats.tx_carrier_errors,
 				   CERCR);
 		sh_eth_update_stat(ndev, &ndev->stats.tx_carrier_errors,
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -515,6 +515,7 @@ struct sh_eth_cpu_data {
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
 	unsigned magic:1;	/* EtherC has ECMR.MPDE and ECSR.MPD */
 	unsigned no_tx_cntrs:1;	/* EtherC DOES NOT have TX error counters */
+	unsigned cexcr:1;	/* EtherC has CERCR/CEECR */
 	unsigned dual_port:1;	/* Dual EtherC/E-DMAC */
 };
 
