Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64146AEC5;
	Tue, 14 Jul 2026 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034293; cv=none; b=HEJAE5UGhrtYDPHB4O5dsGyPGGb2dwkI3PW6VsCHubM5Fn3FI20/Y7XDdTHFEYU1+DAlCmhgvNYb1S6yjnOHPWFwZ0xjhtwjariCbVjLQ2vzM88s1WFKWNpQh1RAy08UcByVV/3cqPMiiufy0qpMf26Irc6VJGfJ4hcz/LBN8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034293; c=relaxed/simple;
	bh=1bU43ac00D1C5EwHy4Oc23DyQO6qw/oNH1HGbsV4rBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aElzvIiL+TA4XieUA6MBLHuyKXWo1eQWALtQhkAzz2AHUyuhALORlQrC3mRSrkV7a2nNRHEX0KTLUMikpRMb2sCU/XEgyRv5cRbiOiZqJaZjEdmXfDQ88I85nFOpHm7NrbnR+OsfoeutH4cTai03ZR8LMSy//dbu54fBOrch0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Q/+tORc+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WHGKxFIz; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Q/+tORc+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WHGKxFIz"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzzzk01QXz8v6c;
	Tue, 14 Jul 2026 15:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DGJEKw9VaG+3z1g9JwiMW8kaZXLf4gXeTgptvBZpZo=;
	b=Q/+tORc+/JDT0iyIZel/LL47niIPggpnS4D5jD8zZ0BPkHyoNawk2vihbk+ejvt/BDgCBK
	Rfvr4r7jXDjcscSeo/0DFJ/OkhgqMpNVqdwMlCDZI8MXJzuPuBr3PDnETsWfecwAWW3ejc
	OC9ZcAuAvmEZaVnYjSQiQ77Eo4gn5TKVREXdw0DEn7h96N9qmHF4EAkhHBBInJsdBMxBlP
	wgM5rMqCMA60m0aC+tNsSmipzetXg+MgCEAhDFnFkwysgtUyCLx+VyVAgsx6WYVE4Gp8kU
	Becsm4LmSAl+VgVvHCIIN5g/u/SBfXXEM5W9fAfr5S4niNcL04ZzMfuPD24yjA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WHGKxFIz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DGJEKw9VaG+3z1g9JwiMW8kaZXLf4gXeTgptvBZpZo=;
	b=WHGKxFIzu0/ZVmK/7nPOnGJMnmTVPSkF5cl5WmIe9Ru/vf7xSqHfMttxZC3SWvjmOl97b0
	iRLO+Ef7YJkwJIgKa3g2ZUJfnwa7if02yli/Nndv5FNTxLoWWZhxRvgWozvz0aL26fHYGL
	WuTGdmL1CMbAVL+4EWvrM1gMa+TJh6mMn1aZynX1sIHEJYFeWqVjMliWPdw2MYCvZb8UBS
	3WIwEDXqxovZlyuRDM6GO2a6yGysLzpiDvaS/bk1TnBYY9mYZOuroJpfYxKE0Z2VT6Jx58
	0m+ih7LAx88Kb0YVYd4N9OIXZeNx+MqdpyK2MTgkt7jCeEBD8EXrxMrY+Jc6Bw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:59 +0200
Message-ID: <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 516207bc378c7fb9767
X-MBO-RS-META: xs1kgba3h36krkx8ka7rwa19g5s4b7y8
X-Rspamd-Queue-Id: 4gzzzk01QXz8v6c

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
 arch/arm/boot/dts/renesas/r8a7794-alt.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 5d6d0d8cc4dd8..92bc4ec4f854f 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -380,12 +380,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &mmcif0 {
 	pinctrl-0 = <&mmcif0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0

