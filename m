Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C6F4DB54B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821326; cv=none; b=Owx51o1tVilvvN8BNQoaiNGv0/mckStoEG+S8GFhJI8pjot55/kCKWQlSX0uuIe5Ke/M1Z3EP2ki/nxZTW/f81mAbDKrE9Hn8lJJfzTgkKWDxD9rcfWGgbDKjJ4lT7vE0Go80+to7wxPZTBAQv+E2LH4i0KndX+2K/al3DWBZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821326; c=relaxed/simple;
	bh=sL2ZcLXIOxQ8wvHodXUd2dwBPocLiNSIhT/aNiKrxBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h04lVqlVSfnMvAo1Z55AMdI6miJTkw3S07Vw26G0+21dmNRKlPCaAq1U/ePj/jKjba+e3gv6jPDVRcHV4v4FSqMeh80MZvGEX9oJXzXTtC/BTWWpGyS0JfzzQjvDhUyZhZaVu5kSH7UUuaSsyPeFudTD/zqK/i2vTWVungpQ6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOqbVhnr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOqbVhnr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4333965e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821319; x=1785426119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBsMP7a1V5FrQiK7d5JpSbXabi9hsDcf3fUUN7deLa8=;
        b=XOqbVhnrvU8KnGQjJqOG3FvPzok7YB8bNTBtjmHD1TJ7fA95b3Z3ufh1SAOHC4Z6Jn
         jBL0nwoeNPGsveXGTJQ332qtc1M3xFmg4ktZu5vC5BlHlaD/s9zI/szEOdFVuu9HsIh5
         wmkJAa886gJYkWZLz8Pohs5/s1nPydmQml2FI1uJGhY+TmwTVMs6qZgV4U8ji/IlgE+e
         VBIh/RkONk6W1NdZKE6TXVsYPpz/kPjiN/6PLTMD+7/ISnV3S/ltD+TSNIQKyI4PMHa2
         YAKPDaVqBI3dc1tyLIYa3aqQwqxUdubLIf4c8eokxYX1jIs+AQZhOr/mt9BlHBgpPnfW
         gzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821319; x=1785426119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBsMP7a1V5FrQiK7d5JpSbXabi9hsDcf3fUUN7deLa8=;
        b=IGN0REY09/1jZf5PwOpP9ax9lGDH20FGMmKQM7FkO5nba2ko40maWzmN5B7V1Pdrkq
         1s7oySgVhMiMTEDSPS+tE2/nxJMwcO9HU4kIVVBOy/lcdbl53cWYfkq4YlWQOoouV8sz
         QYViQPYt72bwxDWmFDJo45T6DzCDPsc6FnSdof9xuwpwVEvzUbWBe3LaDAUcpdLOGxgW
         pX/c91sUFbeb/cKQFNIBa6JB3S84g3sldTbtrhzYXBHuP7cfT+24/j2A8deoOdFHbyEd
         uL8y/n3eAd6i+O0krx5A871PFRTR5uDpGQ9Tc+lOAW7L9BgAHo/RIHFAaJoRKyCfnhOK
         aCcg==
X-Forwarded-Encrypted: i=1; AHgh+RqkTuZc7t8HHM9y8zq8wnqgaP2vZcvNssr3WK2TJU9Xsb9LOQqetBcqSsXKOERqC28FvpDXP7LRCbN4vxHuywRSvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3z9kGnhpYxQBT6iL3NvZQJ4hYr24BwlsT1G/3zOrGWLtRpRQ
	6tTQcK46qrQuZwzbhpJNSlJX+QQZ7jGcWpLd6Rk/dL07sVNt6cFLVeY3
X-Gm-Gg: AR+sD113NOHts1FSNj9D+P2XSWUPlcVrLor9uzjwAaJ9wry0H0h7VBjy1Hz4+8inf2U
	+p0/1UHNU+4sW9ppAxH5Pda5NIM0xvr7UAVDV4zxrKnbAZ/tPjp8/xYVXr0r4zG1EWH+G3rtH2F
	sx+/JBd7pSAnXA94pJOHdX2s+he1Atqq2TP6qGjeROpEdjsRLG5aQQzSgJ9md97phUxwOk0D7MN
	d15ZguFl2gqjeVNcsmFr2C6MU8pX0qiJ+Do5Xfxmo5ZbytVgAzvaFDkg3CE3oGq97D6NQvwAoXe
	XVVrmqwmJj+6ZvRbR48FyrvSFqB7EVquW1E69P2I6/RFyXfdV2nktjC6A0rTUES7MIH4UVqmXvK
	QIqvCbgJ1V5zcgyowzTuIkuWj9/QU3rbQE3ryJAkKHCgYGGm1sb28LQJXMEcK5J7AdgZ73lXt+W
	0HOo2T4vxG96WwmBe0ZBWfdN8eAh2GxMUIDj/A3AmlwuhuHEBt
X-Received: by 2002:a05:600c:c10c:b0:495:54e9:c080 with SMTP id 5b1f17b1804b1-49573d06455mr32322955e9.31.1784821318502;
        Thu, 23 Jul 2026 08:41:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:58 -0700 (PDT)
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
Subject: [PATCH v19 2/4] arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Date: Thu, 23 Jul 2026 16:41:48 +0100
Message-ID: <20260723154154.319674-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
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
v18->v19:
 * Renamed aclk->aclks as it is AXI bus slave clock.
 * Rearranged AXI bus master and slave clocks as per binding.
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
index c63a857f0e5b..3665ccbdd91b 100644
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

