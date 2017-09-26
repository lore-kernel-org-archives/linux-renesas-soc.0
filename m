Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967960AbdIZKGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:17 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id BD5182147D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 05/13] arm64: dts: r8a7795: Add lossy decompression reserved memory nodes
Date: Tue, 26 Sep 2017 13:05:57 +0300
Message-Id: <20170926100605.2313-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The secure mode boot loader on R8A7795 platforms can program the DDR
controller to perform transparent image decompression when accessing
certain areas of RAM. Those areas must be kept out of system memory.

Add place-holder nodes for the boot loader to fill with the list of
lossy decompression areas, if any.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index ce2a59361a82..1320ec3b6a5e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -126,6 +126,38 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Up to three lossy decompression regions are supported, one
+		 * per format. The boot loader will populate them and rename
+		 * them to lossy-decompression@<unit-address>.
+		 */
+		lossy_decompression_0: lossy-decompression-0 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			renesas,format = <0>;
+			no-map;
+		};
+
+		lossy_decompression_1: lossy-decompression-1 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			renesas,format = <1>;
+			no-map;
+		};
+
+		lossy_decompression_2: lossy-decompression-2 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			renesas,format = <2>;
+			no-map;
+		};
+	};
+
 	extal_clk: extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
Regards,

Laurent Pinchart
