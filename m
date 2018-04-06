Return-Path: <devicetree-owner@vger.kernel.org>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77980: add PCIe PHY support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Message-ID: <55392eb8-e050-09d0-22d8-87da114fe691@cogentembedded.com>
Date: Fri, 6 Apr 2018 23:17:05 +0300
MIME-Version: 1.0
In-Reply-To: <f07e6173-75b3-fe10-81d6-915942a5f4fe@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the PCIe PHY in the R8A77980 device tree; it will be used by PCIEC
in the next patch...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -164,6 +171,17 @@
 			status = "disabled";
 		};
 
+		pcie_phy: pcie-phy@e65d0000 {
+			compatible = "renesas,r8a77980-pcie-phy",
+				     "renesas,rcar-gen3-pcie-phy";
+			reg = <0 0xe65d0000 0 0x8000>;
+			#phy-cells = <0>;
+			clocks = <&cpg CPG_MOD 319>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 319>;
+			status = "disabled";
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77980",
 				     "renesas,etheravb-rcar-gen3";
