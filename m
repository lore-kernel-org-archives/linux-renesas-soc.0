Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C373921D0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381935; cv=none; b=PBs7MGkjGSvOAUmNP6Ro+GHdyCIUBun/12ee1xmz3I2Lak4y/O/3Lh78ORW21jp1AqxaQ/jt5GrdqVn199+JLFvIyzsEaSX2pMQvmpo5L4y72wBwjJIz1vP3oIIsudGdi+QwnVUawONMICVjkpI6y+EzJZS2n7pp+nK2U0N7cl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381935; c=relaxed/simple;
	bh=y/WSoV7nvfcrB1W0zj2/Mvh6cJfEPxCK9CUupbrr45k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NX0IaUaTcXyYllwIu32ukAs2V++WVC+bg2KuPZMeYJs27Wu/8dqT9lw+e60SeYQMQRdyyQPa4/plIHVza6X8ZyLj7pp079YPreKB04BYe9ZNpFYvWr7DXV/2L4md2SqFwLXEKRRItjtePw05guP212eBKWSyCyVs+2Q28KxTigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTmmqvr8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTmmqvr8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso35833525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381932; x=1784986732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvx0jbtDdMHoGdK+DqsZ7JHopU84dkAONUnfD/8T1D8=;
        b=GTmmqvr8OPHpPYnUns/5IWnjwKO65zZrac0l9cdydpe53ybN2YrJbFrXWhGrQwd7nF
         4PMFW8wGxTVE8hNowbnuYBDx7wMZLz4W2FaxP4voKxcD/m4a+zxLzjKXtPKim/R4oFZ0
         pWW2RK63/2JBQMh+tdEKJtHRenCn8+rBAvP3Vp9Wu9f5DTFRgkd0A+ccUREyBpYI98JN
         oFmUhzJ4Z8LPTVQ5MdNFVMv5K5jU0h9BaX+D2dGRy9OCVZdbdA8RGBMR7fiJgd/TswK1
         Lyw1ICkbmAL9D07HMLSuFuhvzUkrLDeIokgHeWtijSN440RWPLTEGzhh0bUWlYtsErp4
         aFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381932; x=1784986732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvx0jbtDdMHoGdK+DqsZ7JHopU84dkAONUnfD/8T1D8=;
        b=a1r86JSL6yJWPyDuvP07c4/wPu7aMOcTKpLlLhatoxMGcKJmOZ8qDXvnXs4eMU8RT3
         ckVm02ISEY2tETJPI4sej/jOOCs2QHOdBVRa1cGKGAgG/GVvVHfBH2H7ntebEP0nIyo/
         rcn1rVumk0kFm7DQk6qCpszN3g/mdGDRXEdFvaBbxsKXK8Mkl6mf4CYFewA65kD/XDHx
         4FBGQTsfsAgpf3HjoSeXi2MVC7xkaB9Ku+R0ztE86WJeT/P3RBSRSS2cFyh5cmEMqTg5
         xM6cw8RM66ixJU8D7bWhSblqL3jQOs6/eSlnru9L7EM0jqlYjpvXLkiapi6CTg5r+ZwC
         F0LQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBlE6/RGvd0ZhpjXu8Q8K6yergGhAfhUn+EQkk/YfvwKRjCoxzYLOUe4h21+EIgR6Q9H9Wa5usD1b+9Z67HUEpGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpnbqHst0ugUuyRXZwD/Njpx5IOo8oN2/KvtsRzIYhU87wGW3p
	KSdn56bl7T0zFyCqiUrRsne8Wvl0ahnCXl+mY+oQ30DXG4Htz3beE5eu
X-Gm-Gg: AfdE7cno82ik7UHboCyhnsnG1J3E1/5itr1nDf1+IIyHlaV9UNXc5CfrAKyMhAR82d5
	8DiPOdWaliMUGcYrkEwBmpxhZm04/7Rz25uSLgZN5yNrzu8R/bMyLkEfuekbXphMM6QizRH4zJh
	2HgXTXKVIJEZU6d2e59Q0swULYUNQbDBGTpCUNKbHS3PfSmV+xM4KlNW2dUayJLmN6ER7T+xB7X
	/sQCD81gRLQIa1iNjnJ3J1dTAsukk9DNBMupMlykl0d207t+GHVsGxR3RB8DJln716NPHCdg2Z7
	n4EO0iSkIhJw+5lP7uvPgmJ+h8Tu4JX4lTYGp5oeTfzBE0RHc3CQormRXxsvKy4K28LPNUt4oT7
	GpPlFM3OkqXQjhFG3OIIP7cDXlNVZ4fkAD5shXv+1yW0LzmX/HlWVLbC7V+tow8aSCBqYb2iqLq
	sdl2c7k6/f+mRNm1CEZqa+Peb33Ts=
X-Received: by 2002:a05:600c:4ec6:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4954d5c913dmr59504785e9.7.1784381931810;
        Sat, 18 Jul 2026 06:38:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v21 11/12] mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
Date: Sat, 18 Jul 2026 14:38:31 +0100
Message-ID: <20260718133838.152905-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
References: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Remove the hardcoded SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL constant
and replace it with a per-platform osel_tmpout field in both
renesas_sdhi_of_data and tmio_mmc_data. The field is propagated
during probe and consumed in renesas_sdhi_hs400_complete() and
renesas_sdhi_reset_hs400_mode() when setting or clearing the HS400EN
bit in TMPPORT2.

Set osel_tmpout = BIT(4) explicitly on of_data_rcar_gen3 and
of_data_rcar_gen3_no_sdh_fallback; platforms that omit it (such as
RZ/G2L and RZ/G3L) default to zero, leaving the OSEL bit untouched
during HS400 mode transitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * No change.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index e2c26917b884..7ed92229e937 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -41,6 +41,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d5d8afde9bfc..e44751647982 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -310,7 +310,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
@@ -457,7 +456,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -598,7 +597,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1198,6 +1197,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 893d9395e9d6..b1146dca94ca 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -130,6 +130,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 	.clk_div_mask	= GENMASK(7, 0),
 };
 
@@ -149,6 +150,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 	.clk_div_mask	= GENMASK(7, 0),
 };
 
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

