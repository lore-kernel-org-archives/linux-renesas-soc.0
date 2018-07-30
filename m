Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbeG3JIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:08:37 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
Date: Mon, 30 Jul 2018 09:34:56 +0200
Message-Id: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
off for that to work.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
	* fixed indentation (Thanks, Geert!)
	* merged two patches into one (Thanks, Simon!)
	* Added Geert's tag

 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts  | 14 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 8ded64d0a4d5..368be55eda4e 100644
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
 
+/* MD12 (SW12-7) must be set 'Off' which is not the default! */
+&sata {
+	status = "okay";
+};
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 9de4e3db1621..45016a06fab1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -47,3 +47,17 @@
 &hdmi0_con {
 	remote-endpoint = <&rcar_dw_hdmi0_out>;
 };
+
+&pca9654 {
+	pcie_sata_switch {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-low; /* enable SATA by default */
+		line-name = "PCIE/SATA switch";
+	};
+};
+
+/* MD12 (SW12-7) must be set 'Off' which is not the default! */
+&sata {
+	status = "okay";
+};
-- 
2.11.0
