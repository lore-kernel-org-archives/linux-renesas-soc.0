Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbeKZXuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 18:50:10 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gaku Inami <gaku.inami.xh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 30/40] arm64: dts: renesas: Add CPU topology on R-Car Gen3 SoCs
Date: Mon, 26 Nov 2018 13:54:56 +0100
Message-Id: <b380ae0db6039131fd0ad985b760c5b3f5096dfc.1543229515.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gaku Inami <gaku.inami.xh@renesas.com>

This patch adds the "cpu-map" into r8a7795/r8a7796 composed of
multi-cluster. This definition is used to parse the cpu topology.

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 32 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 26 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 660fd54d384b..408ff4e8170a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -116,6 +116,38 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+				core2 {
+					cpu = <&a57_2>;
+				};
+				core3 {
+					cpu = <&a57_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
 		a57_0: cpu@0 {
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3baee26ae372..b12bf73bb03b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -127,6 +127,32 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
 		a57_0: cpu@0 {
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x0>;
-- 
2.11.0
