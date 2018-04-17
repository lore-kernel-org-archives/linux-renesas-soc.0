Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbeDQIu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 04:50:56 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC net-next 3/5] ravb: do not write 1 to reserved bits
Date: Tue, 17 Apr 2018 10:50:28 +0200
Message-Id: <20180417085030.32650-4-horms+renesas@verge.net.au>
In-Reply-To: <20180417085030.32650-1-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch corrects writing 1 to reserved bits.
The write value should be 0.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/net/ethernet/renesas/ravb.h      | 12 ++++++++++++
 drivers/net/ethernet/renesas/ravb_main.c |  9 +++++----
 drivers/net/ethernet/renesas/ravb_ptp.c  |  2 +-
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index b81f4faf7b10..57eea4a77826 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -433,6 +433,8 @@ enum EIS_BIT {
 	EIS_QFS		= 0x00010000,
 };
 
+#define EIS_RESERVED_BITS	(u32)(GENMASK(31, 17) | GENMASK(15, 11))
+
 /* RIC0 */
 enum RIC0_BIT {
 	RIC0_FRE0	= 0x00000001,
@@ -477,6 +479,8 @@ enum RIS0_BIT {
 	RIS0_FRF17	= 0x00020000,
 };
 
+#define RIS0_RESERVED_BITS	(u32)GENMASK(31, 18)
+
 /* RIC1 */
 enum RIC1_BIT {
 	RIC1_RFWE	= 0x80000000,
@@ -533,6 +537,8 @@ enum RIS2_BIT {
 	RIS2_RFFF	= 0x80000000,
 };
 
+#define RIS2_RESERVED_BITS	(u32)GENMASK_ULL(30, 18)
+
 /* TIC */
 enum TIC_BIT {
 	TIC_FTE0	= 0x00000001,	/* Undocumented? */
@@ -549,6 +555,10 @@ enum TIS_BIT {
 	TIS_TFWF	= 0x00000200,
 };
 
+#define TIS_RESERVED_BITS	(u32)(GENMASK_ULL(31, 20) | \
+				      GENMASK_ULL(15, 12) | \
+				      GENMASK_ULL(7, 4))
+
 /* ISS */
 enum ISS_BIT {
 	ISS_FRS		= 0x00000001,	/* Undocumented? */
@@ -622,6 +632,8 @@ enum GIS_BIT {
 	GIS_PTMF	= 0x00000004,
 };
 
+#define GIS_RESERVED_BITS	(u32)GENMASK(15, 10)
+
 /* GIE (R-Car Gen3 only) */
 enum GIE_BIT {
 	GIE_PTCS	= 0x00000001,
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index dbde3d11458b..736ca2f76a35 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -742,10 +742,11 @@ static void ravb_error_interrupt(struct net_device *ndev)
 	u32 eis, ris2;
 
 	eis = ravb_read(ndev, EIS);
-	ravb_write(ndev, ~EIS_QFS, EIS);
+	ravb_write(ndev, ~(EIS_QFS | EIS_RESERVED_BITS), EIS);
 	if (eis & EIS_QFS) {
 		ris2 = ravb_read(ndev, RIS2);
-		ravb_write(ndev, ~(RIS2_QFF0 | RIS2_RFFF), RIS2);
+		ravb_write(ndev, ~(RIS2_QFF0 | RIS2_RFFF | RIS2_RESERVED_BITS),
+			   RIS2);
 
 		/* Receive Descriptor Empty int */
 		if (ris2 & RIS2_QFF0)
@@ -913,7 +914,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 		/* Processing RX Descriptor Ring */
 		if (ris0 & mask) {
 			/* Clear RX interrupt */
-			ravb_write(ndev, ~mask, RIS0);
+			ravb_write(ndev, ~(mask | RIS0_RESERVED_BITS), RIS0);
 			if (ravb_rx(ndev, &quota, q))
 				goto out;
 		}
@@ -925,7 +926,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 
 			spin_lock_irqsave(&priv->lock, flags);
 			/* Clear TX interrupt */
-			ravb_write(ndev, ~mask, TIS);
+			ravb_write(ndev, ~(mask | TIS_RESERVED_BITS), TIS);
 			ravb_tx_free(ndev, q, true);
 			netif_wake_subqueue(ndev, q);
 			mmiowb();
diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index eede70ec37f8..ba3017ca5577 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -319,7 +319,7 @@ void ravb_ptp_interrupt(struct net_device *ndev)
 		}
 	}
 
-	ravb_write(ndev, ~gis, GIS);
+	ravb_write(ndev, ~(gis | GIS_RESERVED_BITS), GIS);
 }
 
 void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev)
-- 
2.11.0
