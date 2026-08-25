Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE823F4DFE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651459; cv=none; b=M71gAL6yFaOXarel69Yuc8UsSoBiAO0zUuXXWhiP9RoK1612Vj26/K1qoqkL/4Nw4nqxiBGxZuvZ50JBbVAvM2Cmx3Q3kcCKgfNmM1egIlxaITzQaORwvBpVSY4Jn1AkXtHn6ysy1sQ6+QLODwqiAk9U2Wad+Atm4lLvSKzvXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651459; c=relaxed/simple;
	bh=/HkeeA+hW6cXIZLjRr46L3leSd7vxIIkGxvtnXNd93Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKrSDu4lF8+W9QTM0YtAtoZ5SK1UcLDWT226ZTFuwit2e8riAKYpJFiS1d+Tl8z2WmEmO1BEDU3/6cEM463pO3iozZXZivmqQ65UNDXIbpulYlEap2a266vlyh/4XFsweD8bhFEYVgX1eSgoBS2MQjK+P+HLlDEPpxTToF9QpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJkkfl2V; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJkkfl2V"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c16794450aeso666076866b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787651456; x=1788256256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paaPPd/qR8ZuuPD7RS7gPXa0/O72xu/xLDRu3Cm8lYo=;
        b=dJkkfl2VtLiLYxys6yQO7TCQ0YgmoqFk0ptx5Y3Iq9owIc5qT1Bpu0RQqRqrtY/7s0
         kLj2/TGdD3dHbvJeFqgYVEpOrnf+xTYL8EVgUG6EjsQvG84NK3k/PFtVSyL23EZcqby+
         CHCa349Hbxti8Ln4atAkWlGMvr2xhIWMlx3X+2U1bY/8Uoa2kHt2ss1AOgeAUnFKqT7j
         qqFnL6FkzXM3rybiI1f1RnGYZVVWEN4VuFyWb25HaviBWIJ6gSZTzCobVObt4BfurZqS
         6GrFOt8buY+4ReVSSfpvr5mrFN49+Otbncc4IuLqR6w0JC/YcYIkbmfHk1pFxLBGjW6v
         nOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651456; x=1788256256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paaPPd/qR8ZuuPD7RS7gPXa0/O72xu/xLDRu3Cm8lYo=;
        b=iAqVnEavCU6Q+B53es1k+RhH/oVQhxK3IrwEe8i3Sm1BminsSBl0Mxuo9R7pg/VOv2
         oOHKUPKRICD+HW6sE+PpPq3S17+ETMcM2+uD2bmDWtJdG2ASmUZiLF22SJtWsVvyajrC
         y8YI4FefRC/6obplczMFOBe61IleKV15Ei5sw7E/PZk5myut+a4dOyebz0XpscDEOEcO
         3eW4M5kaM2a1aUi7BQWrOy49yWAnbc6D3VVuVLSKUZtd5IWXL1STwIO75OXsrswX+IQB
         JTAmSz6gH0AUoEXBoVatHjq9m1GXGcacm5Gy8zSP5oOWlMQkVb7I5q/SQdVb92xvsCcS
         5rQw==
X-Forwarded-Encrypted: i=1; AHgh+RpHYtupM328RIxicCnScAY1EKvtPvIgjq+tZRNz0Tz8qX+s7lBw2lSSyyQqAxSGsSB0dUMAu8HT6JRIUJp4sdS9KA==@vger.kernel.org
X-Gm-Message-State: AFuF++klNpPshRtS/OxSwy+fSzVri/UbSoPb3IICQROCbJhCsQWPfWyy
	gZFN7M2xSHCPZo9c1WeAPeeVcjmsWZjGIG/N/SSLJZ+dJYGW6WbMdX+q
