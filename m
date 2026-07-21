Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265913BC687
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2026 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622617; cv=none; b=PmwrL6Udrrj/Gfka3Wr3fGZR+HmvkfJ4mTA5yLFR7Ti5k2ufPOo3sqNGAVh8FsfmdwZOI5rcbYz3zyRt8YAm0H4zJNg9JcJEBDe36ZQevClAFwktNmyG/F73ATmmgjqwiPdOAZk4CDGg5G//cbkji49WFK1PJoBnKyPp/9JXn34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622617; c=relaxed/simple;
	bh=HbS4Rpeus8z+CqMlKn9XdXXf2qR3h2VDL55W31Dy2+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LidsgxOFJWRVtCYUwz51zH9OjYplyoAW4dvVyRdNQIaKzbzofevNRknBg0yxxRz25BXxA0C42+9vpDWMouiWwdzbOiebUcbhCIwvpikzm83wPDe5HDQxBmbOpIQYXKgIT8eewLqr/zUFjePz4dObIwOOoQG8wcg96APXsHNCYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jti7Yaem; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jti7Yaem"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 805B84E40E98;
	Tue, 21 Jul 2026 08:30:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 554C960368;
	Tue, 21 Jul 2026 08:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC4AE11BD1290;
	Tue, 21 Jul 2026 10:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784622612; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KC1yk5fADdsigOxHDO3fqt916xnPRpJY0Omipd3mb/I=;
	b=Jti7YaemgJTuccjnv4HQqQmLRR3gejszd9mYFHkdQ2zUFIZx1YAArvY2jvi4rM6K/fa/YB
	f3gnk/I5KgCzWyIFTQS+p5CnNcN8FUBiH+lvMb01SPSQRuJ+odIV9uWYg9xWTnCEMunNVe
	uhwvpmTSwtJMzgfqPi5CxUj4us9BMels2rmLWTDAn5BT+/vtLemzbdG4dMIbYiO4DUC05N
	Xob/V6JdWgRDHQOPnq2tj3/Rnx9zSkhbOTLkPxV8EVEAiX5tYJqedPTM8LSjm+uzZHi8WU
	cHHdf3kBF4NqfuKy35gu/WDDIvj4/XKhOzBGXHDAdRG+1gE5COCvd6LFvSZh5w==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 3/4] ARM: dts: r9a06g032: Add support for timers
Date: Tue, 21 Jul 2026 10:29:49 +0200
Message-ID: <20260721082952.215691-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721082952.215691-1-herve.codina@bootlin.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the Renesas RZ/N1 SoCs family, two timers block are available.

Each block contains 8 timers composed of 6 16-bits timers and 2 32-bits
timers.

Each timer has its own interrupt line.

Describe those timers blocks.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 442ea26b40f5..ba3f011e8c17 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -722,6 +722,40 @@ gpioirqmux: interrupt-controller@51000480 {
 			status = "disabled";
 		};
 
+		timer0: timer@51001000 {
+			compatible = "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+			reg = <0x51001000 0x400>;
+			clocks = <&sysctrl R9A06G032_HCLK_TIMER0>;
+			clock-names = "pclk";
+			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer1: timer@51002000 {
+			compatible = "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+			reg = <0x51002000 0x400>;
+			clocks = <&sysctrl R9A06G032_HCLK_TIMER1>;
+			clock-names = "pclk";
+			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.55.0

