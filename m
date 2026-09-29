Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993E5172F7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679047; cv=none; b=IRkjQe4CatKiHk5p4geLsTQ9kruw0YvJizeYCPKafvboMV1Xxc+JHP0PMFTrHmcq+1JZ2539X0TZapnepIgFFo22xkOrZ7bcHO1wt36ufHTRhRMqIRja50enEmEEsBleIvbGxOHwnzvjzDwn9xlLV3O8JK1OuQ1GLGbF1z2g+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679047; c=relaxed/simple;
	bh=24VJL4yr71yDjFK19B91jRLLCZCsRy4Ks9vH5rORZX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd2rFbI4nSsqRfQFghgFIzfNKTGqVViHejov4F2yT1OPMPU7jIgskCuAnresHFETMt4m6EqPlGxrSt0x26yTglCLRea5SdhTuVGHBQboruEUMW8nlS1QpXgxccnSGIY2WeZ16Wz+bf03Qdl1C2p9sglTajk2sEI33oMGpAKP4cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtehukGn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtehukGn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso3239429f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679038; x=1791283838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRZBWbdx2V+lf3HeAagoP8lmXsSParpAXBpfb0Sv3U0=;
        b=OtehukGn9KxWSCiqayr5219Uscq6hSCHyeC2BaRNzBVSXArCaiANl3+diBNX4G32UV
         Ixu5l7k+rd2QR8VWU6k7pBVIAYGjEIFWSZ5Weg8baIZQNJSVWvQrnbcGSfQ1FYFZAk4f
         yxE6vSsdjPwiEXZvJiOcX7QJAoedGPyi8lXqe4cQ3bGQkKZWiD1fk3T11tRukPEaaQXt
         kLlMbbesUlbSUhXX0AeA+Nzw7r9je8GnGrqk3RaoVjYuYcxMLPUMh3e1LfPfhHBuSzJo
         1zzk3sndv64ToDf8bzz5TClovmh60MFE9mPywD1vbgJClJxOUmkba4MPkbGUQge0fEaf
         Li/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679038; x=1791283838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRZBWbdx2V+lf3HeAagoP8lmXsSParpAXBpfb0Sv3U0=;
        b=vfQYSe3f965T0+M6DG3io3i97x/J0J8gnMyIj8Nbh8aeRgT0S07Cf5yVVPzyK8D6GO
         5BP+nV/5sUDkX7mdohXZsFXIDGoaFEf4BroOUjNe0Fn/UTkrhteDBEIfvMKCe69zmwJs
         F/BA9liQAQQBaRevOLC0Dq7YIQ5+ixcUwRJI98e7BfvBg9bzKD/uUmgXBxsks6yGQHI4
         uS7SQqn1w9PLkf7R3udlr6j1dh1Mahp4nKTq5dTRliuiju+DdaGkJqfZqyjHC5dsWrcK
         A065GaVa1i8tO0pS1+MfGWM6qO8VUlv3X+n/9wUjURQwwuqT5FgucUWKLnQOaHT+XprX
         rlcQ==
X-Gm-Message-State: AFuF++llff7d3onbxIw6UlEbjQlC9XGgM9H4B9UXiAN/T/5Pe48C7OAo
	RhG1xXVZH1hYG+/C5zfrFpXlYLr8V8GoDBrtTzfWr5YySkQp5d4hJelp
X-Gm-Gg: AYBFou18ZInxSrHbrf4fY9x26hIZC8+7MKCttumxe0PhaqyNrCLppektwhUKL+K2mJi
	9YFy85Cs5cc1LL8b+V5Xiyt5xvUkO3JjCpGQjERSRKVoJTwpxDZk/Q/L9AdaJVjkNDSEAhnNURL
	rr62TszriVD9kzAVbhKAaIsTZ/TSasU+4RYbGF53dsxooMsnxfSXPS7Hx4rdkCX5SHsAR/hXObN
	i4GIeGE7/qmcthBPWhh0MdnXr82nBaupyERWstCdh8SjBw7ziYHHYsMszYCJ1ABKLolTBn6BVsf
	t4OCEmzwVSSbtpbtcZ59RfV2WtwAfu7n038lvyhZD4rfHZZas0ifB5Ua3eYYW8hhFODaFwj2jhc
	Zs7T4x81KFUlB6a8B6vD+Mz1gJ1BH2R2zbgMXixKhrnqSo6aMLAwtMEJCw6ANbimO/w7ZhHIzaF
	oOg174B0ixT6nv6BS5/PjgVoKK2p8ACF9zZVpH/7PrHFg8d2bk9iFycVWtoTjr7P6V+4Cz4zQx4
	G02/hCDUqI/JY1jMX5Hm6e7dMH1L1x0tv7RAMHaLQv4rNnnTpbn5PSfB+kN0pqSMShaa6tj0m/w
	enqNc8moVokHGDi17lGxxYeAXeko
X-Received: by 2002:a05:600d:848f:10b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a00bc928f3mr39671375e9.34.1790679038306;
        Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 3/8] watchdog: rzv2h: Drop enabling clocks in the restart handler
Date: Tue, 29 Sep 2026 11:50:16 +0100
Message-ID: <20260929105021.542730-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The watchdog restart handler runs from do_kernel_restart() with
interrupts disabled and after smp_send_stop() has halted the other CPUs.
Calling clk_enable() from the !watchdog_active() path takes the clock
framework's global enable_lock. If a stopped CPU held this lock, the
CPU executing the restart handler can spin indefinitely and prevent the
watchdog from resetting the system.

Keep pclk and oscclk enabled for the lifetime of the watchdog device by
using devm_clk_get_enabled() and devm_clk_get_optional_enabled().
Remove the conditional clock enable/disable operations from the restart
handler so it does not acquire any clock framework locks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f247e42d54f5..55ac11fcfcab 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -192,22 +192,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	int ret;
 
 	if (!watchdog_active(wdev)) {
-		ret = clk_enable(priv->pclk);
-		if (ret)
-			return ret;
-
-		ret = clk_enable(priv->oscclk);
-		if (ret) {
-			clk_disable(priv->pclk);
-			return ret;
-		}
-
 		ret = reset_control_deassert(priv->rstc);
-		if (ret) {
-			clk_disable(priv->oscclk);
-			clk_disable(priv->pclk);
+		if (ret)
 			return ret;
-		}
 	} else {
 		/*
 		 * Writing to the WDT Control Register (WDTCR) or WDT Reset
@@ -292,11 +279,11 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->pclk = devm_clk_get_prepared(dev, "pclk");
+	priv->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(priv->pclk))
 		return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to get pclk\n");
 
-	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
+	priv->oscclk = devm_clk_get_optional_enabled(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "Failed to get oscclk\n");
 
-- 
2.55.0

