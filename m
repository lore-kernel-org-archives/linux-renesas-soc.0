Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:10017 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753374AbcEYI6f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 04:58:35 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 9F4E71580002
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:33 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 538F62E40267
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:33 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 2/4] arm64: dts: Renesas: R-Car3: Add product register
Date: Wed, 25 May 2016 10:58:26 +0200
Message-ID: <1464166708-18320-3-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The product register of the Renesas R-Car3 isn't part of any SoC
module, but "just" a register at address 0xFFF00044.

It provides some configuration information about the SoC itself, like
the number of the CA57, CA53 and CR7 cores, the product description
(R-Car H3, R-Car M3-W etc) and the sample revision.

This information is needed by some drivers to enable or disable
specific features which are present or not in the SoC.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 .../bindings/soc/renesas/renesas,rcar-gen3-prr.txt  | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi            |  6 ++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi            |  6 ++++++
 3 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rcar-gen3-prr.txt

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rcar-gen3-prr.txt b/Documentation/devicetree/bindings/soc/renesas/renesas,rcar-gen3-prr.txt
new file mode 100644
index 0000000..23101cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rcar-gen3-prr.txt
@@ -0,0 +1,21 @@
+Renesas R-Car3 product register binding
+---------------------------------------
+
+The product register of the Renesas R-Car3 provides some configuration
+information about the SoC itself, like the number of the CA57, CA53 and
+CR7 cores, the product description (R-Car H3, R-Car M3-W etc) and the
+sample revision. This information is needed by some drivers to enable
+or disable specific features which are present or not in the SoC.
+
+Required properties:
+- compatible : "renesas,rcar-gen3-prr"
+	       and additionally a SoC specific property like
+	       "renesas,r8a7795-prr" or
+	       "renesas,r8a7796-prr"
+- reg : Location and size of the product register
+
+Example:
+	prr: product-register@fff00044 {
+		compatible = "renesas,rcar-gen3-prr", "renesas,r8a7795-prr";
+		reg = <0 0xfff00044 0 0x4>;
+	};
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 26df300..0ae4687 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1610,5 +1610,11 @@
 			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 728>;
 		};
+
+		prr: product-register@fff00044 {
+			compatible = "renesas,rcar-gen3-prr",
+				     "renesas,r8a7795-prr";
+			reg = <0 0xfff00044 0 0x4>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..100b531 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -141,5 +141,11 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		prr: product-register@fff00044 {
+			compatible = "renesas,rcar-gen3-prr",
+				     "renesas,r8a7796-prr";
+			reg = <0 0xfff00044 0 0x4>;
+		};
 	};
 };
-- 
2.8.0
