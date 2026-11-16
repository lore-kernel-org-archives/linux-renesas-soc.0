Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830541;
	b=EebpsrJDPNQu8KtZmIT5r/H9YPmqPBVzhLbMmzk5aFB79HgNWWHvFde70Qu0j/5vaCa+
	 J/HE1RY6EohhJLBMWfxGMhVWOMxZfs2b5oAugH0oX37wlS6E5KCBDE05tMWt3IPLk8QAP
	 CEiLtBgV/Epus9OSYaHfYoI3lTGDQHu6YaCAgeuOH90qWz+UwkdpfM9IM3BPMoWI586jB
	 6GhARxhDRceswhtv8wmu/EcP1NiGu9c6SZXkU0PZMFAnLZ5hy8IDttnRlV4BpOF7FpbhG
	 lgGgLDBOa45yM4EDZ/oELr3tRkgRLvM8yp8mHOvURafenesmj1yCk2BvZyboZ6VY4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wycBFwUVd8CFbin6WeDowNgzU6IjX96JHqmfLjS7zaE=;
	b=SiMMBTGiZLtbQkqxQS5GKWvYe0Ja8bid6q09uKQvSfzLs/uQzcaEqQ9oUjtEx6NExPCv
	 rY3hmmph2yIpWBdg7vvphkyuvkG4yfI8fE/luUgpPgqCksSPVjQcA5ciW4HZueBwB2aJe
	 Bnlt3Q8uCrbaprS9xELqB17G2hxYownYCtQKXDIpbxqpTBrN1AbuFWpoDZhmkSBdi6s+l
	 9k7gXxAc76U9QlztdnmOXpgKtm9TpE0YKShJ+ao8qq8bfc04dKoswTJiaXRng/AN1e5Mj
	 krO5+Yl5zwaAkF7Gfvydszc6sWUD5RfykC8mtt5y3lLPwfhbvmKum3B+iQrtxmVRb8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fb7TEeEO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C5606A33B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 12:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68C5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fb7TEeEO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so16799965e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 04:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830539; x=1795435339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wycBFwUVd8CFbin6WeDowNgzU6IjX96JHqmfLjS7zaE=;
        b=fb7TEeEOOQoidHokTK/7ClvicnQNNePjJBdsq3S9dEIYNFvsv/piL08koa13tfXJZ/
         YGv0T9+lDfjm7TwjI3OhtmeUMdLD7Zz+cMKHyXeS6vxxBCczzXTDGS9HAM73QIUL0G2o
         2YbpbgXvGsXKDhk1OcBiqzE1v/JphRGioAnMJtYmK22XMUm1WUF1Sn1vS/UbuPbNbAXO
         I8vTODfvRMsFroPgyRNh9qcBXRQEImiV72FQ1eW+/pWCiuWzXA8AXdyIzWzc/kb8YIzD
         NTHoDSvEVgdMWTxb4hLA5pIfbkpKtRvFeeuWtY3ySLXAq82J2HPMDgR5t4MnzpykYYOe
         d14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830539; x=1795435339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wycBFwUVd8CFbin6WeDowNgzU6IjX96JHqmfLjS7zaE=;
        b=1EHJwtB8GJ/ZOt92zE0iyUXvBDrvbRfmxH6WwXhjxCbwCivgVKcerCIZmQd5qFThQa
         NHFEfgunE8jB1FDJ6Vwtco5f5JpP5RYsPcThToyqgxTr6RS2tQwOrsPtr73DkniwWo1D
         dIdm7GcsIgkn4W7J3Vb+L49/MenImDcGm1MoEdwhdvUAE8W/BNOS7o5htrY1UZjq0Fee
         QsJfQnKXjBuvLZEy6DZrTQcKYgbLg1/a/RoCRPOAJ8RTfv4D/cDSB16nhyznjcP//BnC
         1GW4KnshIQTBAHzCMU38ENKvg68zBaevbkbrJBicIKK5Yy2Kofbf+ZST4/k6pHkveXPW
         ncxQ==
X-Forwarded-Encrypted: i=1; AL+hErFAC8WW7ylTeJ38WV+OFuzsA/PgK7FrBhBq7SkGbq3DdM2oPN1wuoxYcaLyY9Utcf+42XU3H3kpfznrNLq+O2MzCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XwvXeS8hvO/mFMIPeFV5Rmk9JS1Ad2nb/E3r8TpSkweTorHUo
	zTxdcKma8YLErEj6IO4yE4J5f4ZvZpWmphbGlOvzZqCZHxJTHnCTP2Oc
X-Gm-Gg: AYBFou1CnR+5twHf0o92YVre62QmNAQgCptIcu0dglptS5b9nama+BU1yIv3+QyiqD9
	mU9qYiwU+nXkB9nXbwji3RpBrk7J7ilhxdkgs6pif2FCzau7fBM/68orwUo8ZYBC+4i3duP1djs
	iX5V6zX40XdTamYTPgq4gbt1nEEWf+28ndeBiZ7HNA/XZPWnJ9SRZawXY6zHOwWA9/IAuGRNCmd
	IfMR0mEC0iqVB2UZp2hEtt0TGdBund8N0Ocr0n/RUsEWzPTqwnvjmAZabj0XMW+0SHCukh7laZJ
	wqz+BsxY/9avkIoODTS6Zug73Z+I6ichABxw8taWfRlKOGqjOJl/zgrd/2IuA0Pg8/ot+6TQluM
	DryPxiy4/Fa8WVhuAQsaEiMu3883gFKg+QqcSDs2s5CjzTa8AW44gQGyiRL269aJliqcu79gaLC
	rvngQDhJNIx7+TI1ZWiOFX7agMCjHA6Nsmnw8MHWT1UZpOlXE/u3igoSG5Cv6s5dAMoIWgeI+sH
	za8c+IeJ82TNojaLjAIsmgeW+5n6ynhOzDNJBHZGgjnMUrKjY9KrQm8bEGHoEy/5GvzzNEQBsht
	KMxh/xlCeFzNsCkIbtVHpfRdUHgytMUMsYzt/PPm6dILM1VpTvejPPooCNVOoUbTj79Ffy6z7Dl
	dw/n7wZcxZ4s=
X-Received: by 2002:a05:600c:4e43:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb55a6a937mr215757375e9.7.1794830539328;
        Mon, 16 Nov 2026 04:02:19 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:19 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:02:16 +0000
Subject: [PATCH 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
 per SoC
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sdhi_hs400-v1-2-c5bedd312408@bp.renesas.com>
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=4066;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ggghEPeGQYbLQtc8+CGJ64+RPB8GdQRBKmahvFKobRQ=;
 b=JsRU2l9EyfhgF2O3OSO4uvWFprbcqX7UxV8vPYEez4BWTNYMJnmySyhR9QXLhrYqc6tSzm/x7
 slDbEDc5m5mDIlHDB8IPKPNdfcUwstJJP8KgOfi+Bb+ZqvxDrZ0kcS4
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a93e613e9821..8ae2ec04bd1f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 56286431fd2c..7dfcf7f970aa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -333,7 +333,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 #define RZG3L_SDHI_SCC_HWADJ2_1_8V	0xff
@@ -484,7 +483,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -621,7 +620,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1233,6 +1232,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index eaf21f93f5d3..37eeaa52f011 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -124,6 +124,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +141,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 99b05c8c840a..501ca4355c34 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,6 +72,7 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u32				osel_tmpout;
 	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

