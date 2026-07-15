Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07142438474
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118231; cv=none; b=g6avblX1o1M4JdwLwXGw1UvFLR/0C5qqdFihijp6LjRchHw717GzhTHwWciTXrpbrzslfm502vSYzTaDEA7W1oMGLFq5dbqBFsfiAapF7vUnP5yajSBd4zhf4hboUeKzoVl4mv4yvlXkuvgAAApC/wAxmcouJyuc0epxb/0DmYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118231; c=relaxed/simple;
	bh=bDAOPe5Qcuz1UX//tXS59VnDMR5cUxqww/YP5Nf/abY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YCZajyAOgEdTaEgJQr0yPamB8xXZ9A1QNiDuTj37L8Xe2bA/rhkXvLNvftUJfEp2k5PO16huOOjvYH9GZf4P8OcC37ZSs8gfC4lt2TUcoH53RI1M5UIveDSPPHEaJhrMSACsXadB0vR1bAxNqDXYyfxOcrQLeICp1MviPHNV9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TNGSDlND; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TNGSDlND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8CvlUGuiNoEinh
	8lQW/4EuXAkmHCwLSgBalcuIStamE=; b=TNGSDlNDYKgHCD6khSgdY6YCzV+rxC
	45lVPXWq3pg1SHp79mPk6qSUh/6tyyKVnlaX0Ngg6aDUOp7keHEvnbZNB4l23DOB
	s5l1Vr6W7GofKutisNLF+8vj5oYh1EFC2vYy3Ub4J4LI9DDnC/sNhO7IQnL0WGfY
	mFE9hYX9qyvgjDFDGN5YIqrJlKo58dgT4BQwsOnYimo1O6lksmBSVjmXt4YKc+i7
	YGJmkIpcxU2UZ6boDmtjJ8+bk5iVffxqI86O1nEsyVLegKKabGKMJ0+kYQxtgC/2
	5aBlinKWmKDQDOWWSo41GMDii0Rxeemq1YEhRSqD9+MHRjrlryQVUiHw==
Received: (qmail 682654 invoked from network); 15 Jul 2026 14:23:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 14:23:44 +0200
X-UD-Smtp-Session: l3s3148p1@7Lv7ZKVW9JcujntW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12
Date: Wed, 15 Jul 2026 14:21:05 +0200
Message-ID: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CN12 offers some GPIOs independently of switch settings. Add the nodes.
Verified all the pins with a multimeter successfully.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

 .../boot/dts/renesas/r9a06g032-rzn1d400-eb.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index ead379988fb1..7d6ddc91bb2e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -57,6 +57,12 @@ &gpio2 {
 	status = "okay";
 };
 
+&gpio2b {
+	pinctrl-0 = <&pins_gpio2b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -136,6 +142,17 @@ pins_eth2: pins-eth2 {
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

