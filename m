Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E938C2B6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523215; cv=none; b=K8HKwQNtGqD1Z9b/WM7oZmJX5VvptApuWy4x/cOTuOee2RGMzp+1C4jX3Hrrpj/NgE/8hamm+kVk7AWWGrbGZ+X2YR6VthKPYuRaDz0srgWCHtPHhxUSFmbfSbvE22NBlIG1QV1ReEvSTWpWCykOBnwtAX1qGVolLtQNdPIQLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523215; c=relaxed/simple;
	bh=+ZAyTQp65EIwuXSHSXormBFcrCjnoX+hpRnpUkHYdWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meAMQhcTO+DVwtpx3mB81W388fVhQpqnU7o93Ld0/cZ9lFlww907byhwWVWXuNyGnmVc8GnB++DRsv/z9z0sr2qAz9hdJDuvvN2koalLEUTpZU66trwcXKidXgzjZ7GIeN9jZ/BmCO8ufgSu+Ky5PjVkhyp9n5BCwJGCaa+aOyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlmSrXmG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlmSrXmG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b9144790dso446530f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523212; x=1775128012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/sFHOET0k+buUlTybSm02sxCJWIJTnlItgG+5spzcs=;
        b=HlmSrXmG9ksNfrc3X9ZUZZSj3MySUKI4Q6RLIgx0uzqIy8IfhJEK1O4KNA59QQkTAC
         f9eCE2uOVgzgPVh6a4MU+eE7BE9Kxw03ixc4+ejpGH8jvfSleq4+hDXtgTwbMG8ihTZi
         h8A2bvoB7BpFBLmJ0zC0fxvbMrxI6hcC9yEI1aTCwiZUVBRfl4shCJ7zJKfhrXc2NPV/
         BC/giADRyqiLQmfIBYA1cP+eEZyfbWlLwUzIT8st3wxNHm+Eml9Q1o8JOGpn6PuqMZsE
         M08DFOXhibrObRGNh1jdlm0dgbAPB1CMM343p5y5ZMKIo8k2nKTNpl0oTtwnKw35GjgP
         xXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523212; x=1775128012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/sFHOET0k+buUlTybSm02sxCJWIJTnlItgG+5spzcs=;
        b=hO3v6Vm3/uyAWGCMytv9hjKQ4rs51a3Fk8GMJb48iQkuOt4o15AljHCxDVoz+/h0Lk
         R2cChSdfCRrHIbuwH9zVtyHbyrR1k2osVoQ3R2iFpPzD4H7ly3t6NkRxwmuhq9+B/buW
         sh2tbZyh8DZqSqQTeMShK6VeCViYxJFpqE2hI6fh+dmX7FftLuTB/NrjqiexnMfjIm6J
         7+R5uW8Mx0A9SaIfUhVQYm/UhNKf03QLOPx6TGMhwhPxbozokgBOF+qWZPjO9hXqcpqz
         iKEYzA93SUV4Gc26at1K0MmJ9aJh6Y/mWMkPTsTkWFLDhjs9fVX119lhUMid4zzyjr9L
         SqiA==
X-Forwarded-Encrypted: i=1; AJvYcCUjw6ePSX+aft2jYWhTur6FEDAToSYM52G2Cyw11Qdbs5+ltWZu3p/2BNuk99Uyk3qv8s2oUSzj4jHjuonxhiVX1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZQwrSb1SweLiEGvGGj/p6xxc0xU/uGroyMOYHE3/KAYR7p3f
	tDcxQl5ZuPkoI7VrRNOnUHvSrD6UtKvTTA6zs8/3jTlnKoy6PamLchg7
X-Gm-Gg: ATEYQzwdmsm2rENO3so2NkSsYXyV1BFbzRGKFQ/vPJYjzSQEg0VWZDOkIaWc5cVw9Yz
	7Q1X5Hnqc4PdazLnFG6WxqR4Fq3CxneXCbSLxC5MFgTu/A5LwwZnv3VonUJ3dbi6mHZ08pd1jea
	eFjduigO8RLhb42hfV5M+ywa7pA0BRnj1atTZ2UhUp+Qfr9X+N9t+wJbvYn0cpjq9WsbdBWftfQ
	7dUxfOptYjvoY4jTR0WbFySTNH3kyZrH+8T/ihcb7KAdHXdafa7IpUXC8M51knlqfN0He426tIJ
	/HXDP/SnaPqJ+8Po1Sb8Wmq/o5pGckKmZ2S2fpw/Rqp5v72yhNp0thL9a8sXangaCqTOe28pvbo
	wOMSFVIdA1PcgZjVSMKzNHnxtViEbfQJM3+m+NsdjOuzh5eoJiHJSufuwbqm041PBTZ4lkTpufS
	zgdD2G53AASvakr84Vd5026UDUtlnw3S5HCHBVRvEwQmn5Hp6j
X-Received: by 2002:a05:6000:18a8:b0:439:b522:37f6 with SMTP id ffacd0b85a97d-43b88a0feedmr10937192f8f.35.1774523212434;
        Thu, 26 Mar 2026 04:06:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Thu, 26 Mar 2026 11:06:35 +0000
Message-ID: <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Rebased to initial boot series.
v3->v4:
 * No change
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index abfd8634d2be..910c16a369a5 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0

