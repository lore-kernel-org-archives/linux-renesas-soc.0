Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963382;
	b=BoehJvahikP7fO0RpoGRuCA8Es9pXJ0ogEjgD0RSqiBX/tXOFA5bXVBYGrkSy+Y5BpmF
	 1z9rKResLDtFn/qduwN3WS4bVKQ37tAWAKp4u7m9ayjsh86twm1oUihmOGG2X8XnBsupI
	 MhULhhkteS2gWhE33qY2RCdYHfHco8ojwCUetCxfuoqFIcq3t9cMB0gSWU2wBAADI1IMT
	 /QviAUvO5LS7PuZiJg3ItkDPwlXumPxhRcck1hRgpZKD2MAKVGPmd9IS/YmGPCkEePuCn
	 yltuD3vYBTl7Hxe9VSBHTCLojyRjLpXBmOL1mZUaK00mLwBh/kIrpmU5zcDp5KM/kDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
	b=Dms9APB42vbXfyOeE7ARaIIIwUs5+PYYYevd4eaubBHoZVgj50POvxZ0BskX3e6KQTFE
	 uw+1dkJiCq6238wRtgpMUxFUUqx/IJEdLwtPm9ZosdQ91qdVn66DadoETrRiBV9mX4Knb
	 MCoghrQXYTb7SeBZB04/2IVB7syfddsCSzish2Ac/O6OTnAFoiFFf5BxRv/zjBiBvAweZ
	 zkuXkrCmPyzXyRKwfcbYrW/IGQa1UfICYzaa4ZsmufbUvMnTHSYWIMAfA7lNj8ZcjYkjY
	 3XX3jlgrbN7oLV+TqvUqwOXIepZPaFPj4MIK06Au93do4IgjogBDoToUZeWEpvurSdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTiuM0bR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF0D606A33D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 11:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF0D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTiuM0bR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4766495e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Nov 2026 03:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963381; x=1794568181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
        b=NTiuM0bRFB1dOjn1ZKrp3AYl72iiEVSCnVtVnCHMCg+IUkoVB9jaFi/3lcuEZv9je3
         N16BCXHj5+AGuRY9mkKDiluZtiAj9Ffd20w7s+WCXIDtw7yHEXGOc/T6LR3tAKXbH6At
         mioZqPHfzMicFPLwq/jOM9nsKW4hW8wLFG1p8LZPKZs4NN0bNva+BFTm619drhu+lpuz
         nZ+csvW4UiPo640p3N7bybTSXHEcrpIE9GWqpmS0H/Hc+Nwxp3aCpfXg9n5yZpKVR7NW
         xKe28lJs69cn6rpAldEXdrEr/A4PceygQl1+v6erusPsk+6sN9Foq1WAMgzJcE4z/Gj4
         yNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963381; x=1794568181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTbyh58iiuFNzTp6atljdu96OB/wZRJMCHvu1cBZ0J8=;
        b=LZcHa0B1O7Be+2qcQbDvnT2T4dAjPIsz0L1LuOwvxFY8JB1EkHU2YtTSUttm1JzARO
         PX0PjkoM94ipF6WxFfpJs0bqHmMv/ELcKjtBfXX2KNbxSQ0dRF9KDT6dYaYV/hxIVkB0
         z3rpbwPz7Rjpr0fDCiSEZGjWvSRHWdtn+zg+J63OX2IvvDhxtv4CQo6+K8O+mOpR5F0Z
         ScDiAWjEBxrhXpivkgtNyMJQGD/uSrCj/hhnHsBd+8U4c8KjX4BEVuHbxLctaH/g+gzj
         q1nbZ5T7KHsIHPjI4SPjxqbIIE8QEFjBKjxdKzk79vwedO5TK/o3gFtyGg7bPrv8+LTz
         jRHQ==
X-Gm-Message-State: APuU4Z9pW68b+mxsG+RyLrrtfMme9XKotJa/pXkpmO44xslXjE7Emjnt
	DhfedgQgkdxbTCSXz2Ji4zBDvjuomc7e0JTwGYYkLNhH24k7/qlLHbhT
