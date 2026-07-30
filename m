Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24984195C8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411135; cv=none; b=HCV1xPYGw0r4YIW3Av4W8II+a7GKGR4cIHwJJ/0uMEFqg4zDfWuD8xgydiX9cPjH8CTJu0f/xY84mdUZjff0NROm7Ql0j/jL0ygFXJlx00RRBXbO6he2njpikWsOMkQ2yMdpQKPMKA5mzXGax7xJUvRzq3fbW/orOPO0zl2wbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411135; c=relaxed/simple;
	bh=DcomajeiwQYU2WRfh/Wfcyi4a4QbJLuLEZWCKejl8sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR5gun8eDXX4ENhTb8BsaDi5R2M/CjmMyqfamaTlXaupztVolR/JcAPHrda9EqC1g1PsxbLW8jpJxhgvDHDOVk+rT8aFhAh6ysTL9uaFIJ9rZwrYLqWmMFzyTSbUmPX+xOszSLDSe/JQ1SBVIz5QpcsBBMadOKF4uEC8X7gTKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JY3jLyTh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JY3jLyTh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-472326ca506so1431047f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411131; x=1786015931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVeWucm6Y+Kssz1cz2IxEb/3Jy+yzinhHMv/lgms5jk=;
        b=JY3jLyThu/oWrFxjTZDf4sRRAiwiZp5ymyMuE/MhmfMVRx/5xZzRWTBFUWfZDqYhFz
         ysYtnZW10j1rOhnEcl3GXStoE89aqfrzkfOVqGl+FzM68Y2jTNpo5ADroekoeonyAljb
         Yf/H1cMNce4riFO1fIoG6fx4iu1OIPNwsG3hAP1m5H+UmzVFWgrQAABYOI9oPOa/Zl3Y
         909c1y7Xwc3zsfvQ3ZEsevzi8l2cJwLJY/ERS9/YdAW9SzJoNOkW/xkvMvlSdFNxQ7Pm
         y+6RCqU2ydMKPnO3KqgGF6Ty5ahCHTzNilbiIKmIzJv1tQOo6PedA8MyM+57v5DLiaEt
         qYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411131; x=1786015931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVeWucm6Y+Kssz1cz2IxEb/3Jy+yzinhHMv/lgms5jk=;
        b=JRnX4Z7WAO3JxyL6msKocutD+6NKeqPActcRxxJPo0ESwDxvr4r/ljh2+RNkc6HtVv
         LT03ZXjDH0t2I0QH5rrj3KdsvU8lDR2t7gH1a1b4krRmSTFFFl4eHBuxLFRe8C36ucEg
         IT+y/W00NaH1EcUWItLSopdrjCbx0uLKW6uHXdFFKnXVwQZyD4/HMrcyFvNhcGNpru+2
         PB0IkemniQdWVoplbxG7dcYbsC0WUR7LiLlU90wJTwBUK9M48xKJ4Lo/5k67TcJI39mO
         l23e8oLqiXsOY+vN4JOb10kXfTY5BYcG0b4HRUvceiDZQT+HV3Q5M2JHpAKVUO91J5yP
         Qr5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDkX2V6IFSIGEi9pFneP3Z2na7TwpklhjErTSoq7sy4PhPvbcDnopWIIV0gaBGbf8y9nVce18WQ0KcpD2vgzA4+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yThHhyMymGjYhU4zkeQ9OYaRoigruO7tn1BkYSw7RNe07sW4
	KoSPr+m6PESL5xOcBarl8WeUw0e5Op8Z7ndhAewvhmZgQ0PEGJovr29U
