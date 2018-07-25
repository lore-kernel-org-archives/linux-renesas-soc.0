Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38236 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729354AbeGYUsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:48:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: r8a7795: salvator-xs: enable SATA
Date: Wed, 25 Jul 2018 21:34:56 +0200
Message-Id: <20180725193457.3999-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
References: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
off for that to work.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 8ded64d0a4d5..3032bdb8c47d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -152,6 +152,15 @@
 	};
 };
 
+&pca9654 {
+	pcie_sata_switch {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-low; /* enable SATA by default */
+		line-name = "PCIE/SATA switch";
+	};
+};
+
 &pfc {
 	usb2_pins: usb2 {
 		groups = "usb2";
@@ -176,6 +185,11 @@
 	};
 };
 
+	/* MD12 (SW12-7) must be set 'Off' which is not the default! */
+&sata {
+	status = "okay";
+};
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
-- 
2.11.0
