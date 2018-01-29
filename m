Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34583 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbeA2PqL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jan 2018 10:46:11 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org, kieran.bingham@ideasonboard.com
Cc: wsa@the-dreams.de, magnus.damm@gmail.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 3/5] arm64: renesas: draak: enable I2C controller 1
Date: Mon, 29 Jan 2018 16:45:46 +0100
Message-Id: <1517240748-14780-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

No devices to add, I2C1 has an external connector only.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 6ff9d3e..af07da2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -51,6 +51,11 @@
 		function = "i2c0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	pwm0_pins: pwm0 {
 		groups = "pwm0_c";
 		function = "pwm0";
@@ -84,6 +89,12 @@
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
2.7.4
