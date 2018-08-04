Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:53043 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:16:27 -0400
Received: by mail-wm0-f66.google.com with SMTP id o11-v6so9944209wmh.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:14:08 -0700 (PDT)
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
Subject: [PATCH 10/14] arm64: dts: renesas: r8a77965: ulcb: Initial device tree
Date: Sun,  5 Aug 2018 01:11:10 +0200
Message-Id: <20180804231114.21420-11-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-1-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow the bare M3-N-based ULCB board to boot.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 5debb02fad2c..ad7be9a8ca56 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
new file mode 100644
index 000000000000..4dde14738fb0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the M3-N ULCB (R-Car Starter Kit Pro) board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a77965.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas ULCB board based on r8a77965";
+	compatible = "renesas,ulcb", "renesas,r8a77965";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock5 1>,
+		 <&versaclock5 3>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.3";
+};
-- 
2.18.0
