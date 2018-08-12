Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38109 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHLQLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Aug 2018 12:11:39 -0400
Received: by mail-wm0-f67.google.com with SMTP id t25-v6so6224429wmi.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Aug 2018 06:33:34 -0700 (PDT)
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
Subject: [PATCH v2 7/7] arm64: dts: renesas: r8a77965: m3nulcb-kf: Initial device tree
Date: Sun, 12 Aug 2018 15:31:49 +0200
Message-Id: <20180812133149.7710-7-erosca@de.adit-jv.com>
In-Reply-To: <20180812133149.7710-1-erosca@de.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is based on the existing KF device tree sources:
$ ls -1 arch/arm64/boot/dts/renesas/*-kf.dts
arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
Changes in v2:
 - [Jacopo Mondi] Removed redundant license text.
 - [Simon Horman]
   - Renamed DTS 's/r8a77965-ulcb-kf.dts/r8a77965-m3nulcb-kf.dts/'
   - Renamed board name 's/M3-N ULCB/M3NULCB/'
   - Renamed compatible string 's/renesas,ulcb/renesas,m3nulcb/'
   - Adapted Makefile and commit summary line 's/ulcb-kf/m3nulcb-kf/'
 - Documented the source of inspiration in the commit description.
---
 arch/arm64/boot/dts/renesas/Makefile             |  1 +
 .../boot/dts/renesas/r8a77965-m3nulcb-kf.dts     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index eb158d1f90e9..a8ce6594342d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts
new file mode 100644
index 000000000000..dadad97051b9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the M3NULCB Kingfisher board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+#include "r8a77965-m3nulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas M3NULCB Kingfisher board based on r8a77965";
+	compatible = "shimafuji,kingfisher", "renesas,m3nulcb",
+		     "renesas,r8a77965";
+};
-- 
2.18.0
