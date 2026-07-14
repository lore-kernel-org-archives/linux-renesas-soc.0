Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555646AF0E;
	Tue, 14 Jul 2026 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034288; cv=none; b=PROKg6TJVKusS+LlYaLCRo6M0hDIZtYXyPRjXI2l54cXT4AoxXEH8oClzUmC4S2fqYla4ABVGMZGGX5jsH3Khyot96KonT2pTFBV4GUYgDnLOByIQYgFOF2nCZUmj6Jg5J1qGUlRBnimE0mSDgSCfZNRTg/ZR7HMdItd6qDeWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034288; c=relaxed/simple;
	bh=taLv/NHXzUfwPp4BmA+AcjGSqLQ8m3xenjXb28vCXOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lebDSGNfdmHoMcqKcETAUlw/CRxvSAG1msrqSL9/3hxF1q0h7EmAYtGipTJoQIksKrcEGyyogSyJ52vjmtaGHgL0BbU919NerMRu8P08E6TRDm1yM93qCw3wee/MRKiWpTX987irYxnqNGxzDKJZ1+puA84C8pitxZtKkCF8+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vEjOeSwg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hwsVcsE5; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vEjOeSwg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hwsVcsE5"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzb5LWqzKmyK;
	Tue, 14 Jul 2026 15:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=vEjOeSwgbriNhwC0sNf933PK1Ddp7QnGRpnu78amq9fi5J4WdrdZvi5PFAz5FKjjTkhX5m
	0Uyyi0bRVOHVXmiUAhyCtuh5QyGdiienBLPmriOBkiWVs1wGGzO8VnHFXMlyPNCUkCjBwE
	ekQCLgbFs1H/v45hjV8j/lxfbm02ZG3rJvakKZVapLArNZ3M6SD/0FUHiepbWywtBcev6x
	xovGTDFhltv/TU2AElI/n5bh2zoyaMb8/ZV59KJJ764pDxzhcw2Str8zSFZvBlAbSQPA7G
	lKjOJ4RkjZTsrby763qv1VaWl5UCzKcP/QuR5REyvf1FRLxPwTSKq1cZxRzWfA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=hwsVcsE5u0gTNkGdl6tTbFiN5a4Kz8R4I4Nniwe/EXLh9YDC35zSh+P77fZpnHdLYTOVOQ
	T7/GAaFGMFOOgY9lV5Uay7dWtAukwhmSu2oj0QDCCT0Sn4EfjvfMW+3s0FvhQC5HtkDlO+
	5MvNZ2Muc7xX70KbUafbP8GUBj8snhOJ6tus20rc5kxnTwtlY8GS0z9ii0lgV49StR6j3e
	ywrBwOse29oXNBJP/7BV8kQXTjEUUfmHL7zV3/9XUcADL88CpeTdUnRPmGmvFLflRaPHk1
	B2WRI4fqcdU6UsGgT97KOXs+BITSFrkyjZy+fkco90tLWHYJnpwM8hTWCk3MeA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:56 +0200
Message-ID: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2c8c949d0327fe1a3ac
X-MBO-RS-META: zby49muz9hgdi9kdnob1qtk9uzt8qdhw

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
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 48db62e0ff874..54148a5ddff7b 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -678,12 +678,14 @@ &ether {
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
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0

