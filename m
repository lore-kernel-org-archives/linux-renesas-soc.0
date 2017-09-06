Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:37194 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753980AbdIFWg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 18:36:58 -0400
Received: by mail-lf0-f46.google.com with SMTP id 80so15993713lfy.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2017 15:36:58 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
Date: Thu,  7 Sep 2017 01:36:55 +0300
Message-Id: <1504737415-23386-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports PCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 71dee77..40885e7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -48,6 +48,28 @@
 	status = "okay";
 };
 
+&i2c2 {
+	gpio_exp_74: pca9539@74 {
+		compatible = "nxp,pca9539";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio6>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	gpio_exp_75: pca9539@75 {
+		compatible = "nxp,pca9539";
+		reg = <0x75>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio6>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
1.9.1
