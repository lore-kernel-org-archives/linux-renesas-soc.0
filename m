Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A841DEDA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576148; cv=none; b=sDRt9ovRJxGqbtoXJvePb2ZG5Ph1Uy+5e+64UqavIOtl/edroc1WPzUTASYPDABSQyBQtA3KPasjW8J77NCw8jwf0GWKFnOySP02KqwI+XLsJmoZA42LNYHbrHLvp+AxnBPOaV8IO3s/xDExi1KCv172tvTYs8DSscZhGCGe/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576148; c=relaxed/simple;
	bh=30ZZqhUMeAuyffRRfbVhxV+DdgyX9Ua7fqPyawNZ+7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7OE68kxpfg16FxMR8s7LULJ8PYPvSucf9sKMV0i8JcWd94BN5fpL4NtzqwKV535F3F+wTTt/lW1NJEgjQnTlffm45CPzTcU4s6kqrZ6+fELXxnmpvGfvOAJboYrTAXRndbUDyNxwYv5CylvLMXcQAWk6ZMRgK079jkOHM98zz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9G+UdtL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9G+UdtL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso8644162a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576145; x=1788180945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unn4dgeJwrLigxXrI1YjfTCy5CqWaORoXQIDckl5nvw=;
        b=p9G+UdtLi2HU58ZBd3+T3C6gbWqirKO74hjGzfuz9gRUWlYFls1aJAgSlpOdvXM9iR
         Tyr5RC6TmRCP1JOBpHv2pwP1Epdj5ZnXHfSUgNWe/5MXz/ra1I+pG/XZzPZwSsRzWKWN
         fW417IT5OiK8mD5fErQtnw44R15Yfl/l8ITQb6uZu/Ehvm/VA1rOiHVoyR6mOuOJO3xN
         0xXtzBGJ2I2sKpuY25d8MZJQNexUAuhv9K2Bd8NKOZ/L7bMpf1VdgZdRE5Si6n3ovD/H
         S1ZhVajeQk3D+ok4Y0pSwjVjDW+cPKz2wHrSGeU0H/qT5/RqxreOTzoT6pYrx3ZaaMtE
         2Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576145; x=1788180945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unn4dgeJwrLigxXrI1YjfTCy5CqWaORoXQIDckl5nvw=;
        b=EG6t816DnmgJKsjV/hYCb70tITQ2yhuarCPuK+Ya4LGAr3PmoQzcCCQsB1mgJmRcRX
         MJFT/CuKccYWXIxWYcv+Y2ozdCNb/xLBGWtQV0y4TF7FTi9M7nKrQkL+62P91jSaxb2N
         qrfUbTN7M705qxp4EqvkgPnZnN/PHY1p6kXW3d8ja+xPMhjq2kU+wGIokdSb8RTENrJS
         2DtmVbJUrDQz6esE2inPuWG4cENCcqjwT99lqyleiPhkOPhEQruEgby3g6Vy7nPXjCFE
         +r2NXzJbO2zyswBPyuIcepldGh6WW7PnLGNz7mLGxU7aKybkRFVYpLobUtFtfeNCLM0j
         GWTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrir0n6l1IGI0HUKXDjKu1jXTcX8/aucTpFvDG3k2lt1udBA2ALQFiVPScxPDDZpeU6LFphhRAKS1mjZoKcgf8dew==@vger.kernel.org
X-Gm-Message-State: AFuF++kUIESV7GRL8FYasXwKnFKp35gYHAnPcNb7Rk4F7mXEdys6UsLU
	fLtDCw8bF/uTCYIOP6WYeJw0lH/PCHsRHY+hkMUhyoX2mpBgPEkyEl8H
