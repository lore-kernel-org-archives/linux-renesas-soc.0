Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42135 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbeIQUrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 16:47:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH net-next] ravb: do not write 1 to reserved bits
Date: Mon, 17 Sep 2018 17:19:11 +0200
Message-Id: <20180917151911.25450-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

EtherAVB hardware requires 0 to be written to status register bits in
order to clear them, however, care must be taken not to:

1. Clear other bits, by writing zero to them
2. Write one to reserved bits

This patch corrects the ravb driver with respect to the second point above.
This is done by defining reserved bit masks for the affected registers and,
after auditing the code, ensure all sites that may write a one to a
reserved bit use are suitably masked.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2 [Simon Horman]
* Cover ravb_timestamp_interrupt() by this change
* Use enum value rather than #define for reserved masks
* Reword changelog

v1 [Kazuya Mizuguchi]
---
 drivers/net/ethernet/renesas/ravb.h      |  6 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 11 ++++++-----
 drivers/net/ethernet/renesas/ravb_ptp.c  |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 1470fc12282b..bca219edcf94 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -428,6 +428,7 @@ enum EIS_BIT {
 	EIS_CULF1	= 0x00000080,
 	EIS_TFFF	= 0x00000100,
 	EIS_QFS		= 0x00010000,
+	EIS_RESERVED	= (u32)(GENMASK(31, 17) | GENMASK(15, 11)),
 };
 
 /* RIC0 */
@@ -472,6 +473,7 @@ enum RIS0_BIT {
 	RIS0_FRF15	= 0x00008000,
 	RIS0_FRF16	= 0x00010000,
 	RIS0_FRF17	= 0x00020000,
+	RIS0_RESERVED	= (u32)GENMASK(31, 18),
 };
 
 /* RIC1 */
@@ -528,6 +530,7 @@ enum RIS2_BIT {
 	RIS2_QFF16	= 0x00010000,
 	RIS2_QFF17	= 0x00020000,
 	RIS2_RFFF	= 0x80000000,
+	RIS2_RESERVED	= (u32)GENMASK_ULL(30, 18),
 };
 
 /* TIC */
@@ -544,6 +547,8 @@ enum TIS_BIT {
 	TIS_FTF1	= 0x00000002,	/* Undocumented? */
 	TIS_TFUF	= 0x00000100,
 	TIS_TFWF	= 0x00000200,
+	TIS_RESERVED	= (u32)(GENMASK_ULL(31, 20) | GENMASK_ULL(15, 12) | \
+				GENMASK_ULL(7, 4))
 };
 
 /* ISS */
@@ -617,6 +622,7 @@ enum GIC_BIT {
 enum GIS_BIT {
 	GIS_PTCF	= 0x00000001,	/* Undocumented? */
 	GIS_PTMF	= 0x00000004,
+	GIS_RESERVED	= (u32)GENMASK(15, 10),
 };
 
 /* GIE (R-Car Gen3 only) */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fb2a1125780d..cddb0c2856c8 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -739,10 +739,11 @@ static void ravb_error_interrupt(struct net_device *ndev)
 	u32 eis, ris2;
 
 	eis = ravb_read(ndev, EIS);
-	ravb_write(ndev, ~EIS_QFS, EIS);
+	ravb_write(ndev, ~(EIS_QFS | EIS_RESERVED), EIS);
 	if (eis & EIS_QFS) {
 		ris2 = ravb_read(ndev, RIS2);
-		ravb_write(ndev, ~(RIS2_QFF0 | RIS2_RFFF), RIS2);
+		ravb_write(ndev, ~(RIS2_QFF0 | RIS2_RFFF | RIS2_RESERVED),
+			   RIS2);
 
 		/* Receive Descriptor Empty int */
 		if (ris2 & RIS2_QFF0)
@@ -795,7 +796,7 @@ static bool ravb_timestamp_interrupt(struct net_device *ndev)
 	u32 tis = ravb_read(ndev, TIS);
 
 	if (tis & TIS_TFUF) {
-		ravb_write(ndev, ~TIS_TFUF, TIS);
+		ravb_write(ndev, ~(TIS_TFUF | TIS_RESERVED), TIS);
 		ravb_get_tx_tstamp(ndev);
 		return true;
 	}
@@ -930,7 +931,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 		/* Processing RX Descriptor Ring */
 		if (ris0 & mask) {
 			/* Clear RX interrupt */
-			ravb_write(ndev, ~mask, RIS0);
+			ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
 			if (ravb_rx(ndev, &quota, q))
 				goto out;
 		}
@@ -938,7 +939,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 		if (tis & mask) {
 			spin_lock_irqsave(&priv->lock, flags);
 			/* Clear TX interrupt */
-			ravb_write(ndev, ~mask, TIS);
+			ravb_write(ndev, ~(mask | TIS_RESERVED), TIS);
 			ravb_tx_free(ndev, q, true);
 			netif_wake_subqueue(ndev, q);
 			mmiowb();
diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index 0721b5c35d91..dce2a40a31e3 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -315,7 +315,7 @@ void ravb_ptp_interrupt(struct net_device *ndev)
 		}
 	}
 
-	ravb_write(ndev, ~gis, GIS);
+	ravb_write(ndev, ~(gis | GIS_RESERVED), GIS);
 }
 
 void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev)
-- 
2.11.0
