Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40890 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753584AbeD2S0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Apr 2018 14:26:49 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: salvator-common: add eeprom
Date: Sun, 29 Apr 2018 20:26:39 +0200
Message-Id: <20180429182639.6243-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the EEPROM found on Salvator-X and -XS boards for H3, M3-W, and M3-N
on the IIC_DVFS bus.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Always nice for I2C debugging to have en EEPROM around...

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index b5b9b83bd972..1b686602f418 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -492,6 +492,12 @@
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "rohm,br24t01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
 };
 
 &ohci0 {
-- 
2.11.0
