Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFB32C316
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259403; cv=none; b=MfNkUIZL+QA2xEyxi0R3Bz8rKw8l/qH7YBSv2ZuCe2zGos9TRmo3b2qQ55fgary+/yvD6GGJJk2K/b9aGvNmBNj0amIej7usC+cqzXRwdtXutG2RBk7TwGlwHc/XhtUYaBz2wQaOCxa8281wcAnxVUD342/ONSCmdC6DNHdk5+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259403; c=relaxed/simple;
	bh=md+i3AjCZbd2TNdKlMAYhi+Fu3dZtmZpD48lTBwt+Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIx8FVAxjM/lz2zpiymYaGsz/vmZs5NBPAxQj7vEIcrT7QNhkMB7LqL23l2Tt+QWOLxv92eN4kcwy5R0LOdHnXInAQ6XyTNuDLvB8f76FcWQIujYsd9hkQliCSlJitTSZSmpwIjtXzSoM7OvqSRYvWORTwAXbCXk33Ut3o5rr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iOfvzPuk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iOfvzPuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cTY5AIVrasw8mp
	QallJO/IIs7QdE7WPsj2T/T7INTpc=; b=iOfvzPukoxQ6taGt/nsUpPyDn4neg7
	haKw74zqiNSCk1D2IbDaYMpZ5tU8RjqehWeVutzQKkWdS6A9EIgZPeguUxwZPr7G
	CzWJaJ4gtL45ZS/2WUe0mSehInnqI83xGDiZSX4K/70rChgTgbZfhiz1HNr8P+38
	FHHRbYpbxc+zw2UgnnELZkgwIV9emaElezuJFCx+nN1OqvwazEQb+zgmlIhkZJlq
	Nu5GaTFMm179fnjP2UgowcMCCwwY15+A9B5pd5KNQR88Tpz+7tkZWhnjQ9tBUFf4
	AveMcNicFMeYvdsj0i3ztE8vgPOtPaqSdIDflgDa4DidsgqJtesLKNGg==
Received: (qmail 3789737 invoked from network); 11 Mar 2026 21:03:16 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 21:03:16 +0100
X-UD-Smtp-Session: l3s3148p1@nZFiIMVMipYujnut
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
Subject: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: use interrupt for Micrel PHYs
Date: Wed, 11 Mar 2026 20:59:58 +0100
Message-ID: <20260311200307.16034-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
mux.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
Changes since v2:

* use pull-up bias (much better now)
* keep pinmux sorting correct

Thanks a ton for the comments, Geert!

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 93ace602c154..cd63e30ef901 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -185,6 +185,18 @@ fixed-link {
 	};
 };
 
+&gpioirqmux {
+	interrupt-map = <89 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* pin 147: phy@4 */
+			<91 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>; /* pin 149: phy@5 */
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-0 = <&pins_gpio2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&pins_i2c2>;
 	pinctrl-names = "default";
@@ -290,6 +302,13 @@ pins_eth4: pins-eth4 {
 		bias-disable;
 	};
 
+	pins_gpio2: pins-gpio2 {
+		pinmux = <RZN1_PINMUX(147, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(149, RZN1_FUNC_GPIO)>;
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pins_i2c2: pins-i2c2 {
 		pinmux = <RZN1_PINMUX(115, RZN1_FUNC_I2C)>,
 			 <RZN1_PINMUX(116, RZN1_FUNC_I2C)>;
@@ -401,11 +420,13 @@ mdio {
 		switch0phy4: ethernet-phy@4 {
 			reg = <4>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 25 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		switch0phy5: ethernet-phy@5 {
 			reg = <5>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 27 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.47.3

