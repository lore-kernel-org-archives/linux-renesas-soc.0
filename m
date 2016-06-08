Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcFHA7y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 20:59:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] arm64: dts: salvator-x: SCIF1 supports RTS/CTS hardware flow control
Date: Wed,  8 Jun 2016 09:59:38 +0900
Message-Id: <3cac478cce564c11f56f30bd16530c2757b3e4f3.1465347183.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347183.git.horms+renesas@verge.net.au>
References: <cover.1465347183.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

On the Salvator-X development board, the RTS and CTS pins of debug
serial-1 port SCIF1 are wired to the CP2102 Serial-USB bridge.  Reflect
this in the DTS by adding the "uart-has-rtscts" property to the scif1
device node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 9f561c943f6f..76bc94a528aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -208,6 +208,7 @@
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
2.1.4
