Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:48934 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751728AbeB0CV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 21:21:27 -0500
From: Gaku Inami <gaku.inami.xh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a7795: Add multi-cluster definition
Date: Tue, 27 Feb 2018 11:19:51 +0900
Message-Id: <1519697995-6061-2-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds the "cpu-map" for multi-cluster into r8a7795
device-tree. This definition is used to parse the cpu topology.

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index ce85704..ffcc91e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -34,6 +34,38 @@
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
-- 
2.7.4
