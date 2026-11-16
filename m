Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855164;
	b=YqJkFJDgLaMgckH6hE1CgRnrYaEqPskeMZXBVAS6rfxj++KfhNykGqWTxVitSzZIGWjI
	 6wZW4CQVVLr86YjN4PxLoaVfsdR0nKruYxQimfdi2jzN5rkwDP9V4Y/YzNm9Ts2avgMmL
	 LSA0bNs8VpWxcP2sy+8t/EBs9jOlWzabfS62Skj1Sm/JZl/bIdsAGWmPKHHGG2Ho6oBHM
	 zZbsg/E1S875qNGorzd1wE4vNSzhRTli4eJsVCSK4oMwIKufVdrgQBleWTMpBzUpcCEcg
	 1Drc75M07W6seXUqcAJMhEc3JwFWWjxSQXrcr8fNAAi8PbXCKa5DlLgw6niNVqU5E4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
	b=Z0tHuDd9k1+jer9mR9/ijWRPauRnZ2oVXhRFmS58yylrMdbbAZ9wBcFvwK9+sEDjvPMt
	 Rfho3jfgb/kg+Tp6uWOtmECEjqjQUlFd+rP7/AHhLIC5UxCZ6bd9/Qgp4KwiTOsak0Myy
	 oDaLkSUTcOc9uhMA0UeiP0O1h+TBnxiCKugspxq3C9FcHl1L6xOAfakJ8drT0xsFCSpO2
	 30mQn2lvSJZE/jTzampAUs4/+nT1qJ2wVspa59nJ7ImPw/+01jWX4h+ejlVM8wzPhrGeA
	 fYdXqPL9QT3ZAOtX9/VfYooV8NEcGXY0lmET2b2uCVjQEkbYc1aCoNtb9u/Jfw53ZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyLQ5Mgj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7105606A882
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 18:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7105606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyLQ5Mgj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so2119954f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855162; x=1795459962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
        b=wyLQ5MgjxjsoQtM0gPvPL1Skkd0515VBuf3ATX7cSVOFqv7lRiIcZc7BgwfE0sTMaO
         /t9N07vlpHHy+HJmr02ctplUm7MZXxDS2snEKADzh2UmP6NBAAPVGGm/f8C5fYwaPNnN
         c2/ra2Ae/RiXgOWDUfc4ZN9jT8lfV9QfcCalHEQAADMZ9to500NgLfILGRrLQE2I5+RN
         g4BZ/9sz4SVqB8Sb7xFgNDpxsTZuwdxsHegUN81spoQjGmmRG712Ajmwuku89CAIdq0J
         6ymsuil6hEUD2qKazE/KPFYcB7iVeLz3wGu1E2HEJ37ml1QAxhm6dFxv7za9F5mTUtq4
         Pq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855162; x=1795459962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJT4CBUbgD3xpezjgv+AsgOQys6XK1VUjumYM2wegeg=;
        b=y/Qus492ypzVhtrn8vQQWt6q0lqWui3/1tiGYHF47DLpQ0JEEk4t6mj0EIv4Wd9L9d
         dMrxPz/tF4k17+2maZ2/ZTHcRRx1iJXv4pA4Gg3McmsR79dEeyQYEd1jzJsVkLxz08w7
         rGzs6WtMjCIDKMU2XtCm/8ISfky8UFZsCcQNcgHRugVXZTDlSz4nFFOURR7brPnPjWga
         bHxtXFNO5PbrTsIf62PkPH46uM6w44LG0KK6ZaUVQKAQZrYQwGr+uFSIwB0pP861MrvN
         j4qaFPAArS/iHgrVrZ440znQax2V4GJxywRc4OOjL7u0I8zL1mmQHCd2kfajTs82Tiru
         SCWw==
X-Forwarded-Encrypted: i=1; AL+hErGgcf2+UTeLRmg3su7bkkrFxeV/K8jlbWieMrP/vIl8Y1FJZ+NU94tbWDMpy7xRypBEbVu6FlBhkwr808ta0vTRvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wuM5LL+SGCWMRfHKrlJ0SyJ0p/pP3YBtz1pTTMEyVJ1MovSZR
	vDBkXo7wTef54LB6cgtI8iglw/Ks4T5iOTuADpsTW67SsgNpruoMl0N5
X-Gm-Gg: AYBFou1wq+mp/DLuAQ0D3SdmxEN1n3TOnsotyUN5jH5wcmvIfeT6lnb5+X1sXfv2r40
	SmUlTSk2PtMdFBS7Ub7/PAszJ81nlImh4yTgt+yqk1U3TQtv2hCzvnpz9gRhIK5xjVuK8GESAqt
	jKVokKj1/dstKYLLTIU9TzvQtjYhpDp25VcB5cy4FzMlEqObB0h2eAKMHBtGn/HSK+KzOgjsPoT
	HTs0UfpVJsuyVTm8W9KZmXMyD8yHeixMNMlsz3Sl6B6cYaXn1UePf7VqKkvaHsfm/XacJsyw2Fl
	eycVmf+P0mYJY5fvekCNwlr6RGWZVIN7qdw05AximeoaE9ArLGke6bSjdeL3h7gmwVfrmoKd8K3
	zOoxokSSsQowqPWsvAJozuZx0jGpQjlUSlK0hDbAvw9t7jLeETGjmbuyQX03rcubckBkxxlwVx/
	VO7tJNM78F1sYH3pMxahjDejSlg89v7nmrXTRuqfmhS0F1NNiQ7DS6GT6nXONMflkdxQ9f9CS4z
	qznPbv/s/dQFFELKNY/yuuRFWhTYOiKEliMHSHvhagS4Q0lGmCctZrBAwtWQXgkYOdEfwyr2bEZ
	0+xRR1/Wi91JHun6kgabz0856YpbBRQwWdVhT1iee8sdV4FXSVq9xB4DQcO2lGry4c4=
X-Received: by 2002:a05:600c:506:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4bb55a5d6bbmr162373025e9.10.1794855162142;
        Mon, 16 Nov 2026 10:52:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm157961345e9.4.2026.11.16.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:41 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 18:52:40 +0000
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: Make HS400 OSEL bit configurable
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
Message-Id: <20261116-sdhi_hs400-v2-2-de41f7a7f330@bp.renesas.com>
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855160; l=4095;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=AnhaKOiPuDqc6xcLEGP7+1MeHlroB4vbW7YE9vOw010=;
 b=c5atoYCQWPfqNKolpifzoMYk00fDB2d23uepR6WSvcjIje1VR13Q73QWr5S3+oLm6nLE6oHxN
 gtTbd6VDSIMDnM6/wzMbjK2ycIwEimomYaSwy7GjWcGZMIwc10whUE1
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
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

