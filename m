Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41890 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbeGSMGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 08:06:03 -0400
Received: by mail-pl0-f65.google.com with SMTP id w8-v6so3512112ply.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 04:23:21 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 19 Jul 2018 20:25:25 +0900
Message-Id: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: renesas: r8a77995: Attach the SYS-DMAC to the IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to IPMMU-DS0 and IPMMU-DS1
following the R-Car Gen3 Rev.1.00 (April 2018) datasheet.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Based on renesas-drivers-2018-07-17-v4.18-rc5

 arch/arm64/boot/dts/renesas/r8a77995.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77995.dtsi	2018-07-19 19:57:01.350607110 +0900
@@ -356,6 +356,10 @@
 			resets = <&cpg 219>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>;
 		};
 
 		dmac1: dma-controller@e7300000 {
@@ -380,6 +384,10 @@
 			resets = <&cpg 218>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>;
 		};
 
 		dmac2: dma-controller@e7310000 {
@@ -404,6 +412,10 @@
 			resets = <&cpg 217>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
 		};
 
 		ipmmu_ds0: mmu@e6740000 {
