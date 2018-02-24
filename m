Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:46573 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751424AbeBXTlu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Feb 2018 14:41:50 -0500
Received: by mail-lf0-f68.google.com with SMTP id r80so16903174lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2018 11:41:49 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH net-next] sh_eth: fix TSU init on SH7734/R8A7740
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
Date: Sat, 24 Feb 2018 22:41:45 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It appears that the single port Ether controllers having TSU (like SH7734/
R8A7740) need the same kind of treating in sh_eth_tsu_init() as R7S72100
currently has -- they also don't have the TSU registers related e.g. to
passing the frames between ports. Add the 'sh_eth_cpu_data::dual_port'
flag and use it as a new criterion for taking a "short path" in the TSU
init sequence in order to avoid writing to the non-existant registers...

Fixes: f0e81fecd4f8 ("net: sh_eth: Add support SH7734")
Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
David, I'm submitting this patch against the 'net-next.git' repo since nothing
seems to explode when writing to the non-existing TSU registers. Whether to
apply this to 'net.git' instead is up to you...

 drivers/net/ethernet/renesas/sh_eth.c |    6 +++++-
 drivers/net/ethernet/renesas/sh_eth.h |    1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -752,6 +752,7 @@ static struct sh_eth_cpu_data sh7757_dat
 	.rpadir		= 1,
 	.rpadir_value   = 2 << 16,
 	.rtrate		= 1,
+	.dual_port	= 1,
 };
 
 #define SH_GIGA_ETH_BASE	0xfee00000UL
@@ -830,6 +831,7 @@ static struct sh_eth_cpu_data sh7757_dat
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.tsu		= 1,
+	.dual_port	= 1,
 };
 
 /* SH7734 */
@@ -900,6 +902,7 @@ static struct sh_eth_cpu_data sh7763_dat
 	.tsu		= 1,
 	.irq_flags	= IRQF_SHARED,
 	.magic		= 1,
+	.dual_port	= 1,
 };
 
 static struct sh_eth_cpu_data sh7619_data = {
@@ -932,6 +935,7 @@ static struct sh_eth_cpu_data sh771x_dat
 			  EESIPR_RRFIP | EESIPR_RTLFIP | EESIPR_RTSFIP |
 			  EESIPR_PREIP | EESIPR_CERFIP,
 	.tsu		= 1,
+	.dual_port	= 1,
 };
 
 static void sh_eth_set_default_cpu_data(struct sh_eth_cpu_data *cd)
@@ -2915,7 +2919,7 @@ static int sh_eth_vlan_rx_kill_vid(struc
 /* SuperH's TSU register init function */
 static void sh_eth_tsu_init(struct sh_eth_private *mdp)
 {
-	if (sh_eth_is_rz_fast_ether(mdp)) {
+	if (!mdp->cd->dual_port) {
 		sh_eth_tsu_write(mdp, 0, TSU_TEN); /* Disable all CAM entry */
 		sh_eth_tsu_write(mdp, TSU_FWSLC_POSTENU | TSU_FWSLC_POSTENL,
 				 TSU_FWSLC);	/* Enable POST registers */
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -509,6 +509,7 @@ struct sh_eth_cpu_data {
 	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
 	unsigned magic:1;	/* EtherC has ECMR.MPDE and ECSR.MPD */
+	unsigned dual_port:1;	/* Dual EtherC/E-DMAC */
 };
 
 struct sh_eth_private {
