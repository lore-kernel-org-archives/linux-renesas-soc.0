Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41514 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbeHTRUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 13:20:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id s15-v6so4076590pgv.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 07:04:49 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 20 Aug 2018 23:04:44 +0900
Message-Id: <153477388406.17364.12188160262873747451.sendpatchset@octo>
Subject: [PATCH] arm: dts: Include R-Car Gen1 product name in DTSI files
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Browsing the DTS for all the R-Car SoCs with similar part numbers
still makes my head hurt, so to improve the user friendliness of
the 32-bit ARM DTS code base include R-Car Gen1 product names for
each DTSI file.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Based on renesas-devel-20180810-v4.18-rc7

 arch/arm/boot/dts/r8a7778.dtsi |    2 +-
 arch/arm/boot/dts/r8a7779.dtsi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- 0001/arch/arm/boot/dts/r8a7778.dtsi
+++ work/arch/arm/boot/dts/r8a7778.dtsi	2018-08-20 22:54:32.819084747 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for Renesas r8a7778
+ * Device Tree Source for the R-Car M1A (R8A77781) SoC
  *
  * Copyright (C) 2013  Renesas Solutions Corp.
  * Copyright (C) 2013  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
--- 0001/arch/arm/boot/dts/r8a7779.dtsi
+++ work/arch/arm/boot/dts/r8a7779.dtsi	2018-08-20 22:54:05.579741880 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for Renesas r8a7779
+ * Device Tree Source for the R-Car H1 (R8A77790) SoC
  *
  * Copyright (C) 2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Simon Horman
