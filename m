Return-Path: <devicetree-owner@vger.kernel.org>
Subject: [PATCH/RFC 3/3] arm64: dts: r8a7795: Support shared irq for thermal
 sensors
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <57661211.7010900@rvc.renesas.com>
 <57661BB1.3060401@rvc.renesas.com>
CC: Wolfram Sang <wsa@the-dreams.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Thao Phuong Le. Nguyen" <thao.nguyen.yb@rvc.renesas.com>,
	"Hien Duy. Dang" <hien.dang.eb@rvc.renesas.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Simon Horman <horms@verge.net.au>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <57661CAD.8040807@rvc.renesas.com>
Date: Sun, 19 Jun 2016 11:16:45 +0700
MIME-Version: 1.0
In-Reply-To: <57661BB1.3060401@rvc.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds the shared interrupts for thermal sensors
TSC1/TSC2/TSC3.

Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index db203db..761df2b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1628,7 +1628,8 @@
 			compatible = "renesas,thermal-r8a7795",
 				"renesas,rcar-gen3-thermal";
 			reg = <0 0xe6198000 0 0x5c>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#thermal-sensor-cells = <0>;
@@ -1639,7 +1640,8 @@
 			compatible = "renesas,thermal-r8a7795",
 				"renesas,rcar-gen3-thermal";
 			reg = <0 0xe61a0000 0 0x5c>;
-			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#thermal-sensor-cells = <0>;
@@ -1650,7 +1652,8 @@
 			compatible = "renesas,thermal-r8a7795",
 				"renesas,rcar-gen3-thermal";
 			reg = <0 0xe61a8000 0 0x5c>;
-			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#thermal-sensor-cells = <0>;
-- 
1.9.1

