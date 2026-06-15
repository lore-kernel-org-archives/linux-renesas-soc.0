Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A8A408616
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538516; cv=none; b=hlDsM9NACEu5CNRT3TNXFREIEuGJQFFLHOxwhZxM7q0HQ24h8ITbrLGvola/XXISuM7lN7tT64qRIzi4ISe7F+UkTfdeObRt3C12wX2Y5VzrW3lK8Pvb3JvvTRzcQ/dmUt6qWrvsBISAdKW5S7Qgp4S9SuzdhAe0D/H1Mud1Rkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538516; c=relaxed/simple;
	bh=VeFRtFE6g1dPxi2Ict2HCIeaPoo/i0XnTAR0WFi63t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXDe0x0kbz0b5YRFueNN0B3VefNHFhM8nmRszQzJdbS+o2bM7hYLRHBuvRyuI9rCzmpi5w6wiAoOuldniVbGc6SahIfs3iPpT8eViR4/nZ1gU2cQzXH70EyA4ISfzhrtI7Q3etsbDLUco86r1xszXlZ8O3mFfO88THFhNR+7UL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/li2IzL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/li2IzL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4908b92904fso42849255e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538509; x=1782143309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi2INdyOzIzUgyLFjKy8yVa7T7k94g3Q/7heIGOkyf0=;
        b=j/li2IzLApW3uvbsaYFe+UZPncRyKzb+wq+LpG2SSO3kNcTQuYpTgJGLP11IgoTqC9
         8a5yAfl2hiA2P5RjxyJTzj+ZLidy0VJ9C3S5YOhr+3hYUkBCyM7wOuUJmboURW0rZ2fq
         Ec/nJsPnTUreSZwYEAT/hfng4vE58bhD7yGqLMh+qmci8FHTiDd+BnXe/9iurhPtRcpz
         zhx7PfcaND6VT19L/pviKRdnaVLlFPm/5xqU64a16LT9qHSFjDTcj4h3mhFIVEPPE2T0
         Npn8jcJGPvxT3CD5t0f5O4TNuk1+oqBRrIk5oA8v6Kt5+M6hccebSxV0mzQJrzP+o8hy
         f5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538509; x=1782143309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zi2INdyOzIzUgyLFjKy8yVa7T7k94g3Q/7heIGOkyf0=;
        b=IWEnVa7dym73YicNvdbI0wQNNFEXIk1DSWrPNuSVMBun7Ci/+vSIeDAnZ1bh3L2DWG
         6FAe/zF6VcoKv4JTILGxnaZQi6O3cnQUlyuMVpOc0nqdRrVVSarrJtKrE6HOqhCyPf08
         hCjjrcyCUvmskGuycUySR6l749paUDK7OL+tYJOSOSgVuS8hYNvc+yC9DK09EB+vGHue
         +7KGbhV2jxmJf4Z0dSHPsSOp0QjK2jSQq3DDRiUAApm/p/UFPZSBsFKEdBBAQAapeS6r
         gXFugViS8jUgNubMlM9gXSD7e9FEHzAgsHx7xs05tD3dXyvcSLprjFKYh9XlVZ1sPruZ
         +mvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YDoqM5cSji9DfHT/WcILYzdT1ch2zfgxAXNhhbhz+NTzEcBkaGWQ2atbMEE0vc1idLMekX8hBwl9lTWMIZolgdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMR/FdKUBqqEeCyEugkJp8KIH92MTPU8xvr1dwfDS8CW8HMli
	IBViqMJgsrcW/YwJkuvHDRL4W+fo4B38uIcq7PlwcwL5w25ivDpil9WU
X-Gm-Gg: Acq92OGL2Zpy4l3fhfu0a3Hig3PL4iqQqNHWb/rVWIv7HusiiNpcnkVrKrwJjsG2wS2
	Z9rx0Ikfw4tv500zjX6fYuP3cVnQvZ8mXu1F1b2LcTJ388KsoMfpefpzdt4eygZOBDcyPNKQRm3
	J4XSwbjogs+KEgCbLWg7UdjXluRP7S6AGomgKgTFj+1zT4aWj/cLbmW2/IKYjwmyH/S43hhYIbJ
	R1hePxIKq/cgTkGA2Qgi6DeOmPJTSEyndOtgxTxy4fy5qgr+OPhtvI5/7+sMumOkRAq8qoJ05ex
	XDseDEcgYqoNigaLUbI6uu25L6mDGXat48hcACqJJRzTa3M78/Et60ichrRB4pXuUiMVCZ9lacB
	cVYIFd2Xs3RaagiWb7O0URLd7tmmLUavYtPC6Gcc3fiucZVHtrGlyDgD9306D7FCSCxkHC0br1o
	I4GHHd1QOLig8fagse3h8ZooDF89VYywqg9apj6amyEbTfLAo2mpnHRmy+WHKZ5D0Ga7BUZA3Jw
	4ry10CCiUopduIRRFVC0fM0F5aMgDCOk/NIni9Y7go7k0Y=
X-Received: by 2002:a05:600c:e54a:20b0:490:e190:38f3 with SMTP id 5b1f17b1804b1-490ec504dc0mr131727005e9.21.1781538508599;
        Mon, 15 Jun 2026 08:48:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:27 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct device
Date: Mon, 15 Jun 2026 16:48:02 +0100
Message-ID: <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 drivers/rtc/rtc-rzn1.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index bc6af59744e4..25cad9213147 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -386,13 +386,14 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
 	unsigned long rate;
 	int irq, ret;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -400,14 +401,14 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+		return dev_err_probe(dev, PTR_ERR(rtc->base), "Missing reg\n");
 
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
 	rtc->alarm_irq = irq;
 
-	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtcdev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc->rtcdev);
 
@@ -415,15 +416,15 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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
@@ -474,9 +475,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
@@ -486,18 +487,18 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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
 		rtc->sec_irq = -ENXIO;
 	} else {
 		rtc->sec_irq = irq;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
+	device_init_wakeup(dev, true);
 
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
@@ -506,7 +507,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	return ret;
 }
-- 
2.54.0

