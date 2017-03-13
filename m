Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: dmaengine@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        vinod.koul@intel.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, dan.j.williams@intel.com
Date: Mon, 13 Mar 2017 23:38:25 +0900
Message-Id: <148941590566.8144.9773823591196103378.sendpatchset@little-apple>
In-Reply-To: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
References: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
Subject: [PATCH 3/3] arm64: dts: r8a7795: Use slow mode for TX on SCIF2/DEBUG1
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Experimental code to enable slow mode on r8a7795 for SCIF2 TX.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-13 23:16:41.350607110 +0900
@@ -771,7 +771,7 @@
 				 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>;
+			dmas = <&dmac1 0xf13>, <&dmac1 0x12>;
 			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
