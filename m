Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33619 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcFIVtP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 17:49:15 -0400
Received: by mail-lf0-f43.google.com with SMTP id f6so13871995lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2016 14:49:14 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 11/12] ARM: dts: blanche: initial device tree
Date: Fri, 10 Jun 2016 00:49:11 +0300
Message-ID: <1696555.qxkHIgkrXz@wasted.cogentembedded.com>
In-Reply-To: <1879394.3zBGLpF2nv@wasted.cogentembedded.com>
References: <1879394.3zBGLpF2nv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial device  tree for the R8A7792 SoC based Blanche board.
The board has 2 debug serial ports: SCIF0 and SCIF3; include support for
them,  so that  the serial console  can  work.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- added Renesas Electronics' copyright.

Changes in version 2:
- added Simon's ACK and Geert's tag too.

 arch/arm/boot/dts/Makefile            |    1 
 arch/arm/boot/dts/r8a7792-blanche.dts |   45 ++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

Index: renesas/arch/arm/boot/dts/Makefile
===================================================================
--- renesas.orig/arch/arm/boot/dts/Makefile
+++ renesas/arch/arm/boot/dts/Makefile
@@ -638,6 +638,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
 	r8a7790-lager.dtb \
 	r8a7791-koelsch.dtb \
 	r8a7791-porter.dtb \
+	r8a7792-blanche.dtb \
 	r8a7793-gose.dtb \
 	r8a7794-alt.dtb \
 	r8a7794-silk.dtb \
Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- /dev/null
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -0,0 +1,45 @@
+/*
+ * Device Tree Source for the Blanche board
+ *
+ * Copyright (C) 2014 Renesas Electronics Corporation
+ * Copyright (C) 2016 Cogent  Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7792.dtsi"
+
+/ {
+	model = "Blanche";
+	compatible = "renesas,blanche", "renesas,r8a7792";
+
+	aliases {
+		serial0 = &scif0;
+		serial1 = &scif3;
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
+&scif0 {
+	status = "okay";
+};
+
+&scif3 {
+	status = "okay";
+};