X-Gm-Gg: AR+sD10kzdF3tIe4qFtcyqyXAFBysHNuwTLTYtbCmYsdcPvTJulae+EIesQwZoUEp7e
	SqbsqTdrPA98gfucKHEoRlSicFBBo+JWDmfItlTS4Nhp/nJ/MyTulK6wzn6PbYRSScpw4JDIHkX
	3qFPzy5xTxQkvVq7DNDBFIb1IoOfQh6AOOwWrQ+TVwpMF9jvKZPjJpPDuqGKNV7UVtxwTdkikRA
	XV+3s/n0zBLBYpIxm3KUIPdbyBuJuSbm7d/CT0pSDr4S3JuA5Tc7RYvHLjpvg6grZd40fDjAXbj
	RqFgrANd+SdbdZGgD+6HMptAjl+EWtE/x9RpglSx+4Mo+JQA0OevS4WfMJUGlcY1cQAuygi0Dne
	Bbt6hVIyMjBTtfiyB8+dW6+Z+RZ3Y8vL8ExYM8NrmHDgnHtXbVnCqVtqbTOrogZYgXtoxhe1fY8
	p92HTORwpKg9Arzvcu/dmTZMqvBrRNnRSQ4LWgof3rugWlXZUOjinG6TOz1AS7lM9OtEDhz/MFn
	69jyKhLh0KYUg==
X-Received: by 2002:a17:906:f58b:b0:c1f:8021:deef with SMTP id a640c23a62f3a-c246a390c73mr2711178966b.10.1787576144662;
        Mon, 24 Aug 2026 05:55:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 2/9] pwm: rzg2l-gpt: Convert to waveform callbacks
Date: Mon, 24 Aug 2026 13:55:08 +0100
Message-ID: <20260824125523.131762-3-biju.das.jz@bp.renesas.com>
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

Migrate the rzg2l-gpt driver from the legacy .get_state/.apply ops to the
new waveform callback interface.

Introduce struct rzg2l_gpt_waveform to represent a hardware waveform
configuration holding the period register value (gtpr), compare/capture
register value (gtccr), and prescaler (prescale).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Avoided recalculation of prescale, if is_small_second_period == true.
 * Moved `wfhw->gtccr = 0` into the if block in rzg2l_gpt_config().
v5->v6:
 * Dropped local variables pv and dc from rzg2l_gpt_round_waveform_tohw().
 * Dropped blank line in rzg2l_gpt_round_waveform_tohw().
 * Moved assignment of rzg2l_gpt->period_ticks[ch] to *_write_waveform().
 * Restored clamping of duty_ticks with period_ticks in
   rzg2l_gpt_round_waveform_tohw().
 * Simplified rzg2l_gpt_write_waveform() using else if statement.
 * Dropped local variable gptr in rzg2l_gpt_write_waveform().
 * Moved mutex after early return in rzg2l_gpt_round_waveform_tohw().
v5:
 * Updated commit description.
 * Updated rzg2l_gpt_round_waveform_tohw() to initialize gtccr when the
   period of the second channel is smaller.
 * Replaced period_ticks with RZG2L_MAX_TICKS for the duty_ticks maximum
   value check in rzg2l_gpt_round_waveform_tohw().
v4 from [1]
[1] https://lore.kernel.org/all/20251208152133.269316-3-biju.das.jz@bp.renesas.com/
---
 drivers/pwm/pwm-rzg2l-gpt.c | 208 ++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 81 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 108fa99f832d..2d40c59106fb 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -86,6 +86,13 @@ struct rzg2l_gpt_chip {
 	u32 channel_enable_count[RZG2L_MAX_HW_CHANNELS];
 };
 
+/* This represents a hardware configuration for one channel */
+struct rzg2l_gpt_waveform {
+	u32 gtpr;
+	u32 gtccr;
+	u8 prescale;
+};
+
 static inline struct rzg2l_gpt_chip *to_rzg2l_gpt_chip(struct pwm_chip *chip)
 {
 	return pwmchip_get_drvdata(chip);
@@ -152,7 +159,8 @@ static void rzg2l_gpt_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	rzg2l_gpt->channel_request_count[ch]--;
 }
 
