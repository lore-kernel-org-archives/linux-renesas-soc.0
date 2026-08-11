Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428882F616A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472856; cv=none; b=AeyNrrs6jf/AgmhFvu5pqkEIv0BIGYldxXNubLvFaRV2MRZvWuc7105IJeSBFi+JnsYalK5cbVtAy1Ljh6jsnX66PEWfU0DxCldbOBEdYOFqBYbim6ejYji6IPxnqjajQ8+LaN5cEDzO+3JppGybYzK1Wf4IDVi/wuGVzBE1rII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472856; c=relaxed/simple;
	bh=mqmafDf7D+GjfEPYR6J4RxC/jXPl5lKysFJIcPaqAso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfgvWwsdyAanNpWGcscHzWIndFt6MN77C72GIdshVtFGnYHeJ2VmiTaF+jXh3iaqnjaaYbxZKySfRzE0FQpTIzo2s4g7Xx2tSWH5DHkovBSjt371afenPGlaUlEPOL8mqoR6sLAw9OqiSbvLYN2DSHLXJ+d+7GZqXNxQBx9li4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT0Cq5DZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT0Cq5DZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49954b88fffso1185135e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472853; x=1787077653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ij+5nUBr62ISeroE1A14zeBfYBlsVYffc+E2WxB1wTY=;
        b=mT0Cq5DZ588s2GALo197IG0Ymy5e2Z4qSwsKFCbq0ktqUxcJSqGYzQwm1+vkLbSU5J
         0Q3NCLKPPxWDIVaDlmWWVjfK5wsJWQGwlyDmVizXwF0Whb20lLrW88ypIAi/9pqjKyMC
         Yt63tqWu6Qj+7ONen+Pq5e9CZBu1vBnPJZWy6DY5zRjuTN8mAyRCG9m8UUkuIH5TfZ/V
         pdsLJjChJn6Lg+bhvEcByCln7C1EtA/H2cNa3NSb2iAo/on8LAZX1LbWqZyxl9iD0VoX
         zWGMFI33M8UMLY/zIBtxG9N/nc3EpyjPrA1cO2VEIoMG2UTfwSpOFt6zB4uHury/sbvL
         LDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472853; x=1787077653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij+5nUBr62ISeroE1A14zeBfYBlsVYffc+E2WxB1wTY=;
        b=UazIo0l3za0I8+FytW2Qjad4nFz+3RcOIEoIQL9l26AF//2N3P43yIXpTCl4neA+zW
         JHVmG/cD3NLWxB0lXCM5Q2eHv9ojS+ZrmC7EMMDuDx9CEyijELeINyF0ADuPBtaXyVIo
         LdmADjcMm8M9vR2TX4/mzLXh8TUfO8hWw9c3Vv98Dpo2uOf7GxU/gQw6w0XTJvtRKQvL
         TnDPFBPq0uQzeg0f9kndpqnQcuRJmvd4/bS3kJS/E/S/zkD9cxWaBoCl2OTt/s1MgWCx
         UwKZUWop4vdrIbj5U8cCFaMQ3JZFBmWdez5DMbNphkezF4HYJrY+bsW+Pz68k2KzL9+x
         2Z4A==
X-Forwarded-Encrypted: i=1; AHgh+RqUAgU9f9KTIHcH0ZOR+gR1irowOumMTPsw5HNmWEKc39Kv6rK9Nf5DTL1N6Toqk/Dc5KdDyiqWX7QsvGUt2i5sJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxROBOn25sdr9Fouc/VvST8zSOfNP0JHtD9VLtU548ls/YiL98s
	sqmLQTYfsqPf1VVMtWKmrZUT+mgBOH9NQU2dGZ0JnkCHDtiTfek/cvjv
