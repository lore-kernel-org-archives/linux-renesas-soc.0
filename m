Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35588 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbeIQNqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:46:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2-v6so7059666plo.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:19:50 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:19:49 +0900
Message-Id: <153717238926.32742.16468076576808713610.sendpatchset@octo>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Attach the SYS-DMAC to the IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

For R-Car E3 hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to
IPMMU-DS0 and IPMMU-DS1 in same way as for R-Car H3.
This follows the R-Car Gen3 Rev.1.00 (April 2018) datasheet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Developed on top of renesas-devel-20180914-v4.19-rc3
 
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-09-17 16:59:44.177451447 +0900
@@ -373,6 +373,14 @@
 			resets = <&cpg 219>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 		};
 
 		dmac1: dma-controller@e7300000 {
@@ -407,6 +415,14 @@
 			resets = <&cpg 218>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
+			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
+			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
+			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
+			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
 		};
 
 		dmac2: dma-controller@e7310000 {
@@ -441,6 +457,14 @@
 			resets = <&cpg 217>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
+			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
+			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
+			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
+			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
 		};
 
 		ipmmu_ds0: mmu@e6740000 {
