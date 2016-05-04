Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:50000 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757820AbcEDI6F (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 4 May 2016 04:58:05 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: kzm9g: SCIFA4 supports RTS/CTS hardware flow control
Date: Wed,  4 May 2016 10:57:57 +0200
Message-Id: <1462352278-30327-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1462352278-30327-1-git-send-email-geert+renesas@glider.be>
References: <1462352278-30327-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On the KZM-A9-GT development board, the RTS and CTS pins of the debug
console SCIFA4 are wired to the CP2102 Serial-USB bridge.  Reflect
this in the DTS by adding the "uart-has-rtscts" property to the scifa4
device node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0-kzm9g.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index e6b2ef3785c7542a..b393b1f5bee24574 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -378,6 +378,7 @@
 	pinctrl-0 = <&scifa4_pins>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
1.9.1
