Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f180.google.com ([209.85.210.180]:44862 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbeJVCgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 22:36:41 -0400
Received: by mail-pf1-f180.google.com with SMTP id r9-v6so18759684pff.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 11:21:31 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 03:21:39 +0900
Message-Id: <154014609942.1639.1864795559248515734.sendpatchset@octo>
In-Reply-To: <154014607107.1639.11934965040569923.sendpatchset@octo>
References: <154014607107.1639.11934965040569923.sendpatchset@octo>
Subject: [PATCH 03/03] arm: dts: Include SoC name in DTSI for sh73a0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Update the Emma Mobile EV2 DTSI to include product name.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/emev2.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/emev2.dtsi
+++ work/arch/arm/boot/dts/emev2.dtsi	2018-10-22 03:00:57.044330962 +0900
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the EMEV2 SoC
+ * Device Tree Source for the Emma Mobile EV2 SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
