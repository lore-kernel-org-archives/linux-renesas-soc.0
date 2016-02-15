Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/7] ARM: dts: r8a73a4: Add L2 cache-controller nodes
Date: Mon, 15 Feb 2016 21:38:29 +0100
Message-Id: <1455568715-20880-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device nodes for the L2 caches, and link the CPU node to its L2
cache node.

The L2 cache for the Cortex-A15 CPU cores is 1 MiB large (organized as
64 KiB x 16 ways), and located in PM domain A3SM.

The L2 cache for the Cortex-A7 CPU cores is 512 KiB large (organized as
64 KiB x 8 ways), and located in PM domain A3KM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop "arm,data-latency" and "arm,tag-latency" properties, as they
    may not be valid when using virtualization,
  - Change one-line summary prefix to match current arm-soc practices,

v2:
  - New.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 138414a7d1703781..6583a1dfca1f64c6 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -29,6 +29,7 @@
 			reg = <0>;
 			clock-frequency = <1500000000>;
 			power-domains = <&pd_a2sl>;
+			next-level-cache = <&L2_CA15>;
 		};
 	};
 
@@ -45,6 +46,22 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	L2_CA15: cache-controller@0 {
+		compatible = "cache";
+		clocks = <&cpg_clocks R8A73A4_CLK_Z>;
+		power-domains = <&pd_a3sm>;
+		cache-unified;
+		cache-level = <2>;
+	};
+
+	L2_CA7: cache-controller@1 {
+		compatible = "cache";
+		clocks = <&cpg_clocks R8A73A4_CLK_Z2>;
+		power-domains = <&pd_a3km>;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
-- 
1.9.1

