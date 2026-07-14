Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1504779A5;
	Tue, 14 Jul 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034298; cv=none; b=IjwddJ2H23MO0VSIy4K6NFlxy3vYiWYz3xUig/sJQgBs8reBFNSVN0f8/hQ8z+8tKLJll6Mk64h6R3/skDoUrOeNzhxV4Bw4pZDRuA/Bxx7JlU+mINHno+gvgorssdAIVZbjQr68K1DH6sGlyk7XwTNdctj4ntIbRG+kWgTz5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034298; c=relaxed/simple;
	bh=WV7GhnBrohuErBrleFzz+sdoxhrVh0AAgaYFixx3g3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRYaW+pXsf3x9IpxdYH+Dj0MKouJpzbZokwi009Eay1SH/DuvQCss2oApi3yhM/hopnJGi1rduYI3ukViLBVXE6J2L6p2qySk4gdv1PMcCFgQA2k8D3RilwxCGVn2OnNwftRMvwqBfRccnHAIUKxM0BL+aMT2nY05qSOsOIFwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ndQOwXuX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ayzvAUb3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ndQOwXuX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ayzvAUb3"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzzzq0bffzMlDF;
	Tue, 14 Jul 2026 15:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIYsLkAjUeyDKKQKrmnCLsByOqWE42bsxW6TVXBXKao=;
	b=ndQOwXuXEEczfanTo49npLbHWf8Z8V/O/MY8Za+ZvouLgB9SDa/Oo4+Dzyg+CTPU0BOXgy
	1cntIqMgv5mCscTZlCI7OdtMeKWqE/jnKyVeXzSqqp1JSTO4vgES/dZ4RH66jmusyFWyYJ
	CYKUNFkR/24GDNAX4IP5rYXy1J3sxY6AQFWcs3VrTlA2rrvAatehXzgY7F25scVJcypsVo
	/HfD0MeHyW9RZTkx2LEXKMNYUgV+KELTDSfMR0LwddL46jTjxe2ITlv+pJ3xY9KipHUyG5
	NzFP3c5NAJeBKHbJ7jOt5pI+unAFIo/C75RZjbGOLJXVKOlih9IL9+u5VThklQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ayzvAUb3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIYsLkAjUeyDKKQKrmnCLsByOqWE42bsxW6TVXBXKao=;
	b=ayzvAUb31pnEGosErW9vURvJpfJiAc8OgINnQFjBJaLLc/PBS2sRzKFk/xmbrnT8u7qktL
	ggy2cv/9vmPcOZAUnkPLfw3SnMaxq+dqHvTDlQh+Pwr7R3ISHl+S+KBEDzNabC+0nD64QC
	91olWvD+bjs3aRHpv1Zt9qwKnd6Xxa430P/0JQFvF7D48nA50F/o/gdzab+aF1BXmiQ8Pt
	HGcrJqe2CdA9TUUGWG1iNZ7ns3QMgryVP+FYxftwF4jx3pxJzQYhhqXejvD7dYt9p0qrTp
	xfj5QasdjuGRloY9TLloKHGSy4CHvFTZ7m4FCQyLSRTPG9UhyvqRO+rdwLgITg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:01 +0200
Message-ID: <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 443339035ef379a2ec4
X-MBO-RS-META: uhewo1entse39fnbw516k77yt4a41km6
X-Rspamd-Queue-Id: 4gzzzq0bffzMlDF

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
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index 60217797e5345..dc1b4ca944622 100644
--- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
@@ -72,8 +72,10 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0

