Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36546 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbeIQOGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:06:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id p5-v6so7085081plk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:39:40 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:39:39 +0900
Message-Id: <153717357933.480.16204445206291701317.sendpatchset@octo>
In-Reply-To: <153717356234.480.6698281193817518888.sendpatchset@octo>
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
Subject: [PATCH 02/03] arm: dts: Include R-Car Gen2 product name in DTSI files
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Improve the user friendliness of the DTS code base by including the
R-Car product name in each R-Car Gen2 DTSI file.

The product names are taken from:
Documentation/devicetree/bindings/arm/shmobile.txt

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Developed on top of renesas-devel-20180914-v4.19-rc3

 arch/arm/boot/dts/r8a7790.dtsi |    2 +-
 arch/arm/boot/dts/r8a7791.dtsi |    2 +-
 arch/arm/boot/dts/r8a7792.dtsi |    2 +-
 arch/arm/boot/dts/r8a7793.dtsi |    2 +-
 arch/arm/boot/dts/r8a7794.dtsi |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

--- 0001/arch/arm/boot/dts/r8a7790.dtsi
+++ work/arch/arm/boot/dts/r8a7790.dtsi	2018-09-17 16:22:22.002897845 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7790 SoC
+ * Device Tree Source for the R-Car H2 (R8A77900) SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corporation
  * Copyright (C) 2013-2014 Renesas Solutions Corp.
--- 0001/arch/arm/boot/dts/r8a7791.dtsi
+++ work/arch/arm/boot/dts/r8a7791.dtsi	2018-09-17 16:22:47.249221466 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7791 SoC
+ * Device Tree Source for the R-Car M2-W (R8A77910) SoC
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  * Copyright (C) 2013-2014 Renesas Solutions Corp.
--- 0001/arch/arm/boot/dts/r8a7792.dtsi
+++ work/arch/arm/boot/dts/r8a7792.dtsi	2018-09-17 16:23:16.352747315 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7792 SoC
+ * Device Tree Source for the R-Car V2H (R8A77920) SoC
  *
  * Copyright (C) 2016 Cogent Embedded Inc.
  */
--- 0001/arch/arm/boot/dts/r8a7793.dtsi
+++ work/arch/arm/boot/dts/r8a7793.dtsi	2018-09-17 16:23:38.337899965 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7793 SoC
+ * Device Tree Source for the R-Car M2-N (R8A77930) SoC
  *
  * Copyright (C) 2014-2015 Renesas Electronics Corporation
  */
--- 0001/arch/arm/boot/dts/r8a7794.dtsi
+++ work/arch/arm/boot/dts/r8a7794.dtsi	2018-09-17 16:23:53.752708146 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7794 SoC
+ * Device Tree Source for the R-Car E2 (R8A77940) SoC
  *
  * Copyright (C) 2014 Renesas Electronics Corporation
  * Copyright (C) 2014 Ulrich Hecht
