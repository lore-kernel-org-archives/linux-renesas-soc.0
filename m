Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290EB3DA5B6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219699; cv=none; b=qA7e1tiLyo4AwSMsctVclfesNn4Zmi2qagVhfAVUd5KVrN4bXn6NT/8TRF8aN/mvDKmX2janayv3B43XL9+zbTuUjmRQh/RF8USD8MJylSDsd2EZ7WI//nM9chBU3xbVawli776M73HE9T6WN5Ui81KgaIa2NtpkCVSlqQ1wDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219699; c=relaxed/simple;
	bh=Be5rlx58c3nKi8wfJHKJ3g+BWcqxfwWPy2Y4nKU+NEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qx4J6FJiVtQpKKZFFn1zVNhUUO72OzrvQKF2VhmWRMhJaMUuf5kDXC0jO5kvqTR6egwaKzYjTX+lVxiUZU2ohvH6C2pkxsplFiqEbW4JOVbAjOQQMVvBWuX+icmLFJ8wX17+u/HoWywvfM2kKGdO+x4IAxHu4eJlS6qsc+uDVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DO2Ab3OF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DO2Ab3OF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1302188f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219694; x=1787824494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ySB0ICIj0lyZt3Kc/3j1HhYWUIAhEIVNas2QeZe4JM=;
        b=DO2Ab3OFdwX4ewcMD0t3SuSNKD5w9ToBg9HJV/bOB1mnTQB+TvUz/AgTjtsgL8AM+7
         42poOmGR4fP9c9Yo+oaL118leejWcw0QgTh/D4DZn/FeH5K0BNNxvMnMP2ATayZHdFjz
         mAxZGZxBl9BbNG/pLLFaqcLmj6hDAjAdj8RxNe1F6X5ZiSqxjAt3rX4pUdCRMhUwtfzf
         fHHWSeT99RgPSOKG+QUeeSwGqLad/5e7g/FlBMJeDtG+lYho5cxtY8LmVNwFt9is6hwt
         VbztKsdgQ8Sgrz3E2kFdOyCYJa4SxE6Dg+CW1AY9MKYNQhTcZCC92ymxr39sy0Q6Eh55
         SVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219694; x=1787824494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ySB0ICIj0lyZt3Kc/3j1HhYWUIAhEIVNas2QeZe4JM=;
        b=nwjfzIgKC3xMFntkT3Xk8ezYynr68nRk67cMFZUoYEe4WlQarZH7ISJeaN179hH5ae
         z4/AzNeYDhUaQD/ALxW/IuzOJjo07JrUS0g3qHbxhRjUAThfdD1Mh6mAgxx+aq8ZA5iP
         Hj0wG/+7s2CPB86ieJEb6wD8wYxaaZAh5LtAvcpoFq692C9QhBCbKEmAZ6Mlw3Jw3S1X
         7RNqwHj56XxtUD+sJXgAwo+P2P3nNsXFkfPFzWf98nMizUGbCClPIMlLF7nTMw59nZcF
         J3h5SU815BYbFfifJ8AVB9xzNgj3URQ9YVsVVuNs71DoGC6SZVVIhOlvgbq4jLoVaQVE
         eBbA==
X-Forwarded-Encrypted: i=1; AHgh+RrWUDZucKNbgznBzHRNlaWJ+6uK8maKKA3m8LZjUcgfbhbSLh8StTVjRm9Sotngatph0HGlFE9WBsFUouV9ev1ELA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0o8JSYTmxt635IzJBvqzu99/SkwVOZnGWn5e8o8brSl1BLSc
	cwnCMbNOhKkSSQDhlA/mr3L9ozxYXkpue2sh9j3/cGscZx/umn0ajGb7
X-Gm-Gg: AR+sD11BY8D4NJO1ZOAuWyq89WZLdUaPSvNBpngLHX36F1thSCuAPR2N/5k4dCcT+Cq
	R92y6dxD2yG5VQeyoH4S5hn1rZ71hif6v7qn7os0GEoTvqzxspDyyGb5BE+OuTZ2fM0euZz2pnT
	n7IqVqS5jK3SQEbl37iqbSIVlx4YF+iEGwA2bLB7PMaaXdee6N1/bmr01af+Vw5IkIpbAZnYWwR
	eP9rNbkiygZ1zQPez+wKC44WwAqMyCBa/rge9u4KX+lV8hXjByTMVUiN0LcEdsS9eDfeYCpoSRe
	t85T0Z6Kefp1i8X6+iSw+UfM6wkg7UCadJeApDDa63M1r0N5PuI2tQGopAVlx6oF2DLjgeeJdIN
	oIgBGxzJn2LlyLoijDL/XMBt/3bWnWO4sRR15AvrXiyg5HMfunkK2MGahbZqb65BtS+K5MzbIYC
	FqTxqt/OTkkaaRpzd+Ic8zgOloR0y3mCqUZY9AsvYc3QBHxB94vtGquQunhl7wtGbgHWnW
X-Received: by 2002:a05:600c:6990:b0:499:8c68:a3aa with SMTP id 5b1f17b1804b1-499aa1c53bfmr196498425e9.13.1787219693922;
        Thu, 20 Aug 2026 02:54:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:52 -0700 (PDT)
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
Subject: [PATCH v8 3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Thu, 20 Aug 2026 10:54:41 +0100
Message-ID: <20260820095448.20930-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
References: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

