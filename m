Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7C3914E2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Sep 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521930; cv=none; b=TOxPWypV0ycff55y7wi9fX2La/z+0pi2ohzhykrVlCe+LHKPinbcN9k/7hAMM4III9HKDew3ECGuA4wnxgvg/UTm9KtspJQZaaTDrt4S5qDSqKKztfq8PKIkIuQo4Cr62F00njUn3X8gCBd7Wc1C/TNGGnR0fCnEi/c/iYHiqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521930; c=relaxed/simple;
	bh=sdi3szlRb1zbfE5lzr+H5BoBW20IGh1jr33k8LyM/2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2Fyr1RcQVUGCTpl99AokSbl9NyzBx9zc3tXIhEzZYsRi4O/BqS+7f0yyVE0RF7wfnEiwkfIyCBj7avgRpzznWCf1IEN0u1wT3fNC7qUsUsG6Zjmbt4q+/kY3K1oGWmg8xBnExL4URV8pB14r0j/gfVo7TTOcDIDfsm5Stp6zJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JKJZlUZU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JKJZlUZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=CFpTIauGIj+Mjl
	h83c2bPz/qGCcJV6Hol6+Vk+2TBl0=; b=JKJZlUZUei6O88B5nvbgsNGJ5gCWQv
	B0oJlmRd2rVx9X7nX62zF7KUnxPmif+mwgk/UVG2L8xVmY0xMxSdevnsKjlyRQxO
	zb83bdINMJk2bfvmd/ME7cpkA85Rur52NqSboJet/CuilFjb69iVrBc/QVDpudOC
	0mWjH5bFaq8pBLrk6go42L/5KSphOCRunQLAYV7dnH3nC/wgpI64Z+F2bHxP0K8+
	RAIHGE0KaBD6gHLLdqGALla/+3uGiPOd8MCmgZ+tTKp59JZ7Tz/zRgoTxnyllWKF
	EVmaAmtdT+FNHutkf/wd+eS8a+Aq+Bh+VpIUqUsYzQl23dVi3fTiAdQg==
Received: (qmail 2667956 invoked from network); 27 Sep 2026 17:12:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2026 17:12:01 +0200
X-UD-Smtp-Session: l3s3148p1@yI8LX3hcmrkujnuD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Add I2C nodes
Date: Sun, 27 Sep 2026 17:09:33 +0200
Message-ID: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the I2C controllers of the Renesas R-Car X5H
(R8A78000) SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on -next as of 20260925. Depends on "[PATCH] clk: renesas:
r8a78000: Add SGASYNCD8_PERW_BUS". DMA nodes to be added together with
the DMA controller once its dependencies are upstream. DT check has
passed.

 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 112 ++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 9a07753b2215..fbca02da6184 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -862,6 +862,118 @@ gic: interrupt-controller@39000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		i2c1: i2c@c06c0000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06c0000 0 0x40>;
+			interrupts = <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x44>;
+			resets = <&mdlc_perw 0x44>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@c06c8000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06c8000 0 0x40>;
+			interrupts = <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x45>;
+			resets = <&mdlc_perw 0x45>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@c06d0000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06d0000 0 0x40>;
+			interrupts = <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x46>;
+			resets = <&mdlc_perw 0x46>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@c06d8000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06d8000 0 0x40>;
+			interrupts = <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x47>;
+			resets = <&mdlc_perw 0x47>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@c06e0000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06e0000 0 0x40>;
+			interrupts = <GIC_ESPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x48>;
+			resets = <&mdlc_perw 0x48>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@c06e8000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06e8000 0 0x40>;
+			interrupts = <GIC_ESPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x49>;
+			resets = <&mdlc_perw 0x49>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@c06f0000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06f0000 0 0x40>;
+			interrupts = <GIC_ESPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x4a>;
+			resets = <&mdlc_perw 0x4a>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@c06f8000 {
+			compatible = "renesas,i2c-r8a78000",
+				     "renesas,rcar-gen5-i2c";
+			reg = <0 0xc06f8000 0 0x40>;
+			interrupts = <GIC_ESPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-internal-delay-ns = <110>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD8_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x4b>;
+			resets = <&mdlc_perw 0x4b>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@c0700000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
-- 
2.53.0

