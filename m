Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944593DE438
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219699; cv=none; b=mkZqkxoiajSx4ZEIAgRDcH+lGATd9rtEma4jYEv/xn4lykiEDGgiX9wLQ4PhN5ATDj0K5sAFzyVhB+YMy1q32PrlCnu6a8Jj+1aLRQ7/YDCpDyuQFOd4bz3kfCoEZrBmRcbjmMVHpKtYfp7dpyez+wwc3SEF8CWNdvl5rorvuHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219699; c=relaxed/simple;
	bh=cmC7ORYb/5Jjq2DDsTTj8RSsB459okJgJXhRg2moZVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awlKQmMXDna2AFOKsfUfB9gk/M88LbSFuGLlxGoZZY8erMcpmMn4oB01T62rewZDv4khb/R5yNUG/WC/u4Om5w/HIQ5ZS3p4s/v7rF+nBdTrcimnacEcLY0sxzoatzgF8LtEybLWndbBhmkmab0TZh0jL1o55QafFjG5YNm13Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsCY/0tR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsCY/0tR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso15959025e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219695; x=1787824495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvgZuC+j2jtOw7qJxYBVGMkHn8ERnr6Y8EdgLSoL0vw=;
        b=dsCY/0tRFi7Z0v4oYpG7zHis0JAftRQbXIz57gyVC4YXcygCuR4rnghgoTfhM5nawQ
         DHmm0Da9tg+4HU1mjA66PnjKZzjuksZIc7Dk6KxK0uyQd7OfD6LwG+cFClmWOt1xVrj4
         b0ysXX9k6wJQOT5abYPthzcxJ1eqCG/joeaZrxq1z3C//OlPHEyd8fGKAzZzB1RZyoyH
         OWVd/rNm9BbnkcU0UPLGK9dBAylvnDt1LGjEqphepWqNfwdtYJGG/t6f0bdjTEsTa/hs
         xWSESptWB02of3KGPse4v/FLtLB+rNFiP8zgWNMDBHeelS9FjDckV9ayysGMNfdsOLEy
         w0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219695; x=1787824495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvgZuC+j2jtOw7qJxYBVGMkHn8ERnr6Y8EdgLSoL0vw=;
        b=i9mB4r1zWdvcQxPSjfSLHcLbgIKyz5SUiLrgPPDkXLHGQhYo1t0K3N2XY9LjOql62+
         4ZcLhJOr9jvQT6RV0/oIZIzwuS4LthiC4uY725Bn7oBWDQBiV/OTplyrIXtdwE1Xiky8
         f3uu6t/cxLIzEuo+SI1Cf2Jgrs/zvEQYzmrwsIJf5ZzIhgRonVGSVk3LGJvwdoRSxDN1
         C0CStpgnzDtbMyE+PBzuGcGdUNmRT3usiN4k5Tu4j+EzslrNJYSqTaHzJ4eu577XjP8b
         c2chykwbFHMM07khrTsRwMjNAVPA/KVspkHM9bikjYwLBGLtz1pafs9u/cVi2sObtt07
         qLNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDUZrE+rKaIihq7Qp0neqIj2/Ym1cuI7FDvKmNW0SS54rYzvLNJO+4P4DzTmhKflVTAoAH2tSPdcML6a5yvdDYRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OccVBwzW8wS1bBYg+xAZR4TcSm9IB0geQ472IH57hX+RRPVt
	ILHMuIqUxElynZY7eTwGoTOGfmIZM7WS9ct6wXpqnPXcRitYEbbPr7CQ
X-Gm-Gg: AR+sD11kIz/lIsHipHqbKciJDok6d7Pg8Aj8DxypO84usd4NZFQIyHvhb/6QBw85Qko
	yI5gs/irriT0Iu3F1deNzBYYWZFBLQ5g3ZUYjUQMFmYqapb9LP2yTGX3jHOcdPghozA7CTZSRC5
	/sn96hfORFLn0dyER0leH7laUmwrvk+71/5duVnITiMjNOhFtR/8Ac82BM4WJIgBCQ7eCB5Symg
	xhzJgFlGy+3gehg6CqXjUKZPgXv937Hwsa5DHU0w9UGmsPE4TIbtx2QedDsJAfaUqwPrRn7VhZL
	NJRur7Ry2A+bMUOSKI6bH89Oc/Nhh6/gh0YFNT4AfJ1wvoTFVnewt+p/iYmeMJISCVSkHARfbk9
	YkOXDEw1ZBNDmKLqpAQTrjZvBNl107QV+3EupAIS56hjafnxa6yc3gUqGrvzRjmD1bVaIv2YPIw
	2WoQvVrVn34b+/83PSKCj3IFol+pvzPJQF3Om3kbQfRK4e0XyrcLDzxpvQF/6pjBNj7u5z26TV8
	ZQPzBg=
X-Received: by 2002:a05:600c:c167:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-499aa143546mr216415815e9.2.1787219695460;
        Thu, 20 Aug 2026 02:54:55 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:55 -0700 (PDT)
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
Subject: [PATCH v8 5/5] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Thu, 20 Aug 2026 10:54:43 +0100
Message-ID: <20260820095448.20930-6-biju.das.jz@bp.renesas.com>
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
v7->v8:
 * No change.
v6->v7:
 * No change.
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

