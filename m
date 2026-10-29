Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300310;
	b=bTXJNw/xc7nR62Z02S+PnXUwLI39jQU1cARNjQ+c1LQMkVy+uPhbE+m2EvIJ9MPWY32V
	 CTPEL72aYYZw8SlyIXYHMGh8HYu2bjDaMSblrngm1YF/IyQcPd3yTMBVgp6A4ZeovPCzN
	 jFq+atk7sBKJVQCz1sXR+gH7WxCpMYw9BThxTN+OqZFPXIfg0tT9I1gb7WCKNbqoqdbsi
	 6Zm7xrIPQzdYx7UM8osgC+33Ind05Z3XothENtkStoEXVuawble/j/MGvPktFx4ghqT9H
	 254RjNV6rz5A+HgNPHaOEwP+63l8ycdM1pqcgPnWx9uRpXNyw4Yjfg0uQNeJ/uAFu1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
	b=wTWRb8PpymcUgD6lEyby7wsVVL/EFABmaEahdECkJpNXYrOgE7OZWXtXJWesyvReQOPh
	 lf/sF/fv60SAgHDUTg06bNrCbmdfNlvTUHC47YwRLW0jeVpBq7V1cQmzJgx/5cyHqxjH+
	 wRIAvPJ1/5Vl0kXZTd2E2QDuzgqhiCKWY1WAVuhNiSMgssbikQol3rfQNSCxGGTLF++QP
	 HnIdqtE0unRxpQT14232nAwRIddeoTYcg2E4rmiIAW/0xYAJGPNPtPgf+vmMN8e/lNBgK
	 N5Ulz988NjypGFoaTZxW4IsmInQuusd7A19ptZxztkx1mDraDlu14FjTXgPdBydxYLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlehwPUe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D51606A327
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 18:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D51606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlehwPUe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so26814875e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300308; x=1793905108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
        b=ZlehwPUeWHIvJWMcOwcjPrBaEC0p8+PXvLWZ5BlMXt9Yrm1F7U84ZptR4LD2AvWsh2
         fbFUe1BaDtlDa4LbzxhpKaaz/RUKjVnk/5IErpzjuX3072kFaUm/6oiYNGQDX1A0Lgr9
         PuZ7GMqIZ1pEnGcTeb3sGrtg90MzHxqdFBR/7GqDb6m41Erku9A8j5BLOCJXN1iDPkiD
         S0owNGf/Dr3meNUIs9c3Nx5qA7gENrdbs9KCKKONf4BSpqoUnmV7J3z4wTKYGPpa6oR0
         Z2yUDEsWWPEIzWT1+fq1Wc+v8ZLR2BnpqpOh2A4BqKrmevb8Y3y7y8TbTqAke1ZWtpOf
         E11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300308; x=1793905108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbI9RqX3ttU/XFS7d9UXMiiXZOo1/l4f7kQVLIvsA8Y=;
        b=iJI+WknX/e/g2orkLrRzQTt5a+Q2EsW+9hHNtPMT56Vmt3T1YPsPkj5gxGzHpNQPl1
         6PhBW9MzpVhkQZDhrtIRchhWzNH9CHUUQqSOFiPZbIuxtXzBC2aC1duv8qayqAnp9MyE
         4Lyrn7Xdl1I1C5Nd/isDmguTuhtqybX8ToXokgRyWuNL6tK3dQoLfYEaVkRmTcp3Icyl
         ZEM1lg1w5acBbtcK4CtWhP3HlPY8tLIxzZWQ5jbDre0z0q3Ez2gyJ7teDlJqvGOdNW9c
         GkJlHJ9AlD+fzkOh1r+XodOX9yG6YBC6GUEeRFyVLGlRvpyWMKNVqg5dgPcGywJNsI1P
         /X+A==
X-Forwarded-Encrypted: i=1; AKwUvByJn6jvXjYk0Xa13nYjo6AHpjFURqh6suZs3mGH6baD+tH+HjpKD33bm+6RHj8NT6tabYMiQ9wCNAo0M03BDMGZ5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGVmo2rUJyWRxNrN+yNgpOI951+QAf6co8BeFllpG6N0St1riQ
	fH5rp47bF47GNxjbzIjRAzclbCNRy9AdfSFL3QZFJpaXWicKp1S7qNHi
