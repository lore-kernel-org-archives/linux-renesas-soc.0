Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42673 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbeJ1BP4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Oct 2018 21:15:56 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
Date: Sat, 27 Oct 2018 18:34:10 +0200
Message-Id: <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
array and the VCCQ supplies the bus. On this particular board, the VCC is
connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
the pinmux to match the bus, which is always operating in 1.8V mode.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7d3d866a0063..d9a309b28fcf 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -602,7 +602,7 @@
 	sdhi2_pins: sd2 {
 		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
-		power-source = <3300>;
+		power-source = <1800>;
 	};
 
 	sdhi2_pins_uhs: sd2_uhs {
-- 
2.17.1
