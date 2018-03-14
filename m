Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:49106 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751556AbeCNMKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 08:10:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] arm64: dts: renesas: ulcb: Configure PMIC for DDR Backup Power
Date: Wed, 14 Mar 2018 13:09:46 +0100
Message-Id: <1521029386-29975-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
References: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On the R-Car Starter Kit Premier/Pro, all of the DDR0, DDR1, DDR0C, and
DDR1C power rails need to be kept powered when backup mode is enabled.
Reflect this in the "rohm,ddr-backup-power" property for the BD9571MWV
PMIC node.

The accessory power switch (SW8) is a momentary switch, hense specify
"rohm,rstbmode-pulse".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index bb21ae335e8b8489..6caf2e4b776faf40 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -256,6 +256,8 @@
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <15>;
+		rohm,rstbmode-pulse;
 
 		regulators {
 			dvfs: dvfs {
-- 
2.7.4
