Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9E414DEE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346724; cv=none; b=TgrBWzotv4BTHEUa5dL84uIyaQ4CDbcTSz4C3cM/H8jgO8JFiA8J6HTzdQulIZwpmBk2mj2vh0mOlwdAqe6JjbssCTvfirBP+482lozmaG/QCYAgG6gTLP8IujSZlZja6W2Js/KTuXESt9WVvB8HdoUDpSWTlrY19nUotTxmc6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346724; c=relaxed/simple;
	bh=s9BUVibUcdXFVsJInMHWm2yG1ceknFhn/TVwbVDtmuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QH+RTKjf0db9tl17++X4+v9CXU+H9nG1WmBezZXP6HNi6fgkQEedqbYC+u40xlrOP+CtlvZ5fP1D96JKYUdodr4pVCNu9YPdIgo4XwMtYUvxIwAzjU16SNutWVBlG8KLMeC4Lo4zZT+RuL6Xlh1ExDLD0QjeM8decZNB3no7giE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHOwoIrm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHOwoIrm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1130536a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346722; x=1787951522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RAGswYTmu3NrFU6zGdKpepBZD/bOxZ1HCrIvY615qE=;
        b=dHOwoIrmlrGbMeNqHKOy7Hq8R0UCxUm4IhQZvojRuxxl7hyFNqR0nOKtnCpzv0jJ5C
         qhYg/n59z4ClnNXgnPkXokJUYuj1YVjcIb9Xyb8tkSIfZdlTqBUTK7HjJfFWXpK1sxrU
         2DaMi9gcycXcU8RYsVj2GfaxCTzbdiYeoF2yDypxMLg/b3X41Xo5qUSp6BtikFzbizBA
         vdEilnbI4pFxlxaA8umtmP2c29BrP3WjEecUN1JYbKEk+ilqHJ4fj1tqxjjeRPOW1+4J
         E1yIJO5TKzC9BYHo0xcgOSdhxUGzpseET8TRU0OmxNzEAUJ4cQ5IKxlqWhh1ausyTDs4
         00Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346722; x=1787951522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RAGswYTmu3NrFU6zGdKpepBZD/bOxZ1HCrIvY615qE=;
        b=TpRdWl1k1nOA6hqfolVmOQ4bbigmcv9kXEfbLCCcPYrBmyOjE2shEEn9RXGJd1fzt+
         /Aw+AmeuubA6RzsWSLLCqY3aknkYM2hXlb8F+e3l3hNoOFWmV7JVvQbhf3XuSmUp4cIl
         d2G2gZjDG0SgEmm5+/6kEdIbWw+m+/miGeN6SznsaT8wGAPoTbXcZ/88YjBfm71wVehJ
         eCgJKNjxut89nekGZCGX2McZZ9zCFbC7WS8hGXO22CA/iK6SeSkVIo/GKmBr/bt7Pn3Z
         0FZZq3MFXHA5cITQFuAQK3PzuHbryIQ9BcnnKmiCDxZHqC8MGmfKDXRYIv7MW0flSBqL
         U5BA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/rQZWCpTFkMhc1WQr8LSHEVJ8Udl3KWTJuBPXSFCfmpvC/BWeFyxiIpXPsPV/Za4rUgtlyLPP8eKEJAloKH07RA==@vger.kernel.org
X-Gm-Message-State: AFuF++nCjxEkbz4xogTRo5kAPCUNYiZLsaoi8b712xoZTS4x/WlCfUWg
	lY/Y1x7OVDMohBIhZR9vPBCYleAJb5tQUp986oZMJCzTmyRRpgiof6N3
X-Gm-Gg: AR+sD11AeAycsBdOL4vEDVb2dhDdHPgPCpZW2P/y/kjTdkmaNPopb+R4M7h666gnnn+
	AUxKZQr2z+OEgSyZ1X0z3PdCEpNbtPDMkaiSmsBP245dbvQQn3lNggEDQ9MgBE/Jk3/DbbJpBzR
	GvMvvt0Aae/R+G7iNP8VpGrFjCdRVDMLXN+nGMHjFTN2sS8C2nMAFeT0RutAXCkulg/30s1Ll/E
	wQ68BUe0jmn7hvaX9PF8JBj8wuaLrkHrIzq460G+rsuCtN95DArA3TyrbnBw5HavjGWAXHgBUEy
	zg/Q6+Axnun80M7/M8rnpVkHjIr3L3t7OPHht8QoLhFj0mtUz08zbq5rPwEW9+caLH30rXtcwEJ
	lFx6OtwCKXwifxC2S+1TZ1QaNuNA1pDmo156x6EXi/bKw6PfDIEUZTzbOvsNp/bxX+wJTCq5zoq
	lnR7yfXRP9VhLm0DNY7XjoEK7R56Woyag+ZxP8LwMavLtxF0Qjw6keEjJQbkc4NIMHagGg6eEWE
	43XkElY71pd03K6c9i7zJye4jF2a1/ep8dE3V0ODa9+ZDVA2rPUv4/ESjh4ebcjdoJweGaizBOY
	Us/ji+I=
X-Received: by 2002:a17:90b:3ec4:b0:381:528a:808c with SMTP id 98e67ed59e1d1-395c397c6ccmr14692155a91.12.1787346721862;
        Fri, 21 Aug 2026 14:12:01 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:00 -0700 (PDT)
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
Subject: [PATCH v6 11/17] rtc: rzn1: Dynamically calculate synchronization delay based on clock rate
Date: Fri, 21 Aug 2026 22:10:26 +0100
Message-ID: <20260821211032.13554-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v5->v6:
- No change.

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
index f90785827945..4e62f7bc2e34 100644
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
+		/* Wait 2-4 RTC_PCLK clock cycles for the counter to stop */
+		usleep_range(rtc->sync_time, rtc->sync_time * 2);
 		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
 					 val & RZN1_RTC_CTL2_WST, 0, 100);
 		if (ret)
@@ -398,10 +399,10 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
-	unsigned long rate;
 	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -451,12 +452,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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

