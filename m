Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19671 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751358AbdJPKNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 06:13:40 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH  2/2] ARM: dts: r8a7743: Add xhci support to SoC dtsi
Date: Mon, 16 Oct 2017 11:12:49 +0100
Message-Id: <1508148769-47488-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add node for xhci. Boards DT files will enable it if needed.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 699c040..386bf07 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -931,6 +931,26 @@
 			status = "disabled";
 		};
 
+		/*
+		 * pci1 and xhci share the same phy, therefore only one of them
+		 * can be active at any one time. If both of them are enabled,
+		 * a race condition will determine who'll control the phy.
+		 * A firmware file is needed by the xhci driver in order for
+		 * USB 3.0 to work properly.
+		 */
+		xhci: usb@ee000000 {
+			compatible = "renesas,xhci-r8a7743",
+				     "renesas,rcar-gen2-xhci";
+			reg = <0 0xee000000 0 0xc00>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			phys = <&usb2 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7743";
 			reg = <0 0xee100000 0 0x328>;
-- 
1.9.1
