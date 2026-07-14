Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F237477E3F;
	Tue, 14 Jul 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034300; cv=none; b=MsdHiMHYe/12hysFKYxlM3rbmZ9PxMC8Fj5C49CwTiOjhTnqKRIrLyF9FUmYRP8MFFv/tOou4tlJU279EKKrSyq6phWfh9+bQHrbbYAkAg5x7ND9X74JP7ZXsMq4cc8scW7PdRC644GdYs48muHrBNxMgb35+25FnyWg09q6HcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034300; c=relaxed/simple;
	bh=WZgo6fKDSqYPdcfoY5QKOyYmgw8MD7TOEaHX4YniNNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5WHOgi19t9wnQus1rP474A3jX1njobuCRoLA5tpaznk7GFtsRGELbG3yaUoHIR/pHFSnr9+5L2qnuKAUf+Ty+HChYhBdIl+fHGJbWUFnWIRjJm86Bd8jvWkh2++vMjVWwBsZsoDMDSDgwVvuke7ifVNR8D3jFHgkNvRIVgHK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QKVPOvc7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O573BQ2e; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QKVPOvc7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O573BQ2e"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzr3fwgzKmyK;
	Tue, 14 Jul 2026 15:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2wfK8JSekgLRRiuf/K6EQ8zzuugkmdh+qH0iDGf9K0=;
	b=QKVPOvc7XATX0TgWPP7fg+a/GRwt5ke/O2RAWHOYxX+202HFXu4TVCrQlXnoHjVm+e30bX
	s4PpBYbF/ThQLseE15m6CUPhpWRnIL6pcaw0aKmCcQXwnyVliZ3JWlmWxdvYU+oVqeFcSN
	Nrk0DrXRxJNENVbJbQQUxiIsTy3jp4KvIsPIA1UX+itHkoYcqLXjMqg41LKNBpiMNjqdOC
	necacqxRbQKpdJG0nQ5JKqzstJnI4qcr+1f9SM0cb6iG0iRR95VQB9ISnUIria7YLGV4p2
	Hkma9wOBAbyvb2vqJKZMlwDxXCnRzEeEWko8+IR94b50FGveHmOuyoKYK4S9lQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=O573BQ2e;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2wfK8JSekgLRRiuf/K6EQ8zzuugkmdh+qH0iDGf9K0=;
	b=O573BQ2eU7zfrj+sqb3IKUmdl16xJ2OHFc+P7Eawajxtu7tVsprQoBOlkv/T+CHTYVecGo
	hWkozd2ilBQT2PtFoEGZ5opi394w3g4THN3iOMX7c8Cr83kPiZx4ZP+o0FF25wi9yJKhaj
	LRi9YU4Jdu6pjYytwdYGptgNcx+Hdt9zTpAKp8dgQjJDOB4jbDgAgAK1nEsDDUEYNtAdWS
	VLe9oVXUe0/z6rmmj1QZ74xk7O+L9UNv93Sbp6rOLbed0ZsSpTvu+Fgazw1tqdQ1EuRhs4
	jA/0R2PTkBbc7pzloOxP5bAtL7ELPoaO/c2O9im99kZfELtQEyv90Q7YmFIGaw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:02 +0200
Message-ID: <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6b610f2587ac1bd8da2
X-MBO-RS-META: mi95c6jdhh1x9qahzzdr8rzj94gbd7r4
X-Rspamd-Queue-Id: 4gzzzr3fwgzKmyK

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
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 42e82f0697553..26ee1eec521be 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
@@ -67,8 +67,10 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0

