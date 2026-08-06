Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F51442118
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011765; cv=none; b=CTJb+7Uxh/emIeHz+l60ec0B8nUC9BMGALsEuGbm+d6wVhq/LFY8Ddebbw2AMbe5xXbfCadzRtBujcYciHdHwn6WgqMlS+HjoxGYHnQKyGBfy9kwj3+bA6dvYJJB7Oo/A3nobzndQ2H3UQ5NhZGsVzBln67ZtGrr0rdAirtACOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011765; c=relaxed/simple;
	bh=5fKCpMJFRgVfnEGprSRDHnL4FI57A63Ut8Ry0ew439E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOhbaR0LMlBnaGSgZJNtiEySBYRNO0VPnzUDP/OFcyOrIh8hPqad1tHOL8YAXEI2YmSUapIg+FVfhTwcsxxteLUGco76jHdcZ7g/JvB6FmHkzFEnHto29mV5N5xJny3WXi25JeimI0af0fjvGT8SqgsPaqrO+7W14Jra7u6LN/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ/KU1Go; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ/KU1Go"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso10121545e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011762; x=1786616562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFglV42KHdA3jgSjSf/2dBZqoLiuEPCj1y1Dpx8KHoA=;
        b=fJ/KU1Goyi3M/gdEojFYFGcv3dolGgNFlwrWk22oJ8fvY575HrvnbmjDpEtJj1mnky
         eevwxoiDxJ0BBgAyM9yoYaEr+WWacaetkg7IDfUomDI8wENY4ilGaY8s33N+keFfCkn4
         grpxxm6EtoDaT+9aCJrooMTMYBsf8lp2QuD9oZoYYOOjaUjrsxQh18/GMzBbKeqHWH/Z
         9SnugAT31xnN+sQxV6QRCzaXTSjU3eTA0jRB/jGJ7GwxpgNV0ZDXGG1jNnigicHPvVRv
         XETvTUCBt1mX58HTnyTCjcHewmCwCgn0t2P/dM5uP9G59evQWH+EtmVQwIn5tL4xq6s+
         bPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011762; x=1786616562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFglV42KHdA3jgSjSf/2dBZqoLiuEPCj1y1Dpx8KHoA=;
        b=qxaZAuKxVuvVZAQEjXDdbtHrpTj++cgASKvJEGZt9iqYBKaAWFEp0NhTSFFd7uZCWn
         eppIEqut3b/azLmZ3tbZgpo2pGxtXGtqVGVbNlmd0OcZ8i76LuRTTuKkEVMu8tvxdczw
         88wGNAb61FmPY4QuxvIYCzQfUJtYzdY9EF+en67ywtRQ3gdonTOKRnk3ezE44ZbShWIB
         15tszxZgXMpI5L0Ox1Wi0YhDxusQLhB0KDNKj9eYRVLPLjf4SoCaYqn0dVfxwMHUNtNG
         lnDMj1WzAbpUdLmpzcGJxPB0PqVzDbsDAFlazCbem1P2uxpVIEcUMV9BzpvlM0++4cQT
         EOSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpA2tYPAZs/XzGGO84+31HIdglSykchB4mptyj/y+F0QDGNtOegQF121b4mZCvq64GRfIzSnHgv44X2XCI70hUf3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfXV42QPSRIIK/nJtiUKHo4ccgDsFkberzbRqLk0A8o8W36Jh
	9GS/+E5pMaVp4j3PHj915E4pLewRYTD4zHRW2o5XywQuQ2ykaGLaxwWk
X-Gm-Gg: AR+sD13LR4KeYs92/Tm/SLpB9LI1SeMmVtuAIwl1AC0Ac1nzZkhzIOhnZtVlA65AVIl
	owZidJrj163M5Fs1k4YaiV7yKA+EnHJ9LPJUPTf+qj1YGedeUMePkPqKFf/OHBztI4kLroZLks3
	ndVGDcV6AbSBEg5HsT7Frs6o03f0LrNslLcXbaUkQcOZ0T6B7cqq+ZtTEi3FJFXDQ04aV2+eyPi
	aNgmZhgbU/GFwO5yN3G+kTGvNaY0+yyNXDkiYhuevb6jUpMGf+r86AOJkj/SDfNeI3g4MDLV71P
	lMYFRXY1NZX4wkrQlZlI6twiA12qcAY9/SqKJ/m5BqdmrFT8lmSkev6BrI1LhYf6M9u3LDrQEb8
	X0ybg1PnQbiS+8YKMsaG1sn/XqtiFJJj83Uv9NZ2VyNFBQ6Qv8Mkmo45gBtw3lMY9Wo2ZKnyjha
	vjs0xl4PduzmGuBWA/Tn8P+H4Dln+FfXV6ZjbwSEGJQ02ceI0Nul8NiidvfiDCOiWuBrrKngDIb
	AgXFL6stFOo
X-Received: by 2002:a05:600c:1c25:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-4994e79dbf0mr193806425e9.6.1786011761822;
        Thu, 06 Aug 2026 03:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 03/10] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Thu,  6 Aug 2026 11:22:22 +0100
Message-ID: <20260806102236.149159-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
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

