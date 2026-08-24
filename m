Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685F41DEDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576159; cv=none; b=lBsaaUSpDv/O/9ITDVzqZK3GDAYnoJtoyKGNNTMcumQJoFgI68xthNF94TwFxabhwqmWGCRUTXjKAZ6CAfiobRU4ud8XSxjnnZas158hsaYYWSdD/7sufGsFfXrhklemFktPbWf/Hy2NdcwiFSGBxbSqqzOfX5TXRnYMJwaDY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576159; c=relaxed/simple;
	bh=WF43uh9DEFG/iSay7LTzpQsb1QG3ediiaYUC29U+SlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUC4WOf+EHu3joQ0jQdDVhBsaNEF22CjQG6xoQbq3+t8BAH1EPfYvj5hKN/2+MjAkoya9XO7ymUoYDdbkgDR8AuKwBJ5PP6WbCquj5BdB2ll4uRSiVeBINgBL4j/KkzXnub5+9lfJ6jC0oTqJkR23oqgMFb0LT7ximxf2nJ18o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAB2dEu8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAB2dEu8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so3708844a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576154; x=1788180954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJRWjVbAapYcETNapM+o3EvgRbyZOp6oMld1UiTr6pE=;
        b=sAB2dEu8uBu4yUf+7mDfM3aOVwd1snp2dHAacDIZirHzIS4uoCx8N5wwjOemmS1F8s
         h1k2MrOxjR69v6fuXPM4htaN9copvpPiMMhlk4Yu2F1dFGNWAtXzJTssR+7pZFTVldG8
         sXSvS5wUsuo3SCEl9n5n6VzHmtv5GlPNtrEWX6qB/8q1wNpNR2XVEh7SXGH5GvfPetku
         5b6QLg8fTUcLZAWDBZ178SArXtmHfU6oaHn6E6AwALEbwHH8xVaMKlNKKSzXE1oMeer1
         SzYF3mlWArFIMlzhAIPQdVCis4h/8fCt727XnBHdwTkqMChoURWNPYXGdmyjErmrErO1
         ioWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576154; x=1788180954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJRWjVbAapYcETNapM+o3EvgRbyZOp6oMld1UiTr6pE=;
        b=kgNP1rMIBnF9zOlQJFr6fK/SWkzM02p4+Si3cXZjQe29UcWcL/O2hk/k9HeAM3m1I7
         6jThBT3dyUpKoelM9dBhjmowJI2LBqGKQ+x5IfZey+vircl8LgYnyi7baN+iQkYpjhKC
         f4YW6fgTWVSUJDYLI/bLa5ZqutMV6g6tluUeClh8636W/cDTcQZckzpVzQgghV0N6VPI
         PMK9moFDSzw5Bl6S3A7Wl9CItlcanGO74WLqpMszBKn7fJdARfigU9ajWveNvKyOjq61
         /dyHuE5LEzWwprQqyFhAczgp1RfdPdzN7RWbpeCrVHEmkakFk97d9jwPuvDANQY2YyM3
         xdaw==
X-Forwarded-Encrypted: i=1; AHgh+RqGABCZN1LtoIUGMPW1ZY+fF1msOAHKFJxugPECkarVH/VFB7H/5fwzhd0qF9PGtCulLUgn+k7nQBi1EkGgn0HhxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nrbVoavnxQFqtqYTrFch0yMN/ArjiYfGyoacqsGEBZ3K2H1QY7
	kBIIOmSz5AW7c9NIF0ylata3KNAr4E1YnWxoXUYNW38ojZNZvI2UE6Qo
X-Gm-Gg: AR+sD10xEvhEDBeofuEahngleas6KgJWQ4Cu30m3LNep9pcQyPtFyaqvbB94hYOQmP8
	SYzlumchndGLG0NdcZ7RgOc7rD5DRJG5dfonQ3B7/xHmGLX991E7HVTRoIl5YmZVFrynLeGWNRd
	oCVUdljhVOl1C6TZhZa7rwWBtGt2U+Yp2RJryVQDjGBDsBfgRmWaX+UCfixl64Qr0z3pLI+phCW
	8EnlBllpfM41URYeS/o3owkDUQSI7jo/7PFRJKsLgLNVDoQbFoJHCO74OI/09+cXvp9PmT6IM8X
	hsxYIETIaqb4nFtGgW2QedhalX8SLuIrrM/jZLnZ2R9bqIbGV3zfImrzHksr72odMABfdvCRH9H
	Kn74PHrEgCpJ73qBFy+PPw+VRBRpeRd+308vT371frjrnKRAniwjd75Hm8muxxdI5kG/+oAKplx
	3QBMhuI9YS8tUi4hof30K0NLJ5jCKsa5ZIwMja4zaocJoMCtJGi4tOgTUHk08nfGNOTqgZZCEN+
	NPiEBeajurtFDxJ2iuxLUwP
X-Received: by 2002:a17:907:3cc6:b0:c17:cf99:6154 with SMTP id a640c23a62f3a-c246a6176b4mr2915739466b.16.1787576154265;
        Mon, 24 Aug 2026 05:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:52 -0700 (PDT)
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
Subject: [PATCH v7 5/9] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Mon, 24 Aug 2026 13:55:11 +0100
Message-ID: <20260824125523.131762-6-biju.das.jz@bp.renesas.com>
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

The RZ/G2L GPT prescaler steps are continuous powers of 4, while RZ/G3E
uses powers of 2 but with a discontinuous sequence. Add a
calculate_prescale function pointer to struct rzg2l_gpt_info to allow
per-SoC prescaler selection logic. Replace the direct call to
rzg2l_gpt_calculate_prescale() in rzg2l_gpt_round_waveform_tohw() with an
indirect call through info->calculate_prescale(). Wire the existing
rzg2l_gpt_calculate_prescale() into rzg2l_data to preserve current RZ/G2L
behaviour.

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
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index fc77c27f0a97..2a1c5a22484b 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -78,6 +78,7 @@
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -291,7 +292,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 			period_ticks = rzg2l_gpt->period_ticks[ch];
 		}
 	} else {
-		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
+		wfhw->prescale = info->calculate_prescale(period_ticks);
 	}
 
 	wfhw->gtpr = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
@@ -498,6 +499,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };
-- 
2.43.0

