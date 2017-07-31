Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdGaPU5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:20:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 35/38] ARM: dts: rskrza1: Add Ethernet pin group
Date: Mon, 31 Jul 2017 17:19:47 +0200
Message-Id: <4cb674cd204dc95eeb6d1ea11735510ee6b02180.1501514100.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Add pin configuration for Ethernet.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 5fac0f82d742..cedf887e809a 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -55,6 +55,29 @@
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
 			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
 	};
+
+	/* Ethernet */
+	ether_pins: ether {
+		/* Ethernet on Ports 1,2,3,5 */
+		pinmux = <RZA1_PINMUX(1, 14, 4)>,	/* ET_COL   */
+			 <RZA1_PINMUX(5, 9, 2)>,	/* ET_MDC   */
+			 <RZA1_PINMUX(3, 3, 2)>,	/* ET_MDIO  */
+			 <RZA1_PINMUX(3, 4, 2)>,	/* ET_RXCLK */
+			 <RZA1_PINMUX(3, 5, 2)>,	/* ET_RXER  */
+			 <RZA1_PINMUX(3, 6, 2)>,	/* ET_RXDV  */
+			 <RZA1_PINMUX(2, 0, 2)>,	/* ET_TXCLK */
+			 <RZA1_PINMUX(2, 1, 2)>,	/* ET_TXER  */
+			 <RZA1_PINMUX(2, 2, 2)>,	/* ET_TXEN  */
+			 <RZA1_PINMUX(2, 3, 2)>,	/* ET_CRS   */
+			 <RZA1_PINMUX(2, 4, 2)>,	/* ET_TXD0  */
+			 <RZA1_PINMUX(2, 5, 2)>,	/* ET_TXD1  */
+			 <RZA1_PINMUX(2, 6, 2)>,	/* ET_TXD2  */
+			 <RZA1_PINMUX(2, 7, 2)>,	/* ET_TXD3  */
+			 <RZA1_PINMUX(2, 8, 2)>,	/* ET_RXD0  */
+			 <RZA1_PINMUX(2, 9, 2)>,	/* ET_RXD1  */
+			 <RZA1_PINMUX(2, 10, 2)>,	/* ET_RXD2  */
+			 <RZA1_PINMUX(2, 11, 2)>;	/* ET_RXD3  */
+	};
 };
 
 &mtu2 {
@@ -62,6 +85,8 @@
 };
 
 &ether {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ether_pins>;
 	status = "okay";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-- 
2.1.4
