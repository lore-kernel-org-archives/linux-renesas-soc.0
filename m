Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34121 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbcKHOQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 09:16:37 -0500
Received: by mail-lf0-f50.google.com with SMTP id o141so68357246lff.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Nov 2016 06:16:24 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 4/4 v2] arm64: dts: h3ulcb: rename SDHI0 pins
Date: Tue,  8 Nov 2016 17:16:29 +0300
Message-Id: <1478614589-10045-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This changes SDHI0 pin names for H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- Initially added

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 8d0ac07..6ffb051 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -163,13 +163,13 @@
 		function = "avb";
 	};
 
-	sdhi0_pins_3v3: sd0_3v3 {
+	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_1v8: sd0_1v8 {
+	sdhi0_pins_uhs: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -291,8 +291,8 @@
 };
 
 &sdhi0 {
-	pinctrl-0 = <&sdhi0_pins_3v3>;
-	pinctrl-1 = <&sdhi0_pins_1v8>;
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi0>;
