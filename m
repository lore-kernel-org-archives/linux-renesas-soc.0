Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89336A027
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251468; cv=none; b=uw03llxYg7MbbhK1asxI4hS9Rf0txWA6gS+/N2XWJ3dtGYyDh5yJ7o9MoHf1xxxuA2HRO24DkvgWcp/ipQt7rdcsRrbY2tr7E4Q0P5XgkqFYLHzdapeEiKLG759bAqBshuyKm585kxuj0zG4mmG2tJGCl+boDZHSiXihDBlgevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251468; c=relaxed/simple;
	bh=Dj2Ew8yvAldSr3awukAV3Kg2s3w/SBPqK87po0SUhoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yh43TGfR/hUQquyPk681xdbQtNnwAL0FDh+i8kom72LZubT/sk6GHHyidQSmwuUVl9E+AImpsI6judqWnyGU7itJFvW22LFoji80KQdgMCJltellsPuyVGdNR7ybVgnKv/OnIYk7KUunFbOzg/biXGcUMRbWoKQkFl3CsgPjV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tr1DDe/J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tr1DDe/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=calaLBGJcR8us5j9ZC0jBLLXjs2EQu5CFLvUErb5yWc=; b=Tr1DDe
	/JpvH6FU5GQwcYKndrxphnvbrSmD5K2Wk+Be6WGJyApJZ54BDGibqL+9uAYqOUba
	etn7YaOa22cZAixKm2wG4Sf5Vz68gj9WxxR7uX+lje4WM4TCHIjb3bdO/UvU84Se
	2igY47GWPh9meDEff32Wkb5LbliLnkHzeQLTZTLSmlRgySCJt5xU3aSl7uaIqX8W
	iNGB0moUvyrMlnPw1aDHvI2YOl6Uu3+/xG7ll71SoJEDCNpr5GxDx/TS/FzlPbw1
	CxOGfxR949xtKODz5CRRIyq6iheYHb2AAqNYJNQcc/8cnfMKNrEXuGpazQMLZQm7
	jWrYhXSpwmArnxvg==
Received: (qmail 2443804 invoked from network); 12 Jun 2026 10:04:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 10:04:11 +0200
X-UD-Smtp-Session: l3s3148p1@gYIA7AlUtqcujnsK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SPI controllers
Date: Fri, 12 Jun 2026 10:03:55 +0200
Message-ID: <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
4 can only be controllers, the latter 2 can only be targets. DMA nodes
are not added yet because DMA needs some extra code in the drivers and
cannot be tested yet. Basic FIFO mode works reliably, though.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 442ea26b40f5..e5c76b38a58e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -563,6 +563,96 @@ gic: interrupt-controller@44101000 {
 				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		/* Controller only */
+		spi1: spi@50005000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x50005000 0x200>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI0>, <&sysctrl R9A06G032_HCLK_SPI0>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* Controller only */
+		spi2: spi@50006000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x50006000 0x200>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI1>, <&sysctrl R9A06G032_HCLK_SPI1>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* Controller only */
+		spi3: spi@50007000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x50007000 0x200>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI2>, <&sysctrl R9A06G032_HCLK_SPI2>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* Controller only */
+		spi4: spi@50008000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x50008000 0x200>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI3>, <&sysctrl R9A06G032_HCLK_SPI3>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* Target only */
+		spi5: spi@50009000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x50009000 0x200>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI4>, <&sysctrl R9A06G032_HCLK_SPI4>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* Target only */
+		spi6: spi@5000a000 {
+			compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
+			reg = <0x5000a000 0x200>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_SPI5>, <&sysctrl R9A06G032_HCLK_SPI5>;
+			clock-names = "ssi_clk", "pclk";
+			power-domains = <&sysctrl>;
+			spi-max-frequency = <12500000>;
+			num-cs = <1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		/*
 		 * The GPIO mapping to the corresponding pins is not obvious.
 		 * See the hardware documentation for details.
-- 
2.47.3

