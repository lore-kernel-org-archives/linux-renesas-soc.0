Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A94028CA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672935; cv=none; b=lbC38ZHPIjCp8BQJoYISIa2sUx5FNugeVcscADoCZBViSWCvvpNvyJh6fs+oyNhxc57D/yApz0accY9Y+mP1RFfrhbAvmk9r87mSoqdxwWYr0l294WiChC6WQsmd/O0BBP8BW0Bhp3wXekhdIe4BYt37OGx/he+/deX7jTOFm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672935; c=relaxed/simple;
	bh=DvwGC2hiaOQv6vXVCrf81R5oEbk2paFhxZaDMe7ibeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkxCqMhLDLe8jPB67gNo1RSih7afvW2v8HQRdSQ/nBsyRIIO9mB8fYthm3Ey1BH+rmYyA480NXET/uHIP72Z15e7ylVHD0bNoy3+zslHS2VG9EtWE7j1bd2IdbBag4VBXZ8/5hxxbLEbMR07QJEklq6apIB1sQtZbgvd4jcGYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3s0h3T4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3s0h3T4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2020421077so846589566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672932; x=1788277732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPZf7gPmP8B8UD6UqrTKwvbuyubRbJ0al5ye5Ryd+7s=;
        b=c3s0h3T44vKPK5Z+WgyPQblZTtBwOfqG+W9+5ZjtZYJ3jgp3FvtZk+zS7/1zTXDxLQ
         ar/Yh6vKnYZcxY1MmNbBxPfAV7CYYvGuJYxBU3q/XXR9IiW5/c8N2V2W+6sLfOyDtWKJ
         bz/W5GSFe/WRxGoYiBafyL9H/xLvyDoLJLAOK+eviBkfSAOfmJCcQkQKlbYLIOXrkCv9
         yvTy7gsZhq3fPCraIC8seOWwYZBHJsozFMr3ev+FaJNQS19x+FLsa32lpTnMHsHbS+3B
         vb4mKa6jRDumUukvzql06u2x1Jtq1mNSPo3omiOvV0maNLhmGINKPFXsxU/oOABgIAsS
         mqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672932; x=1788277732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPZf7gPmP8B8UD6UqrTKwvbuyubRbJ0al5ye5Ryd+7s=;
        b=ZvgQt6WoNz/S/VQ2KG2KnRBetnK+m3bzzdmuIF9jIHgF/5XqMNJOzXt4bC2mFt/2da
         ZttAzpeqo7BjbaG2+3oCnvafY3acnLAXCR/plIXMyiCBDFelf820GB5ZVc5Yckvupcg7
         7q86My4qxxHe0QbTUxsolH0bKqNGpcoQ7wtEZWaO0wa1rLu99SRRUnDF+bqUzNQAZFHM
         rsn1tTLE7SP2+9xsqDLpHeaj3H9YVL6JDcVQqVFMACiLZ+esW+cmJiOB5fepewEgkA6w
         QgF9RF0IwekcHwcOOMCFgCEkKIq7KDqbaDOtk/37cOs7eFTi8Ybrk1jdJnig3lBijhDg
         un/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2yLK60kmDwxZUb8gU9nj5KzbOfwNm/rwZRdKVtudCOl7M14LzMENpoOJu3Fp8wGB3fEQF7UGSh9/SNwPRmxMTWA==@vger.kernel.org
X-Gm-Message-State: AFuF++lT6aSB6IlWkInGU/evCJoL6EEtTMKrDE1FuWa7Fc5XSHV6+DWI
	ISO9wrADtVj6qSELQ67YkH/qiiK0kYwh9ZcfTE7BWV5DaXlp48ditKwi
X-Gm-Gg: AR+sD10gPl4l1CPy2MnXQuVgcsmyG83nieCEHNr2L/CdyEC+9C2a70fBsW9K7Mrkuv6
	wqWuQM8fHTYfHwKrKu0X9FCRQT8zPGB58NMOloHlZAwCA1U0RPdMMQEuO8PCaeEGD3VbIX+JZG1
	45Gh1aY6kOzJ2GTrJCC8jo3oYbb9dJj0dWlnWG4QwGdqa1/NZ84k5cpZN82i8bwYno1lyGarT0J
	LB9m+tYAQVxUV1/ZxiDa2UkVqV0WVjljJYCuKRMee0qgN2I8FeKEJ0pdh23bycSxysYIFfrykM+
	nI50Zph/opURYBwt9KobKL0ejhY/BYxCLPTcEKWjJOaGTEyIZD28wzzrFeEjboGW/rFYYNLeaLI
	ayzlW2+RXpKYLycbAYOT69Pvw6YAMlqnwvegsEXLYgK/n5NSJ0WkbSyhIwUZcSLGMrTjIEYFvov
	KkKjYLKSp8xt98y+rYZoFAbGE8LvMEGOL/jxzIx6jZnTEjOxWjl/mv80/ZWEys/iuh/ZHnnnv2p
	fJXRWVutYdi
X-Received: by 2002:a17:907:9626:b0:c24:87e3:b8b8 with SMTP id a640c23a62f3a-c249209907amr2738438566b.17.1787672931520;
        Tue, 25 Aug 2026 08:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:51 -0700 (PDT)
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
	stable@kernel.org
Subject: [PATCH v8 1/9] pwm: rzg2l-gpt: Fix macro used for period/duty cycle conversion
Date: Tue, 25 Aug 2026 16:48:29 +0100
Message-ID: <20260825154847.197948-2-biju.das.jz@bp.renesas.com>
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

The driver converts state->period and state->duty_cycle (both in
nanoseconds) into timer ticks by multiplying with rate_khz and
dividing by USEC_PER_SEC. Since rate_khz is expressed in kHz
(cycles per millisecond), the correct divisor is NSEC_PER_MSEC,
not USEC_PER_SEC. Both constants evaluate to 1000000, so this is
a readability/correctness fix with no functional change, and it
keeps the calculation's units self-consistent with the comment
describing the overflow bound.

Update rzg2l_gpt_calculate_period_or_duty() and rzg2l_gpt_config()
accordingly.

Cc: stable@kernel.org
Fixes: 061f087f5d0b ("pwm: Add support for RZ/G2L GPT")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change.
v7:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 1569f3ba8c53..108fa99f832d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -208,13 +208,13 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow an u64 because prescale ≤ 5 and so
-	 * tmp = val << (2 * prescale) * USEC_PER_SEC
+	 * tmp = val << (2 * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
 	tmp = (u64)val << (2 * prescale);
-	tmp *= USEC_PER_SEC;
+	tmp *= NSEC_PER_MSEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
@@ -266,7 +266,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u8 prescale;
 
 	/* Limit period/duty cycle to max value supported by the HW */
-	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	period_ticks = mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (period_ticks > RZG2L_MAX_TICKS)
 		period_ticks = RZG2L_MAX_TICKS;
 	/*
@@ -288,7 +288,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
 
-	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, USEC_PER_SEC);
+	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
 	if (duty_ticks > period_ticks)
 		duty_ticks = period_ticks;
 	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, prescale);
-- 
2.43.0

