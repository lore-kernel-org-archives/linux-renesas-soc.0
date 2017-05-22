Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933851AbdEVN7b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:59:31 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/35] arm64: dts: r8a7796: Add placeholders for various devices
Date: Mon, 22 May 2017 15:58:48 +0200
Message-Id: <8faafa718887a0e83f6bca636c63dbf420b54f3e.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add empty device nodes serving as placeholders for devices that are not
yet supported and/or tested on R-Car M3-W, but are supported and used on
Salvator-X or H3ULCB boards equipped with an R-Car H3 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 8e2aab8b6b10..60a4289d0b14 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -961,6 +961,38 @@
 			dma-channels = <16>;
 		};
 
+		hsusb: usb@e6590000 {
+			/* placeholder */
+		};
+
+		xhci0: usb@ee000000 {
+			/* placeholder */
+		};
+
+		ohci0: usb@ee080000 {
+			/* placeholder */
+		};
+
+		ehci0: usb@ee080100 {
+			/* placeholder */
+		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			/* placeholder */
+		};
+
+		ohci1: usb@ee0a0000 {
+			/* placeholder */
+		};
+
+		ehci1: usb@ee0a0100 {
+			/* placeholder */
+		};
+
+		usb2_phy1: usb-phy@ee0a0200 {
+			/* placeholder */
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7796";
 			reg = <0 0xee100000 0 0x2000>;
@@ -1063,5 +1095,55 @@
 				};
 			};
 		};
+
+		rcar_sound: sound@ec500000 {
+			/* placeholder */
+
+			rcar_sound,dvc {
+				dvc0: dvc-0 {
+				};
+
+				dvc1: dvc-1 {
+				};
+			};
+
+			rcar_sound,src {
+				src0: src-0 {
+				};
+				src1: src-1 {
+				};
+			};
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+				};
+
+				ssi1: ssi-1 {
+				};
+			};
+		};
+
+		pciec0: pcie@fe000000 {
+			/* placeholder */
+		};
+
+		pciec1: pcie@ee800000 {
+			/* placeholder */
+		};
+
+		du: display@feb00000 {
+			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.1.4
