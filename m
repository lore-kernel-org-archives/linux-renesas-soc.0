Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54657 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230AbcHLJSt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 05:18:49 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id 176E32003E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Aug 2016 11:18:35 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: salvator-x: Configure pins for the DU RGB output
Date: Fri, 12 Aug 2016 12:18:55 +0300
Message-Id: <1470993535-11795-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

This patch depends on "[PATCH] pinctrl: sh-pfc: r8a7795: Add DU support"
posted a few minutes ago to the linux-renesas-soc mailing list, as well as on
the "[PATCH v2 0/4] R-Car Gen3 DU enablement on Salvator-X board" series
posted yesterday to the same list.

As the boot loader configures the DU pins on Salvator-X we can safely delay
this patch by one kernel version to let the pinctrl dependency hit mainling
first.

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 64a29a87a724..b1eab6876f8c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -181,6 +181,8 @@
 };
 
 &du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	ports {
@@ -227,6 +229,11 @@
 		function = "avb";
 	};
 
+	du_pins: du {
+		groups = "du_rgb888", "du_sync", "du_oddf", "du_clk_out_0";
+		function = "du";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
-- 
Regards,

Laurent Pinchart
