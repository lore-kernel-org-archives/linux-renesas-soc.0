Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459745DF4F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544395; cv=none; b=rTDogW4dEc3XBp2rQg/OYpbjleKxDgKwpB0q1p5h++9wqCBLF10etKqEx9BziM6sQhdEC3jJ392BqXwDAo2Kqld2OCqPEucqz7RrYrcfCf2G5/PfEapZK36WZ2V/otIP9wlKRSIr+kuv099tUGamwJUcrETKWzHpqVDV4jGBTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544395; c=relaxed/simple;
	bh=xYZEIFALLWNY+8+IZVHYrcORBf/bSYgbz36cnBlF65M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNXkWLRYxnu8IDvcrDXq/zt1uKUdoIy0lKvQ7AvI6uTUkhYk/duEdi+eEg3kqtK1P5RgU8a/vRsEQ2k+5rlv6fKoEbxMaN+90o+FcN1JDmdC9F4GsnEZ7k3bjldkwo2sza0NvsTly9mrOpeoWXxT9gw7YUsSGoB5uYcp0pmLO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBumIREZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBumIREZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so9117785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544391; x=1787149191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqAQA8Tal4Vzmd3VhRIBzQnUQdEyInv0BIWWZDJPZng=;
        b=KBumIREZ+r2ZIXbfy6L6WfHoEisJvV2N6onUKTBB4RpYlVUccdgjipQ+drN1Sb+4Z3
         fSGhFlCxxUuTuEzaveVm9O58MKRO8WwjSlZA3Gk/x9YEDAuzSHJWBumn7Dqxpmms8ai4
         fYX4/zzNTW+jXGUv3vHr5+O331foSbW3550vhsM3AKqv6BlxATgYR3TMwIbPY0ikveIv
         AoEpKQpVOCcPBPJtlCJEj//t6jY6FlrpXwXz1qNAxDCTpQ1n226xErhhCCpE3tFUJZ5y
         IyQhdXa6Y/xIMwIxZFIuBK2IYcGZtWjza/yTdoMXD3lPjIXh6DsgExRCjIyCeB9FP6H8
         xgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544391; x=1787149191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqAQA8Tal4Vzmd3VhRIBzQnUQdEyInv0BIWWZDJPZng=;
        b=qWQzSbY9Su3uVD0ZDI0Pd6TqUfr5m+oDmjvueyvinQ+j4AAehf0bH59dpca6LyzGI9
         S8qzfcRrGceN7eyoe4rEUQ32QEtHv/dX1A/9l2FVKuye5Ud00YQrhaMNHmM6gak5FXvf
         KSv7dBS6lQeFulettzn5itRMpyQdYK43WSXvZAWv96y5tu5kPdVD3SiTUGalyYoLh1hc
         36WBuHXnX7c42pbgtv6FXjldGpiaWRWITKLRRz/kQT55JpLPFuBps+FvvueCjA9ZVRAm
         zakDIiaB3uZSzwZuN7b0QNhl4MqnXs8eMZxc3F3PV3I6ByqUI/pKXfWjAZ5OJNWGakLX
         Yb5A==
X-Forwarded-Encrypted: i=1; AHgh+RqfuTbNSLkKTWPl06qx4C4U9p5+bZRj1aDH8Xcj6wHUvBPxsVEkezCGThGn60AeXb+L/EHpXpNr2Gr26n7HY3bR9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1fCaxW2vM1vOVCnH+CY1h1cNivH7sNdHd4RZNQDQDdk10kwb1
	brH9QqcPVi+mj4GMWZc30jWTJ35e2EeGaWtycR7OGsrgGk+ZTyn/Y/9R
X-Gm-Gg: AR+sD1149woyZP4USHx2wcBIVoFiBNlZ5XEbmx8PjQh69RCinrosRGfW9tKLX2UhKW0
	Qz0fYMGGyYPp5hNBC/BDj+LwsAeY7+/Np3Q9/uDF7WBL8VzyIVmtpAPlXZbiduDWRUWuOC6B78i
	CQuN3yZ38OCk5PxlZ4gUI599TOBnlWqbn/QnlI4R6zKQ4Fo1hfwVTVFuqfPp24AY3Mf7SNPkZYT
	MpcBZJcqFM38dRwDKln4PDQGbiXDva+OZbtYr3VuRVGup2GPFhemFO4nesUZ1+N90taV5w1rp6L
	5m81AiOlKL7rQ8fTU62noh2EDEqt0LGdhxIZh7bQYshe/DG1iuQfZfQsJ7OCi7/aiNZC0phggz7
	TB6SoYsQdAoqVvV5PZp2Hn0zDNtbTDWIVCqpImIYYMJ1VS7OnRBAtsB8DM8BaYPb8ZJaq3g67kW
	elYJMzqrgOH3cmxnBMJjCUCKkp7X8jtfy+Kr48XuppLf16q0s9hzYFe2NU9G4fDfRKXm/fQtHJL
	JYdAKokwZl5ZA==
X-Received: by 2002:a05:600c:8b57:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-4997c0f042cmr78332455e9.2.1786544390559;
        Wed, 12 Aug 2026 07:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:49 -0700 (PDT)
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
Subject: [PATCH v7 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Wed, 12 Aug 2026 15:19:23 +0100
Message-ID: <20260812141940.246223-6-biju.das.jz@bp.renesas.com>
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

