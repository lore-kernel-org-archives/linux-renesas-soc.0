Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F439021A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819442; cv=none; b=NexI7y2CrkvdxXqy87j14mHBQDQOVDgMDCD1NwUmYpAHWWmc9ZoIvNOUb7E2NMibIvYIBzgPqKRZhHaD3ZmYowN1kXF04FAS+aeCgJgd8AXSyvNt4RTwigm8BoKnORLI6NjAXo3BYqcppcXAzQU8bHCnzOZRzzb7j4tma+ICqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819442; c=relaxed/simple;
	bh=uGfUbasJte88SKOBHsmKAFrdFbgwKTaL8EvAsqGzvq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1n25wRHPgSQGGwlC/ww/2DSKrX94ukrYVPiBb4Y+fpNk/sqfeqrblEVO8EZi++pB8dzRWao6BZA/5UNGia5tYRcucZ6wV+5d/wqAztWrr9t4mBvParzRCjdaQ4R6kZGcVzj6xZkGTb4DxK/RfFuyTlHkg6JV2PE4XFvxGPeSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKzwC4k+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKzwC4k+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5441285e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784819431; x=1785424231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6t3la3ocUwfaicbaizR3LtVSlDXzWQzWGmOIxs0p3z0=;
        b=UKzwC4k+amViERgo146Sh5r/aBUAhYnBR73eZtiqaqejPXnuFD/iH9SPs8/ZL/hSGc
         WnR78OFv6MlUwF568vsdAhPmuHJIF2MQ+cjBuKia70AT4nThctGRvVTfo+E2x8UOTnmq
         yiBXzbwotEmPTN4/LMyf43Gi242wiVyhSvRTnoh2BzBofYp+FbMbDehyMaqFv/XP14sA
         kTWHV2v29SapzYZXed5bf9bCgdUTzWRTCKvngs+P5UI3qZ/rptJBzVfu1joL9oNK6kvI
         keWsrkyIYMjoqS8nU+7FHyiEn8K2+qdN5k9ZJVT8/i8drNZpWlkee20cptlrBLfVHgd1
         sitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819431; x=1785424231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6t3la3ocUwfaicbaizR3LtVSlDXzWQzWGmOIxs0p3z0=;
        b=sSO29y2mxrrnQmNfJJKCPt/jPUBrtIYQCNI0HvMNd1c3h/GmzjxvEk7GVXjdoPgolJ
         ziYjC6p8fnPPd2aDsAdztIgd74cjoGOSY1xhGgux6HOFcZUp7c8x9MhxqDEts4y7Zg3a
         1J8HZfwZ+mKjL8xwD7Ze3HRXwd7Yw3BvkmsAblCYhQuaExSE7CtHzYAa9tlgLzqAkxOJ
         KGNQjpVaZA+u73GOs6u3un+RUaLyDmmVH2cBD1XjDT565jeRic08ZOVynbcfkCnGrZQl
         TAGvz4fxtMK/BIkf/8y16gSqUnNOcBh+IjEt9cb7g2cn6FMLnOj4No4pFH8Lf7dqIzgM
         sYuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcsnRCHfF2kGTABZL543oPcaFk+Z/QTLkjlKG64+6tNIfjitlD7NSa7znySehRIW/YXBEP0KcjKagE7EUCnBjxuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//ALDOWz4vMHgiEcJAwe3cAVxWPGz3arU0rHT1MAVPXQQ69OD
	sKFlKhiU94ruXUA9aHg4GlFxMaFo5/fUkDPQAjfoZ957gC44t4WUilUu
X-Gm-Gg: AR+sD13y07PWSWsJRYYHn0vAY2oDkI2d739eK0T5H9ToXQ2LAEgt4SShCylW43ELID0
	dY11oTW3KzwDncvyPk8ie4AZwYuCsFws7Bk0P7AUi9WMv9r4KTN5DJPpAij/FRZeZtJiBAe30g6
	H2TPo6ghczeESH4XngSG3n3wFTiH84A+sayquYbBQFta3qyuvhDU+apzqwrN2ht/rIT4v/+1540
	yvQCVXkPce1xHa76oty3dVBznY9eRATbuRZPLzb546nwd8rXUW6hmuFtQ1oxuniVICTm/5ws3lV
	DqNIillvUPNDoritew+q6MplNNtndWwocND98j97ZRb7tgtiZgy0GMGi2QZC17Hz3CmwkdFwG/C
	Zb265URav7iGi+FbaBcQ44TF4vkaQxBgpsEtvUB6QAbNp5n+ByEKu9jauBlLepxJUAfdWnhmUpz
	xcM+HJP3AkY9qWFmPiAzQyKwVdLuI=
