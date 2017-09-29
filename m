Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752242AbdI2Lxs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 21/22] arm64: dts: renesas: r8a7795: add USB3.0 peripheral device node
Date: Fri, 29 Sep 2017 13:52:30 +0200
Message-Id: <3bdba1b26771496ad8db8cd948ce144fc1ce1ca2.1506678250.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506678250.git.horms+renesas@verge.net.au>
References: <cover.1506678250.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch adds USB3.0 peripheral channel 0 device node for r8a7795.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 5d5174d8635d..d5cfd1a1c539 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1471,6 +1471,17 @@
 			status = "disabled";
 		};
 
+		usb3_peri0: usb@ee020000 {
+			compatible = "renesas,r8a7795-usb3-peri",
+				     "renesas,rcar-gen3-usb3-peri";
+			reg = <0 0xee020000 0 0x400>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			status = "disabled";
+		};
+
 		usb_dmac0: dma-controller@e65a0000 {
 			compatible = "renesas,r8a7795-usb-dmac",
 				     "renesas,usb-dmac";
-- 
2.1.4