X-Gm-Gg: AYBFou1nUUUzyZTM+lF56hSh6xwI2b0D6AhZdNhMWPTtF1ZichST/Gvz9bp6CzUghec
	iaa3F1r73mi6dIZeebhNVLYDX/GgnC4BSbQ50//AiOBfebfintieeJFM7I5msL4FOdMspq7iwUS
	0Zc1B1tLlU14EeVwz4VAil+zP4T1gOdb1MuWO4XVbWFV61a22TG+pS1XhPM52xa5866gv/cyiKk
	XyG6KPUmDs+IhNrNxX2QeCQLGoVtN7J3SuNx/5EfJFJfZFnd0MmYFo9xiH7ePqH1iLze13T66AY
	FepAqYrvKO5pnNY5pligXWosJba32CdgisZQX40tbuM6yU9LrIeGDc2xmPvBTgSg3aeO1gDyoSU
	YnDjRflu6Ykp1BRsCPV1naNeBbZsHTE5IoMU5q9bEVt7ixeUd+TSrqkqGEl0FHkEPP1VD6Sq2ns
	UGCeI3yvr5oNWxwd64W4YUi1h3j5Z+UWXQ7OrLp1Lq0pzwC2p6Du6+uYiTOAWgbJdSANwW0vXoV
	7U7HHRVn3ND6EiRBGghhPw8X1eh15zk2kOxkgngRib4rf/W2+TGet66ENxriaBdOQdgCiV3s6+c
	0FXYc/SDR5pVtn9xzVYn5333wRRqQM9GE75+OW/6H4Yoj7H8auDFflx97pxA7u81mw==
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr143215595e9.28.1793300307987;
        Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:24 +0000
Subject: [PATCH v9 3/7] pwm: rzg2l-gpt: Add info variable to struct
 rzg2l_gpt_chip
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
Message-Id: <20261029-gpt_rzg3e-v9-3-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=4115;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=W3HtKW2QA823TNPg23+hej8R42an2z8h/hfkwkyGKfE=;
 b=9YzfOW/+tKP8tDj+Zedv6ZVcDku3/TDeIW3JRhb7HthEutiuPhOn55NVnQVSBqMNORlIPE1+r
 NR39N39iZ9hA92nVWK2djU+Dn51FiwKW5c3GUTZXO5iQ4tAoYiJ497M
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Introduce struct rzg2l_gpt_info to capture SoC-specific hardware
differences, starting with the gtcr_tpcs field mask for the prescaler
bitfield in GTCR. This is needed because the RZ/G3E GPT has a 4-bit
prescaler field versus the 3-bit field on RZ/G2L.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Updated commit description.
v3->v4:
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description.
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index e9ba0f3bdeb1..19476fe7f5a8 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -77,9 +77,14 @@
 #define RZG2L_MAX_SCALE_FACTOR	1024
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
+struct rzg2l_gpt_info {
+	u32 gtcr_tpcs;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
+	const struct rzg2l_gpt_info *info;
 	unsigned long rate_khz;
 	u64 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
@@ -324,7 +329,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -346,6 +351,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 				    const void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	u8 sibling_ch = rzg2l_gpt_sibling(pwm->hwpwm);
 	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
@@ -373,7 +379,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		 * that the lock is held again, that the values computed by
 		 * round_waveform_tohw() still match the running configuration.
 		 */
-		if (FIELD_GET(RZG2L_GTCR_TPCS, gtcr) != wfhw->prescale ||
+		if (field_get(info->gtcr_tpcs, gtcr) != wfhw->prescale ||
 		    rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch)) != wfhw->gtpr)
 			return -EBUSY;
 
@@ -401,8 +407,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 	/* Select count clock */
-	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-			 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), info->gtcr_tpcs,
+			 field_prep(info->gtcr_tpcs, wfhw->prescale));
 
 	/* Set period */
 	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -460,6 +466,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -502,8 +510,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg2l_data = {
+	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+};
+
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-	{ .compatible = "renesas,rzg2l-gpt" },
+	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);

-- 
2.43.0

