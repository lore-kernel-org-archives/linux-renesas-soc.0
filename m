Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EEF3C5845
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625367; cv=none; b=aXqMYOoNjG6jyOc/F0EB1gQt2VeR/U6BTTbVAKX4z5zfLSglsWjUrUllYLkKLwGgpOEast+u6V7oBw2aVYUcx+o7IwW27YRDslDbT2jDLLQTL6PfBp+nEG805i2kJ+yQOMpMGjahACMpa0EaWHeC8YyGvyRKVx8OiqVmWmB/dwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625367; c=relaxed/simple;
	bh=1cxAkR9yAtlC5mHwqUD2EvA18orjnTNpVK97GJp9P1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/NSk2QRFImLnM39IVQBaRrbWog/EFtssutY1jcZ6w1i/i4qhqUomsNPzwEo2HnlRUi6/Iw42kuLPVC9ikNi0frkddDPnV1NpcIv8LMSEMtgu8eudDusJfYcA4am0OFFfi2U61f3n/P4ZqEvspTeK2HagaNl6yd0RmoB5fPUir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZyCRx8l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZyCRx8l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so1258895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625364; x=1784230164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G47nT6mkH5AUFnhHVR2jv6VlllcNtsKYGuK3Pr8gb6Q=;
        b=dZyCRx8lHu5fsFjE7s33U1t/Yo+B9fLYvL6fObIism4IEUf3RA9F9Rso2ToyNyVb3G
         e7wylYj8DbMQxil8ljvg0niRLg/RZFcyhJ7YjGwJ5+XtiGhBpFDEDFZqle1mSKWmNUJ8
         RzSb1rNuTE5kbXgjseENID3btR3oUxsv3a0dB0EZnVXYy8LW0fBKAP1kv7xEP7A7/wU3
         ADBPWx4XBYU9BjHHRIPSQaYtfzGddBuVytm7BpMKO46xPDLIgelwVsgQkcB8lI70ju2G
         oIT8JJXZUoyq3OszJ0OAu98f1Et4uhiepRrTWEdS2Bw/z86wV4MV/sodagoLeGabQSOP
         A6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625364; x=1784230164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G47nT6mkH5AUFnhHVR2jv6VlllcNtsKYGuK3Pr8gb6Q=;
        b=Y9bNBz0LID2HHxyyr2gy+Urj8LnOUtkrnkoxbwIWlflvM3O9/K5cvq2APpVXJ7ml4m
         hS4f46A6TcuRcr+P/LmlUIcS804wwv0lInxnCy+v8WP9/WHX4VpLsqx3kP7w81GAdVy4
         Ep/LhpkqGwP4r3dswHFwearwe+5Uce03flu1fGFBtfwRdznYB7Lgt1KIsjG/uli4i0co
         2iIIASffJ2PB61qL3+Oax4a6/3sWuLAdFPEQ9amZDD5ocUNf3ZWvlIYMkI37owW+kuuI
         qx0vPK+56W4a1+s8dYEa24QHufO5eYoVGb6b8cJIgIYNsw1c2PD/zLjHeGp2E1TqR8j4
         9ENw==
X-Forwarded-Encrypted: i=1; AHgh+Rr02BHoNRb36HfPC8QHH+776WzKJs1LRZw2wH4fXj6DXTxWdMLqGnqJzG5k9MqYT6xo4yK5mmKdq6OMlsRGSWnGUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRVBUjQH2/qNcjebSRX6s2uvh0iatxB+0x7hLSRM1zST2EpKX
	YtchiB5EjwMklH28OLq695Ymp9GxbUGezYRFPsybXUVw/Fe/C5+u+XGZ
X-Gm-Gg: AfdE7clHWPuMsPX/qkuOv482zb4IUW3XTkwTnIZqp0Bms9AetjS0HJC/FIZU2KS0fzT
	ctvuTW0rAisjoMtvd4ghbyYoXPC7VhSBetha77n4wJOje9V49iiqbw+PW4DjemfUb2gYD2fabYJ
	CtHTDBZewmubjtPpAfPc1HQS/E7nFWEXqDCf7y++RyNuGkQuZcSEceAB4SdsNbr8vpTb3cZJHNN
	HGlNKwTFFfeRlUiv8rAppO5U/6tj52BKNgyLSy3zd1bOlevg4//KgsabH5Sg6QLR6VEI9mBSR5k
	Oj8/yi1XzMOuRhgojjxLlumpgPXT3KJYAq0fEtdprrkdbxEw7ie3ckFdxrWM2jfRmPdOHYH3xd9
	QBaHPw0AXttzQX50kapYBt2JTo0r7AmSTah29RawoCHt2B7oPGLSwycoR/zv2RAqscgtEQKM48f
	62bZWSHEIZ1bAlGG0Jvgs7UfrYQHZGMPA=
X-Received: by 2002:a05:600c:6211:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493f2b3fee9mr4076435e9.14.1783625363592;
        Thu, 09 Jul 2026 12:29:23 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:23 -0700 (PDT)
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
Subject: [PATCH v19 06/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
Date: Thu,  9 Jul 2026 20:29:03 +0100
Message-ID: <20260709192916.630794-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
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
index 832a7a7be725..b6bba03316fe 100644
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

