Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33979 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752523AbeESVDp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 17:03:45 -0400
Received: by mail-lf0-f67.google.com with SMTP id x145-v6so6733975lff.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 May 2018 14:03:44 -0700 (PDT)
Subject: [PATCH 2/3] sh_eth: fix comment grammar in 'struct sh_eth_cpu_data'
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Message-ID: <b8dc3a23-561a-6336-9587-2cfd336a2163@cogentembedded.com>
Date: Sun, 20 May 2018 00:03:42 +0300
MIME-Version: 1.0
In-Reply-To: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

All the verbs in the comments to the 'struct sh_eth_cpu_data' declaration
should  be in a  3rd person singular, to match the nouns.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.h |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -499,21 +499,21 @@ struct sh_eth_cpu_data {
 
 	/* hardware features */
 	unsigned long irq_flags; /* IRQ configuration flags */
-	unsigned no_psr:1;	/* EtherC DO NOT have PSR */
-	unsigned apr:1;		/* EtherC have APR */
-	unsigned mpr:1;		/* EtherC have MPR */
-	unsigned tpauser:1;	/* EtherC have TPAUSER */
-	unsigned bculr:1;	/* EtherC have BCULR */
-	unsigned tsu:1;		/* EtherC have TSU */
-	unsigned hw_swap:1;	/* E-DMAC have DE bit in EDMR */
+	unsigned no_psr:1;	/* EtherC DOES NOT have PSR */
+	unsigned apr:1;		/* EtherC has APR */
+	unsigned mpr:1;		/* EtherC has MPR */
+	unsigned tpauser:1;	/* EtherC has TPAUSER */
+	unsigned bculr:1;	/* EtherC has BCULR */
+	unsigned tsu:1;		/* EtherC has TSU */
+	unsigned hw_swap:1;	/* E-DMAC has DE bit in EDMR */
 	unsigned nbst:1;	/* E-DMAC has NBST bit in EDMR */
-	unsigned rpadir:1;	/* E-DMAC have RPADIR */
-	unsigned no_trimd:1;	/* E-DMAC DO NOT have TRIMD */
-	unsigned no_ade:1;	/* E-DMAC DO NOT have ADE bit in EESR */
+	unsigned rpadir:1;	/* E-DMAC has RPADIR */
+	unsigned no_trimd:1;	/* E-DMAC DOES NOT have TRIMD */
+	unsigned no_ade:1;	/* E-DMAC DOES NOT have ADE bit in EESR */
 	unsigned no_xdfar:1;	/* E-DMAC DOES NOT have RDFAR/TDFAR */
 	unsigned xdfar_rw:1;	/* E-DMAC has writeable RDFAR/TDFAR */
 	unsigned hw_checksum:1;	/* E-DMAC has CSMR */
-	unsigned select_mii:1;	/* EtherC have RMII_MII (MII select register) */
+	unsigned select_mii:1;	/* EtherC has RMII_MII (MII select register) */
 	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
 	unsigned magic:1;	/* EtherC has ECMR.MPDE and ECSR.MPD */
