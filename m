Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C61B48CD7A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734881; cv=none; b=f/3DNPACpUVjSfEZKAPDtfMPaVGeEIIt9wnqj/IhRRhW9vV/tcuNBRNGOIbE+HyAzGGhStZKF8ToFlaCM5bChTZ1vxXpc4t2+p2nfBfSDMfdI9lGaSe9rIUCqmjwBnh+o9+JH4rwn//YdPQr/ZaRuICbVFYh1j+3pfA/RbDDvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734881; c=relaxed/simple;
	bh=5Y5sL6+J7vx7knLCO6QvJggTZVlGNEgVsdnejYmQ5hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRl80f328EqTcIrUNU3uOaXJa3pQNsIQ37VqJ9wPo7c/YqSRB6i2bcsRXvEVttrNiS7nUaN4W8dI2mxM9zsWMtc3YNij0rQ4gpOE7TFM+EqcT+BZ6vH23xsmTJCLElOxPqy+rWy8z+0tciX7bCcNxltVnFfXMz+DvS3kbUhG6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bywXAKZk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bywXAKZk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccf2360620so14905205ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734880; x=1787339680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcB5rq4VZBgFk1thgYSh8cIbkfOzI14sOVjDrq4EZoo=;
        b=bywXAKZkv+PUj3UcegTh+QMlAWRgbf3btpBGnJ/VINrPf2fdNVDXNKcOXXi4insOWB
         NCnfHf1L5W+Gsf9/ZbfaGi/CJXQdRwdFDYhGjnnnumrfJvVnM0svnzgzuFN09HE0bugN
         BoFxna0xvQTWaJi5E8RviII1ExWSfmO/ObirdSpBjTr4Ep9z+oLSmeC5GsFk8c0+odts
         3U+Oi8vtRXCwgYhhI9xlKJxb6TOUKaCAZKALLO+JNmMCZ+LZE8NHhoKAqwPSssgqH0jH
         ZFmVFgjGGzp7kb4O7uKLG5bGzteVdYn2DK7UmfuOFgxSWHMiFFfhm7MYxpX04vbsbG7d
         B6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734880; x=1787339680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcB5rq4VZBgFk1thgYSh8cIbkfOzI14sOVjDrq4EZoo=;
        b=ZhBV+NyRkJidKB3lS+rC/MSxZ3F12P1puN6loOc97rsW4+MYoq973VZbiOjerRvzut
         IOXRMWS8y0wmq3LK97byYZBTxSkRT2eU71UdoTII/S2DKCgRfkUO5gu7PhQKUPCe9CYE
         BwJD2hVs5E+hU5eWprC4FYIxcIP6+m5D88zNjvymbiYwFMI+JOK08ANrQKYNFci8VjoE
         wVUuz8PLuzqGSACMEJJL/ZDmM6Ioj4KS4h197OpF0Rcw5GqvpMh5juWt52z8vrmCL49q
         tJMN6KrkYZe2Yov1d9qxnOAfA6k2sfc/YjzFyOtNdAUecRAMcDl6RvgiQiQb/9puhdoI
         /m2A==
X-Forwarded-Encrypted: i=1; AHgh+RppWSqRnSIKl72wURrdP+qqOOVlry+TpkcjfdrZHbpZndTWxG+c9Mi5n/LbzApY+TL9Gw6Ac1dGgasTkR+9T6kZDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6Yix6SeUTbEGGGfDsa3HOeCfiMZ5GCIdOmT749pgs0Yw1Znq
	DzvK72o+6DILTad7KPtUBbDyVBmduUE7PP2bnqcVyf0VOaEWYPmTPacw
