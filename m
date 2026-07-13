Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB800351C3B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965134; cv=none; b=L+Xe5cVm0X3K9zwv256EEkWBwAt6RSkyYcw5ZhivudBCHD3eF2rqNh7/MIxmm9Y/uvYpMFkoT5fVyMCIQ4YGlb30+1UIZtzmUxbkwEZf2NwXUVJfT13Jm7uZIjpe4wP1c2ZdcMV7xmkDgy4i9bPV+hFooZaTDWc5N0UkZEPVEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965134; c=relaxed/simple;
	bh=/awFqf0/GhJNh2fHJY3cZfOES8ETe7vN5ppkmGvE60I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSMTXMc1bYq8pugvz3a1SWH58zx/AFnJkckcxLYx3bDK49MeVowand76qgx3l7CXfg4NJquk3oLo3F9gsK0HJPZ1zaklxy2BUBRgV+OobVxYVvUThZzXLwMr7krLsd0vMNzY59f7HCJs5mBSDdylcA+fJ+ctq6OGgtTqUa+vw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCu4Q6zn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCu4Q6zn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so136079f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965128; x=1784569928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBQmmGq/6npSHATny7uStpNW8aUMkBy9m+M7haOuQhM=;
        b=gCu4Q6zntf/BCNiFztyxUWXKVzEhXsA+ib+CdXieV5KbOO0XtnWkEPYZZv4zSooqvP
         k3yFwNj72HRxztnjgEQVuqpadCGhcH048fASoMBrUM4yVYArFT/4Hs0Ch7pKt18AHcKx
         qNeOZEQrXoOIJYsTnGOPOslRNTK9qlFEy8UqGRkyza4SIHUEPLJ7d9EIBVjQ28AjRGW1
         /kJ6NKpZN8NjzdjwtbsFsi15VPCJhi6YLwOQNBrA85X+Xe9IckYQxrkK1QVNfxNpPpib
         pqg449V0ivDIdXYA4WmD6oETj7n8RNUi7uVmwNOJO9zMBhC0ekiWrKwrj5o/QQRyx2dn
         q+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965128; x=1784569928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBQmmGq/6npSHATny7uStpNW8aUMkBy9m+M7haOuQhM=;
        b=sa+mzEO4LrgV2ef+iZuBmJrUyK4FHgSCrlKbP+8/Gn08sWusVEMqqGqzpEtdw6KW45
         USXStGyGI6p4cUymmmSUMdE0LxPTKn/6vYFv2FF7kVSb+1sWsuNhiJdxjeLuGzC1Lvvw
         BB5/EShCUrThvkYMfY4PPSXNI/IxB1Ikfvl3S5y5VZLEQKQEZ91AqVUz6TflZeiYqUcc
         B6KM787NmpkZBiLM56uIe147JBZxqOdii4vQt4JOKd/TXvAKFX+JQCQ6LbcDx1//4mR2
         2D8stPYT/MeyuEmfKcIj4C2QYCpVyFMphPkPYffD73pM0W+KfxcWrl7WI8fDz8D/EpIe
         R7Ew==
X-Forwarded-Encrypted: i=1; AHgh+RpNFFt/7Ner/C6sOytZuDNtYzLMRU3spUbPUd4LmTxzQX4IXehx/e6Jie/WHaAjB49W9E+bsNvVDbTsj0EHyZBYgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNwU4Wt+P8Qb4NV8e4XxgYdM2cKeuKGuggv2+tb2zqnC2k/Yk5
	EWjV3SttBOKOolnPg/NZoegrC3X+luipk2ZFIXRcExJiN3Z5qvHVozea
X-Gm-Gg: AfdE7cnKvnb+9ebEfEufeJoV4ZESudEoSZLCdYLbuN39aXjm5zGOCl/lAjG/gVuro/u
	lYItvRvQ9iNUx6TpEpUuCdM3BS1IubDUTD7aLyzuAdOhO8Qd1mRjHz0qozaHnz/2k2Wd/gN6O/Z
	3+yhmx236kZ8pmalt5Dljr2J5a9dWQlM5+H+vSTcj+rta2eLkTPHq74cbpMlHDn1NVvRq//gs5T
	3k5Ofl/uT807KkzYuHXsZVlLSX3+OA0Uy8lVlAcrS+VIp0I2D4ATYzgbd1zzZPnopGhVGIDWViP
	eENuSTd3nQtFnwwfuXooN3z90K5hoEd4c31hk7JOtr6uOQYU/hRmDuO/Ww4eIh7gee5xYhr6MED
	bmpaYaDKreO6JqpWeJvoNx3C1Wlx9tYsespi86pgxAqmQUaqktL3EZSPgbW5MAojU0PIplU4BlU
	AKBjiCuEAnnp/6NWdsllGs1iRsgGIIjttZCOFgN7SGzR4Cwcv1
X-Received: by 2002:a05:6000:290f:b0:479:e2ea:3d51 with SMTP id ffacd0b85a97d-47f2dce228amr11979954f8f.17.1783965127920;
        Mon, 13 Jul 2026 10:52:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:07 -0700 (PDT)
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
Subject: [PATCH v20 06/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
Date: Mon, 13 Jul 2026 18:51:47 +0100
Message-ID: <20260713175159.138334-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC integrates a fixed internal /2 clock divider that is
active across all bus timing modes except for HS400.

Introduce a new feature flag, TMIO_MMC_INTERNAL_DIVIDER (bit 14),
inside the TMIO platform headers to mark hardware profiles carrying
this integrated divider scheme.

Modify renesas_sdhi_clk_update() to inspect this flag when setting
and reporting clock rates. When the flag is set, the function
bypasses the standard base division logic via a modified clkh_shift
adjustment, then factors the physical /2 division step directly into
the final calculated frequency value, provided the current bus
timing is not MMC_TIMING_MMC_HS400.

As no existing platforms configure this newly introduced bitmask
flag, this patch delivers the underlying operational infrastructure
with zero functional impact on existing supported chip variants.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400mode
   and nonHS400mode(uses 1/2 internal divider).
v18:
 * New patch using flag.
---
 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++--
 include/linux/platform_data/tmio.h   |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 569009ff4c52..d3f6d459fdc7 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -184,10 +184,19 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+			clkh_shift = 1;
+
 		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+	}
+
+	freq = clk_get_rate(priv->clk);
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
+	    host->mmc->ios.timing != MMC_TIMING_MMC_HS400)
+		freq /= 2;
 
-	return clk_get_rate(priv->clk);
+	return freq;
 }
 
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 868a21842fa5..6c512e96e192 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -53,6 +53,9 @@
 /* Some controllers have tuning delay */
 #define TMIO_MMC_TUNING_DELAY		BIT(13)
 
+/* Some controllers have internal divider */
+#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0

