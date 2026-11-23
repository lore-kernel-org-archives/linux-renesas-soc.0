Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442281;
	b=myvnntZsOFqHwvReZPBBG8zXb38w0up2b6DvJ+23xcUfN8cFvV8ErGlzjixNnQXkxjsb
	 KewxOOHvNPrMCDRAjHlUdHTU5/BYsJAD+jmWglRZ2h+tmh/SZOjb6WrqeQ6WTJXuDhnYW
	 V+aTiR/a+sK9lwyIYYezm/3z03a/ajHCKpKfixw2MgIRSbrEmyplrk3mo9CQ3CYHnCu+1
	 /uf4FNtLReC5CwsYX8Fa43gi5GUMUXHX05Ij6mB6Me+xkZ5nrpVARSRX+oatzND0jEJpL
	 cOs/PpsWMAKaDJjrMe3J9FOF8c2NLUhVxoKuwUxiiNo50YrA7O0r3zHWpSpu3Y/CoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=aDsGpgT4oiUwzFQMguwS59INDZNOdr4HuQWSjUgJW9c=;
	b=xAZBitL7HVy3pCjSN3xszCGnI5Ma5mO/5XDDuvXM0TwQonaYYJaQli7YHtOunDvWm4rJ
	 swlvkdEh2f1fKdABCNk5XagOaE06Pn37vHLCM4OS1xcuRDE49VNWUfvSB0cfiatMAMsoA
	 xGOo+hP99hlkS7eMKAGaA97A5+06DgJQktUefFF/lfQkgjJJOTkH8JZeKVh2oO7RpzRsi
	 KjlIkB3uSV+m4/PD7Sf2bfWUskIvUQsYIVayzZf6inG12RM3/tScOlfEkaEaW5xFf5W+V
	 qcu71sMkswLJEj410IcgR6qy3fCp0ar0AVCzHmyTIt4XpdmwbkJ9EhdSaDKBJqASphQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzeZsyNx;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED3606A691
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7ED3606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzeZsyNx
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so29131175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442279; x=1796047079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDsGpgT4oiUwzFQMguwS59INDZNOdr4HuQWSjUgJW9c=;
        b=pzeZsyNxCcSLOvb5ZTiPqotXWgZtNU1ZgFRQEJjq1w7SFLFw6shqlo59UlRkGvvDO8
         F+nUElgorIUrWtcyoFWcwo4AwqvTEixKT2WH9KTdgOqbdMrb4VeEi38bJ4Yjl4nxRsYr
         eoX0w7bSg62grmuK7CXBRNhjBhLzrGa33xubOiye+ebPHHZn+kyHdliJQEaT8kkF4oqa
         1MEBMze4fuXpQA299zcgYnHH/741b6OYSZABpqt+aIqt+fCTPtbzWjw9F7WWqfiuXbgU
         +EV7yklakZpvtcMZHg9GMgDETZ+yh27HtlkA7fyvzOvd4+ip1C5xv8Vj4dLEbnqM/vq0
         umdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442279; x=1796047079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDsGpgT4oiUwzFQMguwS59INDZNOdr4HuQWSjUgJW9c=;
        b=sW8/FAqX6R6THbRemMwQyoZMk7yORxvdK9oS0adT+jomlSZUX1KiSVbzgqpGzm2jGq
         8HCZEopDmO5BFZV5BnptVWL+eNBqfaAirrWO7Ygf02zkwkcGdiI4g75KjIvLOa4yY7dE
         PGNukyCrpTLzBniDkp2LKwT/zDssTiFRTrsg0f84q6FlTmwgE+vSze4vFp0+oPdN4mMQ
         o5bZf5PqiW0fCxphqGtQVhJNNMD0qB6rWP6jdK8p0ibShcB7shmIImXFR73z0YT04ZB8
         VlplxVYyyzbtaIarabjI3xp6v8YZNhHS4qXQvwQwXOnmd9Bj6+v1iS6+FrFaubGOEojz
         gaiA==
