Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:32797 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753199AbdF0ReG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jun 2017 13:34:06 -0400
Received: by mail-lf0-f47.google.com with SMTP id m77so21352991lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jun 2017 10:34:05 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170627173400.581660959@cogentembedded.com>
Date: Tue, 27 Jun 2017 20:33:44 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: r8a7796: add IMR-LX4 support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-r8a7796-add-IMR-LX4-support-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the IMR-LX4 devices in the R8A7796 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20170626-v4.12-rc7' tag of Simon
Horman's 'renesas.git' repo.

The IMR-LX4 bindings were documented in the IMR driver patch and ACK'ed by Rob
Herring, so I don't expect them to change...

Changes in version 2:
- added SoC specific "compatible" prop values;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1454,5 +1454,23 @@
 				};
 			};
 		};
+
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a7796-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+		};
+
+		imr-lx4@fe870000 {
+			compatible = "renesas,r8a7796-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe870000 0 0x2000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+		};
 	};
 };
