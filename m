Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C645C6E1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544392; cv=none; b=jX+TFt+IiZHUk8y+wFUr32ghiDzsPK2DwdhjdLnkYnad7W0GGKy5XVNmlmJBI3rY49ka3uFR7hUhh0E2oWUVz+VMurbbqabnjIk5mbLrAepAHCr4pMFR210Wv2pRP6xGlFHHxOaV4nwvvf2qAztXKk1O6/RhFv6ChmGx6tVot+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544392; c=relaxed/simple;
	bh=sFTEJ93l3RaKWZ26qOROwfIyN9mx/joK1CqDXMN4fkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0Cvpa33Q7kxmO/udVBB1E0JEaXwA8ecXaQFDR1ODlyerSoRoKFCrjbVi4s1QAF0G0fNS8q5C3ihl9ZmGrhtlWXsC724UbEZkJLYKwkE9zpTFIMHackKcL+eptiCPhIPNqEE8SPqUfvhwl8IoRBF4qmROkWSh9SDzm303MFa668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCzwAMUi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCzwAMUi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso11301685e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544389; x=1787149189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyEvIJIlxZC3ve1X/dezBLbn/DT2mkPnRFZ2HU2aTeY=;
        b=CCzwAMUiH/pnQoowO7kp6fqJp925ihUgJ847r+6D2mm8N/K9jjyRSJdxJL+RIzs6Je
         xx0Llior2oqCRTvcX8BjFppNUm042UU89xxoPfnjTcoVrfZNNj+rYoL26aSHuDU38Seb
         aOgmp42nDxrYzIZgWTy842El3nPIhpDFBvifbHPHQOF+5LJPpMqoXu9PuHW5SYw+c+kM
         sGUqUNY5CQ6pKUHuXQkj4isMM6vGd23phBRSG2BM37r1r4wVplyxnKrgTIPi9tL/Gn/7
         MR5Hj0o1gm0C5zbJ9SpOt2HFvL8OfzXZ6LOqbpXh/eL2NyMX1dZrYpP6vWjiMfZ3+qUn
         LJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544389; x=1787149189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyEvIJIlxZC3ve1X/dezBLbn/DT2mkPnRFZ2HU2aTeY=;
        b=rr256aiw337mECkA1L5vWaQWSimCxxzLX+D143dmx+btU14VCCCbFOl2ccV5oHbVCi
         +fl432RMvlOBL1FXW+JtdY2AGGBzbHmGwW+ZmnBqhRtw2IPotHzIoOMm8tbPEN9VFZ2x
         bkeTL3mGTlVh574eTHXNRsHDk2EhJGSVcWKZDzxq6ri7a4h8WJFZzcLCX4T1h2w35hrq
         AA/POm+tBiEuh0/PpNj5pHKbTXBZRVPGhGxEpTaQoUZ2JzTYZBCuYSaPdBmjaYHCDp2P
         KHus0L5xtrhir19fgzsqoohFhTKztd3SPL6hpReWRiOXUw3Y4LhK9N4L8W6h7jdYhcq+
         5iPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrda1YvUOhoVmjGxPv6+rhFhUGDanvEpFEN6RH3bWFZILs5UaPimg8qYXAugEU1vti/dtv4O9LbMOCQFZkbCPu5mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynvOX9VXdqm44YIBfqmAYDaFSk7Til72rED0u29xVVmVwcPv6+
	TzcoPVs3au93BLWcWywXhaGoRUT2oh4phYDOPhZFX/MkFjPpnboDmmmb
X-Gm-Gg: AR+sD12ZOufvzIkNKlTEEJQcgPrsrieJBXbuYK7Tl4rYkf5STQY88nT20xpj1J8zvZT
	LUyGZfGWMwOYt9R0+A9fB//JS3cBfsVEHKB4KkuYEfasYTU6e7mxE9NBbU8Ur3dalNm3s/9IuOG
	69iKDu2u1ztMKQC7/Hq+Fb/amsmRYx0XwQrhmHQNmqBoEJanbTWZA6IEd4y5c4YdS3898LCYjWq
	8P1kWbnEsN0JMX1x3XbHjfPA5WJtt1Ix+djjfLsODuVLi5ffjODRDB7U7V1TQYQoUhF58l5fiL4
	zaOwGg/AR4cyH+DwyEcPOR9tSwLguJwLez77tLfYiZqJxciEkh8EeGJoeWC5hJUVlXpmshA4Qr6
	R4uCBkhB4YnoepT9eupetPFGBA0JU9qCC9wNHfG5Jp7xWsE3gKiMOuvSKSe+hPlc15QxjL6+FtP
	79BHvl0937AfX+igOp2VwU8tuijEMdAtHYOXvecKT9J4nCbfiXkb4ZlQAFAc96wLUz8CbA/pHjd
	gimWrGCjfU1XQ==
X-Received: by 2002:a05:600c:8b16:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-4997c0b8affmr58138155e9.1.1786544388354;
        Wed, 12 Aug 2026 07:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:48 -0700 (PDT)
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
Subject: [PATCH v7 3/9] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Wed, 12 Aug 2026 15:19:21 +0100
Message-ID: <20260812141940.246223-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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