X-Gm-Message-State: APuU4Z9bMfg92aGV0n/W0cUSnzF1QzlqC8/NpsoYlUlgfuiKqOCi9t2D
	nCD7ZqFAuOfAfUxcr1CSrn4XnsF6K4lBKQ5YQEz8HmuZTSGyoM3wJmrU
X-Gm-Gg: AZFdTZfyWInRTmUt8vnnCVR4H/RsDCtDB1gFi9mMmK3Ts+LQM09SRpWMkIV3nFWGuIW
	00bdSp5XJ9pZ+wb3m+8qMSe0GxzOP8ayGS3jWgDn4xSsxXRYUXbo6ijeIq+tGsGqRZ3zM/JxXdY
	WvlzDieCWcGE27ATTPiOSzCk1AI8aJXzz8CZkNU7UNNza1bv9S5Nb+52VFCVWlD67Ncij1UU6MH
	F8EYiWzkePzQ1grr9PqgRhjfHiWeoNhYZ6Dv3JxHCxtnAvb58xa9y3YKnr1DRkkVUCe9Z6MnCqr
	qjlJGx6HZCtwhoxpaZ8tHvaRSsgudGSqtRk7umv5vmRErxF12CxQRVWA5dgWidZvYvSzxMM5xJT
	DR/E7jgaG5Ib0MF3MDOYJs5l9pACfWZoaWYFPVsIRgoO6vtpqQV95YiWSVXGkoSHNmwroyzmbhS
	uobqWTWeq8/3vZkI+13oWlDXM4fW0ieawl3oXvtqxKAPlW6GoLKGBUhdc3EHx6UO82/aWnrlRqN
	lVxBjtgvt0c1E4AMgSj22KeM7C8O4rTNaya52CTGmkTp/zZ5m26mJIhGerGqsQPgf6J+sRZN4pq
	77a4XaWfQ+wd69invsFTSXKTsmbjED36otzoK1sNUG6cdtE3bPMJVuc5NEfnXqjeOA==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr259820585e9.22.1795442279068;
        Mon, 23 Nov 2026 05:57:59 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:57:58 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 23 Nov 2026 13:57:53 +0000
Subject: [PATCH v2 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
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
Message-Id: <20261123-sdhi_rzg3l-v2-1-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
In-Reply-To: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=6931;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ocrWc0zB2k+scyvCAQsjt8c4dk1BRCOtrssBM2yNUqw=;
 b=MOD6Ih9GZIFcC0onSOpAMdIiFWq3REAwC1cHuZiQtioKYWJXR9RqiU8sy0DPZEGnn5wEUVXSH
 aLVicdAlN6yBYt4lhtKHoNZlT3hMh+yyffpQVD/q6yH3ktvHsUUvxir
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 73 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 90 ++++++++++++++++++++++
 2 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bb69e5e3528d..b710f47d3f03 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1068,9 +1068,80 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c00000 0 0x10000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI0_IXRST>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a08g046";
 			reg = <0x0 0x11c10000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI1_IXRST>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@11c20000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI2_IXRST>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
 		};
 
 		eth0: ethernet@11c30000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 517747aef36e..e9b7b3280615 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -16,6 +16,7 @@
 #define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -40,6 +41,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -71,6 +73,19 @@ codec_dai: codec {
 		};
 	};
 #endif
+
+#if RZ_BOOT_MODE3
+	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD1_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
 };
 
 &canfd {
@@ -257,6 +272,68 @@ scif0_pins: scif0 {
 		power-source = <1800>;
 	};
 
+#if RZ_BOOT_MODE3
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+#endif
+
+	sdhi1_pins: sd1 {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <3300>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <3300>;
+			bias-pull-up;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi1_uhs_pins: sd1-uhs {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <1800>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG3L_PORT_PINMUX(H, 0, 9)>, /* SSIF0_RXD */
 			 <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
@@ -312,6 +389,19 @@ &scif0 {
 	pinctrl-names = "default";
 };
 
+#if RZ_BOOT_MODE3
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd1_pvdd>;
+};
+#else
+	status = "disabled";
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,

-- 
2.43.0

