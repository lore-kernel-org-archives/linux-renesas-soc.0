Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830412;
	b=UOtgEm1ZZelK4syY8QYisXXZgfJa/uAdwkm2Zx9rt/9f/DkLV4s6Hh3a/tojFgyWPvza
	 mM4sZgIq5ig0nU5hwiMmTN6+PV0JMWPAHfpe1j0djQ6SdIaWorbzHKwcF8eJR2kmyCt0i
	 O6pSfebZJ9+f2A7CJGSnLyuqNJxX/MBspx8hVYTUmWKQ23LGDxLIvyMN+6AgJDQRcsc6n
	 Yo/P5DvYC0liZkAX7rlN/LuWXrPAjM6H9zHaKDgpIlcA/zJluiBTzb3baHGVa6GKWt6Mf
	 57/DRUH+gpzQefgHLvfpC56GZuvQktgJ2+vxbsLrIgKXlEZUKnbhjKXNAAt1qU0Sswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830412;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YX9FBeJhdF2yIOAZUujuinCPpS1WalQ+zwpREND6wuQ=;
	b=g/TtomGhJMUbRW6VUlutRaFO2leSufoXVyKWF4CYCrDxpqrH4Jb3HBWxbXf4Prh+Yhen
	 IZzwJr+8T5/MNml/5XtYuhOhmAiUMjYpfN24UqBp3EweCrp6BB8o4PbeWMpIxHNmQOGtV
	 UczZwMJuKv5ONylEb81cA3xlmPCGpUIwObADFGXi2CJXKOhIXjCeM1iqdq2tdgC1Tsx6y
	 2t1P8Tsk6ukEEC6HcERNk9kb4kPFQPlMYH8RckKAH4M9XURsrFZuUlbq/wiAImHPNo0nz
	 kp78Ge2rb78yYlTn/JAX4y0jIF/l8lf8zbphDEinLPGNYQ0DxPOYvdoCHWM/7cdiCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DevN2MCk;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D2606A32A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 12:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00D2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DevN2MCk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=YX9FBeJhdF2yIO
	AZUujuinCPpS1WalQ+zwpREND6wuQ=; b=DevN2MCknXa4YIYL3gu+B63l7kMknv
	AQ7Fv1s72gzb4qHVkw//DYBXskeVMFja7Ee9JXCalPjb262ONUm/QGklFcsXFtmi
	28kqSpe3BqkFXEHAN8+tf1QcwEJqypbnt03IuMYL3JwTuTEpGGulnzG+Uf9pTym9
	s3XUnIULVn2qBOTMxp1cdEqKcx/XD+08iu41yLo37WKh3/Z20oV9CluI0WIoP9nx
	1JHhuPhhD4ex4MH7ZmIgimgx4zF4OiTJF3GfmNevvrWMlYysDKAueExF7HLtKjtE
	gzbCGINW397TaLIYJGhW0dzCOKeFmgEr5hwd2P66cibDm4qDds+SHq9A==
Received: (qmail 1271540 invoked from network); 16 Nov 2026 13:00:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 13:00:02 +0100
X-UD-Smtp-Session: l3s3148p1@sC2QhGNgeusujnv5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: beacon: Increase sdhi2 speed
Date: Mon, 16 Nov 2026 12:59:24 +0100
Message-ID: <20261116115958.175376-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Ford <aford173@gmail.com>

The WiFi chip can run at sdr104. Set the respective flags to push the
sdhi faster.

Signed-off-by: Adam Ford <aford173@gmail.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* drop HS400 hunk because of unclear SoC-ES dependencies

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 882513149042..873ffb106333 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -288,8 +288,9 @@ &scif2 {
 };
 
 &sdhi2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
 	bus-width = <4>;
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
@@ -297,6 +298,8 @@ &sdhi2 {
 	cap-power-off-card;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wlan_pwrseq>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.53.0

