Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:50530 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936445AbeF2OvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 10:51:15 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: salvator-common: Prefer HSCIF1 over SCIF1
Date: Fri, 29 Jun 2018 16:51:12 +0200
Message-Id: <20180629145112.9329-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

HSCIF is superior to SCIF (larger FIFOs, more accurate and wider
supported range of bitrates).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 6439d05fd7ecd99f..9687166c44732a9f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -33,7 +33,7 @@
 / {
 	aliases {
 		serial0 = &scif2;
-		serial1 = &scif1;
+		serial1 = &hscif1;
 		ethernet0 = &avb;
 	};
 
@@ -344,7 +344,7 @@
 
 	uart-has-rtscts;
 	/* Please only enable hscif1 or scif1 */
-	/* status = "okay"; */
+	status = "okay";
 };
 
 &hsusb {
@@ -723,7 +723,7 @@
 
 	uart-has-rtscts;
 	/* Please only enable hscif1 or scif1 */
-	status = "okay";
+	/* status = "okay"; */
 };
 
 &scif2 {
-- 
2.17.1
