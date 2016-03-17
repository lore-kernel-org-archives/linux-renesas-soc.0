Return-Path: <SRS0+uua1=PN=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,joro@8bytes.org,geert+renesas@glider.be
Date: Fri, 18 Mar 2016 01:55:54 +0900
Message-Id: <20160317165554.28213.89797.sendpatchset@little-apple>
In-Reply-To: <20160317165527.28213.60694.sendpatchset@little-apple>
References: <20160317165527.28213.60694.sendpatchset@little-apple>
Subject: [PATCH/RFC 03/05] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

--- 0028/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-03-17 18:52:03.720513000 +0900
@@ -319,6 +319,14 @@
 			power-domains = <&cpg>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
+			       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
+			       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
+			       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
+			       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
+			       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
+			       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
+			       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
 		};
 
 		audma1: dma-controller@ec720000 {
@@ -351,6 +359,14 @@
 			power-domains = <&cpg>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
+			       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
+			       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
+			       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
+			       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
+			       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
+			       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
+			       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 		};
 
 		pfc: pfc@e6060000 {
@@ -517,6 +533,14 @@
 			power-domains = <&cpg>;
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
@@ -550,6 +574,14 @@
 			power-domains = <&cpg>;
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
@@ -583,6 +615,14 @@
 			power-domains = <&cpg>;
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
 
 		avb: ethernet@e6800000 {
