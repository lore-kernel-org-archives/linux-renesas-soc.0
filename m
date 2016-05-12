Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54508 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbcELI3N (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 04:29:13 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id A84E2158022E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 5EB9AA402D4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 4/6] arm64: dts: renesas: Add device node for RST module
Date: Thu, 12 May 2016 10:27:19 +0200
Message-ID: <1463041641-27485-5-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a device node for the RST module, which provides reset control.
Declare it to be a system controller (syscon), so other device nodes can
refer to its registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7181db0..36da31f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -526,6 +526,11 @@
 			#iommu-cells = <1>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,rst-r8a7795", "syscon";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..30d05e7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -115,6 +115,11 @@
 			#power-domain-cells = <1>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,rst-r8a7795", "syscon";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			/* Empty node for now */
 		};
-- 
2.8.0
