Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC13ED3B4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196689; cv=none; b=GCdCwrUHCH1smrYevqLD/ARN/1cUGb9cN4ejAN2imBrcUXpelmbyT5RI8IKuTaxZvAS3Na9/2Ebb0J6y2sQRQYEPFHTDme3LCcbzGi7f8TBC+0JpcVdFtftPzepRK34fmsDo/WZsITz349qSzQ+6ZuyPoO89cSTeXd5bfuQO7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196689; c=relaxed/simple;
	bh=bR/PDfzSMGYoNUQKyQ25hzmmK9v6aYEGpKLgnZ+Y1rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kA9+g8ZXld3IcxdEQzwBtJJmjyRUEi3FSkJ1uOIKBfIO5h3+A8i7feqzqnwF+/CCTOMxb3/6kszqL/QJCIvYYt4X1bHVp0rP1hcG+njp8S+5ki+eSfuKplcnHhkbSarVJklJl9gnb0POJSFYixfTVGX9xRsH2jvCJ3rS/qomWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q2NPtv5W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q2NPtv5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=UJvGLV2R2MCNtn
	MfDho4HWrYWQYcceI+5SHqMz3lgQ8=; b=Q2NPtv5Waw3lsr50B32VjUigOqDd7i
	r9p77kqWP4bCT9UOzfJ6zCp8O0hz+Ywuryj4gohUp+XVMLIFcGS3vCSXmG0Tw/4k
	KK9tXpL+8UMfH4BxAHhwzon580k/lNRhxrcKX/j97qV0Rj8i9fES6lnUMgiCEoqg
	1LEtx3IHfxnwZIe6nN607nJxn8tOEM0H+aI8D3fbydJTg4QhBTCxjd9SzFtFgf2F
	MKerwbabPhgrf64oKBR+4H7h2g2YeXGBBEFPw4yA5/FHd42381kYkyL5BeMJ6sQe
	uA1ldiUM5IIaWbODJ8XHXEYOYIpPtex70ALLjkyb4ncJeiPsBJBLK2sQ==
Received: (qmail 1010469 invoked from network); 16 Jul 2026 12:11:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 12:11:25 +0200
X-UD-Smtp-Session: l3s3148p1@+ECbqbdWDu4ujntt
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032: don't set status to the default value
Date: Thu, 16 Jul 2026 12:10:30 +0200
Message-ID: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"okay" is the default for 'status', so don't encode it explicitly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 19c9bce0a26d..8645bab7ee23 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -145,7 +145,6 @@ wdt1: watchdog@40009000 {
 		sysctrl: system-controller@4000c000 {
 			compatible = "renesas,r9a06g032-sysctrl";
 			reg = <0x4000c000 0x1000>;
-			status = "okay";
 			#clock-cells = <1>;
 			#power-domain-cells = <0>;
 
@@ -352,7 +351,6 @@ pinctrl: pinctrl@40067000 {
 			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
 			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
 			clock-names = "bus";
-			status = "okay";
 		};
 
 		sdio1: mmc@40100000 {
-- 
2.47.3

