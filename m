Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeKZBb3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 20:31:29 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
Date: Sun, 25 Nov 2018 16:40:30 +0200
Message-Id: <20181125144031.4407-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the backlight device for the LVDS1 output, in preparation for panel
support.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 2405eaad0296..cd067319e6f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -24,6 +24,17 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 50000>;
+
+		brightness-levels = <256 128 64 16 8 4 0>;
+		default-brightness-level = <6>;
+
+		power-supply = <&reg_12p0v>;
+		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+	};
+
 	composite-in {
 		compatible = "composite-video-connector";
 
@@ -104,6 +115,15 @@
 		regulator-always-on;
 	};
 
+	reg_12p0v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "D12.0V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
Regards,

Laurent Pinchart
