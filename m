Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:33095 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbcITMPQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 08:15:16 -0400
Received: by mail-pa0-f67.google.com with SMTP id oz2so874848pac.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2016 05:15:16 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Sep 2016 21:06:45 +0900
Message-Id: <20160920120645.14819.80249.sendpatchset@little-apple>
Subject: [PATCH/RFC] ARM: dts: r8a7790: IPMMU-MX DU prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

These two hunks of code enable the r8a7790 IPMMU-MX instance together with
the DU device on r8a7790. Depending on kernel version LPAE may need to
be enabled before the IPMMU driver becomes available.

Useful to test the IPMMU with the DU via the VGA port on r8a7790 Lager.

# modetest -M rcar-du -s 60:800x600

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Tested with renesas-drivers-2016-09-13-v4.8-rc6

 arch/arm/boot/dts/r8a7790.dtsi |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/r8a7790.dtsi
+++ work/arch/arm/boot/dts/r8a7790.dtsi	2016-09-20 20:17:26.000000000 +0900
@@ -985,6 +985,7 @@
 			 <&mstp7_clks R8A7790_CLK_LVDS0>,
 			 <&mstp7_clks R8A7790_CLK_LVDS1>;
 		clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
+		iommus = <&ipmmu_mx 15>, <&ipmmu_mx 16>;
 		status = "disabled";
 
 		ports {
@@ -1893,7 +1894,7 @@
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
-		status = "disabled";
+		status = "okay";
 	};
 
 	ipmmu_rt: mmu@ffc80000 {
