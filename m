Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199673D47DB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877037; cv=none; b=OliPFuCUBXUOpY/M6HmA6gfFHwfSMmgIeGbhm6uS5WBLsd5VuQDaCPUvgAYj+rp5hqsCHqgIIdDkpsdtZVoaweWqMhkXzTQtw509Np5BZwbitvSc5OeRkOS8SXsYA1beSgTDE95aGM0R56ddrYnD2D474fxtvAwMzRIAgDNxOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877037; c=relaxed/simple;
	bh=uKYG2HadVgu+Nn0FGDHnBaWtmfMTgEjZq9jI+WvrAWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jxr2R0MV7JaMYsLBmjruyeJYPghE7o+BIe0LTAg/6e38lX0aF++fYPIHfZrMDHnWmJ3TTh527NOUBy2Y08njG24nXSvSROw7KhFAx5Yc/e6EBO14bWgIDGqL0mMUNUwbdSWRNBMn2XGwzNaGG4fFIh18ZA9NAV7jr9pC5ZvKkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSxAIgDe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSxAIgDe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b983bb07eso2252009f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877035; x=1775481835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIilPXW4gr22kd4qDMopNhMeSX89TvUkPQMO/Qu0syY=;
        b=cSxAIgDecvNtpIstvukgDvwsgT4BofhKjG8OUTZOTBSJHdua+aP5pne0++cg98O0i8
         9omi/NU1l1cPTRsCwLv0yFZ+nZ3yL9MPO6TiBRDVA8DMVoexT2HoPnI98Plbgv5TwWiB
         3BbVOlzQHPTNapTu1pR7aKoRAKNHcn08LMI2FfxyRbP1VtgC62q4Pwu5hbgEUKCZTLMu
         /4fFjC/zfntMCpiKbJXX/104bK5bt41TQ7mZ3fDQ9vNM7bSGW6SjIgueCEepXNPMVA/G
         Sr8rYb+lfZkbBz0Me26d0auDXBH/tPoInhM36rFJlHGnEf74XvXJmfTvuWo+inj/ynpM
         vDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877035; x=1775481835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MIilPXW4gr22kd4qDMopNhMeSX89TvUkPQMO/Qu0syY=;
        b=aJNg/i2z803VoOMROfIYSH9fStC4l2XAR0X2j4+ZBfVfV1fpVsxoumbiGKaZ1dEB0H
         icJ9Ok2DM33fIG8QLCfHjMI70KqkPGqNtl+IQPJEGK0CoOl8nQaIEXUQ0FCVSfOdhqR9
         ucLL4u9g2SDiinu4PWDpo68krvXm9w5oFnEq2Op9J6ZBWZrH8fk+yxPibp+PmKcCd6wY
         30ipYGkZ+EODHczhedm7NVDru2vW6hv3YmT9YZENfFwNJ2O8PGnNa05E39d/g//C7sYY
         vyyIiFsDrOcl2nRZ9ClDbiIHnIl4CevZ4pxmyFagH+K2spSWBAR+VBrNo88VDggjq5fm
         MDZw==
X-Forwarded-Encrypted: i=1; AJvYcCUiGU/hlupmlDquG0Uzg6Do4y8SFCgNtSbMlcfL4CtgKh8CBhMgoUg2OuE+B5oclsUltVgL1HXU4n8AWFtJano5Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL1wXL1NAMl+GdvhIb/frohB0m2ytEwYTASooJD+DgIYy9ATGu
	0UcRX85teWJ2x7uGYYA7bWi71ZZa3EsSWMc2pgZPQYtR3SzftoCOeTbO
X-Gm-Gg: ATEYQzzN6puV92i0JRLJ3X6W7bJCDwakNAt/q7n7mZgT++yz4leiKFFoixoV+Pp9wXC
	ZGzB9paRXffbdHKu7KoZKRTqHiaNHkiYrTcZA51PqdmuSOU7WSCWpDMTPOANnDn2urjj4njIowy
	FQ7+ZWSXCwM73hE0eNaUzytSgs/io0SCS8Fb3SK5IUu1pk+6v04OhITvKX+0RDBo9G/Jwsv5tW2
	39fuzPGtg1/ZUzXx5K8bYCtG1jG+FAoeYSYDeXYSZgCk3L4HsQB/M9pTi63uHgWSYmA4hX7XpuA
	k19p63XqMh4qKM3e2+D+U1voU+sNie+XtDze1ZrNVtlexfLwzA0XOOYYxt6uncPPnehgIlB4HVn
	5roREH7VIteYcy4MDiFNsTNHSvhS1BA8Sg0PXSAxqvnxEXgxnntR3iKxiuAf1PrcpgXrPRWH9JP
	Q2KT6qxI9xarnK5AQleTWLGlt4b4i6GozA3ODx/ktt
X-Received: by 2002:a05:6000:186e:b0:43c:f8b4:e5c with SMTP id ffacd0b85a97d-43cf8b40f79mr10771448f8f.20.1774877034354;
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/5] clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
Date: Mon, 30 Mar 2026 14:23:41 +0100
Message-ID: <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SCIF{1..5} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 28d035613272..13c158bb9215 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -269,6 +269,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("scif1_clk_pck",	R9A08G046_SCIF1_CLK_PCK, R9A08G046_CLK_P0, 0x584, 1,
+					MSTOP(BUS_MCPU2, BIT(2))),
+	DEF_MOD("scif2_clk_pck",	R9A08G046_SCIF2_CLK_PCK, R9A08G046_CLK_P0, 0x584, 2,
+					MSTOP(BUS_MCPU2, BIT(3))),
+	DEF_MOD("scif3_clk_pck",	R9A08G046_SCIF3_CLK_PCK, R9A08G046_CLK_P0, 0x584, 3,
+					MSTOP(BUS_MCPU2, BIT(4))),
+	DEF_MOD("scif4_clk_pck",	R9A08G046_SCIF4_CLK_PCK, R9A08G046_CLK_P0, 0x584, 4,
+					MSTOP(BUS_MCPU2, BIT(5))),
+	DEF_MOD("scif5_clk_pck",	R9A08G046_SCIF5_CLK_PCK, R9A08G046_CLK_P0, 0x584, 5,
+					MSTOP(BUS_MCPU3, BIT(4))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
@@ -283,6 +293,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A08G046_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A08G046_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A08G046_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A08G046_SCIF5_RST_SYSTEM_N, 0x884, 5),
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.43.0

