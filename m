Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33763 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751082AbdBTVbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 16:31:35 -0500
Received: by mail-lf0-f48.google.com with SMTP id l12so18178855lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Feb 2017 13:31:34 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170220213129.182097269@cogentembedded.com>
Date: Tue, 21 Feb 2017 00:31:12 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: r8a7796: add IMR-LX4 support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-r8a7796-add-IMR-LX4-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the IMR-LX4 devices in the R8A7796 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20170217-v4.10-rc8' tag of Simon
Horman's 'renesas.git' repo.

The IMR-LX4 binding was documented in the IMR driver patch; I don't expect it
to  change  even if the driver  would be  rewritten  for DRM...

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -904,5 +904,21 @@
 				};
 			};
 		};
+
+		imr-lx4@fe860000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+		};
+
+		imr-lx4@fe870000 {
+			compatible = "renesas,imr-lx4";
+			reg = <0 0xfe870000 0 0x2000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+		};
 	};
 };
