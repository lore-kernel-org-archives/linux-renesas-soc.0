Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EF41DEDA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576152; cv=none; b=MY/rEm4sZahI3K1io3VewN0Q6jbfG6enQoLh84ENg9G1gMHOD2rgc4xa9DFoDveSHJC/dRrNxI7h0HEtiKUGZS/R0pZnR44uh2AD4CR9oyE2PlmKf+x+cj4ZTAlWbDRPs0nIhQGwC4rSLFmwMmDGWgwXM12aOQF+Ke9FR9tZ1qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576152; c=relaxed/simple;
	bh=5Kw2fqLXA76dVaAYZYB2XnROiAJp8L2IGAYhDQnqUYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpfNJEXhWiKZVUyEUb5nSgi0f0q6IdI13T0zxrv65jZn/9Jir4b2p3hXdEIbxndKvSSBK3tsPKVqwDob+56IMb1qmG764N59oekYEgjACNTZApXdpNWJM2AettPyIRZpappaS70t9FITgGv0QU8SSBlXQQxFSg7tEk34DA6PTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoiK/iPd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoiK/iPd"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso8644285a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576148; x=1788180948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TWoXnFxzx1GlYm+udbSxbUhiDJnm5nfEowULKxIdMM=;
        b=aoiK/iPdyaxPuDbBNPsfqka1Kw3S3mQisMsG62wL5ZL514oleu31UAzueq8aoSQCdY
         hT6y58+aPLF6RoKuJiYP84sVJ94l4+mtv9mCb8qIezPA336e7b5137HNOtIwCnovN4Zr
         2QQtMbyT1fo9e4m3IjbPN2+IxzRw2jYreBmhi/qMSnIiBjcY8XmQa8kyYL59OfYtRd76
         a7soNZDwOXRyOblchesbNuPgq+BpwTJkZ3q+kwdCsb/577yMfVxIVbxmiJhMIyAp7DHj
         rtgIOezBfCxufqeFkDA68mRzdDOlUo9DNoxHZYSQS1GqSuo++lrEX5JGFHzPlK5m40jc
         oiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576148; x=1788180948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TWoXnFxzx1GlYm+udbSxbUhiDJnm5nfEowULKxIdMM=;
        b=OPoSLNP07vOrNA91VUvh1ekX04VXP7m08PaLxHPpxwyujcQaxemJQNDwf1SqTopKzE
         XYwEhfXl5j9sST2hv5IToEgpuB9di4iwR5zPVGzhOoQG0p6fYpmUwzsS3DmQZTvFbpdZ
         z1WPUfXTkqSi4MD+ZVyrEitANv7zHITgyYygIsfN7XfwMo6wow2RhEeNRCUqhbFn5RMw
         8DTerJO+ZNupiYaxonYwBQ33R8C5lYPW073VWL1UZcy5GesuoszbD3nI+l89bQQkfoU2
         0kpwqm3Om6hrrC5mxjJIkYsLAJ2F2baVWPwr5JA0PFoe/Z8FF4QlOKQNCBkcpyKS8HXC
         bP1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkTwZv6eIncyjGjXAT0XWZd91rcDwZuA3yRReDKZ0gnobl10qYoGLEp9jA4jGJaC7c4GTSXijMJpOSVAmCQ3B77A==@vger.kernel.org
X-Gm-Message-State: AFuF++mg8LRi6mQVgSTT2vopVeWOR77wY8bikvvoXgDj9Od0JpI5NFaT
	tWJsgWnk4qW3zmWur9uI167m3tJEncEovALGRTRMGGeeL3ARzIP2TNcz
X-Gm-Gg: AR+sD10Nnec1rD84i23TW3T4n/igzzk6LUhRgBAhFGstNAsgYSsTnmvnEQFjKbYCRfa
	Tl4apCFPUOa09Q+CJB23n5ogbLoNMI1o/m6MHRYKfQSZCuX7CZI9Ldy/NC4B8Q7GSL2PeO4a3zM
	IzR2kkLrwHaAe5FsyPq3uCqbGRl7B7QEq1i9YJtJiFtw7QeNOVQIlGeZk+RcCcKdKEjcJ26JwDa
	3VTXctOd8/F0Y/ZcrnNQs7bqY1zSG8oYhUL6QALCcs31lESGyUrsSUlXiDbwBbdsi1WgQxgHuGA
	gYLKc4mp5IZ5Hg7FEVFPITBuVI2802RouwKsYmI9Gkr+a3VeWN9bVVGx8/vwyUV2K4wVjfOHXdv
	/gVaMPpCVODK90RVkk1+vRDF1rVFT4Ees3P0WG/WGp1P8ZPJGNsgvCA2GRPoLSxAm14rsYHuEyA
	txByo7g+LbQpAPHqeJkCTrnrJwVwYIAiH48s9TU5gJkwRP7AryHxCljtVNsMI8ZbzOe8cfeHjHx
	HTox8w2JyRnXA==
X-Received: by 2002:a17:907:961d:b0:c24:469d:5653 with SMTP id a640c23a62f3a-c246a653373mr2750262766b.21.1787576147560;
        Mon, 24 Aug 2026 05:55:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:45 -0700 (PDT)
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
Subject: [PATCH v7 3/9] pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
Date: Mon, 24 Aug 2026 13:55:09 +0100
Message-ID: <20260824125523.131762-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
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
index 2d40c59106fb..da2645a42608 100644
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
@@ -325,7 +330,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -369,8 +374,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 		/* Select count clock */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), rzg2l_gpt->info->gtcr_tpcs,
+				 field_prep(rzg2l_gpt->info->gtcr_tpcs, wfhw->prescale));
 
 		/* Set period */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -439,6 +444,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -481,8 +488,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
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