-static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm)
+static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm,
+				    u32 *gtcr)
 {
 	u8 ch = RZG2L_GET_CH(hwpwm);
 	u32 val;
@@ -161,6 +169,9 @@ static bool rzg2l_gpt_is_ch_enabled(struct rzg2l_gpt_chip *rzg2l_gpt, u8 hwpwm)
 	if (!(val & RZG2L_GTCR_CST))
 		return false;
 
+	if (gtcr)
+		*gtcr = val;
+
 	val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTIOR(ch));
 
 	return val & RZG2L_GTIOR_OxE(rzg2l_gpt_subchannel(hwpwm));
@@ -219,56 +230,40 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static int rzg2l_gpt_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-			       struct pwm_state *state)
-{
-	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-
-	state->enabled = rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm);
-	if (state->enabled) {
-		u32 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
-		u32 ch = RZG2L_GET_CH(pwm->hwpwm);
-		u8 prescale;
-		u32 val;
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCR(ch));
-		prescale = FIELD_GET(RZG2L_GTCR_TPCS, val);
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
-		state->period = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, val, prescale);
-
-		val = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
-		state->duty_cycle = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, val, prescale);
-		if (state->duty_cycle > state->period)
-			state->duty_cycle = state->period;
-	}
-
-	state->polarity = PWM_POLARITY_NORMAL;
-
-	return 0;
-}
-
 static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
 {
 	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
 		     U32_MAX);
 }
 
-/* Caller holds the lock while calling rzg2l_gpt_config() */
-static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
+					 struct pwm_device *pwm,
+					 const struct pwm_waveform *wf,
+					 void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
 	u64 period_ticks, duty_ticks;
-	unsigned long pv, dc;
-	u8 prescale;
+
+	if (wf->period_length_ns == 0) {
+		*wfhw = (struct rzg2l_gpt_waveform){
+			.gtpr = 0,
+			.gtccr = 0,
+			.prescale = 0,
+		};
+
+		return 0;
+	}
 
 	/* Limit period/duty cycle to max value supported by the HW */
-	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns,
+					   rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (period_ticks > RZG2L_MAX_TICKS)
 		period_ticks = RZG2L_MAX_TICKS;
+
+	guard(mutex)(&rzg2l_gpt->lock);
 	/*
 	 * GPT counter is shared by the two IOs of a single channel, so
 	 * prescale and period can NOT be modified when there are multiple IOs
@@ -277,29 +272,86 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (rzg2l_gpt->channel_request_count[ch] > 1) {
 		u8 sibling_ch = rzg2l_gpt_sibling(pwm->hwpwm);
 
-		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch)) {
+		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch, NULL)) {
 			if (period_ticks < rzg2l_gpt->period_ticks[ch])
-				return -EBUSY;
+				is_small_second_period = true;
 
 			period_ticks = rzg2l_gpt->period_ticks[ch];
 		}
+	} else {
+		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	}
 
-	prescale = rzg2l_gpt_calculate_prescale(period_ticks);
-	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
+	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	if (is_small_second_period) {
+		wfhw->gtccr = 0;
+		return 1;
+	}
 
-	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, prescale);
+	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
 
-	/*
-	 * GPT counter is shared by multiple channels, we cache the period ticks
-	 * from the first enabled channel and use the same value for both
-	 * channels.
-	 */
-	rzg2l_gpt->period_ticks[ch] = period_ticks;
+	return 0;
+}
+
+static int rzg2l_gpt_round_waveform_fromhw(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const void *_wfhw,
+					   struct pwm_waveform *wf)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
+
+	wf->period_length_ns = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, wfhw->gtpr,
+								  wfhw->prescale);
+	wf->duty_length_ns = rzg2l_gpt_calculate_period_or_duty(rzg2l_gpt, wfhw->gtccr,
+								wfhw->prescale);
+	wf->duty_offset_ns = 0;
+
+	return 0;
+}
+
+static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   void *_wfhw)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	u32 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	u32 ch = RZG2L_GET_CH(pwm->hwpwm);
+	u32 gtcr;
+
+	guard(mutex)(&rzg2l_gpt->lock);
+	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
+		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
+		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
+		if (wfhw->gtccr > wfhw->gtpr)
+			wfhw->gtccr = wfhw->gtpr;
+	} else {
+		*wfhw = (struct rzg2l_gpt_waveform) { };
+	}
+
+	return 0;
+}
+
+static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 prescale)
+{
+	return (u64)value << (2 * prescale);
+}
 
