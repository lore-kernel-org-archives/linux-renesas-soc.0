Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: r8a7792: add VSP1V clocks
Date: Sat, 20 Aug 2016 01:18:54 +0300
Message-ID: <2191324.RHrKmLEeFa@wasted.cogentembedded.com>
In-Reply-To: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
References: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the VSP1V clocks in the R8A7792 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -757,10 +757,15 @@
 			compatible = "renesas,r8a7792-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150134 0 4>, <0 0xe6150038 0 4>;
-			clocks = <&m2_clk>;
+			clocks = <&m2_clk>, <&zs_clk>, <&zs_clk>, <&zs_clk>;
 			#clock-cells = <1>;
-			clock-indices = <R8A7792_CLK_JPU>;
-			clock-output-names = "jpu";
+			clock-indices = <
+				R8A7792_CLK_JPU
+				R8A7792_CLK_VSP1DU1 R8A7792_CLK_VSP1DU0
+				R8A7792_CLK_VSP1_SY
+			>;
+			clock-output-names = "jpu", "vsp1du1", "vsp1du0",
+					     "vsp1-sy";
 		};
 		mstp2_clks: mstp2_clks@e6150138 {
 			compatible = "renesas,r8a7792-mstp-clocks",

