Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18DF419FC5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411134; cv=none; b=m1YOcLKZZI+fmdDbMDn3H5ZviHLb9ZytO6+hKLF7J2osbAdtMz+99HKlFvvNsCuf2kaD6BCXqJcP1B5e2oY5a+iYTEY+ed7zkMOIng566ZpOwaOiwcrVFlUkNE86fIgqpMXLPv0ZQSDEV2KrHpyFJ0s/21ftHJHqJxYPvTqJ/34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411134; c=relaxed/simple;
	bh=csQwLQjbHc2hh04f2jellNKXnCgTGkiOlCPwHJTkLXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPv6Xs1+YTlRiEMOdVzGFi7k/mqzUr3qQOgpCihP7E3pyLZGqeOiV+cOqM+nuQKeFKdzy+97W3A7inlwccmP+FA/eYOOncEhzI16vsBieLfTrPmOo2XzL/IWcGJe9Z+lU/4KU2Os+EiwRie6MifMNaFHLrQ7f2mlSPkXF6hW3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgjOFwpO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgjOFwpO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1759959f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411130; x=1786015930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUT0miI99zaqej8fJsBWyT/YxX6l62nZHW3oXRHkd+k=;
        b=MgjOFwpOYz/mtu/O4jlpvw6tnjLoZbSlY0w9dq/qOjVJ5Z+HRY9p70oBHJmYskgCF5
         EoXAzu9GyKy0DLljji8w56uOuzDP4wrUvfi+iPShsQNNNv/nd7ggembCVffL7OIxKETC
         wSNkZpQCEvgYDoWbQOe7HLFsp7UiwVUeCRCHrvnF2dtJxCL/kOsEInvVIPPYHthdpxdL
         rjzp+D5/8bZtkt3kXUhD1oYt6XVnxh77vF5LWVZ02/38IEtOj7UfXFEDhJ5VyfUVr640
         9iPOcV7AKBllMZeoi0mpsu7gUZj7veeDQVHKNSy20huSBjCInsuwCvnPSw71r5M8emo+
         x14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411130; x=1786015930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUT0miI99zaqej8fJsBWyT/YxX6l62nZHW3oXRHkd+k=;
        b=h9ZNtQ1kRigxDmC4wYi3KgTauB6dBXdAgSdXhDBPc5ZnWlA4A3Wgx0I54m0hE1aebD
         wxwC0bx6y7ZrficFPBxkFGxEHTjD2jeG5axBbKnc6A+9LY4kpVAd7gEBZ+GUanEwcJ6P
         D0zS8Ew4PS967YXJqjp5w4WrjvnGy76D0ajeIvnKV24o7mHso62++KE6P22iNP2Mb7aL
         OOGGVKjy2GSs2oLW+xDR5khwjY21CP78cNIroeRmZU0Siop7fhCXfZpY3knsY16Mv0Ws
         kPc2YDS+iG/UIsYjimlSmreETvmR1LvZmdhS+iuCeh8r7K0m3mFM1ycmquSLZBt4bI+U
         0u0A==
X-Forwarded-Encrypted: i=1; AHgh+RqMJrhUufQAhzAirrdIq7rRKTpbd2N1OlDDVuDivU5O9tIc7a2YZcCWZKZ15bhPZWkEhlLKm0toobz9jInXlkYQIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygCijLF2nXXch0p9Fhl3wH1db9O10Ym9tzUIIOD8jLbNaL6kus
	Eqc0gUVnqhgwhqGoMhpVxJ0DOHG0WxHKwhiLEs0J/V3cZ6NugXA5mxVf
X-Gm-Gg: AR+sD11WW91Mo7UWCHKWC6LEPXe21HpF9VbQQxMRf7NbSBPmmvtsd7Q5luGnXXWHSGg
	jSfzv7fdhR+MT1EwQ3XBwS0PFwY1X6ktLswnc0yszcEReUQA5ty5W8acsfceAJ11Xf70lbAOz4N
	mouR6OC9MQ/qGQBWdivul1bF8FuxPZxuLFE/dQcQvdkyPAFsSWaK5Zd32/sW4a8x/mtRBuMckxI
	vDo1dM8karO5v54baA+pDhYPH+LEr8ed2fC06+jnu5Tg3JQxl+BTdqZpexZt9pcfAZPENO1Rirc
	KrFP0aLYRM1xvvSEVqM0SyvSNFB0VzraMmv3EUbEjPygSbmsAaakcyl96YhECeumJuZcYFWVU9u
	T38OziE0vuwQMkZFodNGBFlvznKp6acx6S/iREObUoFAtY/lURRFEdB00S13AeYTKSyAiVDobHz
	LkI0KXzf0oLt73qeamo3ZO/iLjcouSIzVjHD7ze7ATf95WSS1fSMXP/vrIt5QCY7mnjE2cAZL1I
	V28xKqBksdCglU=
