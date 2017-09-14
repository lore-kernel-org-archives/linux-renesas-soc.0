Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f54.google.com ([209.85.213.54]:53971 "EHLO
        mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751328AbdINOTv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 10:19:51 -0400
Received: by mail-vk0-f54.google.com with SMTP id m140so235674vka.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2017 07:19:51 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 17/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C4
Date: Thu, 14 Sep 2017 17:19:48 +0300
Message-Id: <1505398788-4892-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports PCA9548 I2C switch on I2C4 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- use generic node name "i2c-switch"
- fixed typo in node name: use @71

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 3bbc490..0c3844f 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -98,6 +98,14 @@
 		interrupt-parent = <&gpio5>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	i2cswitch4: i2c-switch@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		reset-gpios= <&gpio3 15 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &ohci0 {
-- 
1.9.1
