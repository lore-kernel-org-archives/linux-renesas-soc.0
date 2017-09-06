Return-Path: <devicetree-owner@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
Date: Thu,  7 Sep 2017 01:37:10 +0300
Message-Id: <1504737430-23465-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports PCA9548 I2C switch on I2C2 bus on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 1cf8466..3bbc490 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -68,6 +68,14 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	i2cswitch2: pca9548@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &i2c4 {
-- 
1.9.1

