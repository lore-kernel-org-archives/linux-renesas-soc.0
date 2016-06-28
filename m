Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34060 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752353AbcF1JfJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 05:35:09 -0400
Received: by mail-wm0-f65.google.com with SMTP id 187so4261859wmz.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2016 02:35:08 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
	horms@verge.net.au
Cc: magnus.damm@gmail.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 4/4] arm64: dts: r8a7795: salvator: add serial console pins
Date: Tue, 28 Jun 2016 11:34:52 +0200
Message-Id: <1467106492-1341-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adds pin control for SCIF2.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 9c52613..10fceaf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -31,11 +31,20 @@
 	};
 };
 
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
 
 &scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
-- 
2.7.4
