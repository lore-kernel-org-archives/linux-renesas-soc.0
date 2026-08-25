Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E8648B398
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672939; cv=none; b=uMAvZq7PDzrEES/190h6mLif082mQU7gD2yeuB6axcPP8nrs15wXclwQnLN+86GONuZFlaGE8NGS5ea0xycxttuXXqQ0CAD7FUdhC5hvza6T153Syx5ln+nigYFz0zIoLcmqgZkZQwC+hc66UlxHfRfL8yevJEjY3WXcmDI6Jx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672939; c=relaxed/simple;
	bh=XXZ5i5IksEBJwAVQKMAf++N15Fqn4fMxzGytdUiCm/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQqYMy+PZCWSfhFcLPIk6G+ZHrL5UuiOe38AEWGUvPTpnIWCa8bq+gU2QKGR/FIWvLdhKM26XLrDiBn1K+sOiWG1JP9wE733CM/QtPjBe6Bhnnqxw+aZ1yM5gsj0Qz++gWQEcugVyB6E+dd+mtUhldkLETovuGsNWIj2theii4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9J7pjkj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9J7pjkj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so755078666b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672935; x=1788277735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQ8qhR8/HKXyE4EUMBBNGdK4y+PK8YryxX3K0VTnjak=;
        b=M9J7pjkj0WftVRVx4KHhBuoGJF9dAgEJyqWsrc6kw2VkwWMpOzWZzAjda0MtcR0ElP
         +TydhwXz8P0ePH9ZeHUnC4NiIeQxDoyqYqNJTciEI6ckNzLc8i9SUvXcTk/KlR5p1X8G
         nTMAy+9Yk5mnrxZtamv3GvFdWXcRQ0aYvCjR6EKbtvzJuFimM2JJRZAkQqlX/JP1HaNj
         a8zd0kKU4tt0BZVGPrgvqtsvU8GwNuJwMIWtY35TO0Dovgrc5+uLTRXbxxApaWc0WG5y
         4EPsnj/B6F3DJWtvi49KdMIGspVxsfPh31OyP3ag0BxKysOarTDzZ/2YtqUOT0gqmUfb
         KSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672935; x=1788277735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQ8qhR8/HKXyE4EUMBBNGdK4y+PK8YryxX3K0VTnjak=;
        b=TPgRp1Bix1euYLv7zakfwm2CR3rxN7cZVbDkz9fShvRWjgUfFWzP7R9fcaEkD3pj5K
         z+yEYP11A146QZByUz2a/5iV0XTxr3dA0ddv5AFGB82ft7OGN0+VKi0+ij3hSfLuPaq1
         oiecj7YF6fe9YatNug4WJBsitXgSiBgNp5ZXQi9Jr17dAHHnN8suTnt7887AERQsHKQw
         3YzEVCzGlVw+JyI/38DqBqo3oMC1YJAWsndBFxtZrP+ERvP5RDqD9bOSCIlEzwztbBn6
         61gpIFwJQm9J6dbvuY9Amt9hmNBNJ7z0jUixMPRQ6N4uHhVB8u1jnbJsvbz29tuTuhXu
         Cqrg==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6HA0/uU6XQDlx/jnzm9K+++EcjHLFXJNHlx3aeTgP2KpKHpRmRevsicH4hK4rALZz9m5XSld/UhEKlk26fGStg==@vger.kernel.org
X-Gm-Message-State: AFuF++kcY42Ncbty7QbWSJY4Vj4LhTOUNo8n/I/c+rSxbgW4JC94Hp3H
	qZjZbNkKqg24d5EznE2p4uwyWtOaFYhqeIpN5Qz04nkwIkGts7ZdddLv
X-Gm-Gg: AR+sD12zp2uxLVCyNBG3SGCCPqa53aWpHKK8JNcLPegHv6pzRwabOPAhArmjwxHwZP7
	zN+oq/j8IpPXy9LldwkEAg/WSXtclEM+ep3aVae7zLwP7pazzziz/k1m2zn7YpRbrpU4QGFLKAT
	oRCkWbxKyORVhf481TTJbzfFJ/pYj0+MSYZXob15IyH6W7gx3ABPc3GsPrf17CZND6S8sVOLqxG
	wDgU03HFOTMWF1JGjAUHQUaN9/pFPd5ZjcuEENgY3DRKL2h5+V+Bt9qg/SwVn70hCEEuadgl9Mg
	PZacwMY9ZzVIp5qnAK+nAN6y337qGO/tZwFcpZy7dZkQCYbIn5AyuFpXhWZ6Cvz/4TzaVn0cHgi
	xOhUvdpMjD+QUGsE12n7XedW6+8tJgaDaaIl5B5FyjdXzgjBH104Hfecv3G3k8M95c4BqUoVLf+
	tdZMzEbRCBukiy7iTG4w2BtC8uSzI0IfzrPQQq912YZPgJ97VJmictIqxnY+SmYXNP4xWjXdJym
	502iqaIzazX
X-Received: by 2002:a17:907:1c0f:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c24925e4915mr2610407366b.11.1787672934816;
        Tue, 25 Aug 2026 08:48:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:54 -0700 (PDT)
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
Subject: [PATCH v8 5/9] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Tue, 25 Aug 2026 16:48:33 +0100
Message-ID: <20260825154847.197948-6-biju.das.jz@bp.renesas.com>
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
v7->v8:
 * No change.
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
index 47be358cd749..a5f85a510dee 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -78,6 +78,7 @@
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -293,7 +294,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 			wfhw->prescale = rzg2l_gpt->prescale[ch];
 		}
 	} else {
-		wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
+		wfhw->prescale = info->calculate_prescale(period_ticks);
 		rzg2l_gpt->prescale[ch] = wfhw->prescale;
 	}
 
@@ -507,6 +508,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };
-- 
2.43.0