X-Gm-Gg: AR+sD11aw/6uuJA6FQSRvYuX1kXKgAmyjBWIJwhhlJl+j6GtVphOXJRjSV7QPxtcwTi
	HllTA6+ceiT4UcKfaeiH7oehK3OMER7LWxUTBNAB5B7YP3Ep9a2Gjfpbp+ZX9SA4/eCo1N09Yvz
	q9owQYUh2dA0MG/JWXgDRup9W/4nnGZ0VfJf1TJNKOxualgA+TKWM1zO3i+emGmLsbDby17MVR1
	0kCTz1JfyZS0TqmeASNAMV9UT0tn4mCG/W7NWsDhpbibJsTeRJSVmuJqa58dU6MLVatgcUp2VyH
	lHvYnPPonxVqXFblpUWE1N1QxrTtyj0HZmHiY1fubTfVab3Iolf5cPQoClxWwrWOnsSPQQT19Bq
	alH3+ZCHBlEJ9k8W4v7HaI1kVfkqpglsFQLHH+PI8K90c+qalqh8oRgdnOgw9p2F82KlInqPpeH
	jns5Oe1C0ozw9sXD5V+3NLFXRTNGUvZETfFYtFYtiBRIuEAtPp/mrATiRyHvL73sn/UspdIqDwe
	8oHkvoEU9jX53j3z9GVfW8=
X-Received: by 2002:a05:600c:6288:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-499784605d7mr70042595e9.10.1786472853308;
        Tue, 11 Aug 2026 11:27:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/9] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and LVDS clock support
Date: Tue, 11 Aug 2026 19:27:13 +0100
Message-ID: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,
 
This series adds clock and reset support for the MIPI DSI, LCDC and LVDS
peripherals on the RZ/G3L (R9A08G046) SoC.
 
The DSI clock path on RZ/G3L is generated by a dedicated fractional PLL
(PLL7), followed by a two-stage divider and a mux that selects between
the LVDS path and the DSI/RGB path, each requiring a different output
duty cycle:
 
 EXTAL->PLL7->[ DIV_DSI_C | DIV_DSI_{A,B}] -> [mux: LVDS | DSI/RGB]-> vclk

v1->v2:
 * Collected tags.
 * Introduced the macro DIV_DSI_{A,B}_SET and used inside 
   rzg3l_cpg_dsi_div_recalc_rate() and rzg3l_cpg_dsi_div_set_rate()
 * Simplified the divider to "(div_b + 1) << div_a" in
   rzg3l_cpg_dsi_div_recalc_rate().
 * Replaced the data type u32->unsigned int for the variable divider in
   rzg3l_cpg_dsi_div_determine_rate()
 * Moved the declarations of the loop counters inside the for()-statements
 * Updated the comment sections in rzg3l_cpg_dsi_div_determine_rate().
 * Updated loop logic in rzg3l_cpg_dsi_div_determine_rate().
  * Dropped the macro CPG_PLL_CLK1_VAL and instead using FIELD_PREP 
   at all callsites.
 * output_nir updated with mul_u32_u32((p->nir + 1) * MILLI, fpfd) as
   p->nir is small.
 * output_nfr_range updated with mul_u32_u32(fpfd, MILLI)
 * nfr updated with div_s64  as div64_s64 is overkill
 * mul_u32_u32(p->nir + 1, 4096) computation reused in fdco and output.
 * Open-coded 64-by-32 division replaced with div_u64().
 * Renamed cpg_core_clk::flag to core_flags.
 * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
   macro.
 * Added support for LVDS fixed-factor divider with 4:7 duty cycle.
 * Dropped rzg3l_cpg_dsi_smux_get_duty_cycle().
 * Updated Mux flags with CLK_DUTY_CYCLE_PARENT and
   CLK_SET_RATE_NO_REPARENT
 * Determine rate now forward to clk_mux_ops.determine_rate().
 * Dropped the duty cycle macros.
 * Dropped struct rzg3l_dsi_mux_clk and to_plldsi_clk_mux.
 * Sorted clk macro definitions alphabetically.
 * Replaced M2_DIV7->.m2_div7 as it is internal clock
 * Added DEF_G3L_LVDS_DIV for fixed factor clock with 4:7 duty cycle.
 * Prefix mipi_ added for all DSI clks.
 * Fixed commit header /r9a08g046-cpg/r9a08g046/
 * Sorted DSI clk entries.


Best regards,
Biju

Biju Das (9):
  clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
  clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
  clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
  clk: renesas: rzg2l: Add support for divider flags
  clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with
    4:7 duty cycle
  clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
  clk: renesas: r9a08g046: Sort macro definitions alphabetically
  clk: renesas: r9a08g046: Add MIPI DSI and LCDC clock/reset entries
  clk: renesas: r9a08g046: Add clock and reset entries for LVDS

 drivers/clk/renesas/r9a08g046-cpg.c |  83 ++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 557 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  52 ++-
 3 files changed, 668 insertions(+), 24 deletions(-)

-- 
2.43.0

