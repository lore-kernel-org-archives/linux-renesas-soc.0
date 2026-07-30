Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572641B8F7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411136; cv=none; b=rw+sW0iqJimuN5OQt/GON1hZH5xHFDbY/lGUC53AdTGXpTIFKhQSX2/ccxwiZppA/qw+jXTQKWgB76hr5SBgwTY8MkJR79F18z27OykY+NQefFuCztKUkKle55MzDJZpbryOL8oaujXH1WHBbwXF5+f9RjirjO3gE84D3YwCcvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411136; c=relaxed/simple;
	bh=/xNA7EXIhSCo9lgOB39JI/P9JaSZ0VgwLpK+Ez57y10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln0vhVzri3F6154Lims+dkegnSwdDXkewccQFfiLxOs8vnQNbb2/6x5qPQC3jYixLgAhthD1dH13RWBmhycbpSogWW3VkxJT9M29bJjbQsjXUic+/ZrGAsrQtRLoxAR9Lk9bz6Jie7gJUBM332DImkR24d8SuLzkUQ3/TOTuyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcuqIyuA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcuqIyuA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so1532570f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411132; x=1786015932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRvcrtcqnhGgSFkrIS2JSbPQJdicpHVDNdLVJkGZfMY=;
        b=XcuqIyuAMmNsb12gz7jPU637SXlZhOx8OQVNkPJzzCCeF51HR0Y4QecSh+zFT1o8SD
         umAec9zg8CjeczB5Dk+0uo8wP6PyzUNMnCS61wh03fooWA756zSkwxV7s61PugaW+ocB
         pvHEuRo6fUcQ9jrwVE7SZVlm/XmVonIGWWZjFpPU4uhZ5gUL3pYF9M26qyCr4pSw0kt1
         /sSS7OXBm8mCGYfc5HYFNtkBG7uuoOCY6vAqrIKFvx9WGFmVi7SdlDbrofGRu0/ykgFY
         zW33vmPvSyiTnJCW+YHHCkdhbCy+H8SdAtpcy8/4HYi4SC+drrf2afoRaJbVMPelOGWH
         W6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411132; x=1786015932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRvcrtcqnhGgSFkrIS2JSbPQJdicpHVDNdLVJkGZfMY=;
        b=jxbEyZPtderuNjx4yykKn3iOtLqi+L7Z83tu2AsBOv/vrAxTVeMzzQ4LY2r4h/pH0a
         NEVbjzQsvJqhRw/90sbHGMreWNi/UuGSb9Nu3rOF9FnvKnO0UpgezoSYz5FqZ7Z8t7c/
         i4MQmVpd/SatktCAAynzX1SblwHaGn36auMLTIOOI/cp/Lj6MawbH7pAYgwx5+Srsla7
         qHGNyG2i+jgs9ki8yS8+1v7Vnnp4KDAMMyi5noQ3aD5bF52hAZev5GFR+/+4Qekr2sA5
         ZcmsPfGJE82xhddqxkoxmpbwJzTavu6V9O/9wIF94lARwNRCSEJcTqaQPbOoF60V3M6i
         /d4w==
X-Forwarded-Encrypted: i=1; AHgh+RqOKgP2OOMf8MTvB+adrXXlU+AUO8DuJCQPnpjT1U311Yc2gjq7kgQZeIFYM+p532xZXgQP8ZzLJRE5GDTopz+7eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAc5DV1Xv/8leqnCitanZfkdY7g4Kqu+kJx/Vg/kQhi/fLo8G5
	hqu7eR7FKzpGZB/CznmUrsW05RWX4hAJL8Dh1n7VBdr7rY60doh8cgKK45Sl2g==
X-Gm-Gg: AR+sD11FfBRp3uKAhG0Hnc42KGz//bgrC8YAOZIVOTiQjFEAfolEdWmpCwihL9gArLO
	ETL91zB2+kLeOvHEYI4Do9BVa6VBjJ4SaoXVr4W638rcNFBwGxwpPyprCKHJMLNF1lcKLHfOGEh
	7fQea3STo4iu2hcIlZsXcbqMegPHCo7grio0gQPnnjDnnqShT8gtROGvW4IT3e6ORGEp2nheMZD
	Jxijr1J5EvJC+2iCa5SH3lAA3T92EvVZUxFyyZWJ0lcX41hkVc+4a/VJpxv4uAVFcR4PKtbm0io
	bqiM/Q/1Pmg6KiNWqhfh4dU31qu0LWvqPGDIvJAnTqBbNK7J94THYIHI89H99tlGpWa4N0hZV3g
	Tkg54JCvjmC2+0qa4oLy1WdaBLJLJtUo4zRlsqunEnpp9c2pwYnUXJdQqFhQ/0Qq9ehgdAJ/lJC
	h9OFLwDpmfPdiFCbgGtgtSydDs04cu6ZjTOJkMYRh3oTMJi1FQaccLQRCWKfaksbFQO56QoEp2M
	Vz8TVNXhGlfRw==
X-Received: by 2002:a05:6000:2308:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-47fc81f53afmr2967908f8f.17.1785411131644;
        Thu, 30 Jul 2026 04:32:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:11 -0700 (PDT)
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
Subject: [PATCH v23 08/14] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Thu, 30 Jul 2026 12:31:46 +0100
Message-ID: <20260730113200.36456-9-biju.das.jz@bp.renesas.com>
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
index 9c72eb78e31e..3b140cd4ee0c 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -101,6 +101,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 655f0920c015..ebbce7f010be 100644
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

