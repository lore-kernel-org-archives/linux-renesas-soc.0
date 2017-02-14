Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33524 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752868AbdBNVDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2017 16:03:07 -0500
Received: by mail-lf0-f42.google.com with SMTP id x1so72331969lff.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2017 13:03:07 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170214210301.620322370@cogentembedded.com>
Date: Wed, 15 Feb 2017 00:02:53 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Konstantin Kozhevnikov
        <Konstantin.Kozhevnikov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/1] arm64: dts: r8a7795: add IMR-LX4 support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-r8a7795-add-IMR-LX4-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the IMR-LX4 devices in the R8A7795 device tree.

Based on the original (and large) patch by Konstantin Kozhevnikov
<Konstantin.Kozhevnikov@cogentembedded.com>.

Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20170213-v4.10-rc8' tag of Simon
Horman's 'renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1419,6 +1419,38 @@
 			status = "disabled";
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe870000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe870000 0 0x2000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe880000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe880000 0 0x2000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 821>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe890000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe890000 0 0x2000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 820>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
 		vspbc: vsp@fe920000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe920000 0 0x8000>;
