Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A6392C25
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381936; cv=none; b=azxgz+vgK15X0fCP/kkkjmbuuxE3qkpoeMtHxw7Kj4Yyg1kqpMGUfBG/f8gpHgHr6RCepPoWon2ro5qaZetaoWTosChnQ48H9iD+q/TNJXQV+YPUsyQPxpoWQU5FnU2409gtCcmpfaOKeUq9Rb1MWjcrWtnex1A+56QX2mxMkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381936; c=relaxed/simple;
	bh=r4OwAIC4pwtuAWoujK6KGRQbHrxuQ4AOKYTwXfLTIKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqBPBsPmG1Vi7eV1VVjgGNtAMYqp6bMr65CAwN5+AsAWJ4M/fOG6/y+e7maPnO5D5QgP8T6pD6u5/N0uVH/Ab8TQKQyVCbi8+g3uFzyOErgr/LQMy8Zasol40qWU51KTobHpHRWw/EJiNwZxwwr+VU0n6S5//XZn8zDxKtVdDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hy2KXPbW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hy2KXPbW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso21588835e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381933; x=1784986733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boJC/mFBlFSXo/jLmZqFUYkmGNz8ETJlTQzeYbwz3N0=;
        b=hy2KXPbWCeaPmD5+/UbX6tPcYrULwyvTEBQ2q/x4ormhw20A78llqBmfkWLyPTQPKL
         mhRTUKq2FCFk3JvaHgxnJB0nr/t56uHxK7r62xnOvu8S/Pj1Tb1WtnWGT5h1lK/MFfV7
         SA2OR5KQiPhfEGlDXyDK5nFLw3qi7W4hZ8Vh9OAJc2i5r6DksqxSej2dkcjm6bQc5E9I
         1DNPtVg7m/0vA0gq7XyFESVUZ+fKaCPtG2Dr8pEQQ7vYNVjQDobWW4prmtZblnE/jJM4
         uBuwBDcZgYTKv3jBVIZuBW7eeAvYg94HBipUaoMmAfrbuBTUJxClYUjhrytzIFMzdZ/c
         LQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381933; x=1784986733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=boJC/mFBlFSXo/jLmZqFUYkmGNz8ETJlTQzeYbwz3N0=;
        b=im5rhhWz3POGa7AJbo0y1pT6E0C1ke+lF6jJ8sfgl2KjWk4mAXGLStjqp/Xyg22fMp
         diXCcWIjEWO6C0WUEWidBDGvNByueYXgZhbvEZ8z7Kf4bKEnIPreAWy0KeKmjBrpaK/E
         +6DGrtMDU0Cmd8HREFtMo5cBHXGjfVi2HT3oPiQ6YfSm7iT7HqUaJBasjYEr6BXOL/jx
         QyajR2S8cP/aMRblj/LyVrxUcvSXotxUTktThooeGpCXdSS6OghqtHwo1JU5dwa8T8vZ
         AV3o/a5yKr9z5PkU720WSE4gDcheG1pJReJT9ShqGUI4oA5ppbtIz4leD30tTDAXDZX+
         7Pyw==
X-Forwarded-Encrypted: i=1; AHgh+RrGXl5GvD/A4eX41iMNZ4x0FOkfDRjVpJbB/mverg9UJnFliL1Jt4EWAcxvsjXlC5rZ/I48RrGeehe3Mh4nqpvFAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymtBM0LSpxzT8/be30ZxOwIm/UTJ1gsVLv1kF65A+CVQ3OWE2u
	7DvvRv5qaYI0+867+D5jNbNjO6gI8qJbKKP4bjZNb6SIxAJzwdnP/Lrx
