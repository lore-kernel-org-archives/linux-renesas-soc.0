Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:63797 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757367AbeD0Ge6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 02:34:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable usb2_phy3 node
Date: Fri, 27 Apr 2018 15:34:30 +0900
Message-Id: <1524810872-8442-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables usb2_phy3 node for r8a7795 with Salvator-XS.
You must change the SW31 to OFF-OFF-ON-ON-ON-ON on the board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 8367668..622b2a2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -145,6 +145,23 @@
 		groups = "usb2";
 		function = "usb2";
 	};
+
+	/*
+	 * - On Salvator-X[S], GP6_3[01] are connected to ADV7482 as irq pins
+	 *   (when SW31 is the default setting on Salvator-XS).
+	 * - If SW31 is the default setting, you cannot use USB2.0 ch3 on
+	 *   r8a7795 with Salvator-XS.
+	 *   Hence the SW31 setting must be changed like 2) below.
+	 *   1) Default setting of SW31: ON-ON-OFF-OFF-OFF-OFF:
+	 *	- Connect GP6_3[01] to ADV7842.
+	 *   2) Changed setting of SW31: OFF-OFF-ON-ON-ON-ON:
+	 *	- Connect GP6_3[01] to BD082065 (USB2.0 ch3's host power).
+	 *	- Connect GP6_{04,21} to ADV7842.
+	 */
+	usb2_ch3_pins: usb2_ch3 {
+		groups = "usb2_ch3";
+		function = "usb2_ch3";
+	};
 };
 
 &usb2_phy2 {
@@ -153,3 +170,10 @@
 
 	status = "okay";
 };
+
+&usb2_phy3 {
+	pinctrl-0 = <&usb2_ch3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
1.9.1
