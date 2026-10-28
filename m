Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191888;
	b=ZlQaGHvrvrFva+BOpQsMSCIThhl+nrLREKRoEodfIdF4TS3OilGYx/8d82W+RAGEV1hv
	 eMqxQPQCbaUR+AHbMjXjJjeXgIUVC/Wh0liHVWJ9P3nPCrHNYWUg92EUILvojBh8/1/d4
	 8Wiyc0t3lpCdtwFSBXA1yFdhl+0dNovF2b4Yq1d4qWb47KFfCYtmWtn/jNlPD9R6GamSj
	 /e26NhM42LWYM7E60PouFGJw2id8hGrsPb9uro8MMPi98tduIYwLjkPBx873/RvMnZiLZ
	 rDWC+YVKN71ehGZ8ZBq8Dci/i6X0rgTYdEDl3EHkQbc0sTcIC3yCp4UwL5l64xaDuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
	b=GiXjPpGtlnpMaQxfFHm1da2By5ALxES0zUSU2UUKEnycNQhhlF+dnifvjmNzMcr5ddHF
	 alZBPlYPwmQy2+RgXR66AJvBYYidaUWFEKnbwsYpCUtqk3NorHD7+VGOx0YrOn9X/+mKj
	 GJpytrdhOau84BgaHaWF3eZMVooWg+dMzAxYhzt70Hgvvt+2slZJOYTe0/ELcSLPOgwp/
	 i9mrejPiuikjn6O1XmtcBWCXmq1xts9D26IDHkCyrGg1G4s19JBP3muySJGAIG34Ayoq9
	 Xno/dfagOdqZZDBEjXvaZs/NQWUZ/j+rauSS120VzlNqClOJb7ZijTiZdh5xVIySMhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290660A3819
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7290660A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so582672f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191887; x=1793796687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=IL5UIErKM/lQd2sgYQ2SdH52+xW3kobCm/N5cfmX8+XFWTpGyNGeyInMxwRTROHizD
         +LmDPGH+yYW3cbybhD5OXjHLQ5654K7wq4UnlxiGGguPcQzwLfzJ9XZmEy/SgXFqGzB6
         V/Tn+YyMszstLGt+CgxuFIYkARQ8jTOp7AoiaA/VJ0d8aRkv/CewP1QWQaiocjc0uPXw
         9/FuR2rwQZrJeP5VLVWbL1K1ss6AhGFIdk4MwnMclfFt6z7X5+uu51UbrTdOYxP3VMWl
         6Ck1wPeLEoE9tAOIFZXsFNfEL3CCZP2dzPvMLTZ+4KFSG648YonOB1S7lM07aaZtsb9M
         MQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191887; x=1793796687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=baiRRMKEgYSeouHt8A4val5AzdSHLmjmWCp3E6MQDbRaeIXH3llYGrgO6GYDMcfUI9
         8HH77admOPP7SwRDka3MZkK3E8/3JuBdG+cyIKWqtkIBHy31zRt6nGI8c4Rc0/czp5nn
         jbqKhnd6f8LS0jgfRT87U2toYmlLudiUCRRuhnEiiGi3HOkYbKO7ctyJF1nqOK3wdtvs
         W+kxYnkXSVPrlzaOVW35+Z8sVid9Z3pUCyRIimbkkab8ItZCfi+iqn4Pp8qN6c1TvxJQ
         RAWPUvWPmoFPJk9j0f+SdL5tSkwp/wBiyQ9cZnL/2uZQFKl9lGbdHbZmXLuTculB1src
         P1bA==
X-Forwarded-Encrypted: i=1; AKwUvBzL0absQSQ/bB5iCWoXrI6fyAX/p3Tz9bYR8NUodiG+RjnvCjk5c3EFCOZixGj9ry0YuEL0Jn2kWtOxNdQSOw3fQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Jh2SQHrE0v5M1oXSQV0sk2bYXbSqXP6V1pldgz7w1pnN0wgk
	+zOKayA1dZopo4U1dGb/qnqx+WIBK7Z554d9eBrIWiBfZaMbBPqhX9bD
