Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39183 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752670AbcGTITh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 04:19:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ARM: shmobile: r8a7794: tidyup SDHI register size on DTSI
Date: Wed, 20 Jul 2016 17:19:19 +0900
Message-Id: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

r8a7794 SDHI ch0 has SD_DMACR which is located in 0x324.
This patch updates register size

Based on work for the r8a7790 by Kuninori Morimoto.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Found by inspection
Compile tested only
---
 arch/arm/boot/dts/r8a7794.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 685f986cf962..9b36f58dff41 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -697,7 +697,7 @@
 
 	sdhi0: sd@ee100000 {
 		compatible = "renesas,sdhi-r8a7794";
-		reg = <0 0xee100000 0 0x200>;
+		reg = <0 0xee100000 0 0x384>;
 		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7794_CLK_SDHI0>;
 		dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
-- 
2.7.0.rc3.207.g0ac5344
