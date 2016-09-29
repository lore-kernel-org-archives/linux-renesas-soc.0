Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35365 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934511AbcI2Wef (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 18:34:35 -0400
Received: by mail-lf0-f42.google.com with SMTP id l131so92428328lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2016 15:34:34 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 11/12] ARM: dts: sk-rzg1m: initial device tree
Date: Fri, 30 Sep 2016 01:34:32 +0300
Message-ID: <2785627.2cnnnPXLS1@wasted.cogentembedded.com>
In-Reply-To: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
References: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial device  tree for the R8A7743 SoC based SK-RZG1M board.
The board has one debug serial port (SCIF0); include support for it, so
that  the serial  console  can work.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/Makefile             |    1 
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts |   44 +++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

Index: renesas/arch/arm/boot/dts/Makefile
===================================================================
--- renesas.orig/arch/arm/boot/dts/Makefile
+++ renesas/arch/arm/boot/dts/Makefile
@@ -654,6 +654,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
 	r7s72100-rskrza1.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
+	r8a7743-sk-rzg1m.dtb \
 	r8a7778-bockw.dtb \
 	r8a7779-marzen.dtb \
 	r8a7790-lager.dtb \
Index: renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -0,0 +1,44 @@
+/*
+ * Device Tree Source for the SK-RZG1M board
+ *
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2. This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7743.dtsi"
+
+/ {
+	model = "SK-RZG1M";
+	compatible = "renesas,sk-rzg1m", "renesas,r8a7743";
+
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+
+	memory@200000000 {
+		device_type = "memory";
+		reg = <2 0x00000000 0 0x40000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&scif0 {
+	status = "okay";
+};
