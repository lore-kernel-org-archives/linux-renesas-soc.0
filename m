Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40370 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752018AbeBPSfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 13:35:25 -0500
Received: by mail-lf0-f67.google.com with SMTP id 37so5268474lfs.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 10:35:24 -0800 (PST)
Subject: [PATCH v2 4/5] arm64: dts: renesas: initial Condor board device tree
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Message-ID: <5cf82cb1-0278-010c-165d-07dbcbe0878d@cogentembedded.com>
Date: Fri, 16 Feb 2018 21:35:22 +0300
MIME-Version: 1.0
In-Reply-To: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial device  tree for  the R8A77980 SoC based Condor board.
The board has 1 debug serial port (SCIF0); include support for it, so
that the serial console can work.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- removed the useless "status" property from the SCIF_CLK node;
- fixed the memory size;
- added Geert's tag.

 arch/arm64/boot/dts/renesas/Makefile            |    1 
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   45 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/Makefile
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/Makefile
+++ renesas/arch/arm64/boot/dts/renesas/Makefile
@@ -8,4 +8,5 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-sa
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+/dts-v1/;
+#include "r8a77980.dtsi"
+
+/ {
+	model = "Renesas Condor board based on r8a77980";
+	compatible = "renesas,condor", "renesas,r8a77980";
+
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0 0x48000000 0 0xb8000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif0 {
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