+static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
+				    struct pwm_device *pwm,
+				    const void *_wfhw)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
+	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
+	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
+
+	guard(mutex)(&rzg2l_gpt->lock);
 	/*
 	 * Counter must be stopped before modifying mode, prescaler, timer
 	 * counter and buffer enable registers. These registers are shared
@@ -318,14 +370,16 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		/* Select count clock */
 		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, prescale));
+				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
 
 		/* Set period */
-		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), pv);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
+	} else if (wfhw->gtpr && (wfhw->gtpr < rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch)))) {
+		return -EBUSY;
 	}
 
 	/* Set duty cycle */
-	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch), dc);
+	rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch), wfhw->gtccr);
 
 	if (rzg2l_gpt->channel_enable_count[ch] <= 1) {
 		/* Set initial value for counter */
@@ -334,44 +388,36 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		/* Set no buffer operation */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTBER(ch), 0);
 
-		/* Restart the counter after updating the registers */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch),
-				 RZG2L_GTCR_CST, RZG2L_GTCR_CST);
+		if (wfhw->gtpr)
+			/* Restart the counter after updating the registers */
+			rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch),
+					 RZG2L_GTCR_CST, RZG2L_GTCR_CST);
 	}
 
-	return 0;
-}
-
-static int rzg2l_gpt_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			   const struct pwm_state *state)
-{
-	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
-	bool enabled = pwm->state.enabled;
-	int ret;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
-
-	guard(mutex)(&rzg2l_gpt->lock);
-	if (!state->enabled) {
-		if (enabled)
-			rzg2l_gpt_disable(rzg2l_gpt, pwm);
-
-		return 0;
-	}
-
-	ret = rzg2l_gpt_config(chip, pwm, state);
-	if (!ret && !enabled)
+	if (wfhw->gtpr && !rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL)) {
 		rzg2l_gpt_enable(rzg2l_gpt, pwm);
+		/*
+		 * GPT counter is shared by multiple channels, we cache the
+		 * period ticks from the first enabled channel and use the same
+		 * value for both channels.
+		 */
+		rzg2l_gpt->period_ticks[ch] = rzg2l_gpt_calculate_cycles(wfhw->gtpr,
+									 wfhw->prescale);
+	} else if (!wfhw->gtpr && rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL)) {
+		rzg2l_gpt_disable(rzg2l_gpt, pwm);
+	}
 
-	return ret;
+	return 0;
 }
 
 static const struct pwm_ops rzg2l_gpt_ops = {
 	.request = rzg2l_gpt_request,
 	.free = rzg2l_gpt_free,
-	.get_state = rzg2l_gpt_get_state,
-	.apply = rzg2l_gpt_apply,
+	.sizeof_wfhw = sizeof(struct rzg2l_gpt_waveform),
+	.round_waveform_tohw = rzg2l_gpt_round_waveform_tohw,
+	.round_waveform_fromhw = rzg2l_gpt_round_waveform_fromhw,
+	.read_waveform = rzg2l_gpt_read_waveform,
+	.write_waveform = rzg2l_gpt_write_waveform,
 };
 
 static int rzg2l_gpt_probe(struct platform_device *pdev)
-- 
2.43.0

