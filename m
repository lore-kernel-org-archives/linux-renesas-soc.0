Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:53263 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751283AbdIUFfF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 01:35:05 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a7795: add USB3.0 peripheral device node
Date: Thu, 21 Sep 2017 14:31:25 +0900
Message-Id: <1505971886-14916-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1505971886-14916-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1505971886-14916-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds USB3.0 peripheral channel 0 device node for r8a7795.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 0ccac86..cab70cf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2159,6 +2159,17 @@
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
1.9.1
