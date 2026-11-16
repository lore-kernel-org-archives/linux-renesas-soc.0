Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830542;
	b=ZN45BGkIFvA8YjEVAlZE0ocDVHeuvlWzff64pgzgUHcEjm798MOLhooNQz9+2lNNaKrm
	 9OmaDfoNgogEnsytZhtTDybCthkVs2gVVMpVlQW7k3nazyBmHbZ7a6+JcBOmUSxgNN7Iu
	 et6pjwWwyGwK+AzeJ6NAsoF3yHwLbPwjkAowqM1VLw3j3sHlInI/uHVfSYt+YTFdzi/4b
	 NvzPplPrhEgYAiINXLabnTjHmi7AL5Veua1pO8iG3UcH+qvzdWMVILh08qnzUPHc00F/g
	 LKp6C8fjbQav2ppTUCFGyeYnD2yiYLi8hbtC2tmHGPndSPovFLvBDVxOYAvbVSrLUlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
	b=CTUuEsWZnGpXJ935/kP1gezuhTvgln9y43O10yFx1h0NsDLmywX3H/FU0yX88/RVD08y
	 eyluOmlO5bw/ov2I6LBXzBeBeMcG91UJVR6sgjvdh/e97UQhUBERW704Yo0xf29Q9eA9h
	 O+0r+grbt0NZiYwgiovSYDw+LJ0Db/M/7FcV+zOWnQRS1R1Yt4jHTXxQFxBcCyug6VZAE
	 v6pd1Wvypvx3PYTyCqiOHdJF04H1koZAj0Mo7I9QH4DIbuiE5a02Slagx/fkWv7OBqwBw
	 yQiV33NWvnwmUE5cqYxWF4P6rAbwLNmhbY6b+PZGZlZrW+qxh5UoA5zRKr6jIzYqRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsYTPBFn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55F606A88D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 12:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD55F606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsYTPBFn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22335865e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 04:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830540; x=1795435340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
        b=nsYTPBFnByBvont31Bz/qtogyCLMB4xedKGIjxFDZj62qtJqvpqgL6Zx1PKwfIa5q7
         h5Y/O8duQjNutXxjb1+pyJPwpUDpy+pHcG681AQN9IpAFg4F7j0lH1fFpf0MX9mbsj06
         08T8t8weOGxNUjAvZfU+E5hBqxU28SHocKUr/hAP2U8e2afOh4qHpwqnYf4v5LdtFZaY
         99LURbf+nmkrJhTlNwT/QPiLywJ/y6/yHakTEPyEzyHNhp9ByCDDhvAFF5DX/G0kmDRl
         fBdIrw8bcXpcUpvSUctc8AU+6i+bMqe/fX8tf854Srk0rv90wv1gUg0wARmV7sgk6zF2
         gE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830540; x=1795435340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LcVzoQKL0bsokOHWsWsVAJ1s1LCZ3P+TDaOc2v7pus=;
        b=L558hnBaTrNUxRc28hYN7HxgWehnPqqZl/ja6DvwpQz58YTcWVrV09NyVJJU3496PC
         vssnTGGqcGIBsf29qdWHS3wHKEoaf7IDOW4216V2ZTDjUSCHZnKvQrDKDqMO48wC3DAI
         GMeQBS4jmxbPS+aP5S3ihVFfdy+oqYxY3m2xvmIeeKT3mMMfG08ilvKBuh8O7eiOGono
         medkcwaWEs5tOK3+DexHelF9KAGZL/RmLpk4O1lUpUkm7CLSoLceyDYzVR1PSblWQ0HT
         Wa6Z8q4dBlHZCVRdQNZNDnA8tnBDK57ERyeMYys+j9VrDrXwGvvQrZtAO3XuS1m2aEfx
         Y5EA==
X-Forwarded-Encrypted: i=1; AL+hErHCjKfgf+Po4n3IQxbIyOUfe8fr5rvgtIBmlImdTlaKAXLxaoKpkOIN3O3yWp85pxSv+fUvOM4fYrO3jUDhZ8v6WQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/U2mLpgK/U05+2CXu1T6i7W0IpQO0+ZyRBGWtFOTI7WHm4EIuI
	Rd8HTWn10sDZyuGGjOONNw+9KWLTEWQ0P9/NXuUg29HkQ0dK0H77JeRz
