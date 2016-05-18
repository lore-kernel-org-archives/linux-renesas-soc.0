Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28554 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324AbcERLVJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 07:21:09 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta24.fe.bosch.de (Postfix) with ESMTP id AB923D801FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 43F2DA40821
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 4/6] arm64: dts: renesas: Add device node for RST module
Date: Wed, 18 May 2016 13:19:06 +0200
Message-ID: <1463570348-32349-5-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a device node for the RST module, which provides reset control.
Declare it to be a system controller (syscon), so other device nodes can
refer to its registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 26df300..7be6ae0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -526,6 +526,11 @@
 			#iommu-cells = <1>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a7795-rst", "syscon";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..75ac18d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -115,6 +115,11 @@
 			#power-domain-cells = <1>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a7796-rst", "syscon";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			/* Empty node for now */
 		};
-- 
2.8.0