X-Received: by 2002:a05:6000:260b:b0:47f:8c73:aa7c with SMTP id ffacd0b85a97d-47fc842cd50mr2747220f8f.52.1785411129960;
        Thu, 30 Jul 2026 04:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:09 -0700 (PDT)
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
Subject: [PATCH v23 06/14] mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
Date: Thu, 30 Jul 2026 12:31:44 +0100
Message-ID: <20260730113200.36456-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L and later SoCs need a hardware adjustment delay written to
SCC_TMPPORT2 on signal-voltage switch during tuning: 0x1 for 1.8V,
0x0 for 3.3V.

Add a TMIO_MMC_TUNING_DELAY flag and
renesas_sdhi_set_hw_adjustment_delay(), called from
renesas_sdhi_start_signal_voltage_switch() after the regulator is
set, and reset SCC_TMPPORT2 to 0 at the start of
renesas_sdhi_execute_tuning() when the flag is set and tap_num == 8.

Add a dedicated of_data_rz_g2l descriptor with this flag and switch
of_rzg2l_compatible to use it instead of the generic R-Car Gen3
descriptor.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v22->v23:
 * No change.
v21->v22:
 * Updated commit description.
 * Added a renesas_sdhi_set_hw_adjustment_delay() call to
   renesas_sdhi_init_tuning().
v20->v21:
 * Added clk_div_mask to RZ/G2L of_data.
v19->v20:
 * No change.
v18->v19:
 * No change.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 88 ++++++++++++-------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 22 ++++-
 include/linux/platform_data/tmio.h            |  3 +
 3 files changed, 78 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5dcbb431e1e1..a0922bc9d4a5 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -256,40 +256,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 		 TMIO_STAT_DAT0);
 }
 
-static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
-						    struct mmc_ios *ios)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	struct renesas_sdhi *priv = host_to_priv(host);
-	struct pinctrl_state *pin_state;
-	int ret;
-
-	switch (ios->signal_voltage) {
-	case MMC_SIGNAL_VOLTAGE_330:
-		pin_state = priv->pins_default;
-		break;
-	case MMC_SIGNAL_VOLTAGE_180:
-		pin_state = priv->pins_uhs;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/*
-	 * If anything is missing, assume signal voltage is fixed at
-	 * 3.3V and succeed/fail accordingly.
-	 */
-	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
-		return ios->signal_voltage ==
-			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
-
-	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
-	if (ret < 0)
-		return ret;
-
-	return pinctrl_select_state(priv->pinctrl, pin_state);
-}
-
 /* SCC registers */
 #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
 #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
@@ -350,6 +316,55 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 	writel(val, priv->scc_ctl + (addr << host->bus_shift));
 }
 
+static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	if (!(host->pdata->flags & TMIO_MMC_TUNING_DELAY))
+		return;
+
+	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+	else
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+}
+
+static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
+						    struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct pinctrl_state *pin_state;
+	int ret;
+
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		pin_state = priv->pins_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		pin_state = priv->pins_uhs;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If anything is missing, assume signal voltage is fixed at
+	 * 3.3V and succeed/fail accordingly.
+	 */
+	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
+		return ios->signal_voltage ==
+			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
+
+	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
+	if (ret < 0)
+		return ret;
+
+	renesas_sdhi_set_hw_adjustment_delay(host);
+
+	return pinctrl_select_state(priv->pinctrl, pin_state);
+}
+
 static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv;
@@ -377,6 +392,8 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	renesas_sdhi_set_hw_adjustment_delay(host);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -709,6 +726,9 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
+	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0);
+
 	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
 			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 9bf7aa9bd867..1799c6106102 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -145,6 +145,26 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.clk_div_mask	= GENMASK(7, 0),
 };
 
+static const struct renesas_sdhi_of_data of_data_rz_g2l = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.max_segs	= 1,
+	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
+};
+
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
 	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
 	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
@@ -266,7 +286,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
-	.of_data = &of_data_rcar_gen3,
+	.of_data = &of_data_rz_g2l,
 	.quirks = &sdhi_quirks_rzg2l,
 };
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index e4232934c7fe..abf4134a8bd8 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -50,6 +50,9 @@
 /* Some controllers have a 64-bit wide data port register */
 #define TMIO_MMC_64BIT_DATA_PORT	BIT(12)
 
+/* Some controllers have tuning delay */
+#define TMIO_MMC_TUNING_DELAY		BIT(13)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0