X-Gm-Gg: AYBFou38gLf4zsCTXVYoeMF6L/BI6oymYiNin7pHnXmo6lSrzXPYSRuIviGcb+xLYQI
	3vpMkAYMg1boNstS2Zyyg2Zc0t/EoRlXscbPAPcTgQxN4GILneywbuxHEzrsJp8edDk6qPBkTik
	yOiHr3g6b5m/Z6aEnLzT67Di35fUDthGEhQTTLYnCps6ndNK4bqcUonb8GVwWnprYekIlOrKisD
	/O2yNjpeZdQmgarYrc1NApldALl8+10k1SGb340VfUQnA5hJQYi8/P049v1FOugVqsMoOcG66p8
	WNw50hyIBK8IzMYUbP6oRJGJNnuwIGS8hjZqZiW/7Cp6vIzxl2Wlb9CcuEUMNZU3cOIRYFgYRLW
	/sgLnKdG/kKRrzQnYGM4YzIBCTdqv5JVfry6fMeth3jmaGcGlqU5Gu2WbRPfBg1TTih/HP5PwKE
	g7MZplwQe5rPLz7yp9naSiDEQgWzQan7pflj6GStwlCJSy9sqxO5XoO8ARJqKjgPbeanGpr640M
	AByzgGs5DCMDNhGMxl3QmuneMjjdE/9AdFosl9PuSf/60RPnPeQQobVa+CYSdOX2jcLYY03U/xL
	6CWZINJ2ZPwCsG9bNghlA3LfVS2/+9w19n9Z2jzplNgZali7DZ3v7Y272YfL2EjGCRA=
X-Received: by 2002:a5d:6108:0:b0:48c:54c0:4cf3 with SMTP id ffacd0b85a97d-48e5d5c8a50mr4188115f8f.28.1793191886781;
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:23 +0000
Subject: [PATCH v25 06/11] mmc: renesas_sdhi: Make clock divider mask
 configurable
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
Message-Id: <20261028-rzg3l_sdhi-v25-6-57f16691c2ed@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3021;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NV58WXFwlSqcA9STMr65g+9y2UmbhN8wHlp/bQXqlI8=;
 b=FR2J1qyfFrzrgjVYnS/CxYTKleL8E1J0oQGmZDc04CvBxDWktJydaSolk8scnDIcqQxcb3Yal
 KO7o8AgRAAuBRXyD4RqEUz6n9Y/9DR4oqlfJLHXheOLgl3uIBuLrDVS
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a clk_div_mask field to renesas_sdhi_of_data and tmio_mmc_data
so each SoC can specify its own divider mask instead of the
hardcoded CLK_CTL_DIV_MASK used in renesas_sdhi_set_clock().

Default to CLK_CTL_DIV_MASK at probe time when unset.
This lets RZ/G3L, which has a wider divider field, reuse the same
clock-setting code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit description
 * Dropped initializing clk_div_mask as it use default value.
v23->v24:
 * Updated commit description.
 * Replaced  GENMASK(7, 0) with CLK_CTL_DIV_MASK.
v22->v23:
 * Assigned of_data->clk_div_mask in renesas_sdhi_probe().
v21->v22:
 * Updated commit description.
 * Added clk_div_mask to of_default_cfg and of_rcar_gen2_compatible.
v21:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 include/linux/platform_data/tmio.h   | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b759376103d7..3c991f6b988b 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u16 clk_div_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 500ecc357095..86778d83eb7d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -232,7 +232,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
-	clock = clk & CLK_CTL_DIV_MASK;
+	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
@@ -1146,6 +1146,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
+		mmc_data->clk_div_mask = of_data->clk_div_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1194,6 +1195,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->max_divider)
 		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
 
+	if (!mmc_data->clk_div_mask)
+		mmc_data->clk_div_mask = CLK_CTL_DIV_MASK;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 27ea21c00419..f684f4087a8f 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -63,5 +63,6 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

