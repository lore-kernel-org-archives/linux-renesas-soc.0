Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33214 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbeGTMvq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:51:46 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/9] arm64: dts: renesas: salvator-common: Prefer HSCIF1 over SCIF1
Date: Fri, 20 Jul 2018 14:03:35 +0200
Message-Id: <e3853498f25d4c64a4175b42b6d7625fe0b90038.1532087303.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532087303.git.horms+renesas@verge.net.au>
References: <cover.1532087303.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

HSCIF is superior to SCIF (larger FIFOs, more accurate and wider
supported range of bitrates).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 6439d05fd7ec..9687166c4473 100644
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
2.11.0
