Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44136 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751542AbeERSbc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 14:31:32 -0400
Received: by mail-lf0-f68.google.com with SMTP id h197-v6so15290870lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 11:31:31 -0700 (PDT)
Subject: [PATCH v2 2/3] sh_eth: add EDMR.NBST support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Message-ID: <6dc30bc4-04f4-7ac3-e9e9-de86f2eee99f@cogentembedded.com>
Date: Fri, 18 May 2018 21:31:28 +0300
MIME-Version: 1.0
In-Reply-To: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car V3H (AKA R8A77980) GEther controller adds the DMA burst mode bit
(NBST) in EDMR and the manual tells to always set it before doing any DMA.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

---
Changes in version 2:
- added Simon's tag.

 drivers/net/ethernet/renesas/sh_eth.c |    4 ++++
 drivers/net/ethernet/renesas/sh_eth.h |    2 ++
 2 files changed, 6 insertions(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1434,6 +1434,10 @@ static int sh_eth_dev_init(struct net_de
 
 	sh_eth_write(ndev, mdp->cd->trscer_err_mask, TRSCER);
 
+	/* DMA transfer burst mode */
+	if (mdp->cd->nbst)
+		sh_eth_modify(ndev, EDMR, EDMR_NBST, EDMR_NBST);
+
 	if (mdp->cd->bculr)
 		sh_eth_write(ndev, 0x800, BCULR);	/* Burst sycle set */
 
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -184,6 +184,7 @@ enum GECMR_BIT {
 
 /* EDMR */
 enum DMAC_M_BIT {
+	EDMR_NBST = 0x80,
 	EDMR_EL = 0x40, /* Litte endian */
 	EDMR_DL1 = 0x20, EDMR_DL0 = 0x10,
 	EDMR_SRST_GETHER = 0x03,
@@ -505,6 +506,7 @@ struct sh_eth_cpu_data {
 	unsigned bculr:1;	/* EtherC have BCULR */
 	unsigned tsu:1;		/* EtherC have TSU */
 	unsigned hw_swap:1;	/* E-DMAC have DE bit in EDMR */
+	unsigned nbst:1;	/* E-DMAC has NBST bit in EDMR */
 	unsigned rpadir:1;	/* E-DMAC have RPADIR */
 	unsigned no_trimd:1;	/* E-DMAC DO NOT have TRIMD */
 	unsigned no_ade:1;	/* E-DMAC DO NOT have ADE bit in EESR */
