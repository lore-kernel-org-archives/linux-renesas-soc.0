Return-Path: <SRS0+uua1=PN=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,joro@8bytes.org,geert+renesas@glider.be
Date: Fri, 18 Mar 2016 01:55:46 +0900
Message-Id: <20160317165546.28213.87659.sendpatchset@little-apple>
In-Reply-To: <20160317165527.28213.60694.sendpatchset@little-apple>
References: <20160317165527.28213.60694.sendpatchset@little-apple>
Subject: [PATCH/RFC 02/05] arm64: dts: r8a7795: Enable IPMMU-MM
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable r8a7795 IPMMU-MM node to allow the IPMMU main
device to be probed in case of driver support exists.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 -
 1 file changed, 1 deletion(-)

--- 0029/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-03-17 19:00:45.900513000 +0900
@@ -483,7 +483,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		dmac0: dma-controller@e6700000 {
