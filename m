Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:17156 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727293AbeH2N3n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 09:29:43 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: yoshihiro.shimoda.uh@renesas.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] arm64: dts: salvator-common: Add PWM-2 channel
Date: Wed, 29 Aug 2018 18:33:27 +0900
Message-Id: <1535535207-2800-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535535207-2800-1-git-send-email-na-hoan@jinso.co.jp>
References: <1535535207-2800-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add PWM-2 channel(CN28 - pin30) support for Salvator-X

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7d3d866..1234f91 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -572,6 +572,11 @@
 		function = "pwm1";
 	};
 
+	pwm2_pins: pwm2 {
+		groups = "pwm2_a";
+		function = "pwm2";
+	};	
+	
 	scif1_pins: scif1 {
 		groups = "scif1_data_a", "scif1_ctrl";
 		function = "scif1";
@@ -669,6 +674,12 @@
 	status = "okay";
 };
 
+&pwm2 {
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
