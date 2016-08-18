Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49548 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754406AbcHSA7j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:39 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 05B13208D2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 5/7] [HACK] ARM: shmobile: r8a7790: Link the VSP1 and DU
Date: Thu, 18 Aug 2016 19:03:58 +0300
Message-Id: <1471536240-25082-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In order to test VSP+DU integration for Gen3 on Gen2, link the VSPD
instances to the DU and modify their features to match the Gen3 VSPD.
Remove the IOMMU properties for the DU as memory is now accessed through
the VSPD.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 637cb8be363f..0ff45867e711 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -969,7 +969,7 @@
 		renesas,#wpf = <4>;
 	};
 
-	vsp1@fe930000 {
+	vsp1d0: vsp1@fe930000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe930000 0 0x8000>;
 		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
@@ -979,13 +979,11 @@
 		iommus = <&ipmmu_mx 5 &ipmmu_mx 13>;
 
 		renesas,has-lif;
-		renesas,has-lut;
 		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
+		renesas,#wpf = <1>;
 	};
 
-	vsp1@fe938000 {
+	vsp1d1: vsp1@fe938000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe938000 0 0x8000>;
 		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
@@ -995,10 +993,8 @@
 		iommus = <&ipmmu_mx 5 &ipmmu_mx 14>;
 
 		renesas,has-lif;
-		renesas,has-lut;
 		renesas,#rpf = <4>;
-		renesas,#uds = <1>;
-		renesas,#wpf = <4>;
+		renesas,#wpf = <1>;
 	};
 
 	du: display@feb00000 {
@@ -1018,7 +1014,7 @@
 		clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
 		status = "disabled";
 
-		iommus = <&ipmmu_mx 15 &ipmmu_mx 16>;
+		vsps = <&vsp1d0 &vsp1d1>;
 
 		ports {
 			#address-cells = <1>;
-- 
Regards,

Laurent Pinchart
