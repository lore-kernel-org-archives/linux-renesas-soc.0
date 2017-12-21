Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53825 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751884AbdLUL4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 06:56:43 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC] arm64: dts: r8a7795: salvator-xs: enable SATA
Date: Thu, 21 Dec 2017 12:56:39 +0100
Message-Id: <20171221115639.13646-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Needs this GPIO hog, so is probably an overlay?

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

So, this makes SATA work without any user interaction. But as said above, this
should probably be an overlay? Or any other way to deal with it? Also, we don't
have any way to check that SW12/7 is set correctly, or?

 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 7675de5d4f2cb1..b44ed5fbec7cb9 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -101,6 +101,19 @@
 	};
 };
 
+&pca9654 {
+	pcie_sata_switch {
+		gpio-hog;
+		gpios = <7>;
+		output-low;
+		line-name = "PCIE/SATA switch";
+	};
+};
+
+&sata {
+	status = "okay";
+};
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
-- 
2.11.0
