Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f174.google.com ([209.85.215.174]:45650 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbeJVCgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 22:36:31 -0400
Received: by mail-pg1-f174.google.com with SMTP id s3-v6so4733717pga.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 11:21:21 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 03:21:30 +0900
Message-Id: <154014609000.1639.15909663089954894139.sendpatchset@octo>
In-Reply-To: <154014607107.1639.11934965040569923.sendpatchset@octo>
References: <154014607107.1639.11934965040569923.sendpatchset@octo>
Subject: [PATCH 02/03] arm: dts: Include SoC name in DTSI for sh73a0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Update the SH-Mobile AG5 DTSI to include product name.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/sh73a0.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/sh73a0.dtsi
+++ work/arch/arm/boot/dts/sh73a0.dtsi	2018-10-22 02:59:17.767126025 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the SH73A0 SoC
+ * Device Tree Source for the SH-Mobile AG5 (R8A73A00/SH73A0) SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
