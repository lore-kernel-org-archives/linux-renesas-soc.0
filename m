Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED546AEC5;
	Tue, 14 Jul 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034288; cv=none; b=rkqIU6+yu1U/B5Jd9dSHHLPUb8K0QsU3jrSR3CkCveXzX1orHA39fXff07Fqzlhebb30DjkMm2gcqC8jNRdGAizxEdSz2qlhq4WPlp1gBty+Wrl9el1KLc016ln+J732mjKpN4qeUzCRdmsCtWgRlocQ0sbRI5zVzIx79KPjLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034288; c=relaxed/simple;
	bh=ItMPCuqhHkXCD61w8W9pUVYxw29HsE4eqP6IvBVSXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlbLCnG5b+6xdPbDsEXoHa1owB96gSylBRv1UwVBSxcdPMgKmIKkMul7UW7fvo4DPUOxayomqH2f2Vr6fyoOTGgJ3vhyeo9RNN1qnePn447Na4Eq2/t4dw+jtTth/bt0J9OYqjIKxQOcZCYaS5I9ntAiHi3TfHJJZpUQUWV4zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fWKxyWdn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VLjHKKdJ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fWKxyWdn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VLjHKKdJ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gzzzd2JM5zKw51;
	Tue, 14 Jul 2026 15:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=fWKxyWdnlHBoxSeGCUjhNxLfbXwQtrzifI0ZoCi3wspLhBt2uElNRiZpMC3EtJeLCNEX+f
	UYUhkkG9u+h94UxDZTAPKE9Rr4VFO37/9NRsH/Tz4nWp8axiaKkc34nuswsL+rOQ45buJt
	rBMbD+1IZ6oO8aAxOQnA1LCODy1oO5B2c+e+FByG83/r2m+wNDqkalc4QnV0PftBsuD3pq
	1cXvKIVIIgCntyrxwRXmUGCoLigrRJdnFkAyYZR47UJBOkZ5ugh1pcRfNRdW88rCxynF5B
	ntAJYkmCUYeiZtMc0lgEB9elOg+iYIVrkAKUdUKTfGL2BGTY15BZWkuOTjIb1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VLjHKKdJ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=VLjHKKdJ+xS7npCRpNYZmCkf2uOq7qnANYvZH51KdHRwZIlEI3B+PQlctefwzGHb8vbU4s
	rFftwHKzKkWjbmh9ceJ6A5vtrzgYMN5no8jISWLEwRCBeuvTAwp5PUg0ravz9de7o3HEy1
	a4aNnmEY2P/4FuLiJ39l5Dg0p6OSx1u2TDt6AA75DZr3onw8bXiSsW35MDPlLB5qjYTOc+
	+vdTS4wY4RkvQm9SyafDyVhJ0t4jtjAPz+sk3NlPj77We4ZyTs+3Kn3s46T7pxRYbxTQPi
	9Yzt2h4lOWqIuUvGd5ZiXIdMPCDpesiXG3jjDCG+HSB3YaO07I7S8HbC2yEWLA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:57 +0200
Message-ID: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksjhyk64pemgiie94ooiq65hubhz1jj1
X-MBO-RS-ID: 09d30c1597178f11e5a
X-Rspamd-Queue-Id: 4gzzzd2JM5zKw51

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7791-porter.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 811e263452acd..05989da3be046 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -328,12 +328,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0

