Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8C446C0D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011769; cv=none; b=CId4NakoUjGw901Xy5zZ1GKKSDyynszUgq5uZcn1WzAioadjc+J8T/tFcflIyVLOXKflGc9V59Yn3KYioPPrFiMo169YOzUwCFLzw4voIWJOt1/RiKKJxGooWNqE3O3TRf5FR3x3XrRa/jWziwelRNU2nsacIXIfX+K6SAcgpyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011769; c=relaxed/simple;
	bh=gqEb87Z3HdJ12E/AtSskImh7xYz7cpiXZXRm18ye21c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4fdPHo92L8Zh01tzqp45OAwx0Kw87mGVRGwjFhQ0NsRW3/0NYcEUyiUfaBh0DvLOgs3l45h2skLT0pm8W0ooGANzjEW12PN3hRwsVZ3LtKgK7rgDM+JpP37dbJqfwgNfOYURopz/S6ByrPnUEwNNMLwzA+EtSM3qGFkcNbg0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFl2tUQj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFl2tUQj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so995997f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011763; x=1786616563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twOUO5RNbJodzMp+bgALflWmlhfSQgHKUXroTAL1/Pw=;
        b=CFl2tUQjSVrdiuGpoy4kn7XYXRBDMyBJ1505p6DhZhpx03uyNarq/zHy5ZVX95g18L
         5JYZm/bKyCTpSQzrzJQklct5HMgdjKdkhTlso2qtAl+Z2IUVG3YpyDoJZjdqTdAlukLx
         HlSBlXpqDJ7OzS/qyTXIhRpCZmKhLy9m6mg5d9XOSEdTzctenR0G28tUgqSTfVEqlZRu
         j3laPodDiIoymKJb4tb1W/l8Bgovz7ciPuTyGbEWGyEK98wQxSrQbBgdx6hxhOaWlqkS
         fL61mRlEiIfO8sLrl8BkM2gLDjkpDUbyjaW4C3tOcsHz+riUzNhRwTQS6SRnW2AIEeLQ
         vHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011763; x=1786616563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=twOUO5RNbJodzMp+bgALflWmlhfSQgHKUXroTAL1/Pw=;
        b=mP5I39I9J6mA336n8Uqra4/neMeHrBI41GdISO+vOQ+7yx+dkrlqG7oreH2WSdFjqY
         Ldor7GN1bkX9vQX14kgHOVkQ4NN16RPfHeQnvh5rqJJwVa9nbQQuhk4Lj+3kZCMu+mwL
         x3Hel5ClRx6i+uFJjXXMJcNB2+UodUkYS/Y9/cA2EJjvNumYRHALRZpZv5ZRqHSMR9/7
         t62FtkqJXzdwmy2wHA6UImc1B9OOAXoAdClTwkIYg7+P/jOgRryqQGbY3stgOQocVjd/
         Qbyvc5cWAo9CO0DborJ4AnUjPOQIgmYWxn3Fr8XnPnm4yZjJm/zczuxxqhnglxFDGtv8
         Of4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6QkbXR9VjoH59UTbcbhFogCIV631R8Jti4frE8nkLItrH2aOiogrbZTXvhDfJYbFT0CF9SuHWMJVM0fmpQriNeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uw+5qXhJMyePZGlQJxFxJ8LFJ5OJtsXcsP8Ar6drLcQM10sX
	S58lduEG0U06fFDTA/UevQ14z+zAENFqUIQGfuDZgPLxkMMdmdvH4Umq
X-Gm-Gg: AR+sD139B6ZcPLATOuF30hhBkoAcw3PTzueg8aAU8WfmKf57mRvBQZtO/Tb4saw3F9c
	7GRAjfuMt/JeIgsEw9nMnzDmDXhyV4PDrOAr2w4VveRBHw98cbvytNGvW+s4P2ZJyNDmoY6ICoF
	PP74q8v0VjzrHFmIxri+e4A26Cy77eOaNMZbDS015geeamwO8EctH00OjOLBLhKwT7jqHDBiAj1
	CMYEVs9zrc/nsTo68o6qrg+myEGu8kPmXOQ/DN1iFlBUc4Ow7r/DNg/UKoLemu98DX7H5raMbbP
	fpoVJXMCaIMolwZJ0ktLJE5peCH6Le/J9EFw3I2vcuireMqO3icoQq8BybQ/qV97Sj0LRGBbbib
	qBAoLPGvKlRTkXTGZoOe38qk3t24ZHghfM9ASOJvCLpgEdwNWo3SwKN/tDkRBuAjVW8gsL17cs8
	7ej7tqmJw58aA+XGGsqvhKV3h9tyiqusgkTbO/j6AZLZwSdDfhArTnS4HVLpXVRepNZSSpfm2M5
	rNuqWrTmMIJ
X-Received: by 2002:a05:6000:2dc1:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47fec635377mr19736241f8f.28.1786011763396;
        Thu, 06 Aug 2026 03:22:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:43 -0700 (PDT)
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
Subject: [PATCH v6 05/10] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Thu,  6 Aug 2026 11:22:24 +0100
Message-ID: <20260806102236.149159-6-biju.das.jz@bp.renesas.com>
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
v5->v6:
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected the tag.
v3->v4:
 * Dropped rzg3l specific platform driver.
 * Dropped the tag as there are new changes.
 * Added id_table handling by introducing a common probe().
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 22fcf0d10c85..050820a30efb 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,8 +55,79 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
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
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     rzg3l_usb_vbus_regulators[i].name);
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
 		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.43.0

