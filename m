Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:36349 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbcELUk2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 16:40:28 -0400
Received: by mail-lb0-f178.google.com with SMTP id h1so16538146lbj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 13:40:27 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/6] ARM: dts: r8a7794: add audio clocks
Date: Thu, 12 May 2016 23:40:24 +0300
Message-ID: <2753859.2OOnqVymyK@wasted.cogentembedded.com>
In-Reply-To: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe  the external audio clocks (signals AUDIO_CLK[ABC]) required by
the sound driver.  Boards that provide audio clocks need to  override the
clock frequencies.

This patch is based on the commit 0d3dbde84a45 ("ARM: shmobile: r8a7791:
add  audio clock on DTSI").

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- removed now redundant "clock-output-names" properties;
- reformatted the changelog;
- refreshed the patch.

 arch/arm/boot/dts/r8a7794.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -920,6 +920,27 @@
 			clock-frequency = <0>;
 		};
 
+		/*
+		 * The external audio clocks are configured  as 0 Hz fixed
+		 * frequency clocks by default.  Boards that provide audio
+		 * clocks should override them.
+		 */
+		audio_clka: audio_clka {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+		audio_clkb: audio_clkb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+		audio_clkc: audio_clkc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7794-cpg-clocks",
