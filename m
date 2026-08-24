Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572941D640
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576141; cv=none; b=VkekzqWACcM5QS0zhCZNWtJcTGLlYbd2YNyTE1C7m25UfGnNVzTpcKsYaZ2Am4oGtRj+j8lsNMCpTNlm+n/oMoD9MDJml2pi0EaEh+dg+5o/TnQQv0sOIb5/1JE50wL4MIJCQhlzp0h2qoneZ+d8Ecd/cJclu9Nwd6YzkG0KIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576141; c=relaxed/simple;
	bh=yYMxWP4A+NRrpVCC8gDaREvOylF196wwLNFk89y0MU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHBa4sPB2tR6R7f/8he8XE4MPf36ttYq1ufF2t87S6i4bYzwC472zjWD5F5G2qu9DCibBQ6M5/GtWPCMF4Iw2aRPL68ogPPoM4+/0nX3mZMnkgLZcnUkWohxEsbL2qRwoEKvAFxtj1VTA60BjThILNVO4wtolGy7Yp0YPxe3XeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDDSpb5q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDDSpb5q"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15d111ca99so408869666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576138; x=1788180938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qoR/dhTppfDpvNv2/Q5EDuQc2/02Dofvc/NVVx1pJc=;
        b=eDDSpb5qBv4HRdRpoSiMCdJ41a3k/OAohYQZqDBXR1P9+3Ky+NgZF4KLxd0vrBj3Kr
         Bhen6vGTZkCw5Jvc07HVhoDuC+Gl4wCwPVu4ypDwbVPSSoJ3XsBDRnTftuxKC+YgX00R
         HaFJ8msqxmcRuBYYYlzWHKtzuMAh1EOTWa8KQ2J6FDGlNwwR4ter363t+1Dgw0dmorVt
         2wznpYItCA8nZWo0O2CgSXCEjt6Z9XXvqsxYieMU2857ViNsapLWV484vIRhgFfl+3HN
         ApsZpIVCbfzyhVR0ad8QGTVmnYMtUUIB9h6YXy67AxGyIXXcu2ieS4x3bhfrEiItRzbD
         APUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576138; x=1788180938;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qoR/dhTppfDpvNv2/Q5EDuQc2/02Dofvc/NVVx1pJc=;
        b=QgiWJF1+eJbSLob0D9o2dph25RwDiapWbJ2KF1D7bkub8NfK3Zle9HV3JPFlMlv5qU
         ReWnblTuLoSrz6o3dGRXgXNyw6yq5JC1QaEOlIemFVo5FK2y7mJmIVt08MwwoGsowEmK
         XOpo5S+ksGXLxzNmY0R9YZxlk6WB1lDRkJZwGJIfGfdvjp3g/kGVjn29tJ+xaIdEPDZw
         dVYIFyIN5NSMh92Hr+qPTkuLR2crpqrJn8NLSd4301bpmvwLMbuEZFvcMkb0e1xPI2NE
         wfhxjVC0a3jvLty+An18jlLerABV/CUAebr4K+53Sc8EDeduM3Rv0AquwB6o0SgSg1J4
         259Q==
X-Forwarded-Encrypted: i=1; AHgh+RrSugu4IJRJUichl/Q35xGp9Z/TRZtDUcUNS3488E7oOXIXA1+G2NA7Dr4WBwZ9S31MWB7cbHuSUzWTeCcTdwDoKg==@vger.kernel.org
X-Gm-Message-State: AFuF++lytGv3IW0j7hTN6BpN7CEhRPuB3qR1ZJJwacJjt1SLuWpZ0P/x
	L6d+nLK0/ScNICZ81pHAHotACbIh8ih/r5U+Ff06MNPqGddKH88sxKzw
X-Gm-Gg: AR+sD122+FjUxqgkkXk3jlXtmUhBniwa9+QpTtpBzBJk0pSJ17zwj4Qq3lnc5ZJoSRc
	RA86plieE2/q6g/oKzT9VYU2MDuixuLJCH6NXpdeAFvE4TAmKprdXb6ZT96m/ugEcJMPtu7jyFV
	5JDhZwfB+YMpzdUf0+1G3HueDWXBf4v6VCUqYFKLLIFhTS0vvF5dCbZjGioLzS7gSM20/6T8sBT
	K8/sU2SmHip1WviFmfTQJxiOe2iUlUARDYfJwyl2za2BrwQl94jYK/15f9UYESUhp+cPtiU1iLP
	Xx8Veu8+Ncr7OoNtZllIM+b4LmJqunL1VfcCNsBELELTPJekDqM32KOFFHvbzBaOrmaprIixyGW
	u/tHt9JCCyk+wCR3CTjNCiGzVMkU0L0aZCzeioKFHFTWmHhdc2QCVI0/+PIa50h+yZ+mpgSS4bD
	xY6Hd0NJhlfFmuAjUx5OEvFU0qF6H4ZvZ41gWQCMA+EyGlLmsmDSzcqs/uLa2QViKVjxC3lcv1u
	Es8jzuaO9EyZg==
X-Received: by 2002:a17:906:794b:b0:c20:f871:1041 with SMTP id a640c23a62f3a-c24925a396fmr1654642766b.7.1787576138141;
        Mon, 24 Aug 2026 05:55:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:33 -0700 (PDT)
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
Subject: [PATCH v7 1/9] pwm: rzg2l-gpt: Fix macro used for period/duty cycle conversion
Date: Mon, 24 Aug 2026 13:55:07 +0100
Message-ID: <20260824125523.131762-2-biju.das.jz@bp.renesas.com>
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

