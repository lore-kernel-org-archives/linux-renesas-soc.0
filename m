Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992B342524
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150509; cv=none; b=AeHI0gpmrSGoj9RHyi9qfqy6fiFV/cxPQoDyduBV6uJ24pgRZspitNwPhshcj+VC83KjIxnpmIwRfxO6/517ktM1U6orJhJVLMB+u8WuzdoyVEUSf058AfAC+6t5oA+sFhIxfpqrxgQB4FsVZW9s3RAy3K6aHCFzlLwPnRsaqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150509; c=relaxed/simple;
	bh=oAgRPsnzS9ajd0Fk2C+/XltH5+hxpFYxAGcujxM3mr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2J82bxjbit586J9CN85gpBKVkYNtQvTI7mYdkPtvsIMQtNq2A+A8xw1srEBWGH/1l+/z4Yl+nhjNpBxKwRGVUPaMVv3LjU2ci0THI2SHgb1vPnxZxOrI7qsLltexwFpRzpchah0RgrEi/bIKSrTENMmNBGkup7/iNKFwVRcwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OXXUUkFr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OXXUUkFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tqdrkKJZ6dIql+PKmgvnuurXrVMHEy4ieebWovQe1LM=; b=OXXUUk
	Frec1DMV8wGjGmSAkN/nMKvP0OdkmoaS8M6MP3q0mYbLezZ2rsN080QVdbcoVvEW
	tzCSOFyw4maBsmuP6GipCFC843TeveU1/26hvurlaLJel8l4LAkG6YSJZ0ze071I
	W+QgrlaIdVwb6l78Hz4oH8kbgJGMny8BqHxaCrgMkJGzsFiiH+De3KE8n1U/cc6d
	h65K2GX+O919gI7RqtG5hVrm4+RlJBe/YZThe+n6h9+ihrjZLPs+FU/bSNm/TKWD
	EXhAM/znWt9asq4NwZe29QasPOpvFDuKPA+t5Zmb5bH8gXzQXvDkJW0bx7puBNTI
	mM6Rd3liXXaB76kw==
Received: (qmail 2061485 invoked from network); 22 Jun 2026 19:48:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 19:48:22 +0200
X-UD-Smtp-Session: l3s3148p1@cmacP9tUxOcujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
Date: Mon, 22 Jun 2026 19:48:09 +0200
Message-ID: <20260622174806.74450-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622174806.74450-5-wsa+renesas@sang-engineering.com>
References: <20260622174806.74450-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Activate the FRAM and the SPI bus which it is attached to.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Change since v2:
* none

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 97a339b30d76..ead379988fb1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -53,6 +53,10 @@ led@1 {
 	};
 };
 
+&gpio2 {
+	status = "okay";
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -152,6 +156,13 @@ pins_sdio1_clk: pins-sdio1-clk {
 		drive-strength = <12>;
 	};
 
+	pins_spi1: pins-spi1 {
+		pinmux = <RZN1_PINMUX(156, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(157, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(158, RZN1_FUNC_SPI0_M)>,
+			 <RZN1_PINMUX(159, RZN1_FUNC_GPIO)>;
+	};
+
 	pins_uart2: pins-uart2 {
 		pinmux = <RZN1_PINMUX(105, RZN1_FUNC_UART2)>,
 			 <RZN1_PINMUX(106, RZN1_FUNC_UART2)>,
@@ -168,6 +179,20 @@ &sdio1 {
 	status = "okay";
 };
 
+&spi1 {
+	pinctrl-0 = <&pins_spi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;
+
+	fram: fram@0 {
+		compatible = "cypress,fm25", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <12500000>;
+	};
+};
+
 &switch {
 	pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
 		    <&pins_mdio1>;
-- 
2.47.3

