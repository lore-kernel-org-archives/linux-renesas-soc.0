Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40575 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753070AbeCXUIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Mar 2018 16:08:45 -0400
Received: by mail-lf0-f66.google.com with SMTP id e5-v6so22898831lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Mar 2018 13:08:44 -0700 (PDT)
Subject: [PATCH 2/5] sh_eth: add sh_eth_cpu_data::edtrr_trns value
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Message-ID: <e694fd10-e4af-dcea-e577-72d83b57988f@cogentembedded.com>
Date: Sat, 24 Mar 2018 23:08:42 +0300
MIME-Version: 1.0
In-Reply-To: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

sh_eth_get_edtrr_trns() returns the value to be written to EDTRR in order
to start TX DMA -- this value is different between the GEther-like and
the other controllers. We can replace this function (and thus get rid of
the calls to sh_eth_is_{gether|rz_fast_ether}() by it) with a new field
'edtrr_trns' in the 'struct sh_eth_cpu_data'.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   27 +++++++++++++++------------
 drivers/net/ethernet/renesas/sh_eth.h |    1 +
 2 files changed, 16 insertions(+), 12 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -584,6 +584,7 @@ static struct sh_eth_cpu_data r7s72100_d
 
 	.register_type	= SH_ETH_REG_FAST_RZ,
 
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD,
 	.ecsipr_value	= ECSIPR_ICDIP,
 	.eesipr_value	= EESIPR_TWB1IP | EESIPR_TWBIP | EESIPR_TC1IP |
@@ -631,6 +632,7 @@ static struct sh_eth_cpu_data r8a7740_da
 
 	.register_type	= SH_ETH_REG_GIGABIT,
 
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD | ECSR_MPD,
 	.ecsipr_value	= ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
@@ -687,6 +689,7 @@ static struct sh_eth_cpu_data rcar_gen1_
 
 	.register_type	= SH_ETH_REG_FAST_RCAR,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD,
 	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ADEIP | EESIPR_ECIIP |
@@ -716,6 +719,7 @@ static struct sh_eth_cpu_data rcar_gen2_
 
 	.register_type	= SH_ETH_REG_FAST_RCAR,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD | ECSR_MPD,
 	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP |
 			  ECSIPR_MPDIP,
@@ -765,6 +769,7 @@ static struct sh_eth_cpu_data sh7724_dat
 
 	.register_type	= SH_ETH_REG_FAST_SH4,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD,
 	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ADEIP | EESIPR_ECIIP |
@@ -809,6 +814,7 @@ static struct sh_eth_cpu_data sh7757_dat
 
 	.register_type	= SH_ETH_REG_FAST_SH4,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
 			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
 			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
@@ -884,6 +890,7 @@ static struct sh_eth_cpu_data sh7757_dat
 
 	.register_type	= SH_ETH_REG_GIGABIT,
 
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD | ECSR_MPD,
 	.ecsipr_value	= ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
@@ -925,6 +932,7 @@ static struct sh_eth_cpu_data sh7734_dat
 
 	.register_type	= SH_ETH_REG_GIGABIT,
 
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD | ECSR_MPD,
 	.ecsipr_value	= ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
@@ -963,6 +971,7 @@ static struct sh_eth_cpu_data sh7763_dat
 
 	.register_type	= SH_ETH_REG_GIGABIT,
 
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
 	.ecsr_value	= ECSR_ICD | ECSR_MPD,
 	.ecsipr_value	= ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
@@ -995,6 +1004,7 @@ static struct sh_eth_cpu_data sh7619_dat
 
 	.register_type	= SH_ETH_REG_FAST_SH3_SH2,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
 			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
 			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
@@ -1015,6 +1025,7 @@ static struct sh_eth_cpu_data sh771x_dat
 
 	.register_type	= SH_ETH_REG_FAST_SH3_SH2,
 
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
 	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
 			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
 			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
@@ -1094,14 +1105,6 @@ static void read_mac_address(struct net_
 	}
 }
 
-static u32 sh_eth_get_edtrr_trns(struct sh_eth_private *mdp)
-{
-	if (sh_eth_is_gether(mdp) || sh_eth_is_rz_fast_ether(mdp))
-		return EDTRR_TRNS_GETHER;
-	else
-		return EDTRR_TRNS_ETHER;
-}
-
 struct bb_info {
 	void (*set_gate)(void *addr);
 	struct mdiobb_ctrl ctrl;
@@ -1741,9 +1744,9 @@ static void sh_eth_error(struct net_devi
 		sh_eth_tx_free(ndev, true);
 
 		/* SH7712 BUG */
-		if (edtrr ^ sh_eth_get_edtrr_trns(mdp)) {
+		if (edtrr ^ mdp->cd->edtrr_trns) {
 			/* tx dma start */
-			sh_eth_write(ndev, sh_eth_get_edtrr_trns(mdp), EDTRR);
+			sh_eth_write(ndev, mdp->cd->edtrr_trns, EDTRR);
 		}
 		/* wakeup */
 		netif_wake_queue(ndev);
@@ -2502,8 +2505,8 @@ static int sh_eth_start_xmit(struct sk_b
 
 	mdp->cur_tx++;
 
-	if (!(sh_eth_read(ndev, EDTRR) & sh_eth_get_edtrr_trns(mdp)))
-		sh_eth_write(ndev, sh_eth_get_edtrr_trns(mdp), EDTRR);
+	if (!(sh_eth_read(ndev, EDTRR) & mdp->cd->edtrr_trns))
+		sh_eth_write(ndev, mdp->cd->edtrr_trns, EDTRR);
 
 	return NETDEV_TX_OK;
 }
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -479,6 +479,7 @@ struct sh_eth_cpu_data {
 
 	/* mandatory initialize value */
 	int register_type;
+	u32 edtrr_trns;
 	u32 eesipr_value;
 
 	/* optional initialize value */
