Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB43CF97F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164743; cv=none; b=sYfnF0wFbBWwxLhbt7q1W2oZnQc5x3bg+xoiic10z35x0g9zlgo5e6c1sCdFjWdOHjqegzVTmJkO+vHD0xFlC80PHm7HYhO9NXJ1ihAWLDUZFEwtqv2d3MbIm1Mp8arTdLaSoRt3Pv3a2isQXj766AQ/jqZr/A2QrurFIfypKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164743; c=relaxed/simple;
	bh=V2dPCaRU+hd7fSjS8oDY0q0LfBq5U5E8U2B7hmZAJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBM+ZwFxcrOzYh/DH8Ze+2CjZmISBeXm7Mx3yMOcNMRpODb8cInPPvVz/axTUpKFpFjkavvFiDvIF+TYKsr+qIPS5ay/UlqD4NhrJdDQYkpR0yj7RfGDa/HG4XPxDJ9+82IV+vMSwWk2/E5EltHuYinplAShzikpaqR0OwRVH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDkMK0vJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDkMK0vJ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so766924a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787164741; x=1787769541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZcTRLAfLTr9e/jEr10T1e+kHbQ9jqkTcrRchtkL5X0=;
        b=SDkMK0vJZOrI2DqFmOsaKhdSTqbQNSXU+BZo/Q5E4em2PMy6bSG4d5jNRM2pXkIfgR
         uIYEzE1EIAPV7pfMw5KHgzP9fmnKAKw/HBxQP44rWOIuP/2le/svAecNsG7zkJrlq2lA
         RF2OwxN99ryit6ZtN0L+7e9Q6gdUcFlnBGedgrslRo23GYYSwFtO1N84/Ti0TzYq8CkU
         /fDduOEoDmIvEH5Yxas+157DL9b8hUmNkxNGjxwbL+ApG9XPxu68/jUphRFr1dU4KHDh
         veBG11L/XiGEexO6z7I17wtC9xbJsMgHm7Hk7w4hihHtiDn65cS8Je0Ns4NQlWDjrG/D
         trgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787164741; x=1787769541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZcTRLAfLTr9e/jEr10T1e+kHbQ9jqkTcrRchtkL5X0=;
        b=fiKfw6xFYOXpR3tmSDzY87rwNMvfb3tUs7Pqdv9H7vY9ClRYXcQ/FXNdctDpxxSh23
         4AaglgtjKXikGTklOkg52PggeFAT1BDR4O4rZndirlyfPU6J6bieeNo/7BnN9FQO4ZF8
         OLjCY6QxNm2dhs/I7u0iLVZYw0YHr8P2umunWYjdfSqcYwadpT8GJ30KmxFbLuPGG6Ar
         Aw2Z8rELIpUoqnnPPVrq3dzOcXJ0heoywPSdAKPCw+GbJ80Mc/wBGKVPLTR0BC1YZxMi
         w0Cu+4+u4zVvufKUpvsMUoyru1PZQaxr7YUI6a3A89O4kcDWHB56eE5eMuFEhmxR0/r0
         CEdA==
X-Gm-Message-State: AOJu0YyUGonnNmopbZCDwWyh/SwIuvj22nwpzzz/EAZO3znoL4FpSels
	2whRcsx82HJTzmOm1MK1VPqdFY4eaPlkDzxyhe1B+vM4deOd4QWeNvbh
X-Gm-Gg: AR+sD10Y37UIzKnv660Jc5LvzMtVqHTBiW81KNOYiY1JpXDsTr/QEBK8a9fuM3uVpPr
	V0+QBSQY7qHN7mfccXMYsR4XSvktJ0igRfcyfnsW7mF8+tS0cFVwrr9Ae9tOIlH4/dxoGyUSape
	ihCs6dreXtMbKQOEmYU1RTlrkAv2I2B9xpY0J4v82gTxpcVyfJGiifhdUpzjr09Ue+Sp2TJCuoE
	ogp+NUH5tPJ+e1QukxMsWS2Ss61S5ia/RqP30ytZBkuPQCZV6Dr9gWwgLGmReEaw5aYrmk21nLp
	7mP0nyZ365PonuLeom7sGcp9oTj8W2SaTTxPdBnzL/fQvgbTrHg6r/GyAkAeO5stsPGQIrl/Jkd
	lfBLZ1HobSMjpF11UoR6qx+nA6xeUS6epIR4hQJ4p98PkxGrsP6SJCBGI/K4EDokDlgQFNkzvSp
	tiBZ8TvwFhFQnZVHzqPFzkcZngoEP0rB9Ymq5Y9vZCF1tJiw6wlWphBiBn81+ggWdBd//31/JH6
	ryOdnqwUO0aNx+pToXNrwpt0ilsg5JMsIG4LR5RWrM/1Y8zntLURFBLn6WF4/5jaYvRkPUJd4dl
	dvLKF8kxjEb2SFJyfQcj
