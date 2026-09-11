Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4B446BF9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125473; cv=none; b=PBM1bUiRzyn75krqy0kqKoJU3qF6CyVaWvGwj+BkTvB+jWBL52GgPhOffxY9A3/uoQrZC8/Jv+4e/tmQRYJu1EUynFXBoSv0FC8w4jZK3zAJGlbZFflMZQvCoTYWLkU+DiYgJZrRTnL6SC/j4MZT5hfkmYMUCRvgKw4GZm6Z66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125473; c=relaxed/simple;
	bh=KyfbDt9czf3+HI+uydLbr5vC6KLYpGEYKOcYxmAcr6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjaKWjQ/sL3ItZE/ZpOz0XrmOmbwNOy6QKbAHDx/UJ7g0C7UqRw6BWxUspw5ZUzaATeJxNaLK/zods94ZCvkOgAOu6IBWPodYuBUISoxoj1F6kPQhrEh+NbvrxUJp4kQHYacPSyUE983z3C/jCT3g9LE8Lm1vPVEUk0hoHrM5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0X4IQvx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0X4IQvx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2669975e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125465; x=1789730265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS5eU6IT9I1jv6dzRX1Sx143P1BXIUwdXxgwRP/Lqvw=;
        b=r0X4IQvxCbzOW7exDOnA1OsWQcSLxZqsqsHwW8aGQ0DzV60jQb0CzskZwoaPJguVa0
         hKVjlfgoAWRArRODmBt8vP3foAen9RgAcH07orqHTl6tWRqqI8ufudSpZ7X1Kt4If48b
         aHOJcckHTlOw9m6nlnjTR2mdA0GxXSq/Jgs0/UgPmdTDjdXU1FANzTWvglQ/Wy9mXBlB
         M2cXIBX/XTiChYZBmp8k2GXY2imu0mRMqJyuUqb8Fl8dBftQmvBEzpHD1idaGZtWjAKt
         K0gsZSzmPtET6G/QdpuCEKVjDZRjfII8JUdcO8oeXG+A28h6fb+WMdzRJklL+dTG7HNN
         wPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125465; x=1789730265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS5eU6IT9I1jv6dzRX1Sx143P1BXIUwdXxgwRP/Lqvw=;
        b=UoEmCNnMAkB1NxMUPPACjJ1mOnTstw3dr9n+5hQqk4GxpB2P44wcOjsWrllWv2t+WK
         gvx1jYoYnqsF9aXaHWW5uP0ImzSJl3xT+wm50Viv9UlMWovc1zXz/rwDoddZgWJGjwZ3
         t07Rd4Dxjj45WspS4J3k4azfagJv5iTiZpe3q6LfPVNuLiMdQpghMiZJqOUlHaYH8krE
         B6qVs4/IJpJ3czBho+6Bv/0MYSY4B/nZNdddBccTxeKPbf2/wPh7b3oy1woEgNphjkZU
         kk4vdMrCWV7oLu6aLriBjGriesdm2pplBzb1g8hrpwRtUf6/1xBFCDMObxPLVvZwf8vc
         qpIw==
X-Gm-Message-State: AFuF++lKiCda4G1P3hbOssVu7/wsb6s0jBChjM2YetKKyoS9sNEYRwYb
	xGzCg6Iy1RoNCtAM87g/PIlyA6+6ZQy8bEfeiGpkXdS8h97qEltbOY4V
X-Gm-Gg: AYBFou068IvYLzCcpLWazQ4skp/T+o7wbDY2aPIXzS1BJPx27KsNWSi6cDDodm13U3h
	eS8oqxjjnNFAbSfikCcscRA8RQ/h8MYUzrd3SS3BrVOJBIVPiV2k7rwNHXXsglxdLWT8HurhpJA
	iMCrWbUGGAzxz348kF55WYFFcgWSe4cPmiiKCUi34LXd35M456cx9rWLVPquRE3GcFbQ60AePTh
	YgTd2Myq7cNL7rG35DjgVuWWEPqAsgw5dVzOKCc6MWZ83wsq5o9mUcJ8PQ5InEnRcajVin2OHyq
	vINIfHaC+IBW/imioh3zFfrz8MBoZ1sAfyKJM+RVeZUX4TCCkBMbvCoPBXZLIJhlF1M683rp5b6
	bSoJt63bq2Msvs4eu2kBb9eqmAu+XjIQlHjWS/pGIRihfQ5l+HEvy9jB4QrsFuQzz372ClXejkH
	Msoj2Y1NgL29y20bMSv7upLMC2zvZGGPbZDc8AgYRhLSGZmEOTpCb3IZiAOOFkIqsNEQoBFu+cc
	BFv7jxqj3Cr/W08fpnnhRYL8AEayMO7qjsB9lRCNm5RAT1Z5t2zAwrWTTw2FbcxttnixXJKVRmj
	W+Pu/Um9DVumBMgZYEA71wuqtHbxpw==
X-Received: by 2002:a05:600c:3b1f:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49e60f6955cmr48817515e9.4.1789125464885;
        Fri, 11 Sep 2026 04:17:44 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/8] watchdog: rzv2h: Drop enabling clocks in the restart handler
Date: Fri, 11 Sep 2026 12:17:24 +0100
Message-ID: <20260911111731.3404308-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..bd86da71b0eb 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -191,22 +191,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
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
@@ -290,11 +277,11 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
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

