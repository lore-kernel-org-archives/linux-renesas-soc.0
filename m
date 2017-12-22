Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33901 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757624AbdLVK3b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 05:29:31 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/11] arm64: dts: renesas: salvator-common: Add EthernetAVB PHY reset
Date: Fri, 22 Dec 2017 11:29:13 +0100
Message-Id: <f5bbcd533a9d1af97b8a0862a421bb8455f1bf6d.1513936761.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1513936760.git.horms+renesas@verge.net.au>
References: <cover.1513936760.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Describe the GPIO used to reset the Ethernet PHY for EthernetAVB.
This allows the driver to reset the PHY during probe and after system
resume.

This fixes Ethernet operation after resume from s2ram on Salvator-XS,
where the enable pin of the regulator providing PHY power is connected
to PRESETn, and PSCI powers down the SoC during system suspend.

On Salvator-X, the enable pin is always pulled high, but the driver may
still need to reset the PHY if this wasn't done by the bootloader
before.

Inspired by patches in the BSP for the individual Salvator-X/XS boards
by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index b9505a65a793..4e800e933944 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -264,6 +264,7 @@
 		reg = <0>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.11.0
