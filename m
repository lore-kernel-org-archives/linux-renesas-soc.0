Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA53BA229
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568945; cv=none; b=YRMRm3k/Xa/9FlE2/B8mCFgmtUWfFdyKR6a3FQZ2rBrx5wZdXzWjSGL/zmWyzZ5thkudWEiP2el0bzjuQoDLn8Unu6OQh09PEXkN4ZgU0eodk/hvbYBV+XOcjx8k/dX6N0bXf898KD/oa/u+rUhRWRIjS34gaEkQLscpBipGOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568945; c=relaxed/simple;
	bh=sc5J0ko6+f5qMruxGnuhxh+K+pC7up54mVtxLBKGuPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnbRIfJypfkjrBL1iSKVJkGHAuNWiqkvzHByDpqLH8UZjRrItPDDsrB0YcDLOQxeU15thxzWIcMj7PDpoxFapAhHAUvVHxtJpzSEN0L3+y1eBd4VP1DV1+FUQy7l+TxNtZ7S8hrEP6lxRBGS+g11CsFheH4SFfYRrkichviTIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U1KKZCpE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U1KKZCpE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso32118365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568939; x=1776173739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKSqR4T8tyfmhs9vyicABDHYtpzKYEAr1dHgduim9us=;
        b=U1KKZCpEFV6hig6YAhBAVymQNch3kbBz1itv8VBJv7rCiruZsoJB1ByggNQ6l4aYSN
         lt837E1FW2vaSQB5nliYBlI9/vloGzR47reJirNc1ngvCalGucPBx43d2EJUGF7SPsv7
         qKTLkcBTx2pfKW8WR0QBgfmYzw6hHamVpFdMztgF8EZbe8pki9uHl3DKhHXwOF536kl+
         0+WrcJSxuUqN6YbYF2JRMmTv6fGu9A1x4pPzGtve3fvUHPJhWRwwDKaGpQ6IM7JHxWN4
         hoTk35G5wCH4xds11GL904CVrnduVVP4hj3uQLQlKVDLoI9dMizpv0WFgYt4sXsxn/j2
         NMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568939; x=1776173739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKSqR4T8tyfmhs9vyicABDHYtpzKYEAr1dHgduim9us=;
        b=Z1CMgU7MNwwGi3Dp4ps2Tkd92gSkgy6WHCOZM+ckRjWRkP8Gd8ur60VfmK3ElabntA
         euqApHDIzqJV98sFuOvYPkw1LTQ1kMeC8BYOGmAlrAXm6Peo3kOXqGHOw/Euwk+Yl5NU
         ao2CaPP5ZhuwRpJPXIfKaUVuHfMeOQbzMCBpL3tZSzxH4Tyqi5ayNGiKz+sZQ9eVsAiR
         08n1SZ6NmSHBKnuRr7VNcmTBfdu7GiEqg38G8WW1qrhzDc/P432H0VEg1z0smgPXLPPa
         eec3cb0ySg/xkqvCNNjHhHRV2ebLe+H+8fgNY39QHHi7WqRinKfBBnCNnn3sl2hiYYq6
         mmNw==
X-Forwarded-Encrypted: i=1; AJvYcCVp2fsNySVZsT8H1a4JcyEvC7tBhG8VXqmTT9fCMnNRyU7+gV2dCrOILdXNjnXhdgvzmluJCQZTYQalWJu1ViRbgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhhLfYMeS8U1EAD2CgjmSb+SkJEjHFQyocHKmzQdK0ui8IsyN
	7W5Hmpc7Zo6YSSM/B9RKdpL4075uocqp4AA/CLP3bbs1GU2uMDAQPb5DXa44sctJhBM=
X-Gm-Gg: AeBDietontx4jCtHbwMvNu7yqFnuc4GUkSwFPlQKmIp+L7XkTBzY3oYk/mkgJNh0mFa
	ElKUm1OJ9nJY2KUL+MlRqYYruVUe5MsznLvB7T+uX5NhF4TO6WiNHVgG1KHQhhrLHfuclEO6EQ/
	eMwsnS9sEOiOKI4zB93mYAiX4hOMp3zs0uWAFWAA7OOp6TEgdBKYeX6X57Wl28c6Ue281PR37AB
	9h6b/jWwKz6uxbuzNd9SVC5orC2pokAvGyq8RvFIqIEwe18sttUFH3Lvbozzt3F5wWOghpGTqjA
	pVSjakxzW8L9h36UaBzbdwrHqGseKr+E4g6ym8miHsrQmiicyeKyF7ZxM9NfspZ8LSVp6PU7UI7
	6wT3M3z36JaV69HHZdfNqdjdJnwpA6C+Rn61B4pCN4jMRyWVA45ngQE5Eap7war/6fKuDBAIHSF
	64r3eMlscuZohm0mNLA2rw3vYr36swHz+KfNEa8b4eYiZOnzLtV2B82Lq+j+6We+4=
X-Received: by 2002:a05:600c:2d07:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488a82fbd2fmr95263155e9.22.1775568939310;
        Tue, 07 Apr 2026 06:35:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 07/15] dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
Date: Tue,  7 Apr 2026 16:34:59 +0300
Message-ID: <20260407133507.887404-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a helper to check if the channel is paused. This will be reused in
subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 083e81c07aff..bfc217e8f873 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -286,6 +286,13 @@ static bool rz_dmac_chan_is_enabled(struct rz_dmac_chan *chan)
 	return !!(val & CHSTAT_EN);
 }
 
+static bool rz_dmac_chan_is_paused(struct rz_dmac_chan *chan)
+{
+	u32 val = rz_dmac_ch_readl(chan, CHSTAT, 1);
+
+	return !!(val & CHSTAT_SUS);
+}
+
 static void rz_dmac_enable_hw(struct rz_dmac_chan *channel)
 {
 	struct dma_chan *chan = &channel->vc.chan;
@@ -822,12 +829,9 @@ static enum dma_status rz_dmac_tx_status(struct dma_chan *chan,
 		return status;
 
 	scoped_guard(spinlock_irqsave, &channel->vc.lock) {
-		u32 val;
-
 		residue = rz_dmac_chan_get_residue(channel, cookie);
 
-		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
-		if (val & CHSTAT_SUS)
+		if (rz_dmac_chan_is_paused(channel))
 			status = DMA_PAUSED;
 	}
 
-- 
2.43.0

