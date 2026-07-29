Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D0B47ACD7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325835; cv=none; b=aWzutFGaRk7hVekf62nBdJPMhVk0HfuLxXVvSyg9X9YwgQ42IuO/QQQB4gFn3VCDlum0xrAcR9S8vqr40CghuMLphrlPOJehF0f4l7d5wqi/vQjUnfKgTsMqevQtBn3P9jbYKHmkvXpq1HE5C+N59cPM8H9HtwCkDyU+ON8G5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325835; c=relaxed/simple;
	bh=rzPVsru/I5EhW+dI8PeHp0iIB+TfjVD5WfDcYLrOfkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0JBnCr4Tww8dCKQ0dWSiYid+ITJsOIjCRwvqQJadFNzI8+8EDXInpbyco40MjsHp2E9blXe02s83JvvGWh8XU+W3Q3PJj0JsXEkclfbPDyqmPjllzPYehVwOZTL2KxtzNBma6bLU5KLv0oeNb4PeBubv2LKl+vgTQevitIOqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FR+hO58R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FR+hO58R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so5258365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325829; x=1785930629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw5GsG0a2gtJez36tkHgPADK11vktR7Pbta0Pm8MCQY=;
        b=FR+hO58Ru4NkZ0rtbo2QK1oRRKisnv6ACKKblOUVwh1m0UkYfBl0MqZe4qaMhLbXLz
         P4/ljzxaCVrU4fj3nFKSy0vok1UuBXTUQsDGBZcyL1jkk1rIrZ006A1elHjXpSD4UO1x
         HPuzy/B2NYeorcai9a3cwTm7mZRHFp9iOKNCAQSDtwqY/trgvjQgqoqECQd6qs18a0HL
         Yais8JqIJI54Oabd+neuWdUbpWTBwcftFBGVQyXGbLEkhkzeMn6T+4tf1KX0gPI4ZiD8
         jjpEdHE3HWmJ+T0/hE5m30CUogx2pqyQwD4VQvjQOZHJtilJ9pMWtyIFq8qMXOH4qjjT
         H8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325829; x=1785930629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zw5GsG0a2gtJez36tkHgPADK11vktR7Pbta0Pm8MCQY=;
        b=WvJ3csHrWvltZyDhw5uj5yzWXth6GJX29h1HrF3Qb4+/Y0lYPpzzh+7btIIiaLNcbd
         z7s4tFJi3LUkqJky4PK/zGW1LTKG/S9wgvUZtES4x8UjTFc0Tm5E9PZhh3K1eKJczgpN
         /cZ/gi+XQobxiYZiyVAnDwkFUOvD76FAthHip71jq4bq7s7WmYQzYqq+iV5b1dgOUGYo
         nEPamtgAcxpCuAuW8H0N5yuMpSw4bRaIpL0Pmju/toQVZtuit8TUnG9B2u8j75mZHDXD
         4Xnf75B+/80Q3uSUuLIiXOm5KY46NPkX9ab7x7ThfxysaE834+WwdZC/IwQ/yr4Krx0d
         qbUA==
X-Forwarded-Encrypted: i=1; AHgh+RoiS3mSZKxU9eM5kETIfh2Q1TaV9oszMWw75BIlYoxlr+ygfMFr4ZIFUTgIe6E8AGKY1fgrsti2haiBJNPJtzCCkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Kla6FRJFF8ynDviWcWffu1gk8WI5znqoSoDYDeezGDCDA5jt
	ta0JSjK8FSKof/uYTGwx/tQnx26A0DFjHoggH266oonsuxVwkusbFsw7
