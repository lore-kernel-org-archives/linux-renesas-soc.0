Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9F4963BB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320670; cv=none; b=BBYaEzWXHCSr7/j1QWb5P+0MnWmJaFymq7qzJK5X/okMN0mxa7dBwrxJ0lBZ15BDjizpjfUJexqn1BaV7NGCGPH5eTdUfGrwbtDm0Vx+hUxiIpcpZS+Dlm+zF2M45ykQyjRLB1C4jl8iZRe1tkd2WZt0Wk4sx+IckjJM4rj/q/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320670; c=relaxed/simple;
	bh=uAvFRJq8JPI+Gwlw+Khw9+LTv1Cj/4pa5aFIspu/MvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6r+T7ru8UgHOGslAEs27S9lupXVZimbTlC8KwyS2yDe7c+c4SBk2TmsZqu1ZChj9zwFIJ/RvZql3spM1/n8ZbiRbg6+387LDtppEuICSeVls0u7HdBEA4agckBHKgh17KC8S6clLiz2Qaxq1cFMcmIL/ssCTNyvVaIl18erD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnsGmAju; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnsGmAju"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce98cb8165so9272295ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320667; x=1787925467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKcq58zoAwSFjLtipval/n+rqoXw1i5Wq0T4A/rBNmU=;
        b=bnsGmAjurGYQI7Po+fxC/V8g/m8UruFVJEKbQt0pgVIJzuLv1wpEaplHinKex4aidv
         CwSG+pPbUVhqSWxbsMuLP2DVPPeoG67Wo7zL1uMgbeLSLZ6BhDc3r/ZPRIyMiWoT+YN+
         A8ffmulVjMQW7U4lK6mam9Z93ASxxxTmIrF0PxRprknNaAGRo+bQTNmKIJk+SFR5s+lm
         iIkbCcPHWmwv/oJ9hzGbrgpc7fRw7LdWwPDIsS0+rcs6T+eKs8i/H6T6d5+K3EN+zVlL
         2cvXqQcwpyyhHyyHtavpM3sX+ISoVZH2wOA2yy5V1no1NOro8JiNzZWEtKzgF4gZ+66O
         WOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320667; x=1787925467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKcq58zoAwSFjLtipval/n+rqoXw1i5Wq0T4A/rBNmU=;
        b=Y+iY0ohCloWgqPhG7OsUdFaw9M67yi2qWCvZ9WpfqCjTPU5t5GIPKwo2jY+bn4vB99
         5fVbAD+MgNHeGeHN+0bx6/VEdFLjJqABXdiYDVxLYIyVb7gonX2gOqVnI/puaU/14p8w
         06aTdpN7wOCNIogixFmWeu3pZd6ar1cts+iAP8s8tehRo0rBP5VjXp5kdlzPo36QwpwW
         NDYrxpQPQc7PBbIFHu8/ilwlRA4AtOQwporCyDU7jO8Rv8EJnipXcgu+grMgKO8r/foZ
         UdNwEmYwtj/HOJzk8qrsn2vMag4rcLr1g/W9J9JMKlvzQq8pIMX0Jo/hxdC0wY+ve/hH
         wzxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNKGkZi1QdMNPoBNGFZvegsBNs7yzjQrRBQNpaCXzKVab90zTX3nDAvgyS9Dph0h+WNudfMDfvI8sRYIYD+NhcWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mT8fcfivgppsDc4PnUOVZC5ZG4vBhduri/MAzRoyVoqUewG1Lt
	loyH63XI5MQ90FHqbbwdvtOZdEF8Zl/0lASRVnqMDTmq1XIUrV3+gw2W
X-Gm-Gg: AR+sD118E8No0qL6p3U/1DQG8e57EhNTY21MCi5UTYiOWQp+dlfLGUuCYGplK4heHMA
	rvW0h/Hhg5VibBmwpKVVEr5dg3I5JfjW8CtAlDu7BJ+TM1qaOjmBXzhJ0bOSAdsJ2079jYVOHtc
	EN0WJEJky2P01rQGVbR/LpqSBcGPOxmunbShiTyw/hRwqKDSkEIxMlQclo7i90n+2o9vqMfxrkj
	vLSUmnUnJzGTjN1iYpa9H6Z3sLbtVWR6FfubqjVq3QYLiM3CO/4Q1uLtrhS1PuQOCW8o7cGWyMB
	p4TL/IsNABUAuXsS5NFPsVMmcADRZtaJc7nVvP+USIOOC+e+qllNTe1g8Ep0IcEVQI4Hg12F2M3
	mj7ufEXwumYfLkTum6y79IntI5QyWWlh1whXwiaXNpKVEbrdjhlnuAORVVOB9lQamRUG+EWCkeE
	zG49mFvdp7lTV0HxhqJHSsRWgOEOFP5rA0fCYved1ZHZmGRfgEg4i9emjF3+JL7P32XWdn5MKN1
	ZgAMRZ4LN+fRD2DjhhDK2AxQoB0q9vRh1+RAdsuyaDAkBqc8z9z2Bp8lR8uj14sFMennxIk+NPX
	hQ+nathjTg==
X-Received: by 2002:a17:903:94c:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d61a0c9415mr190878155ad.7.1787320666958;
        Fri, 21 Aug 2026 06:57:46 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: [PATCH v5 12/17] rtc: rzn1: Use temporary variable for struct device
Date: Fri, 21 Aug 2026 14:56:03 +0100
Message-ID: <20260821135608.275233-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

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
index 2e5d2460d79d..1b16fc06bce7 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -398,13 +398,14 @@ static void rzn1_rtc_disable_hardware(void *data)
 
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
 
@@ -412,13 +413,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
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
 
@@ -426,19 +427,19 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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
@@ -482,9 +483,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		return ret;
 	}
 
@@ -492,12 +493,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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