X-Received: by 2002:a05:6000:2993:20b0:47f:52e9:3716 with SMTP id ffacd0b85a97d-47f8dcae427mr3614005f8f.44.1784819430820;
        Thu, 23 Jul 2026 08:10:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb81dcsm15886823f8f.12.2026.07.23.08.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:10:30 -0700 (PDT)
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
Subject: [PATCH v22 04/13] mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock ranges
Date: Thu, 23 Jul 2026 16:10:08 +0100
Message-ID: <20260723151024.318918-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
References: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L supports a wider clock divider range than the hardcoded 512
used by existing SoCs. Add a max_divider field to
renesas_sdhi_of_data and tmio_mmc_data, and use it in
renesas_sdhi_clk_enable(), renesas_sdhi_clk_update(), and
renesas_sdhi_set_clock() instead of the fixed value.

Default to SDHI_MAX_DIVIDER_DEFAULT (512) at probe time when
platform data doesn't set it, and populate all existing internal/
sys DMAC of_data tables with this default to keep current SoCs
unaffected. This paves the way for RZ/G3L's extended divider
support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v21->v22:
 * Updated comit description.
v20->v21:
 * No change.
v19->v20:
 * Replaced the check mmd->max_divider with mmc_data->max_divider and
   moved the code after assignment of variable mmd, this ensures
   assigning the default values for non-DT platforms and DT platforms with
   no device data.
v18->v19:
 * Fixed max-divider setting for non-DT platforms.
 * Replaced the magic number '9' with ilog2 function in
   renesas_sdhi_clk_enable().
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 12 ++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  4 ++++
 include/linux/platform_data/tmio.h            |  1 +
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index f926a36f213c..438b2a7afe76 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -23,6 +23,7 @@ struct renesas_sdhi_scc {
 
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080
+#define SDHI_MAX_DIVIDER_DEFAULT	512
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
@@ -39,6 +40,7 @@ struct renesas_sdhi_of_data {
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
 	u64 clk_mask;
+	unsigned int max_divider;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 604d886e483c..d893a263e770 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -117,7 +117,7 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	 * Minimum frequency is the minimum input clock frequency
 	 * divided by our maximum divider.
 	 */
-	mmc->f_min = max(clk_round_rate(priv->clk, 1) / 512, 1L);
+	mmc->f_min = max(clk_round_rate(priv->clk, 1) / host->pdata->max_divider, 1L);
 
 	/* enable 16bit data access on SDBUF as default */
 	renesas_sdhi_sdbuf_width(host, 16);
@@ -156,7 +156,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	/*
 	 * We want the bus clock to be as close as possible to, but no
 	 * greater than, new_clock.  As we can divide by 1 << i for
-	 * any i in [0, 9] we want the input clock to be as close as
+	 * any i in [0, {9,11}] we want the input clock to be as close as
 	 * possible, but no greater than, new_clock << i.
 	 *
 	 * Add an upper limit of 1/1024 rate higher to the clock rate to fix
@@ -165,7 +165,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * for 533.333333 MHz will selects a slower 400 MHz due to rounding
 	 * error (533333333 Hz / 4 * 4 = 533333332 Hz < 533333333 Hz)).
 	 */
-	for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
+	for (i = min(ilog2(host->pdata->max_divider), ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
 		freq = clk_round_rate(ref_clk, new_clock << i);
 		new_upper_limit = (new_clock << i) + ((new_clock << i) >> 10);
 		if (freq > new_upper_limit) {
@@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
-	clock = host->mmc->actual_clock / 512;
+	clock = host->mmc->actual_clock / host->pdata->max_divider;
 
 	/*
 	 * Add a margin of 1/1024 rate higher to the clock rate in order
@@ -1137,6 +1137,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_blk_count = of_data->max_blk_count;
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
+		mmc_data->max_divider = of_data->max_divider;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1182,6 +1183,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->clk_mask)
 		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
 
+	if (!mmc_data->max_divider)
+		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index c6db0418de15..2bf354331b2d 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -102,6 +102,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -120,6 +121,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -137,6 +139,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index fcd2edfa69db..bb66ff7de065 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -29,6 +29,7 @@
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -38,6 +39,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -46,6 +48,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 /* Definitions for sampling clocks */
@@ -74,6 +77,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.taps_num	= ARRAY_SIZE(rcar_gen2_scc_taps),
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 76056d49f5e0..27ea21c00419 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -62,5 +62,6 @@ struct tmio_mmc_data {
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
 	u64				clk_mask;
+	unsigned int			max_divider;
 };
 #endif
-- 
2.43.0

