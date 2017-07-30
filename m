Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:34330 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754609AbdG3U5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 16:57:43 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 2/5] arm64: dts: r8a7795-es1: add CSI21
Date: Sun, 30 Jul 2017 22:56:48 +0200
Message-Id: <20170730205651.6478-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 142 +++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index a0ba7bd21ea3aa18..a9c79ff2135ddcfb 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -76,9 +76,151 @@
 		resets = <&cpg 117>;
 		renesas,fcp = <&fcpf2>;
 	};
+
+	csi21: csi2@fea90000 {
+		compatible = "renesas,r8a7795-csi2", "renesas,rcar-gen3-csi2";
+		reg = <0 0xfea90000 0 0x10000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 713>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
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
 
 &du {
 	compatible = "renesas,du-r8a7795";
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
2.13.3
