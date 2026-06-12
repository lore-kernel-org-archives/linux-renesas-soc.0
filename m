Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C693644AF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251467; cv=none; b=vCjkKd1r6JItcS1G1btwB14eC4Y7z+6JaKIdcfou42/mRiG+XbLeAhbdxkVhB3202rA+b1onydwKwFNVWULgdH9jImGl7VM6GVq1Y3llBVOWA2lQPfTWjzwf4LYj8J1ZDXKYpMN0MfY3mqOXdbdMc3U5dGukc1uqI4C76ybNzA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251467; c=relaxed/simple;
	bh=tdxVXR2Vf4gyVQ8BA0MQiNNlMtfXHD1TVJdxJiHxmR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPid0cOrnAQV3xQ/bioIG0iRmO+A/miKbJPscLlzeRGCvd/qcvvnYPd802kHIGqTkfqkvKdSvNH1YkbrzZHHgUCQnOfj35MvfhVipNyIzi2Xwu0WCUXMymYiHpMjr2nO4FS3i5AQqKCyeiHXeyCU7IzE1OgIXs482LN0MAJ+Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UBHYfxnb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UBHYfxnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=S7eIsNmXUuWZdnb0NIb1YVWhPqho3ZDLb7MIjXioyco=; b=UBHYfx
	nbRbDdS98Tmm2OMzIfM6YCvkn2wy8jWHxE5cpWYxkzQGz541lDI2X6syr5th91of
	ldfiBhIlbKYLS0b9exn/bC7qR8O0mQc5MP/ByMMzMWWpSdmHtO1+nj7DMrHVzqDd
	dzp7t/Lhmf7tyW8EnF8xCzzX2hY4jQzziDiMJBP/Ngzb+iuOO2HXP8mjZmZKO5vW
	rVqZflrugxXEIRNjC65cGnFiTy6RJc5Hn6T37bfH2GY2cw84AT79/xOeC4cPGJoI
	6Iq2Tf4ORcb2l9YT+DsfZfV2H0n3dEkJDdviwTs5gObQ6HEAnbyxQeqbd6nX3VWc
	uNYbseYqkVwz05Yw==
Received: (qmail 2443853 invoked from network); 12 Jun 2026 10:04:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 10:04:12 +0200
X-UD-Smtp-Session: l3s3148p1@LH0K7AlUwKcujnsK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
Date: Fri, 12 Jun 2026 10:03:56 +0200
Message-ID: <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
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

Activate the FRAM and the SPI bus which it is attached to.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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

