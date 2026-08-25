Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1F48B371
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672938; cv=none; b=pk7x7MCK6Mr1hf3mNbh8hnLprNMqCi9q3bzfPKB1E5rYn61NbXbpwUG7T/JfQYq9IyB0T2uRIvSjrkjo6eZd1VMwmcDUYQNh7i1HIdgba0QLHAUbzn7CMttOWK4Qq1SfiFBJ3EsPpbTjqAsBIxbGf1sB0pMLQZiqhKj7XyBnkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672938; c=relaxed/simple;
	bh=MC7THKP3n+rONNU4ruiX6A/Ys9tL+iBw1lcqRapc5MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y87lmbxq447yS4mcD57yYO3pyCJDnqjku3ve3nr7UfMJlQIJsdBCoEJjrUVf0gwL/SH8r3sCNyyBT4dAqNa/NN4Rvk167a9B89OoPCmgV486M8hI08n/9GaV05W0XB4BiJPd3/aJxnmx8ceRrUxSB9rPzD6uNsLiVqf4L+Z+BcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOODqF84; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOODqF84"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso8313637a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672934; x=1788277734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MExga4WlZgw7CqaXNVe0QE7cTJjo0WpKD+kxUNlUNiQ=;
        b=aOODqF84mmcwDdNCOUJEgrX4Nnl3yo148cowAkou0hmck+vxph8wHpAOfUZeZ+ZoJo
         DSHbY+U7K788cuaRsuWBaoTekmnTn6pdqgfZJhnLstNEbJzruvonA8mfpps71wYdp4u0
         9kDE7o+PjCJtSlFUyK7yqTXgYURyXvqcGblYIC1eWryE3t/YqdXawcVAaihz/7JMmGc6
         +45/xBhJ8ZTKAapRSVGckOL0pA8H6vPdrjtH4gzM0PE69S1GpOHGPpHrb/B9n7n52pT3
         34dTBitNWJxrcDfXGWwdxP8hUjGOC0/xdXNeNf5b46HZkg1BlNW2N4Kwp6I6Ls+SjnvN
         IR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672934; x=1788277734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MExga4WlZgw7CqaXNVe0QE7cTJjo0WpKD+kxUNlUNiQ=;
        b=r8nXaeYsWN1P/vPCCgK5NgQK8QNil3JGn/odaomYe1ncBI27rfEREWSB6ATmnZ9n1l
         T567dhbo2Zv6qxZS4QnJGJbilf8bNfNPJWkCFq1DEw/RYY4tx1/lY6dTbt4XKk+fIssb
         3LICJL8iERXSbkgeKog3BBxlXeV10UJm7MmE56fjFfczwrTZubPI+K9CGnYGVnzKfVzC
         g5a0E3RNbYw1RWF+pw6BVvsGuHOJXJecrp9JlwtAZIHFQHI0AvKnP8af9N74qESXT9V4
         T20djWJXLxOj64qmvmtQIn1ZM50QlITrNnN16Y+COqpYncE7LOz9hmYo211etgdQSqOd
         Sd+A==
X-Forwarded-Encrypted: i=1; AHgh+RqPeljJV3PHR8ftBBv6freQdvnCtVnLLtt1zplr2ycNyxKrC4RekUmacknrR0MtxnC26iMWx2K/00unN3nu9IbPPA==@vger.kernel.org
X-Gm-Message-State: AFuF++lsx8UOMrVSKy7TrpO8/O7/Douh2+kezWlYCD3ihlYM7mzu2gl/
	qdT13kuBogU9k2lhbAEKgelFeJqEdOuGxg8kdM/3LUM9qwB+sAZ4W14u
X-Gm-Gg: AR+sD105OZTTecI1/8KOjxr3yvzLoM4ukCkjYObD6xiyiklOJtrMbKglLjtS7xxUN85
	23la9sx5RK/3yr5CMmY5NyeD6C05nNymEpzDUXAI6wy31wJygbUYnkdLaUW2meO+s48Q11PcoDM
	5l8DPSwIU5Gs8Bv4BruVzfk5kXZ0PCpEkfGzVeaR6YRDkjeODkmfBgMrLA5al2dz/TjCz+zpg57
	2xd2mRVsaRMcEbo1Zqq4JaHBEZg5Rm6P07NFOhlwW7VY4ayZAb0u0h9ToJ3zPfdpZ7rqwSl86Hb
	moDVWfkJGSxzvTVV5cUe1CEe+dQI/6Kvx0gqL++9IOu751d84GBTYxaT9dwRKl4fm11g0E8X3H5
	EVHkiTuGHJuj1JDIsp44sDCxZuyGFVVnqz+zcG5+D3AGUQhtzahZ1Kp5ffXQbvd2FxOoqMzn12e
	h09fuRZ1+eqrSOAjiyO+a185ZfwFEAV2xO221Y1SyAI8KZjYvqxKMcvERGQVbJNt1yBoL6KP2eh
	BzkICNllzb/
X-Received: by 2002:a17:906:7944:b0:c25:659:89ba with SMTP id a640c23a62f3a-c25065995b7mr206234466b.9.1787672933983;
        Tue, 25 Aug 2026 08:48:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:53 -0700 (PDT)
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
Subject: [PATCH v8 4/9] pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
Date: Tue, 25 Aug 2026 16:48:32 +0100
Message-ID: <20260825154847.197948-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
References: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
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
v7->v8:
 * No change.
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
 drivers/pwm/pwm-rzg2l-gpt.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 87309f519827..47be358cd749 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -79,6 +79,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs;
+	u8 prescale_mult;
 };
 
 struct rzg2l_gpt_chip {
@@ -221,24 +222,29 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
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
 
@@ -248,6 +254,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 					 void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -290,7 +297,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		rzg2l_gpt->prescale[ch] = wfhw->prescale;
 	}
 
-	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	if (is_small_second_period) {
 		wfhw->gtccr = 0;
 		return 1;
@@ -299,7 +306,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
-	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	wfhw->gtccr = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 
 	return 0;
 }
@@ -345,9 +352,9 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 	return 0;
 }
 
-static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 prescale)
+static u64 rzg2l_gpt_calculate_cycles(u32 value, u8 mult, u8 prescale)
 {
-	return (u64)value << (2 * prescale);
+	return (u64)value << (mult * prescale);
 }
 
 static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
@@ -355,6 +362,7 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 				    const void *_wfhw)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	const struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	u8 sub_ch = rzg2l_gpt_subchannel(pwm->hwpwm);
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -414,8 +422,9 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		 * value for both channels.
 		 */
 		if (!enable || (enable && !rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch, NULL)))
-			rzg2l_gpt->period_ticks[ch] = rzg2l_gpt_calculate_cycles(wfhw->gtpr,
-										 wfhw->prescale);
+			rzg2l_gpt->period_ticks[ch] =
+				rzg2l_gpt_calculate_cycles(wfhw->gtpr, info->prescale_mult,
+							   wfhw->prescale);
 	} else {
 		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, NULL))
 			rzg2l_gpt_disable(rzg2l_gpt, pwm);
@@ -499,6 +508,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+	.prescale_mult = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-- 
2.43.0

