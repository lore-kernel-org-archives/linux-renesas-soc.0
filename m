Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE12D6E58
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199144; cv=none; b=mHnjgULHqfPaGWz6p+nRDGWifcIUFzEeSt+5/nNQv64qxQ5NWXyf2O0bVm2VPCdgB/u3TDjAiiIZvQKtChv7Ypvv3GQVyLrQZroTlXLVZAXR/fQC3/qEBQ83gkDZ6/Jfr5j8vSnSTmirGsXHXcwQL+CyNb1f9Rg6ObAnEVPf6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199144; c=relaxed/simple;
	bh=dtW/E//tKIDKHs/l5D8oM/Ha81OHIhSEpEnkuIvTBOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRcVR7vXwFPctVX64dIP9FfEwJrF3hUK9FSHlctMlTRpFkS89CndkRNSxoCFEP0AvkIeSTi+Leg6KfgNf6UN+de3D6TAvJudj2YI5xs9hgZbdduVRy3XCKcYiDHQgYbC7Nt84o92raUL9Xf1dDt+0POZPW6F4QG2lRf2k3Pp3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hal6ArCN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hal6ArCN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so859499f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199141; x=1791803941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEhyjoQXxwIMnjqSfoOhw1c/BEw0H0EiNT4BODz9+s4=;
        b=Hal6ArCNltLru9rRDd+9Gqpqb0JHnWf7VDNmpjxMTAUGogFn6dNOMN3uS61zU630wr
         keo/ozMWpEjvbjP+VPMti2pU/j+k9kHQW1pfA2IrRUrnLBCkcHWOO1Ga+D66kew7J6Vd
         h6fLprEegv3Ah4yg9yJ7XnTmBG03JTL47SRfceBBwFxPYltZwHxyb74s/fW12d7Chlap
         kpKcsS26bv1RY8ulHROvH4kHf/817gBz55fk6f68TLpAacPTxQu4+NHZGB8jlOdmGd+f
         Eh+dL7DLLS54sY/dfJr1/6Ze6qGVsl0mhUy6EtV3hXQ/6GGhG2W7A1dPw0iIffvjzbSH
         BnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199141; x=1791803941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEhyjoQXxwIMnjqSfoOhw1c/BEw0H0EiNT4BODz9+s4=;
        b=IyCobt/TIzpPGxWuyKQcog8602BXf5/V9iHwToYEPLdJM4mx3uXreVzhLmhKw75UW9
         zDsa0FeiTJoMn14py24rZAi0oIQsKDRHCqpqdVMfuCNMnEgz8QQISN2hrGn92aKLJiT2
         nZOrOqh72loP/1V7gjFlglPZKdFMtAys2N9ztuYOEQNik/8Ypkx4yqN9evkQiydKXi19
         v/N7j+2sglSBzpDqotr1udU1A/JRGIIvJhTt/kF1wt0IeKllyOtdjNFi+n5qJCOiGsMH
         wxaXGAkqLckSuzJ+W0HjDRylpFm22uyUC8drcVMhYoym1KnjihwXzsRRO467saNTP2si
         newQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpw1DT7Xmdlry9r4DjsgeRfexIj6RR9KYC8mvQpACYr2voLnLq2l8N3wMEUCT0B7fs6k5ZCaFcec6lHO1atZ531w==@vger.kernel.org
X-Gm-Message-State: AFuF++loKbUfKo5CibHPwa9X5LkqFT3mL6v8q2aL7ehzuJ1Mw76U5qcJ
	t2CRLM4EIWHf3x/7zBWKK04B33aLUeOZ8BW8BRqgomAzg4hxWL1xw8trNSwKtg==
X-Gm-Gg: AYBFou3W70uD56/EC1ZRm4I7tu+VdfTXv6BuExLHg6cs6ODFLW1i/hiYrNMj9GH5a5c
	ED4MbAMW3UdzlZoLIr9SHjXgz2nnv0uL7V5eXQydBy/HBwnI0zsp3z8fEYyNnbin7/Wu+tBdGpi
	r0dktce3YrqcDUCrXxj9qC7fgl64269jTnFd5N1Ngja+4jJ6upZqIeVjH9rtTH/k3inslyJ76zk
	jpFp+2nQ3IuSls7zCndB5eFV6iOxLz5aVpJrd37hEGc0EADSWNx2KQR+0FAaCoDUnHUe/7ztxY7
	iVrMZvorJXwEA9e/7uFSx/sXFHryYPaBm7VctoOP+CjIzup6VYKnzs7pSQ8wVAqeFjhfI81JuwY
	Q4cc9uam54rpHYPDUwrszUgPvCZIpV0dUigH7p4oZ3HbhbYqcgniZZQJuzbI+ynT/FL6qM5px5f
	nHCdiKCG5ex5/+d6rRCxu0wrufa7w4Qgs4gAFLhrjNkRKNcM0u3NVzLC4K1yOhx1UZOQ5Aj7v5y
	tyqGJYIm30rTl61vU44pmo=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr207370265e9.27.1791199141185;
        Mon, 05 Oct 2026 04:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:19:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Mon,  5 Oct 2026 12:18:29 +0100
Message-ID: <20261005111854.275120-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
The new struct currently carries a pwrrdy boolean. The probe function
now retrieves this struct via device_get_match_data() and
conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
pwrrdy flag, removing the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated the commit description.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f90fdb7e6ea4..79503f6f4b23 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,10 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +110,15 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +158,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +188,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +207,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
-- 
2.43.0

