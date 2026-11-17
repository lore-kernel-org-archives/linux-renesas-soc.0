Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933292;
	b=Tmahrtl/jTmQiM8ByAxnaVnSIm+kT59RhfMWXkcOsYsNL1Di7iyQjU37GVLPqFRQPwNj
	 GIEtxGZIkH0ROd8IGVkvtQuVJ34kVgJN6XS1eHqNYY/zg74PZ2rkvxLUvSSM7mnBAkoMw
	 dcQAwntKSWLlJebiImbP7PSS4a6ooDXGvNrSUfWFpW9JpD9bZkHpI8jnShuVRG/ntt8QZ
	 RtWlQTw+zPHtdfLHK7W/6x4EkDHMUecTQxVdGPievMcoq+biLuiEHQpA/7Hz+hd5/aVV1
	 4xYCi8xVvyk8fzSo8q72c7f2jJuqt/oSbx+DMo+ee2SyXZIzitEaeJbfGPkP/ZOATzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
	b=KHkpNXiH2PR2vQUjYI5yUt1u3hMfaTxqEY6DoNdjmQPywr7Awe4eZRab9TA37Q00drwQ
	 NDx6HQpU3VMGdcgBcZHPjtwYolvGRefRYKoUghDogLFfHWM+2kA9L3fbj8y59fU+6phfo
	 V9e1zHUm5VPfuYUD68zYj2PTAiKhWKaGiyKgGDahFLCfzIlEpaETBWgzMTHExJ3tPqcIT
	 zCb5rp5XgslyJqiincVT234SvRrMVATwLtwr6BtjIZjomZEknA6W1NPJt5OJ2ZUVXrh/Y
	 rAE43D8TZ4LDN6jBKCFtqMIAcPMXs8mprcjOlA/+Pl7m9KOf+ZsISnRwfmegvCam1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwiyFm5J;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A6606A33F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 16:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9A6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwiyFm5J
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4364670f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 08:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933290; x=1795538090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
        b=rwiyFm5J5KcFTQQE+S1XsoqkqIrP4yBvmZ+PbLMSBCw6Q7uFf8dpnzdG/VD/2FkR7W
         iefd41L+YA8QWbSbBBc3PP13B3+9D7+UE8XFpfcHCAUInRS7H3BD/oLsjSTjPEpt04ty
         Vz6+WNsHsrhdDqOOd+D+iA0K4ZhgjHhGmWR4qLRC1oyADzjXFx6IEfT2intMfxEseJ+V
         XwPYY5+SlqS4It+XLva8w6zS/ymQdCF6Q6+wQjPZaLUDwTmwl2NzUbFkHpwArz7GeJO9
         3nKwmndaRUKxaSQqR7AZxDqn5+8S7Xoq1PIK/6jaEPbEXq3vM3MdQSY+45Nutp5Cbe5w
         sn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933290; x=1795538090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4VqzAzyHFDWVHFLx84TvM4z7hRkGfZ+L7UI3ozJ8uk=;
        b=qrzHA2JjDALmr1AnQGc/FI/bPWppiJdjwV4uWrrIQkF28HiLQTTEsnG+2Mia7HdX95
         uHrAHzTJpifOO6HdTpm5sMogyCdWpPVipxkcZ4h2qZ3ZjzbIN/RXxYk46t2VeYTXA4WF
         mVeT3+UDL3yLF7FxWtvSJ0A0LrwdSPhdTNpq30/hYirGwqxDwijLUm4FqKY0x6VYkrC7
         r/qAKL2lcreujABPhcwykpyusvNNsAAiZiFGk0224sC/zkjUa3caQ1OQgc/nQiivyft0
         9Lnqarf1/vxOGkGA6hutpzAKeD2oeSWMRLp/gdMWndkKc4TYkAlRlhsteg2EUt8ymS6M
         WIJg==
X-Forwarded-Encrypted: i=1; AL+hErE9fOvBdsf8uFEWEpF5mCqsBEmXZdmOVSPf9l3WiZhoDl3HGMv173K24FlFxmI1MtfTR5Ww10zIXy+VUq+19+rcpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+LzykEJoY9OGhUEpFgnw2NkjJIWxwF0AZ5eHQgSkSbaJ43EUC
	qteneDl7cXoFKNdc+G5oFovZy8rLyqAguDkSf1wZgPPYTopzMtP6TPYguo7AFg==
X-Gm-Gg: AZFdTZeRy79pJ+vxLDdTJyZkezYXu9uaA/R4Rqgr2YMaL7BopNCzGuHwsD14u0WO+eT
	Rz7e3jC77RZ5qkaPLyYEw93fDJeXZUqXpGVuW14SUPSZznD316uaDUYbNadkNV0BgN2fLAcZPU8
	0VaGsnGyXf7h4UL6i1yLhJJJMlr1YrJAkESzCfyMRrQFjlaCFh2TUCi9VO7MDX7XxM2wXWhFFDM
	ml6ZOj4ls5RwTANf6B9j83r/6JyU2y/svLK4gVA+BB9ArBlZ98h+zEw5xM9qUdCvtvgMeKY6Sz5
	1ohFD2IDhPa/IacklXpvTARXV/JIJ2UtjgGkxr2MsL3jdLSCQVAmkrg2eBnLjxwfSJOW5vD7/rv
	b2sIwpyDN8m0V6u/5mf/b0vQgpuA/TLVvdZBiioGB2aVRjini/sZcPWcVeQ5f8qzb97UYvlsCMV
	NSRFFag5yj1IYh/R62xec8D6NnOnRLBpZWmdww3Suu4IDtdS+1SviLSmhcLjBn0TbgIQWDZjPhT
	eL6fY7HE53OrF/EWlSImAfptBnyNWWWjqtbEqi2JCdEHw3V5TrW1yh2GX9xWVx3AyAVZzZeLbW5
	0rZrbls+UNrKTeJXefKtqXMrkea2PKupSUiCgfI/Qs1+MiPkpFE7DbMiZDTJiJUDY6icRBz+4QG
	NQ6EAWrG91HM=
X-Received: by 2002:a05:6000:2dc9:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-49c71785323mr33874048f8f.33.1794933289986;
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 16:34:47 +0000
Subject: [PATCH v3 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
 per SoC
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
Message-Id: <20261117-sdhi_hs400-v3-2-b4659189db69@bp.renesas.com>
References: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
In-Reply-To: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=4117;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SYAfKvjWLRvmc21t371OTT6TgUwITNpCe9K/LsMWWmY=;
 b=pMXLHb46a/LS8oP3axfxPDPS+u+Wt6ygFOeiojPu8970sOZsOMNQM4qKK0lPrTkojh2FbGEwf
 QYo2hvyotaIC6kRABLxNCMDuudh/7gTsPksstD+VzD8D83djD7228eH
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No change.
v1->v2:
- No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a93e613e9821..8ae2ec04bd1f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 	u16 clk_div_mask;
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 56286431fd2c..7dfcf7f970aa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -333,7 +333,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 #define RZG3L_SDHI_SCC_HWADJ2_1_8V	0xff
@@ -484,7 +483,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -621,7 +620,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1233,6 +1232,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
 		mmc_data->clk_div_mask = of_data->clk_div_mask;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index eaf21f93f5d3..37eeaa52f011 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -124,6 +124,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -140,6 +141,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
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

