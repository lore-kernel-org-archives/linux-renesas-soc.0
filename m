Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191885;
	b=y5vyC9My9+NTuV4u2frpjEqS0oSyqToLjoynAjkTrnm51x55U/5wIOXOJnMnpyIfx9wF
	 xVGdHM13JZgeBVerb+90zbmfcak4DzTViVBSs6y94rUczWLNYpANN92KZeT6mS27wAmpq
	 7y4LFOpUoRSsneQbpS7btXlAS8nACXR+3ozfYx2/8WwCFMfN53og3prHjYJ1bDyGu3YvP
	 boaGmh6ufwItJqvItZtuzon5lqsBGU3ZR3HcCpwwqZSb+WxjSDhkPbQvUjhcdwTcQVeRt
	 aarBU2Yga6VW0AEbMp+oHEbX+0/KtaEBcQsgPoHo5+nDDUza4PzKSPlxFtiVvHQDgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
	b=wbiHQGLV4Bo7R5tWM4Sxkk3WpBSZYVaMvNLj1OFmtOJ26xpwNbBjzG1T8vzjHlJ6JCBF
	 0Uy0OqQ+nBHC5fku37C/N3vZ7/z0zrQzgkBUAPLAZHW8E4BTWCkzQmd6jOdHZfYlJRGWi
	 etGWstXVNo7GikrPayMNu+aPaemffxQIRqPS6rj9+Pvbb4HwO0eqg+ONrS+QAPLjpcH9x
	 k35qv9UOb6BzW7NQsXxA0u0PB5t1X2BpL2Gg9Pvu9j7Dk4LkieDyI4bMxO/Dzl3s5lYNf
	 Q/pFll/aShfp4A/TKQKh/hdO/npp9IPO6PLKDgvRasJ0fW5nzrjgXNR0ICEOBCH164A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvR4TmX6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D160A2604
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649D160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvR4TmX6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso566549f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191884; x=1793796684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
        b=dvR4TmX6PJ8T866B1M9ZMM+YBK0WYbDdi8Cqutit9Ggq5Y6udOKcbg6ZDOSqiNM3sh
         WgXCJDsspCDVHesKZM+BntN3XyjiCGC1TiElD7gEkqu00EyX1DIV+eY8APlGTFldmdha
         wYoT3DDZ9APCSMpnSwvLqenKX74WVnllKKHk73IwF7310kw/e+P04zyYHBsnAtLxqyn6
         jSg/DrhTqID8aOIqk7OAz9ZajrU/V0rvRRQHZu+9BUV4yTBP5DYaBC5tnKq3fi82gWS3
         rGjP+gBoXismiAeb/2Kha2zdkz25bmkc5lyS2e0PfWXZwk5ivSQ63eB849BTdsZMOJAV
         HEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191884; x=1793796684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
        b=pgnwNG97ftIs3SUog3lXJiijrJtBzZJoZdDy5FFNn2q4Ix8h/hGmD0s6R4X77fzNvC
         s3snOHxmbKhZv9yxyEecPoeyY7h5DSJeIwtWE90COQ1uIDAD8X6h6Wc/ACFhWs2pXlHc
         2xf2XlTB+GNipgsFvOBVRPc2YFT0j6qbkopzBq0UXkJM+ruokJj+CgzTnlIeidUCfRvg
         a3xpnODi22mZb08fgUbzvxImVZ+aZwLUwMLsZEWcfZTGCw6UagKr8GJnpRpdx+jdYxCz
         eh68LrgqCdMa4ZyCKGd/9zAaxhy1ZWo1KtpPN1P8pEOmctkxR2RQRQEDQFf6Lh1Q2oKO
         2Seg==
X-Forwarded-Encrypted: i=1; AKwUvBw7YZSBE9LNLri41xdDSHlfHPa4Ov5yQ2k/95JQRVmtp6QwdfErEk7QRiM1ANrO4XGRajzTGVLbux9FXMRUTU3G5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKA1ky8Ti/G5r37kNAc4dNW3JFWxjLoXYvwYula6FyfPu7zeJmS
	o/AafMiKPMVENrpyeUFHiLy4e6GokSwajbLPSHqrL2VRaiq2EkMZpSfZ
X-Gm-Gg: AYBFou1TchyBPtAY3VPOqmSN5ouvksaetwKVhAsseHudp6G7HcfBbZ/qXu4lkid3b2q
	HKnYb7nfDQqOlyNLdolDLgrvO5IapuTzEldhgrOhpmMF8ZcqHGXGESEfPDYugcOHTwAF+R2E0Tw
	HnhjYuZUFMKAdQCSNRc8Ph2O9EQBUiHXGNyOjwTGOTT9NqHZKqQ9iUs/44DR651EsM/P0jmHXAj
	uggzxEbVnle9/jFf7VoX+C1NZ4MScso14tjdwbcGvgbgAcxGSB6ouFHzSC7GiOXcOjcPYsycVtP
	FtIqUjhTvRDZrA35/QK7zsYg9z3QgKFsj/cO0onqm2wx7tS7EPOTAYGr4kaCEW9/Un32bn1AqDO
	GF/rulN9pCQTVkLLuGJxG5cE1UlS6gEjcdFwe+g41rgTnUQsJslXJXgTg6WtCST2yhnweRpeDOa
	GCJrvdlzF4QNBLNYwpp2n+9S+CjIxpqtfw4NkSEfkrBiLkMrMPMqk66yk1R560SPAaOuL8HT3D2
	j9v+jGZA+InengV/XgtgqYoB1ho3MHnyr5K1l5rju5yhPDiL7n9E6bHFL3oDVcek70o6asXV9zx
	RPjWIIjB5RCqUGlWyp7gF7g1sOC+RtRhTPJ3M7DCB5HWLUtHlw/GCD5C/0967ATWRUS7
