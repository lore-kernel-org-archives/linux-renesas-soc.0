Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94448A8BB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672937; cv=none; b=Ango2s0Fjx8UR1mGwycKG6DUkkX40fVPqoXOLSZ/jZbHfW5a+q5y6bSw/DtpfxDYJzG+2RbNhI3Oprwd3aF2KSphcDCvwIql6TE5F9Q1HlYTWOyKAsxjKucQn4/z2IuNPEM4R/wBIeVTQ2dyMeCeE8OILwuhP+LzwOgT/0OmWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672937; c=relaxed/simple;
	bh=VuB36E1lq8H9yU/laDI8ZESD79W3YHrEkAWuM3sQtc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARnUkofsHQ+oZDkDWE1JQ1E1h9XIiLNidMDKtyVUfs8MjO/rLwQaFKax0kFNSS2ChQYLfTxicK9okHEFT7JF5h4UugG5tkhLrvbFHm4zFMEcBCqGPwi6mznNk1AqFMfZXQhdEFscmNIeOdpI5dTUSpvA6EW6RR0pGucmeiaaQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frZ3Svma; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frZ3Svma"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20e70a0962so759832966b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672933; x=1788277733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0is4BUzYiPNaBY1I22YbPSJWBHP4ENy579LWW0iQKA=;
        b=frZ3SvmaKlAQTefI3KFuiWfeByevL/SYqEDT7htrIqElokL49XUJgFm7Fcy3f7Z03+
         04E+x87Vy2LgAQfrQosEuCD1/CWDErTLqFa+bhwHUBPmUjfOh76lSlNHIRHVeYOEwxTJ
         Kwx26RlI5DbYGZPWxMVD8Jh0HGaPvCMw9CA+QiQuTWK1k+4Y032oTKZ6dsyXq6B1hj8I
         ks2YycRXbr8XRx5TGITcS1DVjalr4mjJ3rxpBmfdp6kGyiwtjFoHyNvk7ddvS2q5iI1G
         VLGtCa9uUSfedRXEEPT/HpVxlXIQ/KXkNypxVA7LKxHZc1vrU1fuBPIOcQshYgD4HqDs
         3aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672933; x=1788277733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0is4BUzYiPNaBY1I22YbPSJWBHP4ENy579LWW0iQKA=;
        b=Uu/k7ei7v9xKVLsFQkm1lN20plnnCR9cmxHBv7rmY4Ar+jm+nu0qcIDNauc18Lke4P
         z7mKdRvF6JYMq2HFrEjHfCm7r9rszroS745p9MxfgZfcGPMK1170Vl0FaZhzExvS56vL
         FHAvtItfKk3mJolgG4siLElvmQBaIch5kl5T9xSMwTZribMmNEmj+ME2x2kHM1ZkEA2A
         1k7EfIaYHGHZG0Ihj2WjjTPUeD49vzBO3Rya8sYQ79tfEpHK1rtrLKA+Gg093u7BIybk
         iO21qWkC6R2i52fv2peYlWmVMETZ+Wlbyoqthu+sJFWIamheFaEg/U86nvyV0JHpZmUB
         PFBA==
X-Forwarded-Encrypted: i=1; AHgh+RpA3w11MKPeKx1JBezzlGeo/jwA8pTba99L2Qf4s4AOxBcB6c5VQLTWR1qWcvPzETjkDq1D2/nMCIKdcUx5xO/z2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mUVZNMLSKPj47ClCWrfev4WCx9ASFZcstQgbMoRMtc9AQn76nr
	4Qve99ECNjk1UaBQfVa4DKgw3DfHIpU+ewm8M4Bk1W9hLJ+WRjO74Jjq
X-Gm-Gg: AR+sD10buz1zZ4E/RNad/jbuTdtLjKwXF8DkaxnnQ3qC0sOIo6JWQjnhkr957BqAPm3
	JmY0IyXcGxo0PiPL0G0BM04R24/Wz5fx9TepzDq11ozhwfcMJ2usai5ruIbgQUgT7k4h5ucqhge
	0PJOpSVCcd/3eJ9fQB3p2M8Nz+yyR0pvKgxKe5Sa7If0Gn4zW9MU+oT8F2WwbT52QG70QzByibX
	I+JqY/e4inVLU/eCcO/uXWjZq16EIYvmUL8aDByHkp3X3G86cstTYGmuL8huap2mNk89i5dvndM
	nDPZso34sw/RDOxAKrlQaHP5WxV+Ta8Aksvcp/2UrMSjqW6Bnp6coRKS9gDvgkElwv2d0+kBVXN
	w6aCFFOQ+yQywWTC52IVfdDeuX0T8x+rhRNGEIThLuyq7dZrS572Xf17+Yfg4O6+Ys8VXLXJVEd
	1O/49rBPItfe/egdFHquSftifTZFsGaRMCz+QrU0Ol6lxYGWh1zB5RaOBRds+n11MSkDx7OngPn
	B1qFFv34d73
X-Received: by 2002:a17:906:99c4:b0:c20:af9d:4544 with SMTP id a640c23a62f3a-c246a4e6388mr3638556166b.6.1787672933181;
        Tue, 25 Aug 2026 08:48:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v8 3/9] pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
Date: Tue, 25 Aug 2026 16:48:31 +0100
Message-ID: <20260825154847.197948-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
References: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Introduce struct rzg2l_gpt_info to capture SoC-specific hardware
differences, starting with the gtcr_tpcs field mask for the prescaler
bitfield in GTCR. This is needed because the RZ/G3E GPT has a 4-bit
prescaler field versus the 3-bit field on RZ/G2L.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 drivers/pwm/pwm-rzg2l-gpt.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 0a66da0f98c9..87309f519827 100644
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
@@ -328,7 +333,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -372,8 +377,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 		/* Select count clock */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), rzg2l_gpt->info->gtcr_tpcs,
+				 field_prep(rzg2l_gpt->info->gtcr_tpcs, wfhw->prescale));
 
 		/* Set period */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -448,6 +453,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -490,8 +497,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
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

