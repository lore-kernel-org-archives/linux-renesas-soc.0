Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:41862 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937365AbeFSPRd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 11:17:33 -0400
Received: by mail-pl0-f67.google.com with SMTP id w8-v6so17573ply.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 08:17:33 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Jun 2018 00:19:11 +0900
Message-Id: <152942155173.28480.9146351774134316184.sendpatchset@little-apple>
In-Reply-To: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
References: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
Subject: [PATCH 03/04] arm64: dts: renesas: r8a77990: hook up I2C0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

A hack to add I2C0 on r8a77990. This is needed to hook up the video decoder.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0003/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-06-19 21:07:37.440607110 +0900
@@ -191,6 +191,20 @@
 			#power-domain-cells = <1>;
 		};
 
+		i2c0: i2c@e6500000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 931>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 931>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77990",
 				     "renesas,etheravb-rcar-gen3";