X-Gm-Gg: AR+sD13g3WXR4EC6YVKNDL2x3qRyesLxzASPabyyL/ZUQP0R+P/jDo1Blf9U5dubX1e
	azJuT4rArbKxc/Xts48v6yr9kNMtQAhssnfi/uMR1uos/sFrwYlYN2mIMKbniga5IWJeKXH5WjD
	UZjNVvOsQ/wysfEpGrolL8T5XUIBn+RKazhBz/kRdhQiWHtw7H5p8CP0n/urWhV5LJxUwCOMEyT
	bJiQOrq9ujyWefGPmsQR701CdshIJtby+hXYjpPuIyoemWAJV7i8P31+Zh2UCTumiXOzMNvaxLl
	m2V9EuaJiRuRNz2iYe6rhoD9h/lDl0x3PPUI9pBk1Pduo2P4jHZFbjg4XSgUJDJOWPgtQdfZHV0
	ei5dg+wzu9IfI79qKdkvNxRxj6lnHNIC/WoeljEMdSLl0TZC1f1i+qVvKUARS/Ldx3W6hOK4GDH
	ptI9yOO/Dsrw3HMcR+1H10z0LrKRSwACOgVz5KK7S7G9Rzz4bMhym3IR8gUmC4exNtijrYPi4Pc
	rmo8sCU/mX3E/xFlCqGRT28
X-Received: by 2002:a17:907:9603:b0:c07:43ed:1b3e with SMTP id a640c23a62f3a-c2469f9a365mr3735955466b.0.1787651455541;
        Tue, 25 Aug 2026 02:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1749320666b.23.2026.08.25.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:50:55 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a08g046: Add PCIe support
Date: Tue, 25 Aug 2026 10:50:43 +0100
Message-ID: <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Populate the previously placeholder PCIe node for the RZ/G3L
(R9A08G046) SoC with interrupts, clocks, resets, interrupt-map, and
the PCIe root port's vendor/device ID, and enable it on the RZ/G3L
SMARC board with the required pin control, CLKREQ# GPIO hog, and
100 MHz reference clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 45 ++++++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 16 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 11 +++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f652ad3f1d1a..83e466ec49ff 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1480,20 +1480,61 @@ hsusb1: usb@11eb0000 {
 		};
 
 		pcie: pcie@11e40000 {
+			compatible = "renesas,r9a08g046-pcie";
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
+			/* Map all possible DRAM ranges (4 GB). */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD R9A08G046_PCI_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_PCI_CLKL1PM>,
+				 <&cpg CPG_MOD R9A08G046_PCI_CLK_PMU>;
+			clock-names = "aclk", "pm", "pmu";
+			resets = <&cpg R9A08G046_PCI_ARESETN>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			/* placeholder */
+			renesas,sysc = <&sysc>;
+			status = "disabled";
 
 			pcie_port0: pcie@0,0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				ranges;
 				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x0033>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-				/* placeholder */
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5a8269c06435..a155967e1f68 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -170,6 +170,11 @@ &ohci1 {
 	status = "okay";
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+};
+
 &phyrst {
 	status = "okay";
 };
@@ -190,6 +195,17 @@ i2c3_pins: i2c3 {
 			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
 	};
 
+	pcie-clkreq-n-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "PCIE_A_CKREQ";
+	};
+
+	pcie_pins: pcie {
+		pinmux = <RZG3L_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
+	};
+
 	rsci1_pins: rsci1 {
 		pinmux = <RZG3L_PORT_PINMUX(D, 4, 5)>, /* RSCI1_RXD_MISO_SCL */
 			 <RZG3L_PORT_PINMUX(D, 5, 5)>, /* RSCI1_TXD_MOSI_SDA */
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index c1c2795bda4e..2ee11d54bd58 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -51,6 +51,12 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	pcie_refclk: pcie-ref-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_1p0v: regulator-1p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.0V";
@@ -190,6 +196,11 @@ phy1: ethernet-phy@7 {
 	};
 };
 
+&pcie_port0 {
+	clocks = <&pcie_refclk>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		txc {
-- 
2.43.0