X-Gm-Gg: AR+sD13yudPUDlc8GRmxP7mhFR98m/pGWeTdPMKIzxoCN16mT2x5zb8VSCT5uRGm1Q8
	Mkpdf9rlvs2phmtxguXTU98QGEmcomWDxULKKVCCACJVLOXjSsnfTCcAmsHOBRrdJRoZCOTHSO2
	HkUGdFy0sNZRtMOrhe9WgCacpBiW7Qhyw2EaVQbrWsb7wYWZ7jTRhQuBv67InAmVaFt6f9N1emM
	uwCcHMGqYo0XyGwYfJ4apAuC38JQSp+XEeJUnFKm7LjSrq7Ga25z1rcffNQKPPgdOvo/mmzDENW
	tCxUGXwEIQWiuuK2lay53a0dcG18Vj9K6/68ADZx2z3bCG89lW466yfF1sVMnbzQi/dP/SgPcjJ
	gLAHAJ0Htzd45X1kwxHeoOs2mn0+heZOSFLksEl4WfBjUwNc0SzTOs6Ax8Qb+x3cmWaGFPJ2OFJ
	+QXo/QZpMFbEkTHcyZ3YRkWYXyolQYEmQT2NXu0yZKAHUgq9Y1dknUdMw3HBfAIkrPImHyNLr+y
	oOV0t+3xgSgmw==
X-Received: by 2002:a05:6000:1863:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-47fcbaff41amr242617f8f.3.1785411130675;
        Thu, 30 Jul 2026 04:32:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:10 -0700 (PDT)
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
Subject: [PATCH v23 07/14] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
Date: Thu, 30 Jul 2026 12:31:45 +0100
Message-ID: <20260730113200.36456-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L has a fixed internal /2 clock divider active in all bus
timing modes except HS400, where the divider is bypassed. Add a
TMIO_MMC_INTERNAL_DIVIDER flag to mark controllers with this
divider.

Add renesas_sdhi_clk_get_rate() to fold the /2 division into the
reported clock rate when the flag is set, and use it in
renesas_sdhi_clk_update() in place of clk_get_rate(). HS400 is not
yet supported in software for this SoC. Adjust clkh_shift for the
internal divider case.

No existing platform sets this flag, so this is infrastructure only,
with no functional change for current SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v22->v23:
 * Updated commit description.
v21->v22:
 * Updated commit description.
 * Added renesas_sdhi_is_internal_divider_enabled() and
   renesas_sdhi_clk_get_rate() to simplify the clock rate logic.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400mode
   and nonHS400mode(uses 1/2 internal divider).
v18:
 * New patch using flag.
---
 drivers/mmc/host/renesas_sdhi_core.c | 31 +++++++++++++++++++++++++---
 include/linux/platform_data/tmio.h   |  3 +++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a0922bc9d4a5..655f0920c015 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -125,6 +125,27 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	return 0;
 }
 
+static bool renesas_sdhi_is_internal_divider_enabled(struct tmio_mmc_host *host)
+{
+	bool enable = false;
+
+	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+		enable = true;
+
+	return enable;
+}
+
+static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
+					      struct clk *clk)
+{
+	unsigned int freq = clk_get_rate(clk);
+
+	if (renesas_sdhi_is_internal_divider_enabled(host))
+		freq /= 2;
+
+	return freq;
+}
+
 static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 					    unsigned int wanted_clock)
 {
@@ -141,7 +162,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * clock during tuning, so we don't change the external clock setup.
 	 */
 	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || mmc_doing_tune(host->mmc))
-		return clk_get_rate(priv->clk);
+		return renesas_sdhi_clk_get_rate(host, priv->clk);
 
 	if (priv->clkh) {
 		/* HS400 with 4TAP needs different clock settings */
@@ -184,10 +205,14 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+			clkh_shift = 1;
+
 		clk_set_rate(priv->clk, best_freq >> clkh_shift);
+	}
 
-	return clk_get_rate(priv->clk);
+	return renesas_sdhi_clk_get_rate(host, priv->clk);
 }
 
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index abf4134a8bd8..8d435f7690a5 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -53,6 +53,9 @@
 /* Some controllers have tuning delay */
 #define TMIO_MMC_TUNING_DELAY		BIT(13)
 
+/* Some controllers have internal divider */
+#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0

