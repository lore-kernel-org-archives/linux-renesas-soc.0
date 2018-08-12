Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34974 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHLQLU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Aug 2018 12:11:20 -0400
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so6265557wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Aug 2018 06:33:14 -0700 (PDT)
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
Subject: [PATCH v2 4/7] arm64: dts: renesas: r8a77965: m3nulcb: Initial device tree
Date: Sun, 12 Aug 2018 15:31:46 +0200
Message-Id: <20180812133149.7710-4-erosca@de.adit-jv.com>
In-Reply-To: <20180812133149.7710-1-erosca@de.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow the bare M3-N-based ULCB board to boot.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes in v2:
 - [Jacopo Mondi] Removed redundant license text. Added Reviewed-by.
 - [Simon Horman]
   - Renamed DTS 's/r8a77965-ulcb.dts/r8a77965-m3nulcb.dts/'
   - Renamed board name 's/M3-N ULCB/M3NULCB/'
   - Renamed compatible string 's/renesas,ulcb/renesas,m3nulcb/'
   - Adapted Makefile and commit summary line 's/ulcb/m3nulcb/'
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a77965-m3nulcb.dts     | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 9e2394bc3c62..eb158d1f90e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts
new file mode 100644
index 000000000000..964078b6cc49
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the M3NULCB (R-Car Starter Kit Pro) board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+/dts-v1/;
+#include "r8a77965.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas M3NULCB board based on r8a77965";
+	compatible = "renesas,m3nulcb", "renesas,r8a77965";
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
