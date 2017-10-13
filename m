Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  4/4] ARM: dts: iwg22d-sodimm: Enable HS-USB
Date: Fri, 13 Oct 2017 16:50:43 +0100
Message-Id: <1507909843-52034-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
References: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable HS-USB on iWave RZ/G1E carrier board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch depend upon the below patch
https://patchwork.kernel.org/patch/10004691/

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 5003a8f..847c719 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -67,6 +67,12 @@
 	status = "okay";
 };
 
+&hsusb {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
 &pci1 {
 	status = "okay";
 	pinctrl-0 = <&usb1_pins>;
@@ -95,6 +101,11 @@
 		power-source = <3300>;
 	};
 
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
 	usb1_pins: usb1 {
 		groups = "usb1";
 		function = "usb1";
-- 
1.9.1

