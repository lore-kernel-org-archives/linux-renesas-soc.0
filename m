Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:33590 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbdEBSqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 14:46:17 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6] arm64: dts: salvator-x: Add current sense amplifiers
Date: Tue,  2 May 2017 20:46:13 +0200
Message-Id: <1493750773-7750-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add device nodes for two Maxim max961x current sense amplifiers
sensing VDD_08 and DVFS_08 lines.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
[geert: r8a7796-salvator-x.dts => salvator-x.dtsi]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6:
  - r8a7796-salvator-x.dts => salvator-x.dtsi

 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 47a482f20c9d511f..d5eb022d247cad6e 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -283,6 +283,24 @@
 	};
 };
 
+&i2c4 {
+	status = "okay";
+
+	csa_vdd: adc@7c {
+		compatible = "maxim,max9611";
+		reg = <0x7c>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
+	csa_dvfs: adc@7f {
+		compatible = "maxim,max9611";
+		reg = <0x7f>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+};
+
 &i2c_dvfs {
 	status = "okay";
 };
-- 
2.7.4
