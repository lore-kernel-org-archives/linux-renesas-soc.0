Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14F47FAE5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160070; cv=none; b=e2R5APYDrgmTr1eMlNAbjvzVAHssC8YBvdqrnh9J7WWX9u0VT7Uf3UHpwOE+4yCePwKluCsxuuYsoAiJ6Mk6UDja2TYS8koVQ4WdZ5xR0G/ufIExO0jgsQzRk6JIX3wAaeThXdBTwaMS6bQzgt1N4CtrzR1HLBmT9AZg33vf0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160070; c=relaxed/simple;
	bh=JPq1K/TtYhGpO+h9McDLSD5P9OgM/Hgg+AidAGB5kZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvBBl7K6TKEL9xTYKi1NEQRNJERrFmHl29f3XDtRn12ERw2BBIiVRuOXXbKHoSoxOvlQtUW5bt48PsLYlLbZ/SzEfaRGuNUP8o6ceKeUOu2QtEkBQH66yU0MYhnp/gOVVEakfU94EYsE9Yr4V5KKV6CuVv7EAxt8GCekNL7yb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYUL9gIP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYUL9gIP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9722895e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160060; x=1790764860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfcYaXdQ4JhprU1bLeofN4mzB3OfwntG7DvJN30DUis=;
        b=IYUL9gIPYJqMH6ta6UmGeCGhk8DIsHHAzbYofqCLJvUcJd1cGFPZ1pmRwg6BQ59q1W
         hE2e0h0expbETv8Dbh3Ykf6PjAp4Dh86GNT1GKS3AsHGBmp+VlW7r0N6o7+0+PvE9+P0
         AlYpOU3zgyCZlcNPLEThtBr5KSYBmvbf2IzoKvbY8leIFR5k+aQBfcdgd4E2QlSGOyX3
         esmrHSVIqwUliWW5BR0TacEIngcloE9S3B+LFoW+wtnGxr/0zoFnXeIEmSAuSyoqg/4V
         1gYc+O4fEdZExcqLBePgCguiixv2YpTL7FNOKXEL7M6GVQ/N8v/6Tridf2BtEPLjaa7O
         M3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160060; x=1790764860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfcYaXdQ4JhprU1bLeofN4mzB3OfwntG7DvJN30DUis=;
        b=lq40yWW5WTaIBc7gvC7rfBX67uAfCd1DoT0rYaQNvI3pIyUkkbr4cmOsps2aKZ5AJ6
         gfNBylq49+gnr5TlegkYMtGJX8coF0YUNpPd8rgfHqFTQBPMUTRf6y5ZETC/8RWQbu0n
         th9hrte6ESxt/mo8d31I8OlVce1slInW3iIjXmIOZKr4u0JFcZiNwB54TRyPecHe2ljk
         Pbqf+2MzaDw4e3KCb93AeYIw5x7a0Tm+1hYVm1MpES422S62oiLxaFhBUPr3oKkMQzdJ
         +wOXqLuRiVEd3Nsa611S0Mu8X03IeJs/D0e9UoZtInwCmcQz0T0HoaafMBKX+5nE7CCa
         czVg==
X-Gm-Message-State: AFuF++lULhm8nc4Jm0mkYnCZFisvdKyztHJ4c/3/gNCdv64L9luZQ5zM
	9JshgB4Zy437A4rsJSKfE6LbaFV686NZyelovBPxTjCAlC76Ol00ye/4
X-Gm-Gg: AYBFou10+NcEfI1RjaJD6t8pEDGZmxOZ2N223y+XSmsyhadX5GUf5oX6+aHrdpaQgU1
	rkbnHLdwllPKHcK8kA//ZmBe7zMNMkzMM1Oak7QLhMm7ju7tZjgUrpsvAV8D0GbjWOXQs8b3s9Z
	W14CSe2m4YG5iMLM7R/i5hWMBn3afM9nQR8NZ1vurft58l8HVrqsIFZygO8do3e563XSTFlXtEw
	az7lX/Dtk8Dm6/rst53Q+HTXb2/s+ENyr70aEG3LsbP2qxNGf+tsI+MjikzE1ZUFhtlWbKBwA+I
	d6eACxoDPluZukHaUEi77mr3qWRump1aLANXoWoTdZ+bPEsglJWfnC3aEFh8+GTzpZ43VXzOhQS
	/SPy7Phi1UNVkurRUeMogc/GVgI4f6IF3zT7DIDz0qaNjyozF7t94MywnOhLjZqjN9PQEHBY70U
	YTtsSJNdunpL7lby8A4PfT3jspPgNABRXmmkAhDMBObEfLR1tAQoR7jvHAvx+mWU9nJbt4XHELv
	5W2285Num6dbQJDUFZwkTIH/1QbmIRZXzpZlYPQOsO//A916jksQ0mgS7cHDw+OGlvrEvYpQcCN
	CNUL4wxS0R0t3495F+Q=
X-Received: by 2002:a05:600c:3b21:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-49fdf25486bmr26346245e9.32.1790160059852;
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
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
Subject: [PATCH v6 1/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Wed, 23 Sep 2026 11:40:47 +0100
Message-ID: <20260923104054.3324830-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 83540dd9a37b..057b890de0b0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -174,7 +174,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -268,7 +268,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

