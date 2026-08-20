Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB588489867
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246242; cv=none; b=S4GcGjeF6fBVEw3R4/2FHB008Y9nPH4IgW0DFSRtF75s1fFpRd5wZ/i8P5EzsSe6QIkUTy+4VL3U0i6866sTwyVQbkb0MqjY5lFzC8RyCbtMsXZ+3he0bFmvxCmPpnEHi50XM9ASDyQEr6UrI9IldwL7bY5qcaoO9KrB7e+FbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246242; c=relaxed/simple;
	bh=U54RaZKAqZC8aHk39WCNLShm7fi09cuGQeTreWgZzWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iR7fGzRjcUvxydqjn22Cw1NRxV8YWGGYnYR2lT9cRxm5PBIRnKlvfcGxUusII+d4oVT9js1TWhVWhv1D3p1FQnJb0/odB8byQQMScnSQpBhLAF5XBoNN2HPxyV/+mpd7BXX2obqgeWRXCFLbVBjRpDOJAYUBCDx5Kf0Kh/DB3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i353f/V/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i353f/V/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b966dd74so348905e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246234; x=1787851034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T1NM5S7Ehgk9tTC+v8Mhk7l+caWHzRm98uhzY5VU74=;
        b=i353f/V/PdqCyGaw0VKaNckThx5pfVvumWyiE59Ogtjv9jOjszz6V5X03rHISkhKHB
         WmyqEkw3rmdDQNyQFm5kXyt7kLgfVzAiskHWBd7DcaRlOlkpWaklFjOnCXxOn3bGNbKM
         8nT5jG7OQleWR0bUtSZAnM5v2nj2Y8NOCNBcj4b8PnkvVSH/UVp0NJkYOCN5rHWBfnhT
         GtInx3KA2vVlrH8BSjyLoBmcAGlTDIk2JBR0l+Rvum7T65HZJARDuto4i7tDhbaayYYL
         cPo2NJMWX3t7P4l60MCjiIdXrs0zY3bIDMYauqxz4EmKRJdL+BZuXdBxbuVWwNtwsFB6
         +k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246234; x=1787851034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T1NM5S7Ehgk9tTC+v8Mhk7l+caWHzRm98uhzY5VU74=;
        b=K2cN+8jlZBpSl/ZEWWCiCpiHML2goNwNygg65hiVnqlatYrji+bqpCEKmGo7fDw/1g
         qeoXJ1WwCB10nOBixXbuC/NJyk0Qcw7rADGy/lkruuCAwgw3PwZbpV+JGcZnQF6iTa5N
         8OIoKIhdTDfeTmXy/mAt1jljYeCTgw0N4rXc1P2oAe28ZseXAkGugTm/v8kltRbKdGHC
         g1RTOTumXvduOVsvMzi8uF1rJT04QWCBoDXYc/CIudoihMUPaQPtQZd1gd5VxlnhZfp0
         NZGyYZrZkqAT0KBn8E/nw58jYxqvfFW7Wa4nx4IU2C8he8saDX2nY35tP1CmdqiSEgsR
         qzPg==
X-Forwarded-Encrypted: i=1; AHgh+RoFyfGltNiHK2qw0k1oR4YlK9zRv/n0nWZkGSGQxj7tCoEbyAeMWXBDVve80rDr+cMRDj5YaYb1m8lEAmc7q81vfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxE/AlAC+pGpq2Pi3J56BcTVUgMvuPRZC2XJgbiBQokb03uxSo
	+dKboRpSA7gJyqXAHbRoxh8SAC1te6KoiBW35oPBjkCRFW7We0PDDtr3
X-Gm-Gg: AR+sD10HFSlKMpdVBobfqtZp0lSuqMbRnEEJo5N+a4+HLXU+oMYpPUdF8wOvW0Fk4N8
	rOOP43lxkUyPml964SgaoZ2KxT9mdASfQVGiYNSGBG8XQ8HXSRn+BcdQ4Vqi8kHIpbpLhD4/DPB
	B+YWg7ACBhMDGxqSDCTr6x/+Ou4XnOri/kze7apM+kAxgRItasVnd9DuZvpp90SvjgcE9B2iQmI
	7ZuE1T60D8aYqUDVUD9DMWGVZ2qPwKJWamE9oxaqvS7dLwFMSh30Wzhjl590+LHiungF0oUsnTO
	dImDn0Owu5+zRb3OPvq7sfD0p4m4MRtlyihrUU6S1u93xaKH19V9Zmthomy/nYqyEBYgrPGfP/T
	UEINGMo2A8SPW3pu2a6bXajAsimkn49becntrqrDVngPIczPvsknFUJSX3shXQLoLEvgnNK9Ip8
	rztfWHGOiYekmNPyEt78vGGRgnWJQBr4vzBLcRc7wAhbdpU4AxP7fW3nYAqTxHE9k5/FjU
X-Received: by 2002:a05:600c:3486:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-499b828e031mr11322555e9.3.1787246233653;
        Thu, 20 Aug 2026 10:17:13 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:13 -0700 (PDT)
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
Subject: [PATCH v24 13/15] mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
Date: Thu, 20 Aug 2026 18:16:43 +0100
Message-ID: <20260820171657.62815-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
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
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
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
index dd650dd24b27..7c562074d119 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2f5e02537a94..23332539ac65 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -330,7 +330,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
@@ -478,7 +477,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -619,7 +618,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1228,6 +1227,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 3eccad143526..de570f7fc9c4 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -130,6 +130,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 	.clk_div_mask	= CLK_CTL_DIV_MASK,
 };
 
@@ -149,6 +150,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 	.clk_div_mask	= CLK_CTL_DIV_MASK,
 };
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index e2273a262a23..fecc61e082de 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,6 +72,7 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	int				max_divider;
+	u32				osel_tmpout;
 	u16				clk_div_mask;
 };
 #endif
-- 
2.43.0

