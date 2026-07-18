Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBB38E8BA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381930; cv=none; b=pLwh+Br3mgwCPF3Zr35XImWkIVIkaOjbQ+jINF+8baIZN6OgXauFf+h1o9wonnJZ2AFkhH1VsTtDoODN/3zQvBJJLYttmVO8vi3LNB+vD+iHzpamrCRfZg65XtiXQwugumJlI/GIc68iHn+FDJDGOTr2b2SZBSS17vRny8rS16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381930; c=relaxed/simple;
	bh=fes0AVYIDA0/SsWvj/07+N2C5Ll75WYuV1OSZCK94KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfS2CtFIISWJEOtPuObeHsXdJaH8IW0uORV7wqi7SbODnXgzmP6xz2Rk9z7p3mjUq8xGJPg1786MG/qMYrb9Rz2p+TAChF79eD0l0YBUpXE8Wi2f434F/S8zj1kabW7hPKCQ5tLJ+tCQdlsbE2l/hWhHyMC5ONmtye3B8ECMEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWdNAcYh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWdNAcYh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so27785e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381926; x=1784986726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPE/82wb4qwuDCV8wuwNB3xLrog4AFWriczLUZKVt0Q=;
        b=jWdNAcYhGYZWZg63lOl/JA6LWoBLROPg4p/Hid/nJS9MZ1CsBkoEmcNX+qbTjk9OmH
         C94sZTQ68gsNPzy6QFSoiSxoGFwaQh58EDZs27kMPmvwI3+JZ+t/u22agvPTogzYa/Q0
         hFxyBG7dOOQtvdaCLWusn2AVBxAmk3iwvSxiRMGBwpq6cfexwqoo5S0RA9+A7vQAZXpJ
         KDWLh1O/eKXFCPUQvDrQh272G5+j1SROUZlxf7wOEd4qwqa0vsIFH7aZW3c23J0IF8HR
         FoszNvPZR1K3O7b8R8F16qifwPJDI1BeMQgU9V9fWaak8BZkW+cN0fwGOS35a4HXsIDu
         JQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381926; x=1784986726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPE/82wb4qwuDCV8wuwNB3xLrog4AFWriczLUZKVt0Q=;
        b=iJj+7TMBSitE+mWK+OXEG34tlsHsmb621uLX7Qn9FGqn/9yjtbJRetGli00nz7I5EE
         t16cVVbykN0n5ifL8Rfq5MgjfOOdRqIKR2mPYrSGg3sxsDngyFI6tD7a0ctRZsOo3rgW
         Rvo/V4CMLDBJmOdkMSIHobHm3jHTjOqvPQz47IEBxMxMdLkHL8gBTpVjKaN6zqxNSzRG
         e9VZnLRWnzcLDnnQocIhAy4onzp1qXxcXmbVd3zEKpu9vUuEGzD1jAITlAGicK6MGw3R
         7F6aeqmqevwEJbqoRQxzpeApwauDnkVnufy5ozdSS/B2viWqObS1Wv0TRLUPDI9Avzuc
         cviA==
X-Forwarded-Encrypted: i=1; AHgh+RrxKLRQr/hV6Z5gGY8nF+rrjDbP/HjWvGhftje1fVWalv7n/6HKRlwI6whv6URReFHn2CNpmNpEeJd9pF94PLwxDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXu0F7OhkViAdBiojFuRf95iC/R6oyaR+BQ8W3A3LbIivZuhZ
	rFYmpvDKBSFor8ZThrof3Jf2CXWh+u+S1ZzW/CNWdcIC7pWlmsgncUKH
X-Gm-Gg: AfdE7ckpsx0sfRLuyK8vKdRab82Eelk29LTPpAR03COPEMSZ1rQHHj7CIkQEW2ptcls
	jpm/uJlVb0eXyjFYhc3Wpexp/9/ZCMuhF1Zb24KWCxOhAtXmpl8buagaK6XfKMsg6+Un2XtBSSS
	6nQTQtrHAYn0z9f+Ykh6sILU98V8S3N2LaTeuv82ZbMpu1TGQnS+ZD2p0W6SqDud9jn5/9D9pWo
	ybXJGaJFjGMq8/gN17MBeAC6h51J7t/iUmr4HuqIyZcM1/q4FVFITZhwX951ze1l0QsvetKvD+V
	6Pk29UI6K4GkMT6vT5TlkmzTKcaB52UrzY4vjuCYdULai1c+NPbw1BDY7z8V4/B89mzuCvPypte
	dS3EBzFND2rfzGlCI1PSdVjYffiLns8XkvQhCRdNW/b+Sy9miuYrsMnXXWOzvnBwVoaeltvPgCQ
	ZLyE2UPiGPBd9+LLAZ7vZ0rMg4LME=
X-Received: by 2002:a05:600c:3107:b0:493:d305:b8f3 with SMTP id 5b1f17b1804b1-4954a3d6462mr78543885e9.3.1784381925947;
        Sat, 18 Jul 2026 06:38:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:45 -0700 (PDT)
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
Subject: [PATCH v21 05/12] mmc: renesas_sdhi: Make clock divider mask configurable
Date: Sat, 18 Jul 2026 14:38:25 +0100
Message-ID: <20260718133838.152905-6-biju.das.jz@bp.renesas.com>
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

Add a clk_div_mask field to struct renesas_sdhi_of_data and
struct tmio_mmc_data so that each SoC variant can specify its own
clock divider mask instead of always using the hardcoded
CLK_CTL_DIV_MASK in renesas_sdhi_set_clock().

Default clk_div_mask to GENMASK(7, 0) in renesas_sdhi_probe() when
unset, and explicitly set it to GENMASK(7, 0) for all existing
of_data instances in the internal DMAC and sys DMAC drivers to
preserve current behaviour.

This is a preparatory change to allow RZ/G3L SoCs with a wider
clock divider field to reuse the same clock-setting code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v21:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 5 ++++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 438b2a7afe76..db147af9068c 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -41,6 +41,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u16 clk_div_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d893a263e770..44d9f5da0b4b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -224,7 +224,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~0xff;
 	}
 
-	clock = clk & CLK_CTL_DIV_MASK;
+	clock = clk & host->pdata->clk_div_mask;
 	if (clock != CLK_CTL_DIV_MASK)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
@@ -1186,6 +1186,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->max_divider)
 		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
 
+	if (!mmc_data->clk_div_mask)
+		mmc_data->clk_div_mask = GENMASK(7, 0);
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 2bf354331b2d..9bf7aa9bd867 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -103,6 +103,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -122,6 +123,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +142,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index bb66ff7de065..12a1cf6e769d 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -40,6 +40,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -49,6 +50,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.clk_div_mask	= GENMASK(7, 0),
 };
 
 /* Definitions for sampling clocks */
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

