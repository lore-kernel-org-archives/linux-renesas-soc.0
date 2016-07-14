Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36636 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751051AbcGNVCD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 17:02:03 -0400
Received: by mail-lf0-f50.google.com with SMTP id q132so73331559lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2016 14:02:03 -0700 (PDT)
Date: Thu, 14 Jul 2016 14:02:01 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] ARM: dts: blanche: add Ethernet pins
Message-ID: <2472815.TZ6Lha6VX2@wasted.cogentembedded.com>
In-Reply-To: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the (previously omitted) pin data for the SMSC LAN89218 Ethernet chip
to  the Blanche board's device tree:  the chip's IRQ output is connected to
the SoC's IRQ0 pin and its nCS input is connected to the SoC's EX_CS0# pin.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- killed extra empty line;
- reformatted the changelog.

 arch/arm/boot/dts/r8a7792-blanche.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -50,6 +50,9 @@
 		reg-io-width = <4>;
 		vddvario-supply = <&d3_3v>;
 		vdd33a-supply = <&d3_3v>;
+
+		pinctrl-0 = <&lan89218_pins>;
+		pinctrl-names = "default";
 	};
 };
 
@@ -67,6 +70,17 @@
 		groups = "scif3_data";
 		function = "scif3";
 	};
+
+	lan89218_pins: lan89218 {
+		intc {
+			groups = "intc_irq0";
+			function = "intc";
+		};
+		lbsc {
+			groups = "lbsc_ex_cs0";
+			function = "lbsc";
+		};
+	};
 };
 
 &scif0 {
