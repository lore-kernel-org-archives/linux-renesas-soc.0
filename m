Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9363B0ADF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782497022; cv=none; b=O72OCGa+ecoqMHXNKNZzx9JLPciXdBor66kS+V9EkC78to+93AhhUiAhf1WYEOOm1Y6Vw2D+j72+R8pt288c1MnhUKlxQ9i8zVb+KZ1YEYM/ZTT6Vd9t+02qRgaJgtMzNlAE830SjwNrh24TbScl/ksNsN5rcY+x+ZyfWO8FW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782497022; c=relaxed/simple;
	bh=Ik1/DAOxE7jDk8EG5LXS/DRZ3EgfkWDv/2Vw0mHf2z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzKS0f5v5qVPFpnmwENJFGhNMvjiBKsqVbfzOMdkpCsS1rkJ0jsAy5CMurbJgtZurEMa0qiVvWJ4NsHFG3DZf3hfMK8+VU9repbPWslRwAuD6RYZPRb048iyFwPE3XhyFnBQY8cAkZFcYW3MIwFoVJEeya4ct6dHXhlP390i12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ULwFIXQm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ULwFIXQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=GTeedEL3Ne3n71UQP3FlClQBPUpZXkqbt5kL1oN1wqg=; b=ULwFIX
	QmQPUIW20+J1mUMV4yOSa4b/n4oUn9fHpIdPVnoYSohimc0/zI5RchEMMxRUJGNi
	M6bw+Xj7Xku//d8k4Z6zp7x69ZELXWoEFZrI5b0NeEvmHxz3j9cGBCK/28VZgqAV
	CI/bipqQsWHre77tYpASVtR6bcwwqRiXBpzWYtLTfM04WwuesEwpAZBJC0Rc3rRH
	FK9XY7jsW+Kqx4z5g6FHux16Z9jxlQ4aULwfZ9ncEkEuytovLo/c9ceMxO15iOxO
	8YOLSkQDrqmzL89SsDZY/v29liP1TjVED4jei6HGDk6yJC1fiz4mkqFdGGYjK0Y0
	cn6kIyFWWgrI0HXw==
Received: (qmail 3649344 invoked from network); 26 Jun 2026 20:03:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2026 20:03:34 +0200
X-UD-Smtp-Session: l3s3148p1@cOtW7StVuMMujnsl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/4] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
Date: Fri, 26 Jun 2026 20:03:25 +0200
Message-ID: <20260626180326.9593-5-wsa+renesas@sang-engineering.com>
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

Activate the FRAM and the SPI bus which it is attached to.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Change since v3:
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

