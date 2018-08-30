Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39303 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728790AbeH3RJ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 13:09:57 -0400
Date: Thu, 30 Aug 2018 15:07:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: r8a7796: Fix whitespace around assignments
Message-ID: <20180830130747.6qdj27szbfj2kltt@verge.net.au>
References: <20180828141059.6280-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828141059.6280-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 04:10:59PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi    |  4 +-
>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 16 +++----
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 48 ++++++++++----------
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 48 ++++++++++----------
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 36 +++++++--------
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi    |  8 ++--
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 16 +++----
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi     |  2 +-
>  8 files changed, 89 insertions(+), 89 deletions(-)

Thanks Geert,

I took the liberty of updating the subject with s/r8a7796/renesas/
and fixing a few more cases, likely ones that slipped in after you prepared
this patch (and are currently only local to my tree).

The incremental diff is:

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 2798c4c9cf94..010a9958693d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1455,7 +1455,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
-			companion= <&ohci0>;
+			companion = <&ohci0>;
 			power-domains = <&sysc 32>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -1468,7 +1468,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
-			companion= <&ohci1>;
+			companion = <&ohci1>;
 			power-domains = <&sysc 32>;
 			resets = <&cpg 702>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 8bf3091a899c..1b316d79df88 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -127,7 +127,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x71>;
-		reset-gpios= <&gpio3 15 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
 	};
 };
 

The resulting patch is as follows:


>From d44e5fc06910d21cc131d3b2a860fe0a669aefbe Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 28 Aug 2018 16:10:59 +0200
Subject: [PATCH] arm64: dts: renesas: Fix whitespace around assignments

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: updated for a few new cases]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    |  8 ++---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 16 +++++-----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 48 ++++++++++++++--------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 48 ++++++++++++++--------------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 36 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    |  8 ++---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 16 +++++-----
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi     |  2 +-
 8 files changed, 91 insertions(+), 91 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d9005cbce581..010a9958693d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -66,7 +66,7 @@
 			power-domains = <&sysc 0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 0>;
+			clocks = <&cpg CPG_CORE 0>;
 		};
 
 		a57_1: cpu@1 {
@@ -76,7 +76,7 @@
 			power-domains = <&sysc 1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE 0>;
+			clocks = <&cpg CPG_CORE 0>;
 		};
 
 		a53_0: cpu@100 {
@@ -1455,7 +1455,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
-			companion= <&ohci0>;
+			companion = <&ohci0>;
 			power-domains = <&sysc 32>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -1468,7 +1468,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
-			companion= <&ohci1>;
+			companion = <&ohci1>;
 			power-domains = <&sysc 32>;
 			resets = <&cpg 702>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index d915cff5b1b0..0fb84c219b2f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -232,7 +232,7 @@
 		port@1 {
 			vin0csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin0>;
+				remote-endpoint = <&csi21vin0>;
 			};
 		};
 	};
@@ -243,7 +243,7 @@
 		port@1 {
 			vin1csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin1>;
+				remote-endpoint = <&csi21vin1>;
 			};
 		};
 	};
@@ -254,7 +254,7 @@
 		port@1 {
 			vin2csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin2>;
+				remote-endpoint = <&csi21vin2>;
 			};
 		};
 	};
@@ -265,7 +265,7 @@
 		port@1 {
 			vin3csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin3>;
+				remote-endpoint = <&csi21vin3>;
 			};
 		};
 	};
@@ -276,7 +276,7 @@
 		port@1 {
 			vin4csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin4>;
+				remote-endpoint = <&csi21vin4>;
 			};
 		};
 	};
@@ -287,7 +287,7 @@
 		port@1 {
 			vin5csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin5>;
+				remote-endpoint = <&csi21vin5>;
 			};
 		};
 	};
@@ -298,7 +298,7 @@
 		port@1 {
 			vin6csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin6>;
+				remote-endpoint = <&csi21vin6>;
 			};
 		};
 	};
@@ -309,7 +309,7 @@
 		port@1 {
 			vin7csi21: endpoint@1 {
 				reg = <1>;
-				remote-endpoint= <&csi21vin7>;
+				remote-endpoint = <&csi21vin7>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index efc24770c0fd..c417d4a098df 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -123,7 +123,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -135,7 +135,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -147,7 +147,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -159,7 +159,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -171,7 +171,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -182,7 +182,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -193,7 +193,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -204,7 +204,7 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -1425,11 +1425,11 @@
 
 					vin0csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin0>;
+						remote-endpoint = <&csi20vin0>;
 					};
 					vin0csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin0>;
+						remote-endpoint = <&csi40vin0>;
 					};
 				};
 			};
