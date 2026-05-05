Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916553ACEEB;
	Tue,  5 May 2026 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952638; cv=none; b=Jxxkod+n/YmSDYD+O2R0b/z9VnbuRUNIw8u5dQtB+hIiV1vDzc96hE9xsoBRRz8yhhr31T5EI/VffvVplUgJb551Huh9KlvAke18TxtHOMVYZs5hXmNOfA/XYHND/ZJqBRHgX/DXwToLlEbGCcO5HfRieWJQcXth7JOgKluWlHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952638; c=relaxed/simple;
	bh=yBF/I2Hy0QWG8CqtNGX9VZD//95lWErpmdoTVisKl1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6BVKJDz5cec1XlNbJhpJJ3KgMgiHnnHHk9Hv6rdwqxvSoYpzvJErD6x+gTVEkCJ2p0YY04GAifYy902C82qz5zhzkTAdtWsMckk4g7MpdWxsBQC0UkhipTSMg2fWaTbEvBeTDSupSJ3voVrP3z9WLtzo9vVZbFcM4yp5GgYcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=B6MJYmf3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bQmqLyyd; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="B6MJYmf3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bQmqLyyd"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8krp4WnHz9ttZ;
	Tue,  5 May 2026 05:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgpdazERfEoZazK2lKiGb+H4Zd0Qc1cUAdNGOG/1Ztc=;
	b=B6MJYmf3Q2vjqMvq3GgeK7OQcoxSnAQbZ24nuOdXZK/cNZ/gv6+xyYLooqNnDsKlSFUYY/
	4p3a8g/stdTA1qYVzLXfDD3jOe9FEl4rwQJbZ01CDfku4clJRshWSKnPnkWGKtpcXZ68eB
	9lhZVFGVzAplefrE9xdkfJeB0oPUmKPLnfh2atEyHauRtCauB4z2aGX9ZV2hcjTY0Fw2Xb
	zyH3J4k7oHEZTSeQfxTff/NGeANk1RZ/MyPdAWShW2Hg/tpp157NZk50j3PCvkWm8zZ3+V
	6YQeckomp+kqgv0NquTpVypUcf1aYPblhtxDPX5OjP6EluK6c6MLEmKQ7GqzJw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bQmqLyyd;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgpdazERfEoZazK2lKiGb+H4Zd0Qc1cUAdNGOG/1Ztc=;
	b=bQmqLyydspIEkdRoelJHmkJ4y7Yu53jxrQ7QAHdw3KprXGA5N+0RVnrl8epq5GN79alA7B
	qQeWQe+UvX3MAZGBPn8t4tP44WKLe34GosQwwp/Velo0jEj9lgwoQRLyNVLtPFjsqn+U1v
	GgGiwSmRJ03jXKQaBzMS7TjZ0+6g+zAo/FfJfZuCENC7mWegQUz5z0ZpLPdcPOj5kbFP8o
	1VXXv5VX5yLYN5iaRnMvbLc1DzdDL44SvCSwFf0a9nRVrocfvU3f/8vJLgfpQGPGU2DEs7
	/aMTDxCJZHloPDKQRLqaAVduRO7iXcUJybndguRR4JuNkloYaFcNVo782UwkNw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:48 +0200
Message-ID: <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 84686d86872371c2590
X-MBO-RS-META: gkt87kkokxjk4rh5w1eyqnreq9nhh9s5
X-Rspamd-Queue-Id: 4g8krp4WnHz9ttZ

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index aaedb1fb51aed..f381847c6feb8 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -322,6 +322,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 		/*
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
-- 
2.53.0

