Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:54239 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935004AbcJ0OR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:17:28 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: r8a7795: salvator-x: add bias setting for usb1_pins
Date: Thu, 27 Oct 2016 19:29:27 +0900
Message-Id: <1477564167-22422-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since this board doesn't mount pull-up/down registers for
USB1_{OVC,PWEN} pins, we should enable bias setting to pull these
pins up/down.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index da3e996b..bcaf400 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -309,8 +309,20 @@
 	};
 
 	usb1_pins: usb1 {
-		groups = "usb1";
-		function = "usb1";
+		mux {
+			groups = "usb1";
+			function = "usb1";
+		};
+
+		ovc {
+			pins = "GP_6_27";
+			bias-pull-up;
+		};
+
+		pwen {
+			pins = "GP_6_26";
+			bias-pull-down;
+		};
 	};
 
 	usb2_pins: usb2 {
-- 
1.9.1
