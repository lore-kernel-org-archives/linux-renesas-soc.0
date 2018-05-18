Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbeERLRt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:17:49 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 097/102] arm64: dts: renesas: r8a7795-es1: add CSI-2 node
Date: Fri, 18 May 2018 13:15:59 +0200
Message-Id: <e51c09d53719c0d348f07af7deb14463ec1aeec7.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Renesas H3 ES1.0 have one extra CSI-2 node, CSI21 which is not present
for later ES versions of H3.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 143 +++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 0177f5e60e5a..e19dcd6cb767 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -107,6 +107,61 @@
 		resets = <&cpg 117>;
 		renesas,fcp = <&fcpf2>;
 	};
+
+	csi21: csi2@fea90000 {
+		compatible = "renesas,r8a7795-csi2";
+		reg = <0 0xfea90000 0 0x10000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 713>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 713>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				reg = <1>;
+
+				csi21vin0: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vin0csi21>;
+				};
+				csi21vin1: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vin1csi21>;
+				};
+				csi21vin2: endpoint@2 {
+					reg = <2>;
+					remote-endpoint = <&vin2csi21>;
+				};
+				csi21vin3: endpoint@3 {
+					reg = <3>;
+					remote-endpoint = <&vin3csi21>;
+				};
+				csi21vin4: endpoint@4 {
+					reg = <4>;
+					remote-endpoint = <&vin4csi21>;
+				};
+				csi21vin5: endpoint@5 {
+					reg = <5>;
+					remote-endpoint = <&vin5csi21>;
+				};
+				csi21vin6: endpoint@6 {
+					reg = <6>;
+					remote-endpoint = <&vin6csi21>;
+				};
+				csi21vin7: endpoint@7 {
+					reg = <7>;
+					remote-endpoint = <&vin7csi21>;
+				};
+			};
+		};
+	};
 };
 
 &gpio1 {
@@ -174,3 +229,91 @@
 &du {
 	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
 };
+
+&vin0 {
+	ports {
+		port@1 {
+			vin0csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin0>;
+			};
+		};
+	};
+};
+
+&vin1 {
+	ports {
+		port@1 {
+			vin1csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin1>;
+			};
+		};
+	};
+};
+
+&vin2 {
+	ports {
+		port@1 {
+			vin2csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin2>;
+			};
+		};
+	};
+};
+
+&vin3 {
+	ports {
+		port@1 {
+			vin3csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin3>;
+			};
+		};
+	};
+};
+
+&vin4 {
+	ports {
+		port@1 {
+			vin4csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin4>;
+			};
+		};
+	};
+};
+
+&vin5 {
+	ports {
+		port@1 {
+			vin5csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin5>;
+			};
+		};
+	};
+};
+
+&vin6 {
+	ports {
+		port@1 {
+			vin6csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin6>;
+			};
+		};
+	};
+};
+
+&vin7 {
+	ports {
+		port@1 {
+			vin7csi21: endpoint@1 {
+				reg = <1>;
+				remote-endpoint= <&csi21vin7>;
+			};
+		};
+	};
+};
-- 
2.11.0
