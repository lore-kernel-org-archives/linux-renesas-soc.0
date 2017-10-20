Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752764AbdJTKaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:30:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/42] ARM: dts: iwg22d-sodimm: Enable internal PCI
Date: Fri, 20 Oct 2017 12:28:40 +0200
Message-Id: <bc058f6f03e47610c994a97ecf3bf8a3ea44efee.1508493785.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508493785.git.horms+renesas@verge.net.au>
References: <cover.1508493785.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Enable internal AHB-PCI bridges for the USB EHCI/OHCI controllers
attached to them.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 8772c561e3a8..e378e5ecfcac 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -55,6 +55,11 @@
 		function = "sdhi0";
 		power-source = <3300>;
 	};
+
+	usb1_pins: usb1 {
+		groups = "usb1";
+		function = "usb1";
+	};
 };
 
 &scif4 {
@@ -92,3 +97,9 @@
 	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
+
+&pci1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};
-- 
2.11.0