X-Received: by 2002:adf:f889:0:b0:48d:ff06:c634 with SMTP id ffacd0b85a97d-48e5d5e000emr4198676f8f.54.1793191883611;
        Wed, 28 Oct 2026 05:51:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:23 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:20 +0000
Subject: [PATCH v25 03/11] mmc: renesas_sdhi: Add clk_mask to support wider
 clock dividers
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
Message-Id: <20261028-rzg3l_sdhi-v25-3-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=4810;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=6Q/eM2ygbxf6jRcqbxdAGes1UUbWlVneYC9xcDJwlhM=;
 b=aJfJqQQDgwsVfqhJFP39+rhIeihv9M/tkelU4gr2KgQIXvejCowHBHQpvcjhEpECFT18bobyH
 lHABeKtcJnUCHPxO/kShngFJtNB2d51wyLsL9uWC5kDITU6EgDpEALr
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock divider on the RZ/G3L SoC is 11 bits wide, which needs a
clock mask of 0x200000200 in renesas_sdhi_set_clock() instead of the
hardcoded 0x80000080 used so far.

Add a u64 clk_mask field to struct renesas_sdhi_of_data and struct
tmio_mmc_data so SoC-specific match data can supply its own mask, and
widen the clk and clock variables in renesas_sdhi_set_clock() from
u32 to u64 to hold it.

While at it, clamp the initial clock value to a minimum of 1. If
actual_clock / 512 evaluates to 0, the loop condition
"new_clock + clk_margin >= (clock << 1)" is always true, and the
loop never terminates.

In probe, copy clk_mask from the OF data and fall back to
SDHI_CLK_MASK_DEFAULT when none is provided, so existing
SoCs keep their current behaviour.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit header and description.
 * Dropped initializing clk_mask as it uses the default value.
 * Added suffix ULL to macro SDHI_CLK_MASK_DEFAULT.
 * Fixed a very low or zero clock rate from the clock provider that causes
   an infinite loop in `renesas_sdhi_set_clock` by max operator.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Replaced the check mmd->clk_mask with mmc_data->clk_mask and moved
   the code after assignment of variable mmd, this ensures assigning
   the default values for non-DT platforms and DT platforms with no
   device data.
v18->v19:
 * Fixed the clk_mask for non-DT platforms.
v18:
 * New patch dropping struct renesas_sdhi_hw_info instead using
   renesas_sdhi_of_data and tmio_mmc_data.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 10 +++++++---
 include/linux/platform_data/tmio.h   |  1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 09bf9b24a8c3..bfa626ea6bee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -22,6 +22,7 @@ struct renesas_sdhi_scc {
 };
 
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
+#define SDHI_CLK_MASK_DEFAULT		0x80000080ULL
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
@@ -37,6 +38,7 @@ struct renesas_sdhi_of_data {
 	unsigned int max_blk_count;
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
+	u64 clk_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f9ec78d699f4..495e58fa7728 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -194,7 +194,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
 	unsigned int clk_margin;
-	u32 clk = 0, clock;
+	u64 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
-	clock = host->mmc->actual_clock / 512;
+	clock = max(host->mmc->actual_clock / 512, 1);
 
 	/*
 	 * Add a margin of 1/1024 rate higher to the clock rate in order
@@ -213,7 +213,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	 * provided for actual_clock in renesas_sdhi_clk_update().
 	 */
 	clk_margin = new_clock >> 10;
-	for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
+	for (clk = host->pdata->clk_mask; new_clock + clk_margin >= (clock << 1); clk >>= 1)
 		clock <<= 1;
 
 	/* 1/1 clock is option */
@@ -1136,6 +1136,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->dma_rx_offset = of_data->dma_rx_offset;
 		mmc_data->max_blk_count = of_data->max_blk_count;
 		mmc_data->max_segs = of_data->max_segs;
+		mmc_data->clk_mask = of_data->clk_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1178,6 +1179,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (mmd)
 		*mmc_data = *mmd;
 
+	if (!mmc_data->clk_mask)
+		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 426291713b83..76056d49f5e0 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -61,5 +61,6 @@ struct tmio_mmc_data {
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
+	u64				clk_mask;
 };
 #endif

-- 
2.43.0

