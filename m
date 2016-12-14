Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36555 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933061AbcLNWH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 17:07:56 -0500
Received: by mail-wm0-f49.google.com with SMTP id g23so135317895wme.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Dec 2016 14:07:55 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: r8a7791: link DU to VSPDs
Date: Thu, 15 Dec 2016 01:07:52 +0300
Message-ID: <1922293.x1RvWWSErN@wasted.cogentembedded.com>
In-Reply-To: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the "vsps" property to the DU device node in order to link this node to
the VSPD nodes.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20161212-v4.9' of Simon Horman's
'renesas.git' repo.  It's  only meaningful if the DU driver patch I've just
posted is applied.

 arch/arm/boot/dts/r8a7791.dtsi |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
+++ renesas/arch/arm/boot/dts/r8a7791.dtsi
@@ -989,7 +989,7 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 	};
 
-	vsp1@fe930000 {
+	vspd0: vsp1@fe930000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe930000 0 0x8000>;
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -997,7 +997,7 @@
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 	};
 
-	vsp1@fe938000 {
+	vspd1: vsp1@fe938000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe938000 0 0x8000>;
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
@@ -1016,6 +1016,7 @@
 			 <&mstp7_clks R8A7791_CLK_DU1>,
 			 <&mstp7_clks R8A7791_CLK_LVDS0>;
 		clock-names = "du.0", "du.1", "lvds.0";
+		vsps = <&vspd0 &vspd1>;
 		status = "disabled";
 
 		ports {
