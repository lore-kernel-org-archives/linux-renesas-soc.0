Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191888;
	b=20Pew2caAeHH9hofwuvJb7VFXSanZbZKZ0jB/zi2tSNuEekawe8Dzv8H/nIV+HiiOPTy
	 qGzu7cGH/gFmzuX3I4yhBZdXC5BpnvPVwOl5KDwG2TBoqF91aQcz96bTcYVNmQL3mB0h+
	 7XNMbD2DTgbZNoj+Hr8NCCYrWXO53W4skfYi9VF2jiyFkcnLE9h/t8uroRAUq7UOuhhFr
	 5ZI2ENTmgIRAvhxn+0PZgOBojAhkBbcQq6Bu426qJnPLkSUp2dK2umNNbCtU1aF8P1DHI
	 UN4zIYV0QEp2k1PDfAWPuu5h0hqP/Pvxv1ZV8CHPu+gkLObRzlvQpeI44KIZRxZVgVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
	b=1ArvuCxdefPT5IhQtML8K8TUwXkODLB/hwQzZ2AaMrxHEAIsyFuqkb0Rtt0Yw3PElXTO
	 rJklUQnwUFRqSKTYmjO6sRyOTFja4pT97/i1JKU6Wd3R22tfezBNawGgmxGp6igX+73JS
	 +QGZs9V+lXsgo2T76EcY/p+t+u//UxTvaysHNpsJdV8SsVxT9kAGj4iifaP4TaGwplRDI
	 rg6spYz0nt4rIA1uCZXzoZ+gLTT7Xo5uBl4rpHoJBuPqTyiCnud8jW/tpFRVD/ZPn3Wv+
	 L8IgH5HCNUwN7C1HwHbI8pUbGyM5zQ45/FGp42tDJWZLYUZCjeMmU3FOgX4gBOMGwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qddV/XTd";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87760A2634
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B87760A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qddV/XTd
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so7221395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191886; x=1793796686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=qddV/XTdK2qf4I+nsRzvr3wxU4ipN3wSfOaPvLvujN0VGY6TuhUeop7kAQFRpwzkl9
         Yf5aKY2keNoA6WCgbAbm4FI/1bBHyXMjoaItN/pa/eKHvojIMsSOyLDw2g+kmWxvPIxH
         AUQtAHQP9GwKwi9dkQIFakQC2aXhlheQMlCVql/A7XTM0oOzmEnBuBOvofYiH+5LAgYf
         SWYsURU2tUsgKXBX5ZMyd2hjdPuMQ0caJ0JVjjLC9W/qlybIZJzv+v7PwxXmzmwrC3OR
         yj3z/HeAMNoygZG7Pb7Wo/eWefnNvUFhLtiHhdzE2DcnqyVDG89lsWMyC0OHoXSw6+Hj
         BTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191886; x=1793796686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=utmUwzrw1OHdN5K/ZDA5sxqeSjFGiOKIjPuUFN1Yc3hrXL55PktTnicJ7RERCTcucN
         WTDH4H5jBvCLrwYEAY0dATV5G4u4w8/koar+frGJJr91G55K9EwjHT7ei8UX6q2N5IpH
         NK7tEc4TR890RLLRhz+IbmSaKJ/Px00lr13kFUpDRZwH5FewngFzWd6bi5cf1RfeRbE6
         g0ADHTMoabG/0sWpueQxRuPNeTWvepuxQC1JgPoOJ4YEMqzrs/IBOVR0vRLFswfXkUhx
         iKcRGD8/AhQ2FNdyUfhvY4JwYRE5TqksWfkk0rWh4Qp0WeYGX529QS9xbYyGLngFvveR
         8VkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5NSAcMLmSqdGQoz0TwEQKdMWU0K3QF/Ic6vnZXGiLNAdC4FG44/1PHqTWHYy7vCw2XjW2+Z7oIUe++qKKHGUGWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKvESYNdlrqyAKgB2fvYozKOsLMJykkNxMG8T0jfSg0cCioEZ2k
	qh9B2VXfP8GhZItcCDQMpSHxDTf+dSm6Zwp3WrU8T8FI+pXY9YggFyeY
X-Gm-Gg: AYBFou1bkq4c0X6eYRtbkGlEJkxXm9wfGXCWIEmyiP9Pmy8qfPxlMkoiicK0OzLmAvG
	YHgw/zfh3BHYx6XoHIUD78/ySZTbGuAVcIQs6Ndnd6rDN/k/UBauON6ldL52WzDeOdi45f6WkBR
	I6gGFzWZf69q6JqLgs9LUHKKGsAR6Q2VnvbZMamrkXhH6WEfnVwUrw3K0qZK/02h3UVY1157RR/
	96rgjznZ0AaZOyeZONIj6X4Yxu0PzpUPsYJPVy67VQUta2ZKsK7nFDPdH57vWBYNhyfeyAbYTyE
	iSNhLKPWizdCaMpVlFxJMzfq0+7B31+ItCjPj3VW/UubO9/Q0spOkHNj3WWG/IwRcz1yr8r5GoK
	Hyj8YKnhQvweq2lLG+rQmr/3vAwVyIiynUuJNaFIJANbiZmSOrx2JQFjAJ4ozgEbfobl6GP0ox2
	reP1I2VpJ8yCHz6pFzY7PaDePEUbnZReVEBa5m7QLDFvnl6CygXdpiQfRHZ9kRitwzOL93Ka3BU
	2RquICcfKzrT5ILTdHeCW2/O9PNX961hyeb4UcOoahoCInq0UHhs2KgLy95hWPsPoml20vV63s4
	Qg77EgHy46n43HJUQPHBc3XU64wLixqUmMZbHV5oIkf842WhyuaM20pv/3ZQCD5Wwgg=
X-Received: by 2002:a05:600c:4754:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a966c41e6cmr44785315e9.22.1793191885760;
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:22 +0000
Subject: [PATCH v25 05/11] mmc: renesas_sdhi: Add SDHI_SD_CLK_CTL_DIV1
 macro for 1/1 option
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-rzg3l_sdhi-v25-5-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=1939;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=9RhLI0TxhP/BG9bZ8qAvVR+kroaEpg4uYm47POogTgc=;
 b=bAXkYzWXua8bUQGEteyij3DZYjtKacYh1Q67iPuZtWKoG75gYgMUt/1qBjXCnhK09UvBtY2Ru
 YRn+W+rsQbBB3dANNs6hNkWY56Xkbm3+Y8xpH8Xnmvw83OSSUbHDyQJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the magic number 0xff, used for selecting the SD clock 1/1
divider option, with a new SDHI_SD_CLK_CTL_DIV1 macro. This improves
readability and self-documents the purpose of the value at each use
site (setting/clearing the divider bits and comparing against
CLK_CTL_DIV_MASK).

No functional change.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change
v24:
 * New patch
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b54802c0807c..b759376103d7 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -24,6 +24,7 @@ struct renesas_sdhi_scc {
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080ULL
 #define SDHI_MAX_DIVIDER_DEFAULT	512
+#define SDHI_SD_CLK_CTL_DIV1		0xff
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 74834e72f038..500ecc357095 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -227,13 +227,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	/* 1/1 clock is option */
 	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1)) {
 		if (!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
-			clk |= 0xff;
+			clk |= SDHI_SD_CLK_CTL_DIV1;
 		else
-			clk &= ~0xff;
+			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);

-- 
2.43.0