X-Gm-Gg: AR+sD12f3teyc+aeqWc4FPLwMl1AYcErnLduNBXvravhgWjrHhMf3uQumAziQuuyMde
	OYt1blc/sImqUaiHigbf5wQ/7z5lkE8jAerXdiuUklZrUSaXH2/llh3ywHjA4gyRfLj1S52cQ+t
	Z2uPt+wPGSWmyv2UcvDyAUTrFaPjtTGUxLNcvt7o85Dn55TER/CcxePeVMog/3rWdB91oAMt+E/
	YnTK0q/4kDPxt5tpgNnPfT6hWI/Q4AmWKlSzpaE/7r8OJby2UXlCiuDSbbwaQE5iR/8IfwOMwwn
	f9pKebSyOjlK720+09JHKUV1v6zgpcaRTNoTOevDIv/Bm46o6/WEMzjc1RZvLkNxOVvPQXUCx22
	1bvBJpZz0eZiOjEzSjzWjuo6Mpd8ikyj1G2vEfhsNr3lfJSaeuzM9fKgBEiNplaDTChbtObFDPG
	CchICVmmBU+7vtTTQvwaqgflfVaDcWRUuVecaTLe+1bRCdljYiF9g7QCt/Il682xkCMHUc0gweK
	d2w3WmshXgOqb0nRw0SzzKcgz8w29KqNhcEXtVtZPCvRP7OXjg7Yx8/NSJKOzF0HpjdSMP7iZVU
	qgt0s9tG
X-Received: by 2002:a17:903:2bce:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d3b0aeeb33mr96710455ad.4.1786734879498;
        Fri, 14 Aug 2026 12:14:39 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:bd48:a716:c86d:67a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm6734865eec.31.2026.08.14.12.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:14:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR access errors
Date: Fri, 14 Aug 2026 20:14:12 +0100
Message-ID: <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR helpers currently access the register directly using
`readl()`/`writel()` and therefore cannot report failures to their callers.
WDTDCR is located in a shared syscon region and will be accessed through
regmap in a subsequent change, where register accesses can fail.

Make `rzt2h_wdt_wdtdcr_count_start()` and `rzt2h_wdt_wdtdcr_count_stop()`
return an error so their callers can propagate failures.

Handle these errors in the watchdog start, stop and restart paths and
unwind resources acquired before the WDTDCR access. In particular, restore
the reset and clock state and release the runtime PM reference as
appropriate when an access fails.

The helpers still return zero with the current `readl()`/`writel()`
implementation, so this change does not alter the driver's behaviour by
itself. It prepares the error handling required for the subsequent regmap
conversion of WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch, split from v2 patch #1 to make thing easier to review.
---
 drivers/watchdog/rzv2h_wdt.c | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..b770226f785e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -150,8 +154,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | of_data->tops);
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_start(priv);
+		if (ret) {
+			reset_control_assert(priv->rstc);
+			pm_runtime_put(wdev->parent);
+			return ret;
+		}
+	}
 
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
@@ -171,8 +181,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_stop(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
+		if (ret) {
+			reset_control_deassert(priv->rstc);
+			return ret;
+		}
+	}
 
 	pm_runtime_put(wdev->parent);
 
@@ -188,9 +203,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	bool active = watchdog_active(wdev);
 	int ret;
 
-	if (!watchdog_active(wdev)) {
+	if (!active) {
 		ret = clk_enable(priv->pclk);
 		if (ret)
 			return ret;
@@ -234,8 +250,19 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_start(priv);
+		if (ret) {
+			if (!active) {
+				reset_control_assert(priv->rstc);
+				clk_disable(priv->oscclk);
+				clk_disable(priv->pclk);
+			} else {
+				reset_control_reset(priv->rstc);
+			}
+			return ret;
+		}
+	}
 
 	rzv2h_wdt_ping(wdev);
 
@@ -266,11 +293,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	rzt2h_wdt_wdtdcr_count_stop(priv);
+	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
 	pm_runtime_put(&pdev->dev);
 
-	return 0;
+	return ret;
 }
 
 static int rzv2h_wdt_probe(struct platform_device *pdev)
-- 
2.43.0

