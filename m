Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1D499F05
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320662; cv=none; b=O+1w6e1uP4AVZtXEKwuEMAhsrsNlDWU0eGCpLtG3I0TN/hcwG8UOmi8STTzNrByhG5d802qBYPbAe6CJBjdVARws4xL1+NqgFV97pAVkesTG6YUIGM6U4K4fXDyzscgcaVNxsJbfDpy7S1eikeQZAj0yU81jQnDnnQMkWpFiFV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320662; c=relaxed/simple;
	bh=hePhqd6mttCdYocRKJ9lHAUTzqYuMejlYulz3MEh0Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSboxYtN3/L/PS7tiAu3R4BoOyuYKXJPez3vhc4HO8dmy2HgtwFWS3osyJZgS2ONSP1+DdKMdgSoFOsHi9umGQstot/x8KIqWNNmnT0CmS+c+aT83KPaRJEDzxNSgvut1lYELNXIW5BlTssGYkzumYk4nHPxMP8C/n0dFJg5YSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovq7Bz6F; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovq7Bz6F"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc11a30a259so1045715a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320660; x=1787925460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+vlz4a3cPeY5oqSreIwjjufXcNcsB/FD9+DW9/zOaQ=;
        b=Ovq7Bz6FylXcP2VEEJ1G14rzfb+oxTcO1obpjjiUxPeG8w7IPQcRO8YzHPTraeaFbb
         4PJoAgOXdRaHlw0mFst3bgpPCkMV0O5rjidEUO4pHMsj4ilIcoH2kz4OuDeHIBxTCtsB
         a6iCSjMvdrdYzWVeErULYEs6MOChAXGa5dWhdp/jdah6lFF5OVQ+fV/kdii1EIkiDz7N
         gmzn112KjNCCrTv8cXv25oaLG5K5pAWEU7ZV3ARMNpvyyblZBceRCTWWAhVcNXwFsnAD
         HHDcDM0ML0oT5fKQR4w3xqulmffXKDDCIp+5pk8VjGklSpDFm4LUFfAFMi+O8++PCFH1
         LxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320660; x=1787925460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+vlz4a3cPeY5oqSreIwjjufXcNcsB/FD9+DW9/zOaQ=;
        b=eiePDgN8zFXdUXTw9O5AwraIHY3IfvE0YIyPoLiptprlX/0qhFFYxWsdnAJu+wntPS
         oa/TLYtuK3sBf/1LRzy95eD/jAmOOVRIWKVlknOv9yXIY2Oz1WJuq3h35YWe0L2XX0yw
         ZGRlLs+cRv/4KwPbCZ70y6zW4FpDeb9SLnm7MHdLROSpzbuIEFJKDzNjRsZPJ0Mbyxfa
         Z4tntEfJdNZHlBRBoR2NOXIxr6EVnOSjtKKSoDuuz02nt6hAjY9pMjS4Fh+8aDI8+z1S
         DdtaH3oqZuBUG1BRbNoaImCHOqFs5QVtT02q/c4EAR/IQx9Z0zR4sXvRaEuJuAVwUCq2
         A6gw==
X-Forwarded-Encrypted: i=1; AHgh+RpIlaYxeBOUAgvb/IAb0olldMtN2wGuFNOTPcd8OTRv2fTGceVJ4X2sKXkQWvbxlYtQcbZzeHj44dPzTwaLQEgNaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsmBQGiA/Ru3sH2MYNCPVIT6hQbvZU5HASsKVw1rUuokXHmWD
	BYF8smRy9QXl0R2Qho6EV/KNLpnVLYptN/ToaaeS3ItlEFrO2SKhUTeh
X-Gm-Gg: AR+sD13OV1X6PO81taBOn2bkkoW7+QxmTZJpCjABb72LgHCbHpvR13xGuPbIuiXVvhJ
	/fGXIaZ1L3ILOy4l70a85LLlqtlqYc58CbOkziUxeutEvUvQzMbnHpGml1U5KuSSEcjNfJhrZRl
	4qlRW02hyYfiuz0sM6Oz8lkE7gXomBh4i8E87gpILNAVD3SvNiSeGC1TXYYeDFzopu3j4nXAYf8
	Eeumav38T3zlTT9dqrjRlJlZBG117u/nGEdwX5FFKfNmcPfYPuDpFkXoGU6vYDzefI05aKptN/+
	Y0ddBF1n633eikHmz0ALhFmeJBFeoDB5V1HYEBvTR89xLfY4K1HusbMtAomTZqLmH/V+zASetzS
	Fqq2BJTz0DHEqXK93mGTpEI774Ezlo0i/NxXHo40n8kD+ePBnZx/f3Ej2EnsNqRlpqt6CGHWAHe
	heH/dMkHJDu4VNBddu9DuOmRJ6a7fD615J9uPiGwDbY8IZ2CyBmX/CJOuDw4A8R1o6sdWqlSF3b
	6+qAYWcZJXyrbHqsZLmIGe2dZrSysEONF9+pyzSO2tyay6GX9gO2hO4gtPEFLTcKZ173t0QFS2T
	8HG78uFpF1bsrLyypTIDTA==
X-Received: by 2002:a05:6a21:44c8:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3cd2ff85523mr13296522637.11.1787320660230;
        Fri, 21 Aug 2026 06:57:40 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:39 -0700 (PDT)
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
Subject: [PATCH v5 11/17] rtc: rzn1: Dynamically calculate synchronization delay based on clock rate
Date: Fri, 21 Aug 2026 14:56:02 +0100
Message-ID: <20260821135608.275233-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Reviewed-by and Tested-by tags from Wolfram.

v3->v4:
- Shortened the comment describing the calculation of RTC_PCLK.
- Updated usleep_range() value to use 2 * rtc->sync_time.

v2->v3:
- No changes.

v1->v2:
- Initialized rate variable to 32768 to avoid timeout_us of 0.
---
 drivers/rtc/rtc-rzn1.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 02d720e95a7f..2e5d2460d79d 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -69,6 +69,7 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	unsigned long sync_time;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -119,8 +120,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Hold the counter if it was counting up */
 		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
 
-		/* Wait for the counter to stop: two 32k clock cycles */
-		usleep_range(61, 100);
+		/* Wait 2-4 RTC_PCLK clock cycles for the counter to stop */
+		usleep_range(rtc->sync_time, rtc->sync_time * 2);
 		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
 					 val & RZN1_RTC_CTL2_WST, 0, 100);
 		if (ret)
@@ -397,10 +398,10 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
-	unsigned long rate;
 	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -450,12 +451,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
 	}
 
+	/* Calculate the duration of two RTC_PCLK clock cycles */
+	rtc->sync_time = DIV_ROUND_UP(2 * USEC_PER_SEC, rate);
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
 		return ret;
 
-- 
2.43.0

