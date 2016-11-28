Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:52947 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932105AbcK1LrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 06:47:01 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: r8a7795: salvator-x: Set drive-strength for ravb pins
Date: Mon, 28 Nov 2016 12:46:14 +0100
Message-Id: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The EthernetAVB should not depend on the bootloader to setup correct
drive-strength values. Values for drive-strength where found by examine
the registers after the bootloader have configured the registers and
successfully used the EthernetAVB.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 28 ++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index b1eab68..7f49d19 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -225,8 +225,32 @@
 	};
 
 	avb_pins: avb {
-		groups = "avb_mdc";
-		function = "avb";
+		mux {
+			groups = "avb_mdc", "avb_mii";
+			function = "avb";
+		};
+
+		pins_mdc {
+			groups = "avb_mdc";
+			drive-strength = <24>;
+		};
+
+		pins_mii_tx {
+			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
+			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
+			drive-strength = <12>;
+		};
+
+		pins_mii_rx {
+			pins = "PIN_AVB_RX_CTL", "PIN_AVB_RXC", "PIN_AVB_RD0",
+			       "PIN_AVB_RD1", "PIN_AVB_RD2", "PIN_AVB_RD3";
+			drive-strength = <24>;
+		};
+
+		pins_mii_clk {
+			pins = "PIN_AVB_TXCREFCLK";
+			drive-strength = <24>;
+		};
 	};
 
 	du_pins: du {
-- 
2.10.2