X-Gm-Gg: AYBFou36X/sidlGNL+H2e8HhmJuZ+W8hmgsGbL6F8NpNn+SasN16WP60hp8f8nFQ2Jq
	/TbhiUIrnVlQT6aNOnRVPi/gGqzMlcehxJnxj486WMv/Pu1XtYXKmkeC1Dz33cXzQXnEWGuD7Mp
	QeXtKcer/pHVPdTy/L7cQunSYHOg/UfDe5NJzygsVCvl11i0nTyRO+ph5l2Ed44XeczvB1PjJuE
	5d0ykcFrJkZZzt6Squ7d5Nx8WxM/gIeE32t+zuSxJ3zYyVjDT10DhqwVTjSXQobtFWhgRPLAh96
	MIuFCvOkJyQh84JRnnkBJAdft7WRtcsKYuJtkzRCbvIzixj+jvCVcpQEkYw9l1mnO1U/KzZhWDy
	lnP2+nO8l6HYxTwCilVO2CPAguhKExgnsjZYJIIsAIGA/YCrZCG7BfhmHWrllJPA0hOPdjbed5m
	s3rnvn9tsi9R7r5rXzMU0MpKQ3oXxJEnO+JW05FGZoNWvfWYlEEy7jBRUcDE1/5qdSPP/CYSbhz
	u34z56ArAn6EApxn7zJjr4BGiXAqLDAivcUzD3lP6ttNBZsHpCjI+9dGKqTEndcCcjiR1555xdg
	AlFdSLReFGu5aICkhstdIISCJTrXJLuU202L96Ik6KxsMkB7n1CB3niqNgN8xh1rOnCwHYGX9Wu
	Ioslswkl3p60Ivopn/qKtMMyodt1MRHhtGdPay/S0mRQeeXKI5hXs+Wbfkhk32/J3kg7ygZQZrQ
	==
X-Received: by 2002:a05:600c:3509:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4b6e0172854mr38401445e9.31.1793963380560;
        Fri, 06 Nov 2026 03:09:40 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:1de5:ca41:50c1:3f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm2768243f8f.0.2026.11.06.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:09:40 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
Date: Fri,  6 Nov 2026 11:09:23 +0000
Message-ID: <20261106110923.164090-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the ADC controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
- Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
- Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
- Renamed adc_0_pclk to adc_0_pclk
- Renamed adc_0_adclk to adc_adclk
---
 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 51c1e322826a..9c611f12ad4e 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -35,11 +35,15 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV2,
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCM33_GEAR,
+	CLK_PLLCM33_ADC_PCLK_GEAR,
+	CLK_PLLCM33_ADC_PCLK_DIV2,
+	CLK_PLLCM33_ADC_ADCLK_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -135,6 +139,12 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_8_10[] = {
+	{0, 8},
+	{1, 10},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_16_128[] = {
 	{0, 16},
 	{1, 32},
@@ -171,11 +181,18 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
+	DEF_CSDIV(".pllcm33_adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,
+		  CSDIV1_DIVCTL0, dtable_8_10),
+	DEF_FIXED(".pllcm33_adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
+		  CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
+	DEF_CSDIV(".pllcm33_adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,
+		  CSDIV1_DIVCTL1, dtable_2_16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
@@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
 						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("adc_pclk",			CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
+						BUS_MSTOP(3, BIT(9))),
+	DEF_MOD("adc_adclk",			CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
+						BUS_MSTOP(3, BIT(9))),
 	DEF_MOD("tsu_0_pclk",			CLK_QEXTAL, 16, 9, 8, 9,
 						BUS_MSTOP(5, BIT(2))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
@@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
+	DEF_RST(15, 6, 7, 7),		/* ADC_ADRST_N */
 	DEF_RST(15, 7, 7, 8),		/* TSU_0_PRESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
-- 
2.56.0

