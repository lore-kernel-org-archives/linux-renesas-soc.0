Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:36226 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeGSMA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 08:00:28 -0400
Received: by mail-pl0-f66.google.com with SMTP id e11-v6so3508266plb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 04:17:47 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 19 Jul 2018 20:19:50 +0900
Message-Id: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI files
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Browsing the DTS for all the R-Car SoCs with similar part numbers
makes my head hurt, so to improve the user friendliness of the
DTS code base include R-Car product name in each DTSI file.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Based on renesas-drivers-2018-07-17-v4.18-rc5

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |    2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     |    2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     |    2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    |    2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    |    2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi    |    2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi    |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi	2018-07-19 20:04:10.900607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7795 ES1.x SoC
+ * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2018-07-19 20:04:21.030607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7795 SoC
+ * Device Tree Source for the R-Car H3 (R8A77950) SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
--- 0001/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7796.dtsi	2018-07-19 20:04:53.310607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7796 SoC
+ * Device Tree Source for the R-Car M3-W (R8A77960) SoC
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  */
--- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2018-07-19 20:05:24.380607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77965 SoC
+ * Device Tree Source for the R-Car M3-N (R8A77965) SoC
  *
  * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
  *
--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-07-19 20:06:31.090607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77970 SoC
+ * Device Tree Source for the R-Car V3M (R8A77970) SoC
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
--- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi	2018-07-19 20:06:16.310607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77980 SoC
+ * Device Tree Source for the R-Car V3H (R8A77980) SoC
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-07-19 20:06:58.970607110 +0900
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Device Tree Source for the r8a77990 SoC
+ * Device Tree Source for the R-Car E3 (R8A77990) SoC
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
--- 0005/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77995.dtsi	2018-07-19 20:07:20.150607110 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77995 SoC
+ * Device Tree Source for the R-Car D3 (R8A77995) SoC
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
