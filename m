Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843190;
	b=OyX2ATdPVScAAaZA+xFccOSuBGZocfpWsb5UgohAJ+t29GSqkIYMQi2agyVUpjmww14+
	 zsBLZdM9vh6k/AgCm71hr5CnxZ/jiTn/6rn/Vs3hvX0XzMuWdL+QtUFSXplKyq4OxztdS
	 u/y7EtyeymOw4CH9rSDWpmGtE5yWlXpon3YQaw0XwG4B0ZlP7BN6XL901mAfSLH4zokMR
	 NaAB8vc2y20dVSFpYE2Xjllkx0zTgEfQ7F2tJJjBkNUWn95e28x3vhHFVqubGL+xAk3jv
	 dzFjWZrQgHd7/ytiAYJTA08NI6lx/u5a47VwshZnOCSVvSBWhAIgtOvN+JoKMivEpXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
	b=S+xSjNW7ooP5sCRm/Qbjm2m19Lf04sKZKklJm7ZJIn0XiclH2uO2KIKIRyqM4FM4+xjh
	 rYuKu33loDesJQ54GeWyv5GF9wWxmBWcPpgaqjLdGts0jiPrEta9BCubUpPp0NL5DaBVd
	 P000rutubxOK4ZA8FR/aqYUoH8B1atufdsUPY3heIA3xWGDaD+UUVzw5gHwvcR8byIw5m
	 3AKJDH8qwAIga+6rBMvm4eHajFS3fVzgnJ1t0f7B1NUC25F2lhJrgwLzMdkLvTyOZNFPQ
	 ddUyM/d3VsRTS4n6kkQOlqPzwZgjTDVrftvZowQ9+4Mf1gu5dF+93MjwIIzA2l46HnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641C606A891
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5641C606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38304635e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843189; x=1795447989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=oUYELq1SPtFfNTxWfBeeumYdjCkNzVj1iSWVVpu9Uc8hStEZTU9yVTMC0rEvBGhp0z
         oqISG4ts1WI2TMzmV/IzCrfohGqLnTOE1t8hGEAXOQC3QMvPtADUtIuEDu1LS9c9NuIH
         P7A6Tg5cn4YMb7tCOaJ+yqdpFjDdHCqlV06maRe/TiYdhXZOltisdio5ng1r2d6WvGPc
         WlaKCAl/YtWeyLHyI7s5sNjvudIgxLqhnCFo+bpPHSjBUbTyy6xr8poN+MQI4f1Zk54h
         VS8FLdpGFg8LP64gnw/m1IJ3LMK0WiOpWvnL/nXS1arotJwqARJs8NSQ0yhZMcgAh8zu
         kIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843189; x=1795447989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=bdpjM0P5ybJRozJ3s6d25FO/w/Fia8ELaaLpA47HPJP5Yikb1A2jzDf4ADubGKI8Ur
         a4JrsS2CKeQ7ygMNu9DBEji+zlI3mI8Lw80NGzDN/ZmRVCKB3nnVAlZuugjz1Ukzzfe0
         yZvS2M64ZN1YNURCBuLfpNjFpZgKsgSLObdFeCYdhV/dZnYZutrF0JWIswChgE2c0B7p
         o+wQ7cscipPaQkNOws8Ri4Rt2zyQ6vUB7G2V2yVqsIJsxyyvfSM5mkHgCC92Uac1xLqU
         fB0UmYwV97XgSr2INKFIq/xLB3MUrD0eNGRhLSFbeEwZRvJVZBZxJVYHOvAct7/Jz31d
         WSVA==
X-Gm-Message-State: APuU4Z9nIO574hEsATrneOT209szLkBeSuUepqcAcPU4PJ5aUhSU3usC
	Rn9TPv2TEHFllW+2Bva3ArzJ0VxeIickTuXhrw3KRWEWNiQz7YLOmEPp
X-Gm-Gg: AYBFou33nY72IcHrZp2hndCbQdZz1j5iRpo97gwt3K7Id5r0jlHs8mysDrEfFt+JzZb
	aKE+UHaUw0jKPdFl8xBWd3N1kllwVDqD52N08Ali4wkRksKfrzYEUzpzT3cP0TQnrimJxMTO0aL
	+SfhLjZ/jTm5i5e86LHXz8IityARdd9DeZoDINgKZ0gA87bMVMAyvNyVFSeNL8a7DOSdlG1pUP2
	otj5Qz2FlA8yEc/lNuKxkUsa8rOaJ5rXuB+Dcvk3nqleXHSKa4QOhizwJ4MyP5lu7EHsYwqbrRs
	18y71XmsiZeBdcmqlQAJI52K/ugu4o2md+jnDG9J9n0kkRn8GgAP1cD/mJ33fbte9TNgS7D2hEB
	Ei/JdCUzhUk7mublksSqh2hRBotXhBw7G9J9iqEObM9PShFkS4YpAXW/Cly+QTSwmNgMQjt7Uda
	8rZiMH3GUVntldhtSHRGVjtOSRYchN2W4+mwOdz/ImnRp0Z0fiOuijbP8EbANdB3O4itwD5Y6I3
	KteVxJMSHjaIO16Wvm/dFu0uV+uXtJ6Os11+hJx25VJBhGzEZ2tBcxabHy2LVywd2BhNfI3y6QK
	yU3P/CPsxYKpAolBCZidLUhLAMsNhOprct0c+k6BapLKSj9RolGgFFOx864vJfuAsA==
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr167039245e9.32.1794843188567;
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 15:33:06 +0000
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 CANFD
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=2488;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SlQdp/xtduEIxx0pMtkmUmj3788ItH7g8oWcHzROuzM=;
 b=paDL9ELG/I0ILOtSq6Lzvim+LgrEo7oa2/YsoCu9xRpFVnS1XLHyJcgKQcs0Mvbw9tfAqlFK0
 IjdxH+ShC+ABMnu6goPP7c8ajGkU1wBUGGYqJL+NHWSYJ8aj759wjfz
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable CANFD channel0 and channel1 on the SMARC carrier board.

Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
since it shares pins with the DPI interface. The CAN transceiver's
standby GPIOs are conditionally wired up based on the carrier-board
switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5f5441c47335..7804a903244b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,8 @@
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
 #define SW_SDIO_M2E		0
@@ -87,6 +89,38 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+	channel0 {
+		phys = <&can_transceiver 0>;
+		status = "okay";
+	};
+
+#if (!SW_DPI_EN)
+	channel1 {
+		phys = <&can_transceiver 1>;
+		status = "okay";
+	};
+#endif
+};
+
+&can_transceiver {
+	standby-gpios =
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
+#endif
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -153,6 +187,18 @@ audio_clk_pins: audio-clock {
 			 <RZG3L_PORT_PINMUX(H, 5, 6)>; /* AUDIO_CLK_C */
 	};
 
+	canfd_pins: canfd {
+		can0_pins: can0 {
+			pinmux = <RZG3L_PORT_PINMUX(3, 2, 3)>, /* CAN_RX0 */
+				 <RZG3L_PORT_PINMUX(3, 3, 3)>; /* CAN_TX0 */
+		};
+
+		can1_pins: can1 {
+			pinmux = <RZG3L_PORT_PINMUX(5, 2, 3)>, /* CAN_RX1 */
+				 <RZG3L_PORT_PINMUX(5, 3, 3)>; /* CAN_TX1 */
+		};
+	};
+
 	i2c2_pins: i2c2 {
 		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
 			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */

-- 
2.43.0

