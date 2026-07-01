Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D4348C5A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916215; cv=none; b=aDVx/KL8xEdxSanWUUFKmJrkO0S6xcpvQufQHD2MDf3fqASvXiaqI+xdChv7iBwgae0qgpbey30PuTipDhK6lyuPkEkMT+Mj36a952RCXKsPTZ7IC+kvq+BoeAlradM6yEsNaaxgbC9MYdpG4pksWgsQ2aAXcM//dIcLX051S2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916215; c=relaxed/simple;
	bh=Rbnq2Ej5FKBQgS003/b6Pf76go9Kj6sgibIMBjnk5aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfwEKamqFJpuasT+hmNHywhN2sTWXgH5ndaMjqASKDWu4gX3CWDguGfqLv7cV5s8IL0kJOVYAn7M3owMu/KAB1ISCEcF/7Rel0t38IUUGldQklHPNnWAPSFTo81dblsIYL6uH8TU5sD4jxbLswHPhpZeMBkPVY3Og68w63pAEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ank6lA1Y; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ank6lA1Y"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso715742f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916212; x=1783521012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=ank6lA1YHxRDqytau0/pQWVz8X+Qjc0RkZZmJp1bL+VwXi3g9c9f57FRTcF52+NGRk
         UOvaCJ7qIDJVtvNcDTlACQjcqgrhAs8zsY9g2eoHPVKf6jGOdcYWuLHZB27YdxApel66
         floYki/SiNJEWtGrhryVR1mGO5Z99Pgx212jgfiXr6JSK3GtecOQR+GaXGQ7XkIUbVUl
         dWRJxqF2P+Ro8PewP0Af3b1I3XTYOYblvXghgnZyfCoomnoWNOu51r4+/vS8lpsXS4U7
         F89jGEHzVmnDFsLs7tcxpFgzatvQTxOwUuQNhCHNCN40JvUkkDkGfjQ6t77hYV9883F+
         TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916212; x=1783521012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=Vc6DOuYxcA6hsHaAqGHw3joPEs1LoRcDl0gn3dfAatZWh7xoVeOnApAE2aSJto7ayz
         C1PcC+tuWKMYNgXufTVzHX9LsmYH+RaBN4N1Fh3BA8pLq9IrrW1Tw4yOKy8Z3/Z4Mf0k
         h1Y0LPeBbqMXNw/XgtMR6s3aKuebY54nP02EFsBJ8BICmfUMi59TW/2de3OgoPrywhn5
         mAsyxNoaZwZe0hPRa8q//hwZgjuHBJvqsE2uzWueK66sz2f54RxYDoy1uc2IfKibxzwN
         MIjTh8g/J/2OdY4Us3I71ZGI0z2knKHK8ZWvVamuhdeZM+6EkgrEOypLRBl2Ld9u8FBK
         2qKA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv6+nOuffnYX3hvNwagrxEgdq93wDdCslP6an8VnTgPifnP94efizPxKEYcQYgINrtTsyIP9NQOGz78nJUa3oyCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVtLgCjCg8FMDbBqPhGNshCyfjlacceauor933LyGXEiM41xV
	tAJqj0FViprWEebE4K2IP/wxsXWiPEqozS1F2ByxjsAUkDAhBUKjBvo+
X-Gm-Gg: AfdE7cmErUZVrYTE4uQkFvP+OmoSFcWJbMHEOwdqnxe+fr9TyjRGbVCMuSvgY/8trSv
	BbCT+F4YPIfGp0rd4DqVKkZFneJi/9V06aIYLWEHLAdxnAXcnwVCqKnPoX2ZGD/jjmDt6XozuT0
	Y16WQcokqXY+gJUyghJllBmiXDzIOV26nuzbypgQs3b+BUSKFvq1BBVY+112AaGy3exiD00OqIW
	gHiWrvPeP33AgcgLogp7JO5Ljskl5gKd7zeczrMurMFT9rJTrkmOuDPN42QGsRwSR1Y+eVQe3wv
	JD1iIh7OIn6LQyNJ8WFZ9P3sZwtO1LqgTJFBUTl1iXBeRVr94AXgGoxyoMNWgqLuHJXCVhhZUJE
	4G3wF7hpnjgjFI8aXZHjvTBEjQ7vdx2GPvMy2hnWnVbAglXEVfVVWra8K2hhknmTB0AJit+yf27
	E1xkAGuLH0si9JNxqpNF6RUK2TQmkIzrKeMYEZT3iInhdXbMWWUglvL4RWLRTx0ta4/3AUJTrGy
	GPQO0okMhhOLSbRV9U4NOI36mg=
X-Received: by 2002:a05:6000:2905:b0:474:b9d1:321b with SMTP id ffacd0b85a97d-47757e57453mr3004596f8f.6.1782916211834;
        Wed, 01 Jul 2026 07:30:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 07/10] rtc: rzn1: Use temporary variable for struct device
Date: Wed,  1 Jul 2026 15:29:50 +0100
Message-ID: <20260701142953.2014895-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 1a45a3d895cf..4540d764edfb 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -380,13 +380,14 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
 	int irq, ret;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -394,13 +395,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+		return dev_err_probe(dev, PTR_ERR(rtc->base), "Missing reg\n");
 
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
 
-	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtcdev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc->rtcdev);
 
@@ -408,15 +409,15 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
-	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	xtal = devm_clk_get_optional(dev, "xtal");
 	if (IS_ERR(xtal)) {
 		ret = PTR_ERR(xtal);
 		goto dis_runtime_pm;
@@ -467,9 +468,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
@@ -479,12 +480,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		goto dis_runtime_pm;
 	}
 	if (irq >= 0)
-		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+		ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
 	if (irq < 0 || ret) {
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
-		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
 	ret = devm_rtc_register_device(rtc->rtcdev);
@@ -494,7 +495,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	return ret;
 }
-- 
2.54.0

