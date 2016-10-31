Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:42882 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944933AbcJaRIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 13:08:25 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/5] arm64: dts: r8a7796: Enable ipmmu_ds0 and ipmmu_mm
Date: Mon, 31 Oct 2016 18:08:21 +0100
Message-Id: <1477933702-13423-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the IPMMU for Ethernet AVB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f6d15805b75031bb..dc416c300968b0e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -303,7 +303,7 @@
 			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
+			status = "okay";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -320,7 +320,7 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
+			status = "okay";
 		};
 
 		cpg: clock-controller@e6150000 {
-- 
1.9.1
