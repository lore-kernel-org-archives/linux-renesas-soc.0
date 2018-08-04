Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:55294 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:16:47 -0400
Received: by mail-wm0-f67.google.com with SMTP id c14-v6so9993902wmb.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:14:28 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH 13/14] arm64: dts: renesas: r8a77965: Add HSCIF0 device node
Date: Sun,  5 Aug 2018 01:11:13 +0200
Message-Id: <20180804231114.21420-14-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-1-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add hscif0 node to avoid below r8a77965-ulcb-kf.dtb build failure:
Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:36.1-8 Label or path hscif0 not found

Inspired from v4.12-rc1 commits:
 - commit 68cd16107260 ("arm64: dts: r8a7796 dtsi: Add all HSCIF nodes")
 - commit 6d50bb893504 ("arm64: dts: r8a7796: Enable HSCIF DMA")
 - commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index cb8f8573d9ef..53405af41e34 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -451,6 +451,24 @@
 			status = "disabled";
 		};
 
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a77965",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6540000 0 0x60>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
+			       <&dmac2 0x31>, <&dmac2 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			status = "disabled";
+		};
+
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a7796",
 				     "renesas,rcar-gen3-usbhs";
-- 
2.18.0
