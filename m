Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdJTK3c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:29:32 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/31] arm64: dts: ulcb-kf: enable TCA9539 on I2C4
Date: Fri, 20 Oct 2017 12:28:22 +0200
Message-Id: <0f9c47b2446beb4ea90ba90870cbe72b6419d03b.1508495040.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508495040.git.horms+renesas@verge.net.au>
References: <cover.1508495040.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This supports TCA9539 gpio expanders on I2C4 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 80444aee7bcb..a6c2343e23cb 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -66,6 +66,28 @@
 	};
 };
 
+&i2c4 {
+	gpio_exp_76: gpio@76 {
+		compatible = "ti,tca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio7>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	gpio_exp_77: gpio@77 {
+		compatible = "ti,tca9539";
+		reg = <0x77>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.11.0
