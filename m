Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f179.google.com ([209.85.217.179]:46501 "EHLO
        mail-ua0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751318AbdINOSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 10:18:55 -0400
Received: by mail-ua0-f179.google.com with SMTP id q29so3851745uaf.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2017 07:18:54 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
Date: Thu, 14 Sep 2017 17:18:52 +0300
Message-Id: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial device tree for the M3ULCB with Kingfisher extension
infotainment board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- added own compatible value "shimafuji,kingfisher"

 arch/arm64/boot/dts/renesas/Makefile              |  1 +
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 381928b..54e8316 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
new file mode 100644
index 0000000..22fad76c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
@@ -0,0 +1,19 @@
+/*
+ * Device Tree Source for the M3ULCB Kingfisher board
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7796-m3ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas M3ULCB Kingfisher board based on r8a7796";
+	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
+		     "renesas,r8a7796";
+};
-- 
1.9.1
