Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f171.google.com ([209.85.210.171]:37048 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbeJVCgW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 22:36:22 -0400
Received: by mail-pf1-f171.google.com with SMTP id j23-v6so18768592pfi.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 11:21:12 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 03:21:20 +0900
Message-Id: <154014608058.1639.12857673515083729924.sendpatchset@octo>
In-Reply-To: <154014607107.1639.11934965040569923.sendpatchset@octo>
References: <154014607107.1639.11934965040569923.sendpatchset@octo>
Subject: [PATCH 01/03] arm: dts: Include SoC name in DTSI for r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Update the R-Mobile A1 DTSI to include product name.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7740.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/r8a7740.dtsi
+++ work/arch/arm/boot/dts/r8a7740.dtsi	2018-10-22 02:56:36.462669081 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7740 SoC
+ * Device Tree Source for the R-Mobile A1 (R8A77400) SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
