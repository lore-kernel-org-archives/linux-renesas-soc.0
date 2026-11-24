Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539473;
	b=wsmxsdNKqmTiFgX3u4bSXSclMqB2gcng18e5+gcHRKDrbv4zhtkOWToKnbzbXrwowHXY
	 WmKmN5QeUsDJMP8rQqWLO3Nc0s/X8VCHE8DDcVPtxzCLT1lTNtSYz1f6mgpLhj4wtn2Bu
	 fiWkBqljsnflTcZwfMVhw+RKOFAYm7e14HY0CdA6DM6DjbvpPXzuODT232mR+C5xB/1DU
	 tux1VoWClo2mPPvd7FVXLijKwS/Q2Mre1+ULFAXWUfxVLLr2kFfnmCcqmCyTon/hWgXTA
	 4uVdii9OFW6wHnmdueWR9I1ExMu08HyhDwCf/vhmTk+JGQkkl/wEmJUAN2DXjfvQsJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=x2orYhLUQmXgThVZEetNCW4LkBPFm9pvwkwDOshtYVU=;
	b=eSawpcGHVYaspxIbTp9WCHgF6hAEYbpPIhutrbvIHghttaxQeEwqZ/+e2s+WBR9sPtgA
	 wVZoD4dDjDAH9a1qxXVttTmotRkhGIyP9fEjecLJ1m6j8q5o0K5Hvssqz1My3jZQp2U/2
	 HV0L7zJE8qt+Jidu0KpXYfyE5cFzyD8tpUNobD4OvSULrCWElE5XeuifvlLzdZc2hdYMz
	 mET0eLo8d5hRwjLhEOd3RKP17tzJvjCxjZYVDT7sKYCnEKLu24G79TJ29k3jHOOvqlehP
	 iz2SoEf/cWn/kjL6oo/uMRZPlefCoHU8uTGJukFKF8OSkKrImZxD28TJgeS7quuaM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTfdClPl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00067606A687
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00067606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTfdClPl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3679075f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539471; x=1796144271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2orYhLUQmXgThVZEetNCW4LkBPFm9pvwkwDOshtYVU=;
        b=JTfdClPlNp6b8m5KJm8VwlXjuKnOBwhYR7eiFT/LCRjSs7Wlp26zEBfCDg76zuAalZ
         JddCX5uWc0mRqKYnNJiXbPhoSPHIihmCnkrdvRrvsrvJjhQ/CkYX85dRGZAAA1a46ecN
         MoPxwq1v/A4TWv4P8vdgfHbzxV2XNMuC1CYapaNLMX6sQtmfqGG8ZzWzefO7SlPgvYZO
         9kKIFzUeqHri9QPV6g1LRkr8czUI2g83qDnCWoEKWhZJUYiHLnWix2NiyG2jg3ctARVa
         jkmq9NENBvkFsCqHm325as7qvCpiYu799it/SwXmvoov7RT+MfUhPdex1gVobu70eRCO
         RKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539471; x=1796144271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2orYhLUQmXgThVZEetNCW4LkBPFm9pvwkwDOshtYVU=;
        b=GsByNcy9/NBv+mIMIZYnJynMcC4E44CYr7cmENH6Gx4egbLY2ifKDD/VozefAVJje0
         BFx0Wh2x59iDfzzDGOH7Sz2/gwts9yCndEpo34wSKwwpRltMfbagwkwk9ZXT2kguoOew
         WfjCuZb8d0+1ZNAu28crSxibQhsmA87jR+9Gm9DV7Etbu6P34TQ8HUfS3ljh1ly9nTZ/
         RayKt2TRdgx6Ryd0aQ+d6pHezK2HoAK8t5uiPakM+NULGuBdhisQiHCN2Fg4BXExeZYF
         Iak409mpJoWJScXg87TzdKvC9yKKRFWiGWOJUXipnGPx+TJlrGOSdEHHzSMVoz2pnBW7
         JKSw==
