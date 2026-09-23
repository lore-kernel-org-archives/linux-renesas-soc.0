Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2596499F1B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160092; cv=none; b=T/EfWYnY+7l/Ny7V8jk4+uyIEjifCH7umjZ3nHZpydmAgX5by6b8Mv4QXPVEwABUoUgCl2uj7pZHGKVo0VVSpg144onTVgREuCn0y9U0198P3dsSvpapp8x50j0Cznlh/0Yz7pDSzHWHuUv9StV501IjzX2T0shqZZxIdGPANn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160092; c=relaxed/simple;
	bh=nVHGzNoleuUx99SkwmPwYJ812T3riYThfKcHuu1eGHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1FqLcQ6zlum0LpGPObIWwQhcFJCiJsoJCFKxX3ozOdfOfW6Ibgw0gI0ULuNlbnJRD/Pqf4dVC4GHE1BxlgWKCGsU2qBn67jFbYSBEVcrdipoInM+6gzfT4Gz3oBsjQkkbZUW7ka/1Svkas1plq2LQJqh+HFP65ouwX7xlVZTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB/lyibT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB/lyibT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so8459335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160062; x=1790764862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiaiBHDqP8bmazWMSYgIlSNhn9kLxLCnZ+hvVqhHlR8=;
        b=gB/lyibTvlAxAgkmNBvTX8Wjn4nEWYKf2B+is/Qg6aqjFvmfGc8F9Ee5AIV+pyeKhW
         h4qYKR81Jaz1CU/X8qVp2j052pY3snYS+3ZnUH1dpRoVd/75wmVeh0Rgb/ji8CCKUFE1
         e1sY6+2oglkjVNZ5pnD+hpaV9DqCGCVpW9R9+YY3MDrWum48uLPNENPlrlSVUU3L8lm4
         ZNQ0AD+yQ4E4HICfusU5/R68cvusOTBy+B4C2z0pwyLHKO9cNMERNhIFikrU6c/48ckq
         cb8m8x65byPNZgyqgdMzMLqT/7szgSI4ZsZ/Aq8qVYrJe0Xe8sH38LjPKdfP28PcM3ep
         hqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160062; x=1790764862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iiaiBHDqP8bmazWMSYgIlSNhn9kLxLCnZ+hvVqhHlR8=;
        b=wKNNk0vQUqvJzOCP6M21Ke/Dyr2V3k4ELQUZwrhznGEP0HRrR7f8H8z/mmrpIrZLyc
         LoBIuJOpHyk+V1ED9d+rgcJDv6rgGPYHRCy2BwZogAske8bec7xLQLfA6FENNrgdozpE
         9TYJJAwFOYX0YamauprkD+o2Hzd1/CVzbtVq3NDcwboaceCffj3sZtlbClJy9mYwpJ0M
         GUaGpevkrFRClHZxWB9nw1m4LeZKyZlo4/3UWlBhEEdeYiVlrKbzG6qUBw3vvAr6jbJ8
         TUGsbAgS6FjnPxxGZF3Z8kMM0IuyySf6jjS4KIVQWXOwy0krGyGyMOcfHTMf79fucRv9
         YK5g==
X-Gm-Message-State: AFuF++kUqYR9UwZCBiok2Ia6+GOwPC7D9zGgY0aA+Bgfyz3d/T4qRTnQ
	f3xCBgjxah0X9qWEpXbO9dBJAVrO16+GtBAXrn1AZg2eaiGRmW6Ma9PI
X-Gm-Gg: AYBFou2ZieYwuIfj1+EtF/ZTMDphIIaSI2HEl4OHyB7+0yJGxsoUYr/iqtKk+cG3AAQ
	1ZVKYRJcxx/DQjpkse6hwtv4iMnwi5OIMIQj1KXotxCbGsar93Z3aYC7ce0UGCR+2NB5QT9OtWl
	2jv4sRbufW1HCTGguSlWjGmHPzLxvICCKbhaJh+haRrUdm1NoIOG4eCM5hLuBpMCcqd+hqLALzw
	hB1kM0jvupUcYQ2mr4Ds2Fqz3EA7FrHP4xQSVL82zjCT8OhQcLfDGON6/gsU/mAO52c2pCqG5Ru
	WIgoL+JIMxTnd46u8dAH00hA1jkpTqbo2B2XuvKLKDLDO+DILz82iQ8nhweTYtVQYabUH7oLdp9
	+HypXmbWvW4ADOKF23eOhAkVi5lZ8XNaJEpOV6uHIkfyeOagYgKDxEKuUcQKPfYhBZsEx1DUSrB
	AxjxSQ9ztyuEo1lObzgvh8KCG+wVn+9E9DwYyG0HNznmMFXOGRxMjiYeLRQ/L6v+Dq5GW53uetI
	G6hdthtr+FAK/nwUZWQ9kqSo3ELQi2I5i88b/4pTZlq45sk2NF+bS1djqskRUrfu7ZFP/3EVD5g
	HRFP59Wz/XguX3byyXM=
X-Received: by 2002:a05:600c:c173:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49fdf12b782mr30617975e9.19.1790160062355;
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 4/8] watchdog: rzv2h: Propagate WDTDCR access errors
Date: Wed, 23 Sep 2026 11:40:50 +0100
Message-ID: <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR helpers access the register directly using readl()/writel() and
therefore cannot report failures to their callers. WDTDCR is located in a
shared syscon region and will be accessed through regmap in a subsequent
change, where register accesses can fail.

Make rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
return an error so their callers can propagate failures.

Handle these errors in the watchdog start and stop paths and unwind the
resources acquired before the WDTDCR access, restoring the reset state.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.

v2->v3:
- New patch, split from v2 patch #1 to make thing easier to review.
---
 drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 9774fe8e441e..a65e5d6c48ad 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -87,18 +87,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -148,8 +152,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | of_data->tops);
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_start(priv);
+		if (ret) {
+			reset_control_assert(priv->rstc);
+			pm_runtime_put(wdev->parent);
+			return ret;
+		}
+	}
 
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
@@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_stop(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
+		if (ret) {
+			reset_control_deassert(priv->rstc);
+			return ret;
+		}
+	}
 
 	pm_runtime_put_sync(wdev->parent);
 
@@ -219,8 +234,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
-	if (priv->of_data->wdtdcr)
+	if (priv->of_data->wdtdcr) {
+		/* best effort, ignore ret */
 		rzt2h_wdt_wdtdcr_count_start(priv);
+	}
 
 	rzv2h_wdt_ping(wdev);
 
@@ -251,11 +268,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	rzt2h_wdt_wdtdcr_count_stop(priv);
+	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	return 0;
+	return ret;
 }
 
 static int rzv2h_wdt_probe(struct platform_device *pdev)
-- 
2.55.0