@@ -1457,11 +1457,11 @@
 
 					vin1csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin1>;
+						remote-endpoint = <&csi20vin1>;
 					};
 					vin1csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin1>;
+						remote-endpoint = <&csi40vin1>;
 					};
 				};
 			};
@@ -1489,11 +1489,11 @@
 
 					vin2csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin2>;
+						remote-endpoint = <&csi20vin2>;
 					};
 					vin2csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin2>;
+						remote-endpoint = <&csi40vin2>;
 					};
 				};
 			};
@@ -1521,11 +1521,11 @@
 
 					vin3csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin3>;
+						remote-endpoint = <&csi20vin3>;
 					};
 					vin3csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin3>;
+						remote-endpoint = <&csi40vin3>;
 					};
 				};
 			};
@@ -1553,11 +1553,11 @@
 
 					vin4csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin4>;
+						remote-endpoint = <&csi20vin4>;
 					};
 					vin4csi41: endpoint@3 {
 						reg = <3>;
-						remote-endpoint= <&csi41vin4>;
+						remote-endpoint = <&csi41vin4>;
 					};
 				};
 			};
@@ -1585,11 +1585,11 @@
 
 					vin5csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin5>;
+						remote-endpoint = <&csi20vin5>;
 					};
 					vin5csi41: endpoint@3 {
 						reg = <3>;
-						remote-endpoint= <&csi41vin5>;
+						remote-endpoint = <&csi41vin5>;
 					};
 				};
 			};
@@ -1617,11 +1617,11 @@
 
 					vin6csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin6>;
+						remote-endpoint = <&csi20vin6>;
 					};
 					vin6csi41: endpoint@3 {
 						reg = <3>;
-						remote-endpoint= <&csi41vin6>;
+						remote-endpoint = <&csi41vin6>;
 					};
 				};
 			};
@@ -1649,11 +1649,11 @@
 
 					vin7csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin7>;
+						remote-endpoint = <&csi20vin7>;
 					};
 					vin7csi41: endpoint@3 {
 						reg = <3>;
-						remote-endpoint= <&csi41vin7>;
+						remote-endpoint = <&csi41vin7>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 258a3271b002..28a0794a4190 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -134,7 +134,7 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -146,7 +146,7 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
@@ -158,7 +158,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -169,7 +169,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -180,7 +180,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -191,7 +191,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -1299,11 +1299,11 @@
 
 					vin0csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin0>;
+						remote-endpoint = <&csi20vin0>;
 					};
 					vin0csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin0>;
+						remote-endpoint = <&csi40vin0>;
 					};
 				};
 			};
@@ -1331,11 +1331,11 @@
 
 					vin1csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin1>;
+						remote-endpoint = <&csi20vin1>;
 					};
 					vin1csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin1>;
+						remote-endpoint = <&csi40vin1>;
 					};
 				};
 			};
@@ -1363,11 +1363,11 @@
 
 					vin2csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin2>;
+						remote-endpoint = <&csi20vin2>;
 					};
 					vin2csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin2>;
+						remote-endpoint = <&csi40vin2>;
 					};
 				};
 			};
@@ -1395,11 +1395,11 @@
 
 					vin3csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin3>;
+						remote-endpoint = <&csi20vin3>;
 					};
 					vin3csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin3>;
+						remote-endpoint = <&csi40vin3>;
 					};
 				};
 			};
@@ -1427,11 +1427,11 @@
 
 					vin4csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin4>;
+						remote-endpoint = <&csi20vin4>;
 					};
 					vin4csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin4>;
+						remote-endpoint = <&csi40vin4>;
 					};
 				};
 			};
@@ -1459,11 +1459,11 @@
 
 					vin5csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin5>;
+						remote-endpoint = <&csi20vin5>;
 					};
 					vin5csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin5>;
+						remote-endpoint = <&csi40vin5>;
 					};
 				};
 			};
@@ -1491,11 +1491,11 @@
 
 					vin6csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin6>;
+						remote-endpoint = <&csi20vin6>;
 					};
 					vin6csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin6>;
+						remote-endpoint = <&csi40vin6>;
 					};
 				};
 			};
@@ -1523,11 +1523,11 @@
 
 					vin7csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin7>;
+						remote-endpoint = <&csi20vin7>;
 					};
 					vin7csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin7>;
+						remote-endpoint = <&csi40vin7>;
 					};
 				};
 			};
