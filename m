Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BD3B2FFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962793; cv=none; b=lTnGxzqbLz6MQ4GSwzLaHtg5sQ6SPQ8UsMXRMEqxelyRSRfad5+3cBqSCcpCxJPymIDZ+y5HmjaQseACrnHigqUpNMSUcThwPh9xVOtSaGVDWjNb1DgzMDBii5mul5zV6Q96YVe6SDpHCpAnwzJuYIzPqnrG3uruyPWZhvzEWkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962793; c=relaxed/simple;
	bh=3rNfovr5pupfVULO6YYnsFxMI5Lw1eUwZXiNstFY2Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUyqzOtteouWZO/sPbOS/mZMalvaNT/MukiQ4mUZ+Wt74khz5Yzehje6JEanPYjzMbRseHtf/wItX5LluyY5pYQyMrrnLhju2eKjbpYSWecNN81+d5SPRmujBcxyc7Iow9YAr009P27N3lBHwCBLR55lTCDbOSXj1GObjLOQw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y/j/QQkl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y/j/QQkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ilNVJ5Md0l9XhX
	m/UHssEnmTTeO9Le/v9Ji+rHHM2Z0=; b=Y/j/QQkly8rA4rGmRuVEHDhvqBckpt
	Lew3JgOurhpte03u8fkHtJokbCn5mfPC9rqcwxdB5s5jPE742R2Qyi0ntcuXAFhY
	9306xTCORE044THo0VMEpTbHPc9CFzLl5n2Xi5WOA6vY1/Rw2YLVRahhDakLi3sP
	cW7cKI+wt5F/YbpZogYwU6HCOO0PHlVqcfVH7+NBectogP44is0KVlUMiER+X/72
	jDIM2UoPWdDvEadguitSvsTGIse0mHqn+l7QSOGPsxMt5mGEOdQZUunLAQEBG9FF
	2Ayf3ZKhOTZ3PoGDV/pBq5BE+Y7PmrP9pa/ldBi16VaBeIHIi/0JsDwg==
Received: (qmail 3424423 invoked from network); 17 Aug 2026 12:33:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2026 12:33:06 +0200
X-UD-Smtp-Session: l3s3148p1@mw0fsjtZsugujnve
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12
Date: Mon, 17 Aug 2026 12:30:28 +0200
Message-ID: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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

Changes since v2:
* dropped patch 1 because Geert already queued it
* renamed pin node to 'cn12'
* rely on default pin-bias and drive-strength

 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 303b5926d8d1..eb7295504715 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -53,6 +53,11 @@ led@1 {
 	};
 };
 
+&gpio2b {
+	pinctrl-0 = <&pins_cn12>;
+	pinctrl-names = "default";
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -81,6 +86,15 @@ &pci_usb {
 };
 
 &pinctrl {
+	pins_cn12: pins-cn12 {
+		pinmux = <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
+	};
+
 	pins_eth0: pins-eth0 {
 		pinmux = <RZN1_PINMUX(0, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(1, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
-- 
2.47.3

