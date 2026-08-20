Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA532480961
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246228; cv=none; b=JvR9VSqLd0+y4dXuHURI6GzxQ+L8K57mM4RRF84deWuAdUR0FOn7D5YWtHhCcuiPGFb3SKdfpr3CxYtIHdPSgh24eA/Roh0VZ1xXZSmeZXVvYG5awTElxBJnn3ckVolZ9jnq2Gq443VNGIpx4f28glcXD3TAc9YF8SSrFHeVGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246228; c=relaxed/simple;
	bh=LMVqByU38FdLjG5rLAA7ZHIC7mjY2Ws+ctnXmi6/sFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyIEQw1MnzU2sB4VoCY6h2PgD33s0evhBGJeYREMPzvI0luNZQoeqhVSlLK4Y80xIadcN7pr4cwtPhGzwgVYrDk0TD4EvgM9pzIXIvxgrolnwFPmXkspDCpAKGHv6snw/0HRFuz+ZaxEuzHoVGsvcMT/V8r2Fwp9UF/8HwbXVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo7pnHop; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo7pnHop"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so324415e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246224; x=1787851024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evee9pCw6wURFV/VMZdiihB+PWUJ4VouwconvXAOZkM=;
        b=Zo7pnHop9ef+0pFsqEgAIf5hZ8cpbfHDFw6ItDwRxlFQvqa8177yf0PB8hkKyYVl3H
         kox9QZA6D5D8Kfed2yJch8Yx9WS68/t7ybxNLGFuOihtFekoOQZ5DacmqD6lHn8CzMvL
         0T9WrOKmlvZt5mszrsnQgQeuWecacFonr3AhHk0QUYI6TwALQlM2Civje9U54q/yw6Hw
         XQKHqipXIuSX14EtAVr+5kdX4OvwCqr8kN2Aro0Lrlf9uCpE9S+XOZX88SBgxzkaiWgs
         BF3xRhRgTFpuXTcudd6lrU97hBT+G5oPPfsrXoP1egBQXcKb0ajQDjmbd1bb9ZRSopp4
         gAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246224; x=1787851024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Evee9pCw6wURFV/VMZdiihB+PWUJ4VouwconvXAOZkM=;
        b=A8CSYSjsomte8sqTdwt3FPv0peBPavkHYG9J9igqtAxI/yAgdyCJDa4VxgB7N2cWDN
         XHe1LPI6kM4vwcMzdqYigtgTnabMcoLYxkJO2LGsr6liievCIN5EXRCyEswGM1E3JJmK
         3mS67CbtdT+BLe0lmYJLPYDgz5EwfdxJ3cS9JNUtJ92UlGhwN6LTRMQjInQvcIV5ey6E
         qtCZp6FsqHNrAxKHB7GjPRgd5WXmAgwrvWAeNFKEzFssZoantqwjp/3/SdBtoSPWo12b
         InVSJ9CHTxVgjglYMLSUY0TkO77Mjg19DvEK2g78NfO56NrfJpdYD3Wv6RiQr9QQY4xS
         6hCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3XmKTgNLnEIJniWWHGMRC8PRuMZWzx0LXFJnIjNIlXcS5Sa0c2FQDl+rSDPMZSQLP7vBR+L50+RkQIaUxEFUYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy62mlEFSwQB4/aOSDGsPr6bmHu+lptxnqgvUsvcLaAmFuY29cf
	i15O6wC/uymfQSbX+ripk2UjMrKs5I5UQiZG+PHfYM/cqoB/LsNjqAgT
X-Gm-Gg: AR+sD13ta8EFMs2JkS4qikJK2Y2of9BeAAKoKCedR7Nou7QYmF3B6jML0AEoZ9+56mx
	1BTyXeRu2JBJWSSUpeTuKTMGbWeIuZRAVB+nUPhJUW+2pTZZoUNrkReHSVRtKKMigtRJVoxbqiP
	p3V+9uFd57AsBhAuXrZp1xdirTJ81quTPFYlDmQkBdXbjh+sr0CzSwJV+V3eDR+r5ZX5PAIOidW
	AUXAiyJPNNg2dMVaNlSP8frzoWyULjwFHT4gPOufOA4BTNRTT3t6Tj0NfxWp8WQeYxWpeXDSmO6
	l37B2ccwH5j5AwlENptnDhXxTIM+TJ/BdGDHvmoHhgz3LeX1K/uX4CVgE1s+PJaKjTZPYuvA3d5
	G2BYWnYmvu6y/y+P6cemf+lN17GL6I0+99N/A/oRD3vSEmDK5KQXgJh1bmqQdCDXbK0botLeFF1
	FyKZQRFcj8bjVMtL97oFY3MfFueiqNuVL4/HCqRIgbAQdP5eh9aESZuQt1KqrbkfPJOM5d
X-Received: by 2002:a05:600c:1d07:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-499b857fa7bmr5025685e9.15.1787246223525;
        Thu, 20 Aug 2026 10:17:03 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v24 05/15] mmc: renesas_sdhi: Add SDHI_SD_CLK_CTL_DIV1 macro for 1/1 option
Date: Thu, 20 Aug 2026 18:16:35 +0100
Message-ID: <20260820171657.62815-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the magic number 0xff, used for selecting the SD clock 1/1
divider option, with a new SDHI_SD_CLK_CTL_DIV1 macro. This improves
readability and self-documents the purpose of the value at each use
site (setting/clearing the divider bits and comparing against
CLK_CTL_DIV_MASK).

No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24:
 * New patch
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index af56b4bfb1d4..a1b2761ceccc 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -24,6 +24,7 @@ struct renesas_sdhi_scc {
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080
 #define SDHI_MAX_DIVIDER_DEFAULT	512
+#define SDHI_SD_CLK_CTL_DIV1		0xff
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d893a263e770..fbc0a8317b30 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -219,13 +219,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	/* 1/1 clock is option */
 	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1)) {
 		if (!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
-			clk |= 0xff;
+			clk |= SDHI_SD_CLK_CTL_DIV1;
 		else
-			clk &= ~0xff;
+			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
-- 
2.43.0

