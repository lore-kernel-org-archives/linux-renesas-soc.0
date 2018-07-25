Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38250 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729370AbeGYUsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:48:12 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: r8a77965: salvator-xs: enable SATA
Date: Wed, 25 Jul 2018 21:34:57 +0200
Message-Id: <20180725193457.3999-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
References: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
off for that to work.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 9de4e3db1621..224c8f68f13b 100644
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
+	/* MD12 (SW12-7) must be set 'Off' which is not the default! */
+&sata {
+	status = "okay";
+};
-- 
2.11.0
