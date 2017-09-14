Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f47.google.com ([209.85.213.47]:43113 "EHLO
        mail-vk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751265AbdINOTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 10:19:30 -0400
Received: by mail-vk0-f47.google.com with SMTP id t10so3303021vke.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2017 07:19:29 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 15/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C4
Date: Thu, 14 Sep 2017 17:19:26 +0300
Message-Id: <1505398766-4813-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports PCA9539 gpio expanders on I2C4 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- use generic node name "gpio"

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 40885e7..1cf8466 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -70,6 +70,28 @@
 	};
 };
 
+&i2c4 {
+	gpio_exp_76: gpio@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio7>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	gpio_exp_77: gpio@77 {
+		compatible = "nxp,pca9539";
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
1.9.1