@@ -1997,7 +1997,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
-			companion= <&ohci0>;
+			companion = <&ohci0>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -2010,7 +2010,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
-			companion= <&ohci1>;
+			companion = <&ohci1>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 5ce978502ee9..83f469d6a680 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -111,7 +111,7 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A77965_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -122,7 +122,7 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A77965_CLK_Z>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -1167,11 +1167,11 @@
 
 					vin0csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin0>;
+						remote-endpoint = <&csi20vin0>;
 					};
 					vin0csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin0>;
+						remote-endpoint = <&csi40vin0>;
 					};
 				};
 			};
@@ -1199,11 +1199,11 @@
 
 					vin1csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin1>;
+						remote-endpoint = <&csi20vin1>;
 					};
 					vin1csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin1>;
+						remote-endpoint = <&csi40vin1>;
 					};
 				};
 			};
@@ -1231,11 +1231,11 @@
 
 					vin2csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin2>;
+						remote-endpoint = <&csi20vin2>;
 					};
 					vin2csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin2>;
+						remote-endpoint = <&csi40vin2>;
 					};
 				};
 			};
@@ -1263,11 +1263,11 @@
 
 					vin3csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin3>;
+						remote-endpoint = <&csi20vin3>;
 					};
 					vin3csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin3>;
+						remote-endpoint = <&csi40vin3>;
 					};
 				};
 			};
@@ -1295,11 +1295,11 @@
 
 					vin4csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin4>;
+						remote-endpoint = <&csi20vin4>;
 					};
 					vin4csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin4>;
+						remote-endpoint = <&csi40vin4>;
 					};
 				};
 			};
@@ -1327,11 +1327,11 @@
 
 					vin5csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin5>;
+						remote-endpoint = <&csi20vin5>;
 					};
 					vin5csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin5>;
+						remote-endpoint = <&csi40vin5>;
 					};
 				};
 			};
@@ -1359,11 +1359,11 @@
 
 					vin6csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin6>;
+						remote-endpoint = <&csi20vin6>;
 					};
 					vin6csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin6>;
+						remote-endpoint = <&csi40vin6>;
 					};
 				};
 			};
@@ -1391,11 +1391,11 @@
 
 					vin7csi20: endpoint@0 {
 						reg = <0>;
-						remote-endpoint= <&csi20vin7>;
+						remote-endpoint = <&csi20vin7>;
 					};
 					vin7csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin7>;
+						remote-endpoint = <&csi40vin7>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index b71f3eca35bd..f4b02707390f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -567,7 +567,7 @@
 
 					vin0csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin0>;
+						remote-endpoint = <&csi40vin0>;
 					};
 				};
 			};
@@ -595,7 +595,7 @@
 
 					vin1csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin1>;
+						remote-endpoint = <&csi40vin1>;
 					};
 				};
 			};
@@ -623,7 +623,7 @@
 
 					vin2csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin2>;
+						remote-endpoint = <&csi40vin2>;
 					};
 				};
 			};
@@ -651,7 +651,7 @@
 
 					vin3csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin3>;
+						remote-endpoint = <&csi40vin3>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index d58e9f2c9883..fc2a1d62d773 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -617,7 +617,7 @@
 
 					vin0csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin0>;
+						remote-endpoint = <&csi40vin0>;
 					};
 				};
 			};
@@ -644,7 +644,7 @@
 
 					vin1csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin1>;
+						remote-endpoint = <&csi40vin1>;
 					};
 				};
 			};
@@ -671,7 +671,7 @@
 
 					vin2csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin2>;
+						remote-endpoint = <&csi40vin2>;
 					};
 				};
 			};
@@ -698,7 +698,7 @@
 
 					vin3csi40: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi40vin3>;
+						remote-endpoint = <&csi40vin3>;
 					};
 				};
 			};
@@ -725,7 +725,7 @@
 
 					vin4csi41: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi41vin4>;
+						remote-endpoint = <&csi41vin4>;
 					};
 				};
 			};
@@ -752,7 +752,7 @@
 
 					vin5csi41: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi41vin5>;
+						remote-endpoint = <&csi41vin5>;
 					};
 				};
 			};
@@ -779,7 +779,7 @@
 
 					vin6csi41: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi41vin6>;
+						remote-endpoint = <&csi41vin6>;
 					};
 				};
 			};
@@ -806,7 +806,7 @@
 
 					vin7csi41: endpoint@2 {
 						reg = <2>;
-						remote-endpoint= <&csi41vin7>;
+						remote-endpoint = <&csi41vin7>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 8bf3091a899c..1b316d79df88 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -127,7 +127,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x71>;
-		reset-gpios= <&gpio3 15 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.11.0
