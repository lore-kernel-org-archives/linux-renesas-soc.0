Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39580 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbeIQOGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:06:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id j8-v6so7222054pff.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:39:49 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:39:47 +0900
Message-Id: <153717358781.480.8395569978640568774.sendpatchset@octo>
In-Reply-To: <153717356234.480.6698281193817518888.sendpatchset@octo>
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
Subject: [PATCH 03/03] arm: dts: R-Car Gen1 board comment update
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Include R-Car Gen1 product names for Bock-W and Marzen.

The product names are taken from:
Documentation/devicetree/bindings/arm/shmobile.txt

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Developed on top of renesas-devel-20180914-v4.19-rc3

 arch/arm/boot/dts/r8a7778-bockw.dts  |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- 0001/arch/arm/boot/dts/r8a7778-bockw.dts
+++ work/arch/arm/boot/dts/r8a7778-bockw.dts	2018-09-17 12:47:10.561971790 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Reference Device Tree Source for the Bock-W board
+ * Reference Device Tree Source for the R-Car M1A (R8A77781) Bock-W board
  *
  * Copyright (C) 2013  Renesas Solutions Corp.
  * Copyright (C) 2013  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
--- 0001/arch/arm/boot/dts/r8a7779-marzen.dts
+++ work/arch/arm/boot/dts/r8a7779-marzen.dts	2018-09-17 12:47:35.744292059 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Marzen board
+ * Device Tree Source for the R-Car H1 (R8A77790) Marzen board
  *
  * Copyright (C) 2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Simon Horman
