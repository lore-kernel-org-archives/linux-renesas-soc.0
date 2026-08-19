Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B706443E39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136052; cv=none; b=YctOTAI/pAbiRDqdWl+Q9HyEik3IVUIJErxRVpOxokVTbhGfJUkANJ9YLWemRmIkJc38RW1pppufzVsIuFFFo002DaZKMQYeitO6gucpcN1i7i6T5wOMXRJCdca4ppj3xS4oYcO/n4IwYzWEBmSwwaeqmH0DuCJ8qJotAm+F5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136052; c=relaxed/simple;
	bh=pVdKmvMJrg0xfyZCRZm5q3uorX98aPSMinpzfHA7cPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IShJwosIagvgF6Snu5E5wIeW3qbe2oSuaeQPoQYpuadb5MKubreAM91jBYw3rxG3uCgqZ32ADuG65olVuhcZeYomUtwE5orQin1gBJ9wai7JeAgh0tkQr5Mf+Vg1K9JMLPGm/tTnBtl7+dRPnbF4VnxDDwg0NP1wkW4i36eKEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmmLqDGY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmmLqDGY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso8939275ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136051; x=1787740851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBZzFA3dzWnnOqa8IAFyQP010uCKcQ78Q06wXjSSio8=;
        b=HmmLqDGYXvu5HtOW14ZX/aB4mD7TjFnkiUhTcCyC9qVmcOSVoAqYuaUoRXxWJZoeyT
         A3MozKoueIcssO2c9hr/67Vl3OdbyplMhYIGPXJ76GxZk+I/vEa5ysj5rH9hMCg7Na7A
         aX9Yn6mkbj6JSJMNHne1gvHOePfm5blCmQr8zYqPBBnYbpdOvIpXo330PFbGxmTgQtqY
         elDQ+4Kd5gbwQUn1hctXm6zHAyz567t5HNa7XbEIJv5L5elQzKp6kCFbz+ICjgSBfBSg
         K0o7H/4vUpcnfLCpNLSNp4x2vzWOdgGlOuGxVLQzly3odb+y4/urBYOyED+yD9M9Pfsr
         /HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136051; x=1787740851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBZzFA3dzWnnOqa8IAFyQP010uCKcQ78Q06wXjSSio8=;
        b=N/Y1alSn7n4BAy4IMRQdkYQUndz/l7lSDknoKI23syeVlFq7/YPV3UrmKdbRuBvJd9
         aCJwvpzgbagtv8htZokoKb6ILxX/3g7R3iRRaThobPvOMpystWdne06BwCA3HQ6IOhMI
         gb6JyMlB/E6wOtmNQ655cqHB4RkuHZRBp6XceQlryw25RZLcvp9nh0tEHwg3bsBNyM/V
         NDsZqx9EYADvnTz4n1wk02awRRA1k2EZAX3uGefaMH9tCCnXH6JUZx4Pe7XzmuCpfKhI
         zWO5DN/nLYYjIf1DQyzBn6dGbpeWVvtChloXcIJYZL1AlD1JXCXisyxrm6UMehdW4sRi
         gS1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpUZh0Q7k/r1jHhbn8FQtk1aA6qDeD7DQ+01ZqWosWojCFt6AJYrNofDwIGZrXk2H3+z0zAqRRacWXH13OkpnNKxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lZ1LEa9ogEju4XHFJGhAhP+ADx3UUT+8s/K64137XjtknzjbC/
	FKV2i7JNA0eMYJXJHVyAzFrXbJUit/2AqwXx7zE5QS7n10qyfMxJRy9S
X-Gm-Gg: AR+sD13PZOgruQrD4rkk9gA6HUzdk0WwFwl5BCPhpYpnL6Ar4DbZCdMPYPwp5N7edKu
	mwf5/Oj0yRH6kkXBF+biv1Lu+Aqzjmpf5VyzZ6pEGuUzMCNQ4gHks0Zn/6SKnD5FcNb81J9Jr0q
	PlbNVEddrIwyD4B6qlFY/lD0HJiyN3A4KcWzt9rVBeE9AD/tDcKbSgpyWx8lGKCPSA5NFPwZpOg
	6BW2A6bDSedZY3A+XeXcWNT+bcOH9E6ruRrp+XnRQHe1UJcYg2H3I+qlzb0Vw9v8mIDGJdpXPhk
	ZDYBs+XMmFTrthrrs/VdGj005sCf/nf24FzF4DJdwJMNpeQQVtE1pkGa71QIbzPORigpawXQ84i
	08P2PFOmg5g43clt2O2IuWoXeIM94EwwMbTePBT7I1ovSYydxn3dDASyA1Lqu6+Dxt1PqrUeKZ0
	VQqwfORRUYX7VTrJJ/G1lk8wJQKJMtUPOpIr/EmO7o7Z5pNfQ4bKRFsada13ioYe7vniPbqacdO
	zFTIdLII4jgjHqXF8yXYxpVbZH7SQloGFZFd3ika5tPNMKlgOtdKwKjOCfquagsGbS2ClJ3fIDM
	iDS88RwGFb6CtyrqfHxN
X-Received: by 2002:a17:902:fd8e:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d5fd644437mr71597595ad.1.1787136050651;
        Wed, 19 Aug 2026 03:40:50 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 10/15] rtc: rzn1: Use temporary variable for struct device
Date: Wed, 19 Aug 2026 11:39:21 +0100
Message-ID: <20260819103926.2136712-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 9eceeed14486..e67bc8831cb7 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -385,13 +385,14 @@ static void rzn1_rtc_disable_hardware(void *data)
 
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
 
@@ -399,13 +400,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
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
 
@@ -413,19 +414,19 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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
 
-	ret = devm_add_action_or_reset(&pdev->dev, rzn1_rtc_disable_hardware, &pdev->dev);
+	ret = devm_add_action_or_reset(dev, rzn1_rtc_disable_hardware, dev);
 	if (ret)
 		return ret;
 
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
-	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	xtal = devm_clk_get_optional(dev, "xtal");
 	if (IS_ERR(xtal)) {
 		return PTR_ERR(xtal);
 	} else if (xtal) {
@@ -469,9 +470,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		return ret;
 	}
 
@@ -479,12 +480,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (irq == -EPROBE_DEFER)
 		return irq;
 	if (irq >= 0)
-		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+		ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
 	if (irq < 0 || ret) {
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
-		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
 	return devm_rtc_register_device(rtc->rtcdev);
-- 
2.43.0

