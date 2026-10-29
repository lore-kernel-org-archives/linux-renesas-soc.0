Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300308;
	b=f9p5s96zH70nIeXoDbdS7j5mCq9yKmrdreQrARNuMidHrA+RB8ecyv1WVScr1VGo77nN
	 efBlrCT7mWxzKcR2rFyrRFvlyQKfxc0zVTh0NWFeJIcFOKtJgnIyFDdVT4BgBL96cwuym
	 i02Ja84utKzd5URrdn7Kw+t7QTREmOAn/OygsKbrM212Fh5g060AWrmD2IU8mo+IWFlfU
	 zxQZKrOCm6IOtFt9YmBjIscgNpU/WEPxLVqrYLw7V3cVnQuDnz/g1q7wBn7Qmv7NCpTpg
	 5twp6FmlVMGiJh4Js6eABWB37WwTtd4JM9TbMes7nboQK7Xv89og1eDOnIQEGzR5gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
	b=ERHgAPDikwTiYSoOFdniMuaME1GVvuSTA27dC0v6O/0BABbLOycsIJG7utT7uqNqlygo
	 c6Wnbl+7om+cV0p6ee4GaK4NmLeI6h/yg3m0fs97kkfutoLpF6ZcYjP/TwefmLB5Se0G8
	 lvBDWeVVl462sQ/0K0uOs0CiSkj9jIeQCbvwATT4IDkHhxcwPLSZ3cgmQgaswHhiLHl57
	 KuFpbQB8H7QtXe9WX9ovuaeNLZ4kTciCyEZRu3q8dMXirKrQYtWLPE91o1Lsas5m4e98j
	 nTZbs4B+0UtmU30Hc4hqNmDaWhaLD1fSKkO5Ij9X/1TkJxWhUVeXsMAtel7HL2gUxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TV/vTGGO";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3421606A322
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 18:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3421606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV/vTGGO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso18516605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2026 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300306; x=1793905106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
        b=TV/vTGGOstd22JNi+XZy5ZyO/VglSYY1PcHwLCZU7JXszjXWAMmrGN1AU7U/g174G1
         ZoTocD4mLiM/kAwdDedfLXCggHPkqJlgrcz1L6SBKfzN7OlndquSs4i0MdiUVtH0HiYB
         cpL8n0h9qYX6JfY7E97Rkea0NKN73L3lhUL1SeX28UQ8FZDX4G9Ucawjc5v+21zdh2qW
         4Y67DSPr2e/4PjV8KwtUVooXpW9hWNCtT42Zb3i3NFUh9yUfHGt+a9dISyJS1BeW1caq
         3vJYxUOC0hNkTwyXGziakzbLOhJbMS58s0zUrz2FtqjzobxIdpKEzcyraYVADp+af41g
         L4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300306; x=1793905106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttAFEn+rtoPJmo/PrIZYDo9pnhtVsoutuS9qQ/v2fuI=;
        b=skcXcUJIU5r0kpqg9gIDQoQlmSN4LPG1T0s/F4/35MxRFWr7aMw9nAt2Pu01BMpncR
         9jn/kKYvFWEXUEgzmN5GT/T4Loax/U3Xx5XqQxjo8mBrN06QN56cdjKkzxPeFrYQK1Ki
         b1wAwVMf9Cm2vMF6WrHqn1sX2V/nr8T+wjZjDClTuaTRwQEOvJJ+MUwadiYaTy7sTQJr
         UAAnwJJ8NlYE51UWPvHlG7eK5I/RCMY5BkDXKzmskm0IB3gwj/O4coOQbJ6K/x2lFBgl
         2auiSA7wcRaayo3C/YOxYyYI10dmS5F4rDCsVsGynInPGiAKoiETpXarkbgy+gxn6paN
         fSNQ==
X-Forwarded-Encrypted: i=1; AKwUvByqupI1LOdZRI8jvvmnoZN0yNnn/nBRbUUczLPgFgdIFXUNT3rhXYnnk2zW8wMnmKxQRtPIWA/inVnrl6KVwKe6OA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVJWDkKvIkoqbWlConJ3ljhYFiBJutDuUoQl+wJPnGGGz7AjJk
	jzWsRjw3SEnbvvmtoD/mg98hG0OLG001JHe8jJRcVXknFOC80PFI0Zn4
X-Gm-Gg: AYBFou3Sir/djwTjfv6hAPfJBBlZLunzifpylhYQXqAb3bOZ9cAXoCQ66aNqazblhbs
	+4HjJT2CHc1b6nA+UZVG110PdS6fmKruQ8nHhe/nWrQLBlEMx6vvZwmI+EQlS/AH7F6hzS80nqf
	0rM0QCfXAt6mYKmTvmFWhrNkCLtrvW38Jo2FSZmkS4Oy3p2BTKZ2ZMFV8YvKnNmgSQZ8HiLZxtF
	+xWxFVL2tnJKak6uN64CknpqGlMti2trpCr+PijUMzR+O89QWm+YWu0tRXc4HT42pm7gL5/icbN
	CUYX5RsPyQJ7iM2kRkO8ly1F9v+Y9IWCBw5lW7+QYnywM6StWe+C8NOlKAbdjPf6ikWGQ1Tg2n8
	VLicXuR/qe3D/7TJmh0kD3agndjl9Iq6p9IFS9EG3XBg/rDsXWdOfQPHWxWYrW7o2RyzmUK6CjI
	Gta2r4stfjFvvqvx4HUdP4xxDdmmd0GL40LoUUckN4ZgtiHTI0LKWzZZRH0j+7yTQPenYZUmB3R
	bJkmFQ7p805DdBdSav1ebf91RF24w75s22VIfgEM199C6vinpZEBX5nJfaFrBah3yl82LuCvNSn
	5QXiT5T2vizt84t+b2gFMc2+5vKq5tby3WoyF0EhR8X46lRls0geYGjRmYnAXZy6Ww==
X-Received: by 2002:a05:600c:a117:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4a9672f93d3mr115987285e9.32.1793300305935;
        Thu, 29 Oct 2026 11:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:25 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:22 +0000
Subject: [PATCH v9 1/7] pwm: rzg2l-gpt: Update macro used for period/duty
 cycle conversion
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261029-gpt_rzg3e-v9-1-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=2552;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=HAxHMX8kKpEO0nGsxRfolxnfmZwWa8sxppL9xeoqPRU=;
 b=ztJxoP306mi752bvcCsH/DuoHpOMDk0/8Fnbefo5G3q5ChO0cHBc3Sm4YBcxS5zoWweibbXrS
 LU2e9kCH5mADM0XAKB+JpaJJEIK3wdzee3VVJGbhfGUmY+xYmyxX5jA
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Updated commit header
 * Dropped fixes tag as there is no functional change.
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

