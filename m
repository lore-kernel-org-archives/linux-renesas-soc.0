Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38314 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbcHOVxG (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 17:53:06 -0400
Received: by mail-wm0-f47.google.com with SMTP id o80so129128067wme.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2016 14:53:05 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: r8a7794: add VSP1 support
Date: Tue, 16 Aug 2016 00:52:58 +0300
Message-ID: <2191193.axSzE4vSGB@wasted.cogentembedded.com>
In-Reply-To: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe two instances (VSPS and VSPD0) of the VSP1 in the R8A7794 device
tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160815-v4.8-rc2' of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7794.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -894,6 +894,22 @@
 		};
 	};
 
+	vsp1@fe928000 {
+		compatible = "renesas,vsp1";
+		reg = <0 0xfe928000 0 0x8000>;
+		interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7794_CLK_VSP1_S>;
+		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+	};
+
+	vsp1@fe930000 {
+		compatible = "renesas,vsp1";
+		reg = <0 0xfe930000 0 0x8000>;
+		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7794_CLK_VSP1_DU0>;
+		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+	};
+
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7794";
 		reg = <0 0xfeb00000 0 0x40000>;
