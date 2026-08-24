Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F641D620
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576154; cv=none; b=LTMBqpzdW+sdAaUSo5WkkzKcRnAlM7fv5fp/h0+nPfUuZL0KPCPZGeBeVlo1NQ2CTcItmaBBUecnAtf6cwgNVLUFd2/MBTGS9VK9vdHiYVj4gOQnvI5pvilJ3tnNPgxis4h5RvxXcTCLkkH2E4VoMOr4DNesDBpddlXMffcNOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576154; c=relaxed/simple;
	bh=inSxxGkFCfO+Y6k29RSiQ7EJPmZ0OiQhAM6MDMEWVd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uj64DdroUnfkQuvUJzYmHDKg2gHKGoZ/kizUQTWW49iYe1SuaY7Wq05CphQa1xJaVxxG7iQj66VqpfCsfPsMTM7jIkomFBDcpjFRPbuAXWwLpnDOpOe///qfjJCx4ndy/uAiu3oRJBkET2jNh1lIAoA3l/rdh+V1vXS3ip/HpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfQsgHUf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfQsgHUf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20e70a0962so516113766b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576151; x=1788180951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qaSHwszAWXEDRTaC8hozpR5IBR7Lde/0WoXfRxEwB8=;
        b=KfQsgHUfITXop2lajZ84edDQE7fOHWkXOps6M3HNtnWfIqPYFFS/6ElIi2Wi1UFa15
         2m8TkhufVXvCaHClbU4vXpfFxy8TRbGUcWiloBujW7SCXTXyF7wiFvBTTvSFMEHXZcmy
         lPm+7qDGibqxRGd8nOqe1INK0/TFsR7VCADLPbdsv88i27oPkmFlbWgPgFzG5d9X35s7
         lm/c3jbMBLUUd0z50qNRUwgWSypR6NOqMMMVV1r159kxwXmzXwLA3vxOawvpw70xYvh1
         ZtUP86yJGYaWGv+1kx/Nre7r0XiaJXKsG5kLF/kTt28Fi8CsMxwsgKmlJV3UFIlBGhcl
         kT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576151; x=1788180951;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qaSHwszAWXEDRTaC8hozpR5IBR7Lde/0WoXfRxEwB8=;
        b=olMCsIE9aNWt7jU/PSJia9JD5CjxX+qzdtMxT/2YNGqZhZOXmMhh/xBqs42G7Sug3j
         1b5nkNMc/ddMz4UsYW6cnTvOIulGcDIAg3bq2qLnLecxQchyNAOeUe89aywMkJjTP7aU
         ULbxqYvacqM4W3Bm18tDvWQ+sgpoV6qITwaN7+PwMg3CGao6NIyUna7kFNQDSnWXKxiL
         5wg1X084yGGz0mmwjcAkqFRCKq6ZHRiGnjB0SnzVkGCNYgYCRii9V2hzNCK7OmaerNeE
         nPEuEvgbW3KInWeHivv5nx2k6LNDCWbKXwQ+aFCL8ypiLng0jyyOv+ZYx+EcitTDRIEz
         RsDg==
X-Forwarded-Encrypted: i=1; AHgh+RqfwxysoxcnWsp15Kssygsj7IV17KxG3sDZal8Y2TUw6J6imNy4ZmI56RIy3cIH1sMzRNT98vIOlukXWBeMD/xaZg==@vger.kernel.org
X-Gm-Message-State: AFuF++mLC+RISrJl4si34JTv65HmGVty4LJkH5GJfuFhKSvjTOoxJFVc
	UjLbgKoe7MUxtIHQf0tWVKrIo6T/dvN6GOHRPzPgNQh5iWrhrDjwHFhXtsLIvw==
