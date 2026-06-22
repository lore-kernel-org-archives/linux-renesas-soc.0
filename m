Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF733D6D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146909; cv=none; b=EkBE+7rdP4T8zxLwUlhP0EZAOVaQ4XBfiKmaUpueQpAdni3QFSojdAmu2+gM3cBnzayMhVPlk5ioEuqLclTo4euoLsGC/D3l8gp5ZHodIRxKhcgSv5frUyDLtdjFc/zSpSBFy22fp8v6AWM4d33VC682hvkR10GyLt8dPBo1YRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146909; c=relaxed/simple;
	bh=18QQam5DJuSiaK3r4gpK6C2EH2DHl8QUPhYqR5W/R2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjsD1pk6oErZL6TsoOIL8j8rAcI6r6ES016uNiCnWKK0jIFy1GLyP6KA9hM0yan4wZHnqe4LqT7+ZbIXNEMHQnqaZdOIjqenwqqZ9HOWHTezLNsK0aiKKsDJu6JxmIFUqN4g7Gn9BKC2LyhvVquj8J7RvSCWEU3aBtG17+THL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0rL4sW8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0rL4sW8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2790604f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146906; x=1782751706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxkoo5ooH1NeoGwgjM25DMdAfU0lkc2MSXtkcCh413k=;
        b=h0rL4sW8RtJF2freqjyjH2I5mFZis0/9A384/9d/f28jcM1z8go0laC9OhdN+U+Gd7
         MgvSb+3cYIfgJ9mgAT8JiDo6YJVWb8uckdV7RF6E+E1JryPYSgzGZqcrU/lbjMWLs7Nn
         lWXaO5H/mn8A68V9HKE+JNVat4+Zk9UIH2m/w9/9GlKmgDAoAI4MXv9RqPKKe6JfGOb6
         /jwpdq5PIxFgzbPIoirFLwAKsb2eW5tJZkdSHSgH/BMpJihFs3c8fkz+41oSt3rNP9zO
         o+Zc9l3E+9dJEu14IJNoM9kaYz/7pFs8Q1qA9tmwc7H/cWydTWzCxhAXg4IsF5td3OcV
         UHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146906; x=1782751706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxkoo5ooH1NeoGwgjM25DMdAfU0lkc2MSXtkcCh413k=;
        b=UvRCQ30mR7SCTyw8VOlcAMyZn5A5ppRPQLQYG+T3PzDED3dHHXMwP/b80YYh0GIGsy
         X7t+lmCpFsT6AorLsu1p86+3+4lIHLE5KmYYkHu3Qo17NYVQrm4nqDrq9v6YWdijUw7+
         09uHas8Yomsq0RG7PGx9wvUR9J0+wyu/CsQlY4ue3kwtBt/JVAr91uiERaiU1tZfYnbN
         khqvCPSrYI+vYsouJSfsvtztVC6eeg8MwJPyVL9yYs4GuMD8dkGiDY6z1XoK5g1ppSUN
         PKKpmYfC4ck3uRSZbVEZuAS7sqT9jZPpi1x8+xeyJqBSwNBdEXP++5LI+r2QtuVLxgtK
         fQAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/v+V8Fks9ja2u3Fd7tG7GrJSR72OzJYfl1LZ8DCusjHTk9a4tqGV+Mbzf0ulm6PY+J191/6hYPGzmpTQS0fZAuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2xmTpgkAqu0nThO/JXbFiVFeclkICcgES35YTUoKw/ZUeu/U
	obrrpEAnYVOiChzCBiJLkvHrHcdp5dG2DCQHL3MiX3Jz7r68L5rrykgz
X-Gm-Gg: AfdE7ckTsxPfwYpZAa7Scmfxq7RD2apA/vacqhKuTpd9LdbZv0TCivXGyh9UfYrH+Ha
	aKdGyzEO8lJQBWt5WHRdrKVcQRKM/s/6hgPbXOmrTHW1YJ2SMAQMajP9h8oOQA/ddReB5nvXjRj
	8z2h6T9a/liXVJZw08sjx+8lO7vpuECesF3mmvcyVyBKcYqi6gWD/Iuvu/aGJi1DiapeEvD0/X/
	j2eQ8xlpoMDj9d9vTP1bN5LtJp4APL+U3C3h4VREBDhphG9i2Buv6MFei26z+xodK1rSMu+z9J7
	hqp9oEBYM5Sog37hNKVQODCl0XziAVReuqt+x/HOSI8a4UGDiFASQXiOfX+Z0SBnUeNFjQv42W6
	8y+tyZXU8EGxhwoWzAYhfmpcrnZABo5IFnrv9lrQGf0lZqPdpumqN1k9kriBXKw3ubbocJ57wtv
	TQnHDHsc7EUwbUjbh2mCZtxTp8bjv/OE4=
X-Received: by 2002:a05:6000:2409:b0:464:8d68:618a with SMTP id ffacd0b85a97d-46503176014mr23077540f8f.32.1782146905535;
        Mon, 22 Jun 2026 09:48:25 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm27433872f8f.6.2026.06.22.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:48:24 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v18 2/4] arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Date: Mon, 22 Jun 2026 17:48:12 +0100
Message-ID: <20260622164819.184674-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v17->v18:
 * No change.
 * This patch depend on [1]
[1] https://lore.kernel.org/all/20260622155610.184271-2-biju.das.jz@bp.renesas.com/
v1->v17:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 73 ++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 88 +++++++++++++++++++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index c63a857f0e5b..ff2de3f192b5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
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
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
index 5289efd1a430..0b6b7e109200 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -38,6 +39,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -69,6 +71,19 @@ codec_dai: codec {
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
 
 &i2c2 {
@@ -175,6 +190,68 @@ scif0_pins: scif0 {
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
@@ -230,6 +307,17 @@ &scif0 {
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
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,
-- 
2.43.0

