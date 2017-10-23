Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:39515 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751548AbdJWRKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 13:10:45 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/9] ARM: dts: r8a7745: Add HS-USB device node
Date: Mon, 23 Oct 2017 18:09:26 +0100
Message-Id: <1508778570-28795-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

From: Biju Das <biju.das@bp.renesas.com>

Define the R8A7745 generic part of the HS-USB device node. It is up to the
board file to enable the device.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
Changes in v2:
* rebased

 arch/arm/boot/dts/r8a7745.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 3a50f70..40048da1 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -916,6 +916,20 @@
 			};
 		};
 
+		hsusb: usb@e6590000 {
+			compatible = "renesas,usbhs-r8a7745",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6590000 0 0x100>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>;
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			renesas,buswait = <4>;
+			phys = <&usb0 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		usbphy: usb-phy@e6590100 {
 			compatible = "renesas,usb-phy-r8a7745",
 				     "renesas,rcar-gen2-usb-phy";
-- 
2.7.4
