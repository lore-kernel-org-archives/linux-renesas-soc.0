Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35458 "EHLO
        mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750979AbcITMUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 08:20:43 -0400
Received: by mail-pa0-f66.google.com with SMTP id hi10so872995pac.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2016 05:20:43 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Sep 2016 21:12:11 +0900
Message-Id: <20160920121211.14870.27506.sendpatchset@little-apple>
Subject: [PATCH/RFC] ARM: dts: r8a7790: IPMMU-DS SYS-DMAC prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the SYS-DMAC devices to IPMMU-DS on r8a7790 and enable that
particular IPMMU instance. Depending on kernel version LPAE may need
to be enabled before the IPMMU driver becomes available.

Useful to test the IPMMU with the devices hooked up to the SYS-DMAC
via the DMA Engine framework together with the following workaround:
[PATCH/RFC] iommu/ipmmu-vmsa: IPMMU SYS-DMAC iova mapping workaround

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Tested with renesas-drivers-2016-09-13-v4.8-rc6

 arch/arm/boot/dts/r8a7790.dtsi |   31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

--- 0003/arch/arm/boot/dts/r8a7790.dtsi
+++ work/arch/arm/boot/dts/r8a7790.dtsi	2016-09-20 20:23:34.420607110 +0900
@@ -362,6 +362,21 @@
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 		#dma-cells = <1>;
 		dma-channels = <15>;
+		iommus = <&ipmmu_ds 0>,
+		       <&ipmmu_ds 1>,
+		       <&ipmmu_ds 2>,
+		       <&ipmmu_ds 3>,
+		       <&ipmmu_ds 4>,
+		       <&ipmmu_ds 5>,
+		       <&ipmmu_ds 6>,
+		       <&ipmmu_ds 7>,
+		       <&ipmmu_ds 8>,
+		       <&ipmmu_ds 9>,
+		       <&ipmmu_ds 10>,
+		       <&ipmmu_ds 11>,
+		       <&ipmmu_ds 12>,
+		       <&ipmmu_ds 13>,
+		       <&ipmmu_ds 14>;
 	};
 
 	dmac1: dma-controller@e6720000 {
@@ -393,6 +408,21 @@
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 		#dma-cells = <1>;
 		dma-channels = <15>;
+		iommus = <&ipmmu_ds 15>,
+		       <&ipmmu_ds 16>,
+		       <&ipmmu_ds 17>,
+		       <&ipmmu_ds 18>,
+		       <&ipmmu_ds 19>,
+		       <&ipmmu_ds 20>,
+		       <&ipmmu_ds 21>,
+		       <&ipmmu_ds 22>,
+		       <&ipmmu_ds 23>,
+		       <&ipmmu_ds 24>,
+		       <&ipmmu_ds 25>,
+		       <&ipmmu_ds 26>,
+		       <&ipmmu_ds 27>,
+		       <&ipmmu_ds 28>,
+		       <&ipmmu_ds 29>;
 	};
 
 	audma0: dma-controller@ec700000 {
@@ -1877,7 +1907,6 @@
 		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	ipmmu_mp: mmu@ec680000 {
