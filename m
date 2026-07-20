Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7223AE1A0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528658; cv=none; b=dX/zsKUKSgQK9isbTHizgfjI1efUzsmiGhFpe5gVoLTTXRB2qXeIG1fZz3LWjDT4GquGhWznr2+9WYh2P+wXBjHLvoBi4UixhdvDombH992UqqUUXqwiy4iaWxYMIse6424aLOVanTroEfkqlQA/FRrac8/ikXgAsk0c1QSgI0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528658; c=relaxed/simple;
	bh=BqIi2660BTiwbGipQFxMch04ohRI7z8sfcaL8IOwo6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLOowsUClHnDArgkkV14KlfzmJ5rr/Y8qdbp6vKHWKMrr66hBMs8q5NB7r9pP6qLEZ0P12UE5ruYlQqnURrnx1Y54Atx3j8v8g7lYsNGGzscB8LhDctKCk8R8uhb3pljbvhEjGADtOc275kpxdNWmn/pVYKV4UV6HXKhq/1WS3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=krgrldFc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="krgrldFc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495635a85d2so85375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Jul 2026 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528652; x=1785133452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnQaZJGUMBW8PmJXvoCRSJmk20vajChp/22T5URlFFA=;
        b=krgrldFc9ztb4EOeAo366hlG7Zlkqtl9J6UdAw6f4mhhbcwbraXDw6SrdNriVMEZfp
         pak/ajbec/y3+QNCKqqiphObTkqvHCmMHOjMb5XB4SVjqKy2mCBGYvcEGVMRWG2j0f8+
         hVntFV3v8QcXV7wEqYX4hk8b2jKyUNY7Y5mRPIIG7Y3Vksl3z1Hl5uHt0lXx1yZ9DkCa
         eOTL5CbgSwn5jX/L8GEIw8xq47khgZmivI2oGe9CRw/7v6z6ifhE4tqMJPD4UN9aqyNZ
         xCktT7bV4Hd43hiRKqq77rS9KHpioc2q66GP7wROHw+MgDzZngAwJNrYY4Y3D+iABJRH
         GWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528652; x=1785133452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnQaZJGUMBW8PmJXvoCRSJmk20vajChp/22T5URlFFA=;
        b=K007oNxAdFSaPt9rlLsEheOcaXAyuVzMvM5BcFjng4FTW1qPTDlrbHwEYltjWuIMkG
         Gos9VEB1EXnlDMCDsJ7R5rvaOneg6E5LhbW6faLE/JcYypgP0F9mVsY8ZwE29iqKKuta
         NtxqHdYETYVs0PA95Zo5BXMgP0OfyLTiW72Qe3nx/ixZfnjeJni4x+KjlrGvEhY9cdL2
         DDYYsaecYMSe9mUeQqf5j4rS/nN5izhiBIE2L0j0InzdJIAtiPOWBXIwyngK/1azRCHh
         FUB/g/3r/EHFrsmSZlbytO/Yv/ipIAASWvm3QiM5Dk51bycvK/W92oei6JWe4ylqjFtV
         /92Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHR89aCXLnHOlesUK7TATc4Ki9MMawVXJCcLVfsg731IZjy0aW9C1tuzqkLJsFLRLzBkhKZO2WhsHxfCkafITRYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAqvEaYVeMbEDDqsLa6cK5Qzz7L0VTSB5P1EYDGbHCmZEXBD+
	/5pUEMbehDRm0467fiPX2GfP1sz86rFs+UpoRtpLDZdi5XSGEyV2LoD4GqfRqkGU2UQ=
X-Gm-Gg: AfdE7cmgOQ7Xpw+e2mrQEG83pPbBzMRnB9Z5pknO5e/MlobWIwarm7DVNAjWiGKSb28
	PrIMue8tzb+xzyuYA1A/2Yoto2rjzHWPK1QD4aPDHB2IwO24SIhX4jQ2SOAMTlkC3HIQtjhoJlM
	nNQJdmM8TZH5Z5LkFCh2PhjagRnpwtiocfzs+/+cY7673dcOGqxYsu3iyP/N1RDr0BQ4jhHZpFk
	Qhn+S2zFD6Orsc5yXapFXK1KuqDVk4LDWTXmnlZrSjSS5Ts2kEJQswFc7Oe1N4ZAIqM0KLHe2N0
	Lli1Y/T9apL6ClOIfdyHouQlVyF5I+cMOf8vWhoV9yNh+qLHRSpAVVf5TKOO2LFRGMjjw8TCYHs
	P1s7MnR2wI94Vkh6Cg5sNpamhXzO4R0iGPKBmHGYqCr2l2YTE/1YNbfnruy85oaIIuWD3lRsZ2X
	djMcC79Zs=
X-Received: by 2002:a05:600c:4fca:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4954e1d843cmr107883215e9.10.1784528651910;
        Sun, 19 Jul 2026 23:24:11 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4955de8895dsm54511125e9.4.2026.07.19.23.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: renesas: fsi: Drop platform probing metadata
Date: Mon, 20 Jul 2026 08:23:46 +0200
Message-ID:  <c79fa0d31abc0c80fbd7b4ec94d95b197ddb9f94.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BqIi2660BTiwbGipQFxMch04ohRI7z8sfcaL8IOwo6k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb72KPtdb6nmkop75TLr5aqhAGIk9bWXRTKQz jo/JTxNKhOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+9gAKCRCPgPtYfRL+ TnFiB/wIAQWDqjeBkHJ7XfgrAz7GJMvtyaVtIsGk6NPvnUKWBv6t9VLPniIH5gOS8R+SMKG7IME fbnjzew+MoY198bLHA7lxGuqhRRiRuJENwUvX3CZcLT7/Pqu+p3hLuHt/kUYy7iPGhlE8rOclrV BEtQirzsgbORBy8e6FPnnbudlef3Luz6xceKkUgZAH57jPvFwrOsU7XMVWZsyt0fJgAtlWxRisi WO0+DXo0h10zh3XG/kSTfuY18N4WQKDrb2Kv4pK8QwWwQ6zbcGgR+5Qex6I+9JknakGcCWlBxrh frq+8L2bHHRQYFacklNPhVjYAjRNN8gi0iz1bH3uIqxUCZGX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 38d3273075d6 ("ASoC: renesas: fsi: remove platform data
style support") probing using the traditional platform bus matching
isn't supported any more.

Drop the platform_device_id entries that should have been removed in the
above commit. Note that keeping the empty array results in the driver
not matching on "fsi-pcm-audio" (i.e. the driver name).

While touching that array, use a single space and no trailing comma for
the list terminator, which is the most used style for this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
I was unsure about keeping the array. Also dropping
MODULE_DEVICE_TABLE() if keeping it might be worth a thought.
---
 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 6be6587e1095..23b7e63596d3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1979,8 +1979,8 @@ static const struct of_device_id fsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_of_match);
 
 static const struct platform_device_id fsi_id_table[] = {
-	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
-	{},
+	/* an array with no valid entry prevents matching on driver name */
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, fsi_id_table);
 
-- 
2.55.0.11.g153666a7d9bb

