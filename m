Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3C40824B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970793; cv=none; b=dbdmOCZsiCDNF1pUGXoOsb/tMNU2lTWqMeRtcl9EGTX1INDy8d6Qpm8Zyn3LmBz9fIzWqAkiWj3SVlIFeR6R2erR5LserJd50TviHY/oLJODttkEailXAm04RAW2YPXExaqhPUG/lloAwCSQ3LeAex2MInL62ORVJduBOzXAVek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970793; c=relaxed/simple;
	bh=0al2iiCyvdqOvHHOAtA9D87j8/jVhjszFu42OwifpXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB0nslEOp/Pp5E9SlSeKt9PG+gnDBpz/jSq+Uu23qqzE700QFTThQxddedtIsBUdGecYPJx4GsmvTHzp422HONSGZpCZjn+t4xHK99TBPeGOkDBU1Agc5A61J8TMBQf6y42yxGaQfp5vx3bH+SXvNpRIRZ5UT3ZnuuiynqueEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HEzymEV2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HEzymEV2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24D0F4E4288B;
	Tue, 31 Mar 2026 15:26:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE76E6029D;
	Tue, 31 Mar 2026 15:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A26D10450287;
	Tue, 31 Mar 2026 17:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774970789; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1uWcBKQ8nvsKRUPJODE2gnHDve1r4371hZd5qBpuh4Q=;
	b=HEzymEV2IlNDHGFWgdu6k7TjKILP+8wZj58U9KN0jmcX3/UvtrPs71mO2Goxm7wFjf3Xj4
	3FToGFFvA2TcAL+CgaWnVNbV9k0GKIZCa7SoE2EOUOmiTYt2+XJPid6SzP21YLWt5BiAW/
	ONMf6k2GkXMZGLNN78P2hKt/DBi+cQqrD9MvNtMBW++TZ1TnBzJEp7tGyueKGrdnccS/Ro
	TDYebpmREeaWo5CKI+dxsArBRef9yDu+jxQ0oSaVi123sBxurLDMerUEmW35vCcw6AKqtm
	U64i25n2wHkP5+WmsWMKZSdlWSCinWKkUyVrIJ6oNim1sJmnQIt7+ejpn9DfCw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
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
Subject: [PATCH 3/4] ARM: dts: r9a06g032: Add support for timers
Date: Tue, 31 Mar 2026 17:26:14 +0200
Message-ID: <20260331152616.197031-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331152616.197031-1-herve.codina@bootlin.com>
References: <20260331152616.197031-1-herve.codina@bootlin.com>
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
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index f4f760aff28b..7d736e1e835a 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -674,6 +674,40 @@ gpioirqmux: interrupt-controller@51000480 {
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
2.53.0

