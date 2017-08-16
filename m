Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:36067 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751068AbdHPJQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 05:16:44 -0400
From: Chris Paterson <chris.paterson2@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2] ARM: dts: iwg20d-q7: Add RTC support
Date: Wed, 16 Aug 2017 10:16:30 +0100
Message-Id: <1502874990-12006-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Define the iWave RainboW-G20D-Qseven board dependent part of the
RTC device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
[chris: corrected bq32000 compatible string]
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
v1 -> v2
Added ti to bq32000 compatible string - Thanks Geert

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index 081af01..2c81ea7 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -31,6 +31,11 @@
 		groups = "avb_mdio", "avb_gmii";
 		function = "avb";
 	};
+
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
 };
 
 &scif0 {
@@ -54,3 +59,16 @@
 		micrel,led-mode = <1>;
 	};
 };
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@68 {
+		compatible = "ti,bq32000";
+		reg = <0x68>;
+	};
+};
-- 
1.9.1
