Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34454 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbeHKNgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Aug 2018 09:36:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id c13-v6so10362887wrt.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Aug 2018 04:03:02 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: silk: Add DA9063 RTC and OnKey node
Date: Sat, 11 Aug 2018 13:02:57 +0200
Message-Id: <20180811110257.31690-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add DA9063 RTC and OnKey subnode to DA9063 PMIC node on Silk.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: Pressing the POWER Switch SW11 triggers KEY_POWER event, which
      ie. systemd interprets as shutdown command.
NOTE: The RTC is verified to work with hwclock -w / hwclock -r .
---
 arch/arm/boot/dts/r8a7794-silk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 6ea60e1faf75..60e91ebfa65d 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -416,6 +416,14 @@
 		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
+		onkey {
+			compatible = "dlg,da9063-onkey";
+		};
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
 		wdt {
 			compatible = "dlg,da9063-watchdog";
 		};
-- 
2.16.2
