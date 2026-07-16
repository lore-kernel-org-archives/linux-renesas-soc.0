Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9D3F7898
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195996; cv=none; b=O8U2bS51mJxD5ydYSRRZd47NfGXPWOjGwUvBwxYH/fhwrgUdQX6StQn4tpA0yzPODs+2E9bhNAi3G2QoayhsisqdbgA71HzwQg+QxoVsGxQsifzGIsjx9h1U0ZV0IaoSt49cvpFNvtyC03HJInoGQM497ZGLZcWvZrzu0D2czpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195996; c=relaxed/simple;
	bh=twpT/OwCU+OowmS9PEONsKDlHF48POldZ1WKQl/uj48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4/iD5My/pFXF82SGsRW0eWkxf9dt3NuOEvZPJfYYvdtuFRHciaby9hJSRAsQqvMZ5w6ZarEJuhVvv2NLfLaMg7yGYW2CLJxlJ0t0O3IuYVAenYwMQkzkJ5wL7gyjRNDhPTtyZXYG4OBiWB5KULzIvvl9JSPjD4V9hV+WVpXm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cEHb1q3c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cEHb1q3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lVUZbXASnjcpm4wohNCRP5nYazJ7BhxCfAU2tgaBTIA=; b=cEHb1q
	3cc02AgQVxPexJKoe9W8bt0COFPhe0tJkeinyd72ntrEHmStgedFKhRksO4i31nl
	cKUmCA9rawSd2DPebYn9rJmn/sSK4WjFqB1jYAo5YQd9hdQSz/vglZDnGEP7/bNP
	AAK47GNcggB+gTaXg/1wgXADoTSojQPiotHtge/NDazkJk5eNEUALu80ItOAkRGb
	KW8pucFef70jP9wsgm+mUwUPtX6UEHS50KLmG8m4zG0fYcJGdJx7Bcr/SL0xSDt4
	dQx4SYsPFBD0NeioZCqMPvZYZhltDPPUjBsvsfPSWUfOCTkw2lyaErPtTU1wUupA
	RKu1Vs92i0DoMNGw==
Received: (qmail 1006394 invoked from network); 16 Jul 2026 11:59:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 11:59:47 +0200
X-UD-Smtp-Session: l3s3148p1@oroBgLdWdrgujntt
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12
Date: Thu, 16 Jul 2026 11:59:37 +0200
Message-ID: <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CN12 offers some GPIOs independently of switch settings. Add the nodes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* dropped setting 'status' to 'okay'

 .../boot/dts/renesas/r9a06g032-rzn1d400-eb.dts   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 303b5926d8d1..e6c064bc49c8 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -53,6 +53,11 @@ led@1 {
 	};
 };
 
+&gpio2b {
+	pinctrl-0 = <&pins_gpio2b>;
+	pinctrl-names = "default";
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -132,6 +137,17 @@ pins_eth2: pins-eth2 {
 		bias-disable;
 	};
 
+	pins_gpio2b: pins-gpio2b {
+		pinmux = <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	pins_mdio0: pins-mdio0 {
 		pinmux = <RZN1_PINMUX(150, RZN1_FUNC_MDIO0_GMAC0)>,
 			 <RZN1_PINMUX(151, RZN1_FUNC_MDIO0_GMAC0)>;
-- 
2.47.3