X-Gm-Gg: AYBFou3TyPR/g2JHAYgKAls3qfQIqu4z6bPAYDZK/GX/BS7ss1SG7eB4IqOGxywpZ42
	z03sW3nsEXl/HUuazsx8QM2OvSPaPs754b6AihGbZyTOazZfeYkYI+VrbZoqUkkGqc1smOUDFZF
	Y84nTJX7euFM2z2pEpWfT8bZOO6YM0FsaE2ct9HSvGIXWUzAuyUEUU8esvQ4b86yQMvYr5oZPzs
	r7IC4deCBlNc/Vuz8aJfG06JEIgq9fdwCe/Txde8FjSfplbdGBfq3BnsdpO9eJtnZ/sWJFL2wfI
	OBILmJyp5+uXcNl3Gt3NyymAY/bSR+zdsYrg8ALQ7DXbhwMHpZzlTyvDaoZR22M564WJEpgSJlh
	4ww6IA4kjU8wm6W2yK7hnQ3AfJHvyrnEslLthTO+OY95F/4bD7KfZOiFWMyBmmQ3FxVabeD/4oI
	J79wbjhtxKlWuPb8q550ieYE1gUIsxsE0taryo7XWsEwXvgqqFtkTSsJ4yasiceP7jqIMgwHK3F
	uwOBAfPjF2aX6zvukPmNywylT9O6nWCf1CTbtwFKaieDIv7DmvmPZfnYIkgfzAAUJYb5m4ho8sj
	KUS0XcoYHzrrPu9lDClDCuJVnimy+yBG/azUgAt4YZZWek0bB8ato/Tc9XaB9gGmKw==
X-Received: by 2002:a05:600c:524d:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb68b9f88bmr120047345e9.17.1794830540041;
        Mon, 16 Nov 2026 04:02:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm395562805e9.15.2026.11.16.04.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:02:19 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:02:17 +0000
Subject: [PATCH 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
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
Message-Id: <20261116-sdhi_hs400-v1-3-c5bedd312408@bp.renesas.com>
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830537; l=6088;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=oC8XI52dgMrks2U7cRSaACFaiml902PICrgQDRba1+M=;
 b=GK+gmQd3LyUWIDHhs3v3iW73j6qFhTUXBLJUZm5L2mmn2c79h0cFompgotfMRnTN0v5M8BwPE
 SwczoxErMSCC6cDGd2WDXbv+rIfvMNJFnvYy+hYI5krGOlFT9TFIf8j
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add HS400 support for the RZ/G3L SoC.

RZ/G3L needs a second HS400 enable register, SDm_SCC_HS400MODE2
(offset 0x020), alongside the existing TMPPORT2 path. Add a
TMIO_MMC_HS400MODE2 flag (bit 16) for controllers that need it.

RZ/G3L HS400 mode does not use internal divider and supports
only one divider value "0" in the SD_CLK_CTRL register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c          | 38 ++++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 ++-
 include/linux/platform_data/tmio.h            |  3 +++
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 7dfcf7f970aa..f15f766b7666 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -135,7 +135,8 @@ static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
 {
 	unsigned int freq = clk_get_rate(clk);
 
-	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
+	    host->mmc->ios.timing != MMC_TIMING_MMC_HS400)
 		freq /= 2;
 
 	return freq;
@@ -259,6 +260,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
+	/*
+	 * RZ/G3L SoC HS400 mode has only 1 divider value.
+	 * Other divider values are prohibited
+	 */
+	if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
+	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+		clk = 0;
+
 	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
@@ -315,6 +324,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -350,6 +360,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
+
+#define RZG2L_SDHI_SCC_TMPPORT2_TMPOUT		GENMASK(15, 0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -364,6 +377,18 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 	writel(val, priv->scc_ctl + (addr << host->bus_shift));
 }
 
+static void renesas_sdhi_set_tmpport(struct tmio_mmc_host *host, u32 tmpport)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 val = tmpport;
+
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		val |= sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2) &
+		       ~RZG2L_SDHI_SCC_TMPPORT2_TMPOUT;
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+}
+
 static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
 						 bool force_clear)
 {
@@ -374,12 +399,12 @@ static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host,
 		return;
 
 	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330 || force_clear) {
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+		renesas_sdhi_set_tmpport(host, 0x0);
 		if (hwadj2)
 			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2,
 				       RZG3L_SDHI_SCC_HWADJ2_3_3V);
 	} else {
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+		renesas_sdhi_set_tmpport(host, 0x1);
 		if (hwadj2)
 			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2,
 				       RZG3L_SDHI_SCC_HWADJ2_1_8V);
@@ -486,6 +511,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -623,6 +652,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 37eeaa52f011..d9b9f9663386 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -165,7 +165,8 @@ static const struct renesas_sdhi_of_data of_data_rzg3l = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
 			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
-			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ,
+			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ |
+			  TMIO_MMC_HS400MODE2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 501ca4355c34..81a37d6baefc 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -59,6 +59,9 @@
 /* Some controllers have hw adjustment delay */
 #define TMIO_MMC_HWADJ			BIT(15)
 
+/* Some controllers have HS400MODE2 */
+#define TMIO_MMC_HS400MODE2		BIT(16)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;

-- 
2.43.0

