Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A6835675E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782497022; cv=none; b=eWz9bNljVEs4g/ihD+KPUWf+p/30T/AR9ncjHj4q7MtCrXvZburUwG07xTY+Rlf6E99toC6Ibq2vXFIQf0z9W7ng4DU7h9Gh27Ex00+EDRcqrzsF7ibXILwwZbl0UuKPohIu1NyyxhhkJfQpJzpqG4aBrfGNbOZzBwuqC3BD+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782497022; c=relaxed/simple;
	bh=xoenYhy7fdJ+RKzdknsrHUFoTPz8OLYxgmvpg8UyiYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgLluOW5I/1wPqr+6i51IjO3/uw5Wtb2aDn1aIRVbN8PO6Ykzw8et5XHu14Ctvf1rgXhhK4R/+fARUFVxwA4ycPYxBAE72wWvO+vr53G8pI1JcHNTjrOtuNhOg7gkKFyaHEFQzP+1RBxAyy7PGp96DExaCoXnuFwGFMgWWzqRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R91sSa2s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R91sSa2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PCTHFxiEhyLRVoYX3ET8YmThVDjTqfacn3ZxZVQ6Hqk=; b=R91sSa
	2svXsPEOlQlKTdnTvbGDBjdZ1M+At/qYAm1yFNtkAEb24SJu9auFmMWiHNhM+m6F
	LPXcOx8o+MiNH9YTqpgyvY2SU19ZfXywwM/XRA1YyRiy50lSuJ2Ez9qB9/vxIQnq
	N3g1qzhIGVG+UDyKaEqlRhntr/sWNGVawP7qyn49g7E10wAmlzyYaTyHtOMhgLW+
	nR+Yalo1bibhbIyWGItI2HuGdl24N/yYK0defRYdqN6Jer6zZoWkaTlbdRwygBwL
	+R3NBkdcSzxyt6hKj0TgB0Y86nHdrP3+A3ibY18hyuH0juDgHceufaKBN8i/kOFP
	l8ndFvGCNAfl9HLg==
Received: (qmail 3649332 invoked from network); 26 Jun 2026 20:03:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2026 20:03:33 +0200
X-UD-Smtp-Session: l3s3148p1@uQFN7StVrMMujnsl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] ARM: dts: renesas: r9a06g032: Describe SPI controllers
Date: Fri, 26 Jun 2026 20:03:24 +0200
Message-ID: <20260626180326.9593-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
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
Tested-by: Herve Codina <herve.codina@bootlin.com>
---

Change since v3:
* none

 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 442ea26b40f5..19c9bce0a26d 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -563,6 +563,90 @@ gic: interrupt-controller@44101000 {
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
+			num-cs = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
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
+			num-cs = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
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
+			num-cs = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
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
+			num-cs = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
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
+			spi-slave;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			status = "disabled";
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
+			spi-slave;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		/*
 		 * The GPIO mapping to the corresponding pins is not obvious.
 		 * See the hardware documentation for details.
-- 
2.47.3