X-Gm-Gg: AR+sD10PGADGjNAIwPsLh3uWlRKfR63AZeAWtHncDKUsxtnCKklsXQ2s4rV1aWyj/BX
	UaRrtUKrJfD22E/M2DDi5Dr2rGGJF1h3mNiIs2QrgfLRFiDa4UcoRjOdNih80FktxWBJPfFpCAV
	V/lwR7fDYAxUFl1/LY/nq9qB8zSkJqIa9FGPhnfcNG1DrEqaQpxcTYwJm4N2EjNzJY+bQbUbO66
	jcEQrxOOIqqUMK054KrNPGJ6XU8U8NB4Bwh6nkAu4BfCCgKo8Pcnrcl7ZU5YqY4yvVwq/zEKIXU
	4UJPTQJaPVqmkJ0HrODM3SKo1HlXsNehXL9H+lBhcp091hy6wFp4dB2EaOQ9Equit1EaQw7Q9/r
	J+iXUuiTk5qtsgFLxgpfQGGtcMK7n7QYu8rv9Z1LnyIDF48v7n3nr7GpZLfm5/DCRYQ0zQtksJa
	QDtSOfGvXjUdFDn+uJLsdUkZxto4kzL5J9PmW7NbQfXkQEnLwGhDVlD3wxnmEXSdiTUiWKnt92T
	eRMyoHbuz0g4qfZodlX281X
X-Received: by 2002:a05:600c:528a:b0:495:4cb6:71c3 with SMTP id 5b1f17b1804b1-496c658ad7amr65012595e9.39.1785325828586;
        Wed, 29 Jul 2026 04:50:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Wed, 29 Jul 2026 12:50:12 +0100
Message-ID: <20260729115022.222340-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Introduce a RZG3L_USB_VBUS_REG macro and a rzg3l_usb_vbus_regulators
array with two descriptors: vbus0 (BIT(0)) and vbus1 (BIT(1)), both
sourced from a regulators sub-node as defined in the binding. Add a
dedicated rzg3l_usb_vbus_regulator_probe() that iterates over the array
and registers both regulators using devm_regulator_register().

Convert the existing platform driver to use an id_table, allowing it to
dispatch to either the RZ/G2L or RZ/G3L probe function based on the
matched platform device name.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Collected the tag.
v3->v4:
 * Dropped rzg3l specific platform driver.
 * Dropped the tag as there are new changes
 * Added id_table handling by introducing a common probe().
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 74 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..493397143617 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,8 +55,80 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define RZG3L_USB_VBUS_REG(rname, en_mask)				\
+	{								\
+		.name			= #rname,			\
+		.of_match		= of_match_ptr(#rname),		\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.ops			= &rzg2l_usb_vbus_reg_ops,	\
+		.enable_reg		= 0,				\
+		.enable_mask		= (en_mask),			\
+		.enable_is_inverted	= true,				\
+		.fixed_uV		= 5000000,			\
+		.n_voltages		= 1,				\
+	}
+
+static const struct regulator_desc rzg3l_usb_vbus_regulators[] = {
+	RZG3L_USB_VBUS_REG(vbus0, BIT(0)),
+	RZG3L_USB_VBUS_REG(vbus1, BIT(1)),
+};
+
+static int rzg3l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+
+	config.dev = pdev->dev.parent;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap)
+		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rzg3l_usb_vbus_regulators); i++) {
+		rdev = devm_regulator_register(dev, &rzg3l_usb_vbus_regulators[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register %s regulator\n",
+				rzg3l_usb_vbus_regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev)
+{
+	int (*probe_func)(struct platform_device *pdev);
+	const struct platform_device_id *id;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(&pdev->dev, -ENODEV, "No ID match found\n");
+
+	probe_func = (int (*)(struct platform_device *))id->driver_data;
+
+	return probe_func(pdev);
+}
+
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{
+		.name = "rzg2l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg2l_usb_vbus_regulator_probe
+	},
+	{
+		.name = "rzg3l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg3l_usb_vbus_regulator_probe
+	},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
-	.probe = rzg2l_usb_vbus_regulator_probe,
+	.probe = rzg2l_usb_vbus_regulator_common_probe,
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 	.driver	= {
 		.name = "rzg2l-usb-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.43.0