X-Received: by 2002:a05:6a21:398:b0:3cc:3d08:da2b with SMTP id adf61e73a8af0-3cd01295943mr14796519637.15.1787164740457;
        Wed, 19 Aug 2026 11:39:00 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm1759393eec.21.2026.08.19.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:38:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs
Date: Wed, 19 Aug 2026 19:38:29 +0100
Message-ID: <20260819183829.3953529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT overlay support for enabling the DU/LCDC pipeline on the RZ/T2H
and RZ/N2H evaluation kits when fitted with an ADV7513 HDMI transmitter
on CN15/CN20.

Share the common ADV7513 and LCDC pin configuration between the two
overlays. Disable board functions whose pins are reassigned to LCDC,
including the affected LEDs, SDHI0 on the RZ/T2H EVK, and I2C0 on the
RZ/N2H EVK.

Move the LED8 and LED9 preprocessor conditionals inside the node
definitions so that the nodes remain present in the base DTS. This
allows the LCDC overlays to reference and disable the LEDs when their
pins are reassigned to display functions.

Configure the LCDC data and clock pins with slew-rate setting 1 as
recommended by the hardware manual. Use slew-rate setting 0 for the
HSYNC, VSYNC and DE pins, as testing with the ADV7513 showed unstable
display output and visible flicker when these synchronization signals
were configured for fast slew rate.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Renamed HEADER_IRQ8 to IRQ8
- Added irq support for the ADV7513 in the overlays
- Corrected the DIP switch settings for I2C_SDA1/I2C_SCL1
- Added missing DIP switch settings for LCDC_DATG3
- MOved the header include at the end
- Added a comment for i2c0 as to why it is disabled in the overlay
- Split up the du_pinctrl into a group of pins as only sync/de pins
  needed to set slew-rate=0, the rest of the pins can use slew-rate=1
- Updated commit message