X-Gm-Gg: AR+sD12xjeHUtW47NCZOTJ2qGXV96TDp2X8vJmdG7EK4Logh4Dd2wOZ2DPgVahcdfN8
	SL3L6vAnV5Gza2/GxWcnzYtXJtATtudF7w5CmQiIqMauDJhIWorg4RkLQ4QRCo6fEikVNwlXWb8
	alR7N1g7fcBTwzF9DWBbdxar55VbMVXDcUlLS4fWtznrl6/WJ2JRdnL3asBFfEonBcG5aYl17Qv
	P0BaAAwzNg7K+pALrznKnEohGRoZAiLxTVlOFxIMzuMKbxeC7dxkyLvhoR12i+AL8M+5KR1Wot+
	uP1BbKuucjNPG7ETyPvS64ORjP3a9eKnqspRNvefnkVL8yOiuNkLsUkd28zZDG4f28dlJ8CP990
	vg6o2vbi2n2mmp5IWdwLESPQDFablwvzLk3hZm5CI8USEMj3yYcKghqL0UQB5FjYQBPrFIHsTAI
	IYID0NH+G+0+yeAiEjrSo9TrI4DLkVqQWUmFLQkUmKEPQfH1iZxnXvbOh+ogZPP1Th9t0eYVLfL
	+vjKuue2P4CAQ==
X-Received: by 2002:a17:907:1c9e:b0:c16:3187:997e with SMTP id a640c23a62f3a-c246a4ede76mr2752351766b.7.1787576150539;
        Mon, 24 Aug 2026 05:55:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v7 4/9] pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
Date: Mon, 24 Aug 2026 13:55:10 +0100
Message-ID: <20260824125523.131762-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E GPT IP has prescale factor power of 2 where as that of RZ/G2L is 4.
Add prescale_mult variable to struct rzg2l_gpt_info for handling this
difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Dropped extra parameter rzg2l_gpt from rzg2l_gpt_calculate_prescale()
   in rzg2l_gpt_round_waveform_tohw().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
v4->v5:
 * No change.
v3->v4:
 * Updated commit header and description
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index da2645a42608..fc77c27f0a97 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -79,6 +79,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs;
+	u8 prescale_mult;
 };
 
 struct rzg2l_gpt_chip {
@@ -220,24 +221,29 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 					      u32 val, u8 prescale)
 {
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	u64 tmp;
 
 	/*
-	 * The calculation doesn't overflow an u64 because prescale ≤ 5 and so
-	 * tmp = val << (2 * prescale) * NSEC_PER_MSEC
+	 * The calculation doesn't overflow a u64 because,
+	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
-	tmp = (u64)val << (2 * prescale);
+	tmp = (u64)val << (info->prescale_mult * prescale);
 	tmp *= NSEC_PER_MSEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
+static u32 rzg2l_gpt_calculate_pv_or_dc(const struct rzg2l_gpt_info *info,
+					u64 period_or_duty_cycle, u8 prescale)
 {
-	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
+	return min_t(u64,
+		     DIV_ROUND_DOWN_ULL(period_or_duty_cycle,
+					1 << (info->prescale_mult * prescale)),
 		     U32_MAX);
 }
 
@@ -247,6 +253,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 					 void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -287,7 +294,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	}
 
-	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	if (is_small_second_period) {
 		wfhw->gtccr = 0;
 		return 1;
@@ -296,7 +303,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 
 	return 0;
 }
@@ -342,9 +349,9 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 	return 0;
 }
 
-static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 prescale)
+static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 mult, u8 prescale)
 {
-	return (u64)value << (2 * prescale);
+	return (u64)value << (mult * prescale);
 }
 
 static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
@@ -352,6 +359,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 				    const void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -407,6 +415,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		 * value for both channels.
 		 */
 		rzg2l_gpt->period_ticks[ch] = rzg2l_gpt_calculate_cycles(wfhw->gtpr,
+									 info->prescale_mult,
 									 wfhw->prescale);
 	} else if (!wfhw->gtpr && rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL)) {
 		rzg2l_gpt_disable(rzg2l_gpt, pwm);
@@ -490,6 +499,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+	.prescale_mult = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-- 
2.43.0