X-Gm-Message-State: APuU4Z/UD7bPc9B1Ln0/00jTYXFeGutkMRUc/L+vZxbJqIgkzalyPBVY
	Amq7cZSilZ9zCPhOOzLaKhx8D4AW0ewo0S2nKj+Cz9v7y/PpyGvHFOnP
X-Gm-Gg: AZFdTZeFd++kut0M06I/nfEwraVP4DAbj/80ZacvraW5lJWHgSe6sFm8ktb4Zi9Usww
	PhNbn7Eb85LsprOWDQReIg97j9JMn39nd4vFsMZAFZSC/fsRbT4JcSjaFqMJ4t2rjp6/ynhi8V4
	RKO3BAXxn3Wa7KjwAvATgw5h6y0EIje47EVxz+jNzlLTVpJ6IBE9hsrZ0x50+PZ2joxD2SDxTPO
	T7ebPasa2NUWuNOm7JB2s49vgeJL1G0d8Iy3shzaQ+gQBkgYGlnvYtjGEeb9XEingswwt3uXvFG
	PwBnWk1zXnzk0FiGsIOvCMnqZgr80w5AS5mpOs3B1JpLTl4Zc+7gqh4rL1PM63Ro0ZbS7tLHSvV
	AfrZlx4O/vViTC+E1D95j9Y1NjKqdIxLVi2887hZNesIzUe+qMc+kq9SfL18lQSdLZtXmQU3xRL
	ViTBWJ1U924JBxSWfN7Vvz5a+QXz9LaejEZP/JrV+H95d2ceV338luaOMPh1ObWOO7x0Q0FyATO
	5lBD4fR8OSDW+JAFTnU7piKPFoAeG91XMk77VQADps9VB3VdtVJeFasRvwKXfDl0J0OXObgnBqw
	ZGFruVMlfG5IGxFSNMFJkzI8no84SSxbo6IW51VXOMTtgZIz1E2S2R/4aEoYuO1DfF0=
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id ffacd0b85a97d-4b780c1127cmr4188475f8f.35.1795539471250;
        Tue, 24 Nov 2026 08:57:51 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:50 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:57:48 +0000
Subject: [PATCH v3 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
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
Message-Id: <20261124-sdhi_rzg3l-v3-2-67cdc83b7e48@bp.renesas.com>
References: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
In-Reply-To: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=5386;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Hz0nrRH8QD/xs36CuE0zclmifljP/EBXLnoS322HLdY=;
 b=b09LzaS+YT2KjBoLITny5Kw/Gz1pKGocLoQ6s38emBFp932hL1ayUceLwszNbX5Y2udfTMQlq
 W2Gn8XmOxuIAOEEDZiCVOjUAAemQsfNUEsXZ1hgh7oNDUJa6UVsCrVP
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS, which must match the position
of switch SYS.1 on the SoM. By default, eMMC is enabled.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3
- Added generic node name vqmmc-sd0-pvdd for GPIO regulator
- Retained the tag as the change is trivial.
v2
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   1 +
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 143 +++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index b096ba9e3d99..2429f09f4949 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD0_DEV_SEL		0
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 91b2d0d43104..5e67bb5752fd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ *
  * Switch position SYS.2, Macro SW_I3C_EN:
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
@@ -37,6 +41,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
+		mmc0 = &sdhi0;
 	};
 
 	memory@48000000 {
@@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SW_SD0_DEV_SEL
+	vqmmc_sd0_pvdd: regulator-vqmmc-sd0-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD0_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -241,7 +259,132 @@ i2c0_pins: i2c0 {
 		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-clk {
+			pins = "SD0_CLK";
+			power-source = <1800>;
+			drive-strength-microamp = <9000>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			input-enable;
+			bias-pull-down;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG3L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG3L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+};
+
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd0_pvdd>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#else
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
+#endif
 
 &wdt0 {
 	timeout-sec = <60>;

-- 
2.43.0