X-Gm-Gg: AfdE7ck8CPKtM80XR9ApVyBRo9uKZOtNa48b0TcDsqwv8Gj1xTPqk8HzC2+9xKl7cAD
	5mJklxyyNCjSRVJrOWG+NpShrxGAqxZ3RjeShz5sJ/4IFjr0T2E/yFWOzFZOe4wQlmbGRmwyJU/
	VUp33NBOvCA+XBp727BFAxF0IuMNIqWqrJUMyWG0TMkSi3Bi8VyQdHFGcR6cBKMh80u1f5nHPxW
	1j5SoOHNYTWWWkO/TEtFj1+vCuhXYp4IopBNF5DWSSpnnKMizNnr2CBTn8htj4es9vGGx84uLVS
	hqJt99FZgXkcDjUa/s4TLCjCKrwdxCfpNhCoZcc3fVgcRl69ptwpNQuSWGgG2Pp0V9p79x/5PUZ
	kur5dikzzV4EEEKgTNeJWPqJnP5bwRxB2vFEcFKkoE6Ri1SHu+/JYNbBZ41/fvPl1wnr8o8d4H+
	ME4M66EtROq9J/h6EUysuoJaLIRNA=
X-Received: by 2002:a05:600c:63d4:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-4954a4136bcmr54059975e9.36.1784381932593;
        Sat, 18 Jul 2026 06:38:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:52 -0700 (PDT)
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
Subject: [PATCH v21 12/12] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Date: Sat, 18 Jul 2026 14:38:32 +0100
Message-ID: <20260718133838.152905-13-biju.das.jz@bp.renesas.com>
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

Add HS400 support for the RZ/G3L SoC.

The RZ/G3L requires a dedicated HS400 enable register (SDm_SCC_HS400MODE2
at offset 0x020) in addition to the existing TMPPORT2 path used by R-Car.
Introduce a TMIO_MMC_HS400MODE2 flag (bit 16) to identify controllers
that require this second register.

When this flag is set, renesas_sdhi_hs400_complete() additionally sets
HS400EN2 in HS400MODE2, and renesas_sdhi_reset_hs400_mode() clears it on
exit. During tuning, when both TMIO_MMC_TUNING_DELAY and
TMIO_MMC_HS400MODE2 are set, the lower 16 bits of TMPPORT2 (TMPOUT) are
masked off while preserving the upper bits, replacing the previous
unconditional write of zero.

Enable the TMIO_MMC_HS400MODE2 flag in of_data_rzg3l to complete HS400
support for the RZ/G3L SoC.

The RZ/G3L SoC also supports only a single clock divider value in HS400
mode; all other divider values are prohibited. Update
renesas_sdhi_set_clock() so that, for controllers using a non-default
max_divider, the divider is forced to this single allowed value whenever
the current timing mode is HS400.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v20->v21:
 * Updated renesas_sdhi_set_clock() for RZ/G3L HS400 clock handling as
   it supports only single clk divider value and other values are
   prohibited.
 * Updated commit description.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Fixed extra space in HS400MODE2 comment block.
 * Updated the comment HS400mode2->HS400MODE2.
 * Dropped the updation of clk handling as it is taken care in
   previous patches.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 29 +++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 include/linux/platform_data/tmio.h            |  3 ++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e44751647982..ec42f490d6cf 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -236,6 +236,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~0xff;
 	}
 
+	/*
+	 * RZ/G3L SoC HS400 mode has only 1 divider value.
+	 * Other divider values are prohibited
+	 */
+	if (host->pdata->max_divider != SDHI_MAX_DIVIDER_DEFAULT &&
+	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+		clk = 0;
+
 	clock = clk & host->pdata->clk_div_mask;
 	if (clock != CLK_CTL_DIV_MASK)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
@@ -292,6 +300,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -324,6 +333,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -459,6 +469,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -600,6 +614,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
@@ -757,8 +774,16 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
-	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8)
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0);
+	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num == 8) {
+		u32 val = 0;
+
+		if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
+			val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
+			val &= ~GENMASK(15, 0); /* TMPOUT MASK */
+		}
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+	}
 
 	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b1146dca94ca..8cd3ced88b81 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -178,7 +178,8 @@ static const struct renesas_sdhi_of_data of_data_rzg3l = {
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

