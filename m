Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33243 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752327AbcJ1W3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 18:29:49 -0400
Received: by mail-lf0-f42.google.com with SMTP id x79so66900444lff.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 15:29:48 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/12] ARM: dts: sk-rzg1e: initial device tree
Date: Sat, 29 Oct 2016 01:29:45 +0300
Message-ID: <17390303.uDhVlFKVKX@wasted.cogentembedded.com>
In-Reply-To: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial  device tree for the R8A7745 SoC based SK-RZG1E board.
The board has 1  debug  serial  port (SCIF2); include support for it,
so that the serial console can  work.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/Makefile             |    1 
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts |   39 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

Index: renesas/arch/arm/boot/dts/Makefile
===================================================================
--- renesas.orig/arch/arm/boot/dts/Makefile
+++ renesas/arch/arm/boot/dts/Makefile
@@ -678,6 +678,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
 	r8a7743-sk-rzg1m.dtb \
+	r8a7745-sk-rzg1e.dtb \
 	r8a7778-bockw.dtb \
 	r8a7779-marzen.dtb \
 	r8a7790-lager.dtb \
Index: renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -0,0 +1,39 @@
+/*
+ * Device Tree Source for the SK-RZG1E board
+ *
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2. This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7745.dtsi"
+
+/ {
+	model = "SK-RZG1E";
+	compatible = "renesas,sk-rzg1e", "renesas,r8a7745";
+
+	aliases {
+		serial0 = &scif2;
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
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&scif2 {
+	status = "okay";
+};
