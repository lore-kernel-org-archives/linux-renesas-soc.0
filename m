Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5C3446C3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916213; cv=none; b=hxIyFr1OB1rfeuzDHMxKMIGF9zax4K3SEcuFgudlFGVi/om6tLKEB1j/jr/Z/6bYJomzZjLGo8USBLjqr899HhmamVwJpITAcLpYSOIKein1wd9S9Gpx2Zlha+jpiVSJzqd3rRdCvC0Wg6kA0JPbi/1tHSJR1xUfcb3+1TcaVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916213; c=relaxed/simple;
	bh=g+r2ue8WQlUY2RpdLLI/+fS1P660DwdvJv/oi4A+9CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUar4/Nh2Q6MMSmhMSWWdSDxExJvHCn3TXR1LurIvrOjw7p0o1HQrTgvlnT/0vikXCFWdbqhFLW/P7INcjnuQ2pYw/F0o0bbKe7R4G7YR09EIjS8/k2H0MHR6lAHudHP+P8J7T9Cc4YPkphO4xVaX0bgIUV4iq7cCoXbdhgU8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjIbpLua; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjIbpLua"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47640541585so458771f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916211; x=1783521011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugePcfJjWg3gTdTgtFvlc1OGp49uQ7iOCB+yoMKRNH4=;
        b=FjIbpLuaZ26jOY0TMC2GrMU/UK3rXU8G4xqfwRTIK9RU9JkA8HpJ7rmIR4mUjAm+yD
         7rP4cBMNOa/Tvlsf00vw4nGcS35K9JKMOW7aTgrg7WuJRKYt6QgZwaZqWTgtI1hyWraY
         Xs+3NB2fNUO6zL6QbRRIRubHnU4/RLkfckvIpBE4QJnvI5da1Y6h3pd0XtmepUXCe1n7
         3UHM5XoyJXVwplUrNGv3oyfgCpaNwURlOc19E7A9FuScbxVoEwNvpD6zrMAbMAlC+DqX
         xQa9K24TfeMVR/6t6o2aB/NznysiEn+DkvjYXjudUTjOsjZYi3nPXJxKvaH0/J3npIT7
         fwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916211; x=1783521011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugePcfJjWg3gTdTgtFvlc1OGp49uQ7iOCB+yoMKRNH4=;
        b=c2zsVgyR+AfgN5WAoqu/xsJxivlouktWVuUkZczXol8zCiNgrJGY4nnd6DTti9bi1O
         pjoCjo8mOt4VBrEg7C+8LETxP+CNXg8db70n+hxmyTkJ4LtOezS0f4UMygBM8QWv70ed
         HXGwksKjmnhBPlwrNNiior1aMcPO53GPmwqRs1HxHcXel5dFgNRWk08brNDZRw5yDPUY
         3k9cRNhQf8jhWgtlTrRhzSM9iuWP/UJ3rzPvLTriguue/UFYaNwq+Slc9PzANVkZqyd5
         +cVL6IS12FHvX0iCgnPSZDlLaC+bk2aCujOdLnMfdfUpx72b+GPXRELm+agBGV8iMgzh
         19Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk2n6fmABNpEGBtrCa0j0a/mAvj3fEtiyuge1udFLeFSzGMJ/3QbnldS6ZSx8VdsCzKXhT8bnMpru49BR+x1nAtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfQmbet41t2uQjh27HhEd9rijnHt1kX//oRYSwO/KvHqH3o5K
	NB6GXYIxjP2ttkLvk68DRa/TuPl0BqrfvFZXj2Cer13I/Xnjfw+fE2cj
X-Gm-Gg: AfdE7ckV4HH2FsmWzgAjPNBWXl5RseoLG1QU81VrDw6rW/LlM+itn8cZzvJP7KmxnBZ
	cwF9ar4XVci2CnTqeAz5525TCixvP3F0ykQaeKirAaSre7Sna8gFk3f4qcViOruqkJcbOOzSOd7
	tu67dB8kl1xwBS0Q4McjT/Ranj0wci0Ah6JYRV6l3VNqj5imdbsHrAmNDF1PqPC8bFpGRdO33wG
	DUYA52JtrGHJN/l9xaxyQMRB6QQs+RUv9VE+FLABWSRcxvjt2e9oBF5dEXE6vmBzkpEpYSxLjon
	PNGqpgksu26Q+4blC5apUDm7rbBtJYFx7UhCv8w7rPbqi+VegaVvKzDWUs+d6jr/PnEnTZgSRN4
	aUu08klTDTOdbBqDUoUPLHyuz8aE6JcBVgFsygdF/kf/kcwqMbqzkN5g15RlOP1+un6Pic3nsEr
	JLd7+dWVKdpFImuqEwZ1Gpg+4v50Xyi39v8RD0BOXWRuOQd80TdiDSI5RtMmy3xJ3SEDce6G8pW
	Da9mjjbrnF37dYwuOoukHQu1hXnyD6uoqZJGA==
X-Received: by 2002:a05:6000:4305:b0:471:f180:86d7 with SMTP id ffacd0b85a97d-47759568468mr3184770f8f.41.1782916210609;
        Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.09
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
Subject: [PATCH v2 06/10] rtc: rzn1: Dynamically calculate synchronization delay based on clock rate
Date: Wed,  1 Jul 2026 15:29:49 +0100
Message-ID: <20260701142953.2014895-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace the hardcoded hardware synchronization delays with a calculated
time window derived from the operating sub-clock frequency.

The driver currently hardcodes microsecond ranges assuming a fixed
sub-clock frequency of 32.768 kHz. Newer SoC variants, such as the
RZ/T2H, drive this hardware block using a much faster clock rate
(~195.3 kHz). Hardcoding these wait windows forces faster blocks to
over-sleep, introducing unnecessary delays during clock initialization
and register configuration.

Calculate the duration of the required clock cycles in microseconds based
on the runtime clock rate, and store this value in the driver private
structure to adjust the usleep_range() and readl_poll_timeout() boundaries
dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Initialized rate variable to 32768 to avoid timeout_us of 0.
---
 drivers/rtc/rtc-rzn1.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index a82f2d7f7a2f..1a45a3d895cf 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -70,6 +70,7 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	unsigned long sync_time;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -120,8 +121,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Hold the counter if it was counting up */
 		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
 
-		/* Wait for the counter to stop: two 32k clock cycles */
-		usleep_range(61, 100);
+		/* Wait for the counter to stop: two RTC_PCLK clock cycles */
+		usleep_range(rtc->sync_time, rtc->sync_time + 100);
 		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
 					 val & RZN1_RTC_CTL2_WST, 0, 100);
 		if (ret)
@@ -379,10 +380,10 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
-	unsigned long rate;
 	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -431,12 +432,20 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
 	}
 
+	/*
+	 * The internal clock counter operates in synchronization with the
+	 * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
+	 * cycles in microseconds required for operations to complete.
+	 */
+	rtc->sync_time = DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);
+
 	/* Disable controller during SUBU/SCMP setup */
 	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
 	writel(val, rtc->base + RZN1_RTC_CTL0);
-	/* Wait 2-4 32k clock cycles for the disabled controller */
+	/* Wait 2-4 RTC_PCLK clock cycles for the disabled controller to stop */
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
-				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
+				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
+				 rtc->sync_time * 2);
 	if (ret)
 		goto dis_runtime_pm;
 
-- 
2.54.0

