Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35127 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753607AbcHPOsH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 10:48:07 -0400
Received: by mail-wm0-f67.google.com with SMTP id i5so16886589wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2016 07:48:06 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
	ulrich.hecht+renesas@gmail.com
Subject: [PATCH v2 4/4] arm64: dts: r8a7796: salvator: add serial console pins
Date: Tue, 16 Aug 2016 16:47:13 +0200
Message-Id: <1471358833-18248-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adds pin control for SCIF2.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index e72be38..d4a774c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -31,11 +31,20 @@
 	};
 };
 
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data_a", "scif2_clk";
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
