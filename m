Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeDQIu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 04:50:58 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next 4/5] ravb: remove undocumented processing
Date: Tue, 17 Apr 2018 10:50:29 +0200
Message-Id: <20180417085030.32650-5-horms+renesas@verge.net.au>
In-Reply-To: <20180417085030.32650-1-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb.h      |  5 -----
 drivers/net/ethernet/renesas/ravb_main.c | 15 ---------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 57eea4a77826..fcd04dbc7dde 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -197,15 +197,11 @@ enum ravb_reg {
 	MAHR	= 0x05c0,
 	MALR	= 0x05c8,
 	TROCR	= 0x0700,	/* Undocumented? */
-	CDCR	= 0x0708,	/* Undocumented? */
-	LCCR	= 0x0710,	/* Undocumented? */
 	CEFCR	= 0x0740,
 	FRECR	= 0x0748,
 	TSFRCR	= 0x0750,
 	TLFRCR	= 0x0758,
 	RFCR	= 0x0760,
-	CERCR	= 0x0768,	/* Undocumented? */
-	CEECR	= 0x0770,	/* Undocumented? */
 	MAFCR	= 0x0778,
 };
 
@@ -223,7 +219,6 @@ enum CCC_BIT {
 	CCC_CSEL_HPB	= 0x00010000,
 	CCC_CSEL_ETH_TX	= 0x00020000,
 	CCC_CSEL_GMII_REF = 0x00030000,
-	CCC_BOC		= 0x00100000,	/* Undocumented? */
 	CCC_LBME	= 0x01000000,
 };
 
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 736ca2f76a35..88056dd912ed 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -451,12 +451,6 @@ static int ravb_dmac_init(struct net_device *ndev)
 	ravb_ring_format(ndev, RAVB_BE);
 	ravb_ring_format(ndev, RAVB_NC);
 
-#if defined(__LITTLE_ENDIAN)
-	ravb_modify(ndev, CCC, CCC_BOC, 0);
-#else
-	ravb_modify(ndev, CCC, CCC_BOC, CCC_BOC);
-#endif
-
 	/* Set AVB RX */
 	ravb_write(ndev,
 		   RCR_EFFS | RCR_ENCF | RCR_ETS0 | RCR_ESF | 0x18000000, RCR);
@@ -1660,15 +1654,6 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 
 	nstats->tx_dropped += ravb_read(ndev, TROCR);
 	ravb_write(ndev, 0, TROCR);	/* (write clear) */
-	nstats->collisions += ravb_read(ndev, CDCR);
-	ravb_write(ndev, 0, CDCR);	/* (write clear) */
-	nstats->tx_carrier_errors += ravb_read(ndev, LCCR);
-	ravb_write(ndev, 0, LCCR);	/* (write clear) */
-
-	nstats->tx_carrier_errors += ravb_read(ndev, CERCR);
-	ravb_write(ndev, 0, CERCR);	/* (write clear) */
-	nstats->tx_carrier_errors += ravb_read(ndev, CEECR);
-	ravb_write(ndev, 0, CEECR);	/* (write clear) */
 
 	nstats->rx_packets = stats0->rx_packets + stats1->rx_packets;
 	nstats->tx_packets = stats0->tx_packets + stats1->tx_packets;
-- 
2.11.0
