Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D156486652
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246236; cv=none; b=s4AEJmv3xe2SRgPc+xxsObTh9EAVZonQvrQOClS+j9IxaF1AQ+qWdXgyBqxDEH2aLH1wlrIE+cgkqEe1FxX/AHJ7sM+i9gLYjYKi/c2FfUbrkfY0j64laKGVm+Rni1rcYkuGsuhFuN/NHQHfE8AyI/ABjGymOpnqJHgOBSj8E7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246236; c=relaxed/simple;
	bh=09RqqplIdr6aOQ9UECulsqoZJISUbIr50rncFfrWAkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsyV6JQmGFkCKGqB+EqZ0BwyilMqes/Un6GRu6OQoqXk51zKnaNMLxhh+BJjbZUmRceBiqJcegpbAMJthBjTcX7w8lh4jmtWup5vIa4WodkzPTgN/JanQHbr5PBVCIlOY6uUgA9xl/zngZrVuZhzlybfc2oYXTjj8Z2NZMTnCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3gCKOoT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3gCKOoT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so504795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246229; x=1787851029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWMq2FvPjpeh+c3cKg73BE3wVk+QVZLulbIJQI7NR4w=;
        b=L3gCKOoT/12cw3h6gI0tlVb1rx4jN+bsMWlYM+JH0Pz2CtMwy9egrUdH/klWE7J1q4
         60S7CUZFTV1d4oyok4yhA0F4bq5Iaez94qgsDafxTi/xHR3oIyhDiApvBhDnraPBiIDV
         7s1s+TliVXQjm4ybqaXzpdhaX/7VoRbBqTLs8Wc66eqqtn/veEMLCI1nyQqlqCAV37bJ
         RgRWVrg5KGdjpwhicseON1RRWb4hqdpNTpBSk3Okc+PSja18IjtKzn9CV/D17yF7MJQJ
         E7fitCB3ij+L1mZGRr5+fJSwzKhZTfGV4wfE84YA75LkLlQ6RnTrWPZGBgqzrU9aFAg9
         oTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246229; x=1787851029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWMq2FvPjpeh+c3cKg73BE3wVk+QVZLulbIJQI7NR4w=;
        b=mCCTxzfdLmeB7Pz2O3nFUQyTXG/vHZ9OLfN2SzS8tW6Q5MFD7HnxSUEzZuvzj5qvb8
         NTRovYc+LW1TIAnTOWjdm1qPx6/id9//lJxpCPMEmq+nvxhKAAmiz+dzGnE9tVfmvfIA
         y0TtjNRZeegOx4naTA8ei/D2+w8enZr56grvpaAZy2ix1Guj0l1+6LIaw6CwEf5VHJTI
         UwgqyEjwbG/58Mi/c7gcyoWALRafo5t0/tPKvgvQIOorEkiQracbbGFYu34zzNa1NzoF
         zVJhOjxk32P8TOoxCroFm4cwKiGXpnrYU1sDWtoriHVkM2EMfNQr5pBav9aWPqz7/Meo
         pUog==
X-Forwarded-Encrypted: i=1; AHgh+RrQ3evcMXHBLVSO/xpMOt2f14f6Jagsac8rNuSXDXvAK6mWRyKZmG9qfDzzNYyZtN0TEKDQYsaXilOU+8LJTRdszw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxocGE1LF9TuQt4X/iLOZQWq+9pTvUVcXkvidfplwILtb/A3dHv
	BmY0ALnTxiJUqsZaymhw2Ppaxea6oi2E/pNNYjrdd2AHYIQiD8DB3BUSeFq1Pw==
X-Gm-Gg: AR+sD12+NK/yqDhnfmoqLN6PxNoYMTLHAqMWuIWpM+nUA4EBLY+Vtk1x/9moLxOGWP3
	zC73DQLPLANKJxnZszAWTrcZUVTdvYIFoIbNFZq1GCr62/p9WdBJfSvgk9cHhXiPW/EuWCqCgU/
	Mlx2O/yMhjDlrThlmwu4CjK/cL2mCeqbgE5xyQDWCTmHyLlw5sg4i0Ji8jgI/JyZwABUtP9P/BB
	n9u+4zxoPN3E6X58J8weG1FWSFxgHyWPQ3EHUmOQq8fmg2OzMmZrFGLtgNJ5AVIM0881Nq/+k+r
	OoX8F8Zp/L1LrfXm97VAljHcsggeOyJyrs3Rmm+/3TWjSEkjbZkONg3ZdE7C0EIdrlojwFOqJJo
	AT0bloNfREpaFCViilo3RumhVn8BxCbwCJfw0G35822hEPU2TDG4nvCwtJ8PqEPrV7nPI6jO1hq
	G4v4Db6OfUJK9i7kf/65G6oazB0h/tvQY9jh2Duawh3AV+/uxIEN6oK9iUjGiLu+YSoTBE
X-Received: by 2002:a05:600c:8105:b0:499:8b00:5261 with SMTP id 5b1f17b1804b1-499b831e255mr8632185e9.8.1787246229323;
        Thu, 20 Aug 2026 10:17:09 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v24 09/15] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Thu, 20 Aug 2026 18:16:39 +0100
Message-ID: <20260820171657.62815-10-biju.das.jz@bp.renesas.com>
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

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Fixed the ordering of resets in suspend/resume paths.
V18->v19:
 * No change.
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index cef043d22dba..25a313e9e7ac 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -102,6 +102,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b5f2ff68db75..99f57f22a7b2 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -641,6 +641,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1155,6 +1157,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1385,13 +1395,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1403,15 +1418,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }
-- 
2.43.0

