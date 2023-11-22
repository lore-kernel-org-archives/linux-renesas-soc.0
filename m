Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B7C18E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 08:12:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by xavier.telenet-ops.be with bizsmtp
	id DUCm2B00H3EmSSH01UCmsF; Wed, 22 Nov 2023 17:12:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pq4-009ylF-9k;
	Wed, 22 Nov 2023 17:12:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pqI-00GzNX-9A;
	Wed, 22 Nov 2023 17:12:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 3/3] ARM: dts: renesas: armadillo800eva: Add LCD panel
Date: Wed, 22 Nov 2023 17:12:43 +0100
Message-Id: <278339322dcaaedc0d68fc67f1f1272d880084d7.1700669207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700669207.git.geert+renesas@glider.be>
References: <cover.1700669207.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 5" WVGA TFT LCD panel on the Armadillo-800-EVA development
board, and enable the LCD controller that drives it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.

For proper operation, this depends on:
  1. commit 410bb21319f69c2e ("drm/panel: simple: Add Ampire
     AM-800480L1TMQW-T00H") in drm/drm-next,
  2. Patch series "[PATCH 00/39] drm: renesas: shmobile: Atomic
     conversion + DT support"
     https://lore.kernel.org/r/cover.1687423204.git.geert+renesas@glider.be
  3. Enabling CONFIG_DRM_SHMOBILE instead of CONFIG_FB_SH_MOBILE_LCDC.
---
 .../dts/renesas/r8a7740-armadillo800eva.dts   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index d21e00e1f40152d6..e1ac2c161e730342 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -132,7 +132,7 @@ i2c2: i2c-2 {
 		i2c-gpio,delay-us = <5>;
 	};
 
-	backlight {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&tpu 2 33333 PWM_POLARITY_INVERTED>;
 		brightness-levels = <0 1 2 4 8 16 32 64 128 255>;
@@ -143,6 +143,18 @@ backlight {
 		enable-gpios = <&pfc 61 GPIO_ACTIVE_HIGH>;
 	};
 
+	panel {
+		compatible = "ampire,am-800480l1tmqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_5p0v>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc0_rgb>;
+			};
+		};
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 
@@ -228,10 +240,22 @@ rtc@30 {
 	};
 };
 
-&pfc {
+&lcdc0 {
 	pinctrl-0 = <&lcd0_pins>;
 	pinctrl-names = "default";
 
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&pfc {
 	ether_pins: ether {
 		groups = "gether_mii", "gether_int";
 		function = "gether";
-- 
2.34.1