v1->v2:
- Fixed typo in makefile for CONFIG_ARCH_R9A09G087
- Explicitly disabled the led7 and key-1 in the overlay
- Dropped comment about DSW5[3]
- Updated commit message
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 ++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 53 ++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 63 ++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 12 ++--
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 72 +++++++++++++++++++
 5 files changed, 202 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..e4a7d7ab5b0e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -216,8 +216,14 @@ r9a09g057h48-kakip-pixpaper-dtbs := r9a09g057h48-kakip.dtb r9a09g057h48-kakip-pi
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-evk-cn15-lcdc.dtbo
+r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs := r9a09g077m44-rzt2h-evk.dtb r9a09g077m44-evk-cn15-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-evk-cn20-lcdc.dtbo
+r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs := r9a09g087m44-rzn2h-evk.dtb r9a09g087m44-evk-cn20-lcdc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
new file mode 100644
index 000000000000..aaddfc1154d5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/T2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#define RZT2H_IRQ8	24
+
+/*
+ * RZ/T2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
+ * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
+ * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
+ * IRQ8           P22_6, SW2[1]: ON, SW2[2]: OFF
+ */
+
+&{/leds/led-4} {
+	/* P18_0 is used for DU function LCDC_DATB1. */
+	status = "disabled";
+};
+
+&{/leds/led-5} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+/*
+ * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
+ * settings.
+ */
+&sdhi0 {
+	status = "disabled";
+};
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&adv7513 {
+	interrupts-extended = <&icu RZT2H_IRQ8 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&adv7513_irq_pins {
+	pinmux = <RZT2H_PORT_PINMUX(22, 6, 0x0)>; /* IRQ8 */
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
new file mode 100644
index 000000000000..9c9e4fc80363
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for the RZ/N2H EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#define RZN2H_IRQ5	21
+
+/*
+ * RZ/N2H LCDC configuration:
+ * ----------------------------------------------------------
+ * Function        Pin     SW Setting
+ * ----------------------------------------------------------
+ * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
+ * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON, DSW19[3]: OFF, DSW19[4]: ON
+ * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
+ * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
+ * I2C_SCL1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
+ * I2C_SDA1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
+ * ------------------------------------------------
+ */
+
+&{/keys/key-1} {
+	/* P18_2 is used for DU function LCDC_DATB3. */
+	status = "disabled";
+};
+
+&{/leds/led-4} {
+	/* P18_1 is used for DU function LCDC_DATB2. */
+	status = "disabled";
+};
+
+&{/leds/led-7} {
+	/* P14_3 is used for DU function LCDC_DATG3. */
+	status = "disabled";
+};
+
+&{/leds/led-8} {
+	/* P14_6 is used for DU function LCDC_DATG6. */
+	status = "disabled";
+};
+
+&i2c0 {
+	/* P14_6 is used for DU function LCDC_DATG6. */
+	status = "disabled";
+};
+
+#include "rzt2h-n2h-evk-du-adv7513.dtsi"
+
+&adv7513 {
+	interrupts-extended = <&icu RZN2H_IRQ5 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&adv7513_irq_pins {
+	pinmux = <RZT2H_PORT_PINMUX(14, 0, 0x0)>; /* IRQ5 */
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 76e30a6ecb8b..9d54e7650957 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -162,8 +162,8 @@ led-7 {
 			function-enumerator = <8>;
 		};
 
-#if LED8
 		led-8 {
+#if LED8
 			/*
 			 * USER_LED0
 			 * DSW15[8]: OFF, DSW15[9]: OFF, DSW15[10]: ON
@@ -172,11 +172,13 @@ led-8 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <0>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
-#if LED9
 		led-9 {
+#if LED9
 			/*
 			 * USER_LED1
 			 * DSW15[5]: OFF, DSW15[6]: ON
@@ -185,8 +187,10 @@ led-9 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <1>;
-		};
+#else
+			status = "disabled";
 #endif
+		};
 
 		led-10 {
 			/*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
new file mode 100644
index 000000000000..d0242dc55161
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay common parts for the RZ/{T2H/N2H} EVKs with ADV7513
+ * transmitter connected to DU enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
+#define ADV7513_PARENT_I2C i2c1
+#include "rz-smarc-du-adv7513.dtsi"
+
+&pinctrl {
+	du_pins: du-group {
+		du-data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(10, 0, 0x28)>, /* LCDC_DATR0 */
+				 <RZT2H_PORT_PINMUX(10, 1, 0x28)>, /* LCDC_DATR1 */
+				 <RZT2H_PORT_PINMUX(10, 2, 0x28)>, /* LCDC_DATR2 */
+				 <RZT2H_PORT_PINMUX(10, 3, 0x28)>, /* LCDC_DATR3 */
+				 <RZT2H_PORT_PINMUX(10, 4, 0x28)>, /* LCDC_DATR4 */
+				 <RZT2H_PORT_PINMUX(10, 5, 0x28)>, /* LCDC_DATR5 */
+				 <RZT2H_PORT_PINMUX(10, 6, 0x28)>, /* LCDC_DATR6 */
+				 <RZT2H_PORT_PINMUX(10, 7, 0x28)>, /* LCDC_DATR7 */
+				 <RZT2H_PORT_PINMUX(11, 0, 0x28)>, /* LCDC_DATG0 */
+				 <RZT2H_PORT_PINMUX(14, 1, 0x28)>, /* LCDC_DATG1 */
+				 <RZT2H_PORT_PINMUX(14, 2, 0x28)>, /* LCDC_DATG2 */
+				 <RZT2H_PORT_PINMUX(14, 3, 0x28)>, /* LCDC_DATG3 */
+				 <RZT2H_PORT_PINMUX(14, 4, 0x28)>, /* LCDC_DATG4 */
+				 <RZT2H_PORT_PINMUX(14, 5, 0x28)>, /* LCDC_DATG5 */
+				 <RZT2H_PORT_PINMUX(14, 6, 0x28)>, /* LCDC_DATG6 */
+				 <RZT2H_PORT_PINMUX(17, 6, 0x28)>, /* LCDC_DATG7 */
+				 <RZT2H_PORT_PINMUX(17, 7, 0x28)>, /* LCDC_DATB0 */
+				 <RZT2H_PORT_PINMUX(18, 0, 0x28)>, /* LCDC_DATB1 */
+				 <RZT2H_PORT_PINMUX(18, 1, 0x28)>, /* LCDC_DATB2 */
+				 <RZT2H_PORT_PINMUX(18, 2, 0x28)>, /* LCDC_DATB3 */
+				 <RZT2H_PORT_PINMUX(18, 3, 0x28)>, /* LCDC_DATB4 */
+				 <RZT2H_PORT_PINMUX(18, 4, 0x28)>, /* LCDC_DATB5 */
+				 <RZT2H_PORT_PINMUX(18, 5, 0x28)>, /* LCDC_DATB6 */
+				 <RZT2H_PORT_PINMUX(18, 6, 0x28)>; /* LCDC_DATB7 */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		du-clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(9, 4, 0x28)>; /* LCDC_CLK */
+			drive-strength-microamp = <11800>;
+			slew-rate = <1>;
+		};
+
+		du-sync-pins {
+			pinmux = <RZT2H_PORT_PINMUX(9, 5, 0x28)>, /* LCDC_HSYNC */
+				 <RZT2H_PORT_PINMUX(9, 6, 0x28)>; /* LCDC_VSYNC */
+			drive-strength-microamp = <11800>;
+			slew-rate = <0>;
+		};
+
+		du-de-pins {
+			pinmux = <RZT2H_PORT_PINMUX(9, 7, 0x28)>; /* LCDC_DE */
+			drive-strength-microamp = <11800>;
+			slew-rate = <0>;
+		};
+	};
+
+	adv7513_irq_pins: adv7513-irq-pins {
+	};
+};
+
+&adv7513 {
+	pinctrl-0 = <&adv7513_irq_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0

