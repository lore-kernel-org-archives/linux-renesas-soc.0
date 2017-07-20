Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41406 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935274AbdGTMzK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 08:55:10 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] arm64: dts: renesas: Add Renesas Draak board support
Date: Thu, 20 Jul 2017 14:54:35 +0200
Message-Id: <1500555277-22921-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Basic support for the Renesas Draak board based on R-Car D3:
  - Memory,
  - Main crystal,
  - Serial console,
  - Watchdog.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile           |  1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 46 ++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77995-draak.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index acc4bb30d485b6bc..381928bc1358fd9c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 always		:= $(dtb-y)
 clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
new file mode 100644
index 0000000000000000..d144370051d559fc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -0,0 +1,46 @@
+/*
+ * Device Tree Source for the Draak board
+ *
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2017 Glider bvba
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a77995.dtsi"
+
+/ {
+	model = "Renesas Draak board based on r8a77995";
+	compatible = "renesas,draak", "renesas,r8a77995";
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
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x18000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <48000000>;
+};
+
+&scif2 {
+	status = "okay";
+};
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.7.4
