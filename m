Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851448CD5B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939838; cv=none; b=WwkQ0E92RpWD4R925h2pcX+fOBtfw6dl696gx9d5GmMU62WqFueta2wfGu4iRNyvV7x/gMIpY8gs9mXlh7sAnswZXxwGo/m2cVUImi2yH5WcKsuqVWs1J0TlojRWXlko6br0APQUePKKhB9qsRoeeBQR1weAUzTsd+yNINCs+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939838; c=relaxed/simple;
	bh=WUkCzuN7XV0AwpyDQ25ZiZu8D8JmznT2d0O+9vZUPyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yc4aHuHAEDHzOrHg+prPVc6oxz/6l3QcwyxuoAqHhN+ypwO0rx1D3zPM58praAcABnh7cjM4XyO2WpwciV2Tz/tS4X4zgMS9uxrlAs+CPxo4Q3gcuPyjk2njcRKHR4DIXwn4LQAIcDurZrjk3aSBy8jMfd0wAAzlAtx1nCRa0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0xPf/ZX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0xPf/ZX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so56954065e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939835; x=1791544635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qCewxPtQQkYGuhpBdonVJTZwr1ieN0tV5jAQJ1TZCU=;
        b=e0xPf/ZXEevz/AAb5jVdaLvdKGdEEqaYDsV+YBg3PqYb/SH7yhThxyB/NBVS5SeI96
         01jhbZkYPjDqZy37CeYtZp8kLRIw9IDTPNHCDH8V0tT8B9cyZl+2RFb894mqOby4sR0i
         D2iKLO/BLDoxHlpH9n2lO7cyyqbETCOO2RfKFVPQ9+44YvrteVLeJeH3zM1Ixs8MiM7i
         BZ4Y4a89nDU7iLDoAg9jv2lVf1t/hxyaVskltyuRxIz8+Z5mFH7aEAf6t4z/XE6uDCJm
         27ynKRxUpT+Uc4otcPuvVC9dVVJ8kYpzZ+gsRY/IgLyYgf9naMNS8zl2hxmC9N1kz8uW
         CPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939835; x=1791544635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qCewxPtQQkYGuhpBdonVJTZwr1ieN0tV5jAQJ1TZCU=;
        b=m4VLyz0+JCj5mYD2E4epEu1aUxqHEMgrmCpg1vEjCqjrrLasPtiX3PkCH+KmXrLBAk
         Xi+pu00Gla+MEG+TgZao5pHbgYtNFyn997teWQIPFZyAz3d8gSChtwI3tbHEMRcGQhBM
         NqM1RaADykOiCrq20QlplygfWTyrtYQInR2DqAUDozBN7qrUgPCl2bepcQ/R1qFirRBK
         64nNrS9I/jkgwykMbKnK0y7ucRkw4FmEigOZTW3evhwQWGTxe7UlHbSt/8E0jBgJAADU
         mxnd6bnvApDdXmdNaXnNKrVpIJt1XYNpJ7xIzoOpuHHCqcHdMTlQP3qFQpvA5StE3kSB
         POQA==
X-Forwarded-Encrypted: i=1; AKwUvBwFCW/QlJCutpUXxfCy0II0btjuW+52vgUZGVH8Fw1sAircwY0ujE6U1nru0TwmHwdSBrZCskg0fEtakU/IHCkykg==@vger.kernel.org
X-Gm-Message-State: AFuF++nqYJ5HUFywUvWSuqTET/KXnH1mU4D9fGrentnrJKKKU8dfUHtm
	pQdT24HSGE+Y25OtibmpY9jrDWpv3s89kp5FcoAV5AcGeoDs37i8SzfU
X-Gm-Gg: AYBFou1glY2nU8j2BC/DzN47+ioUxLpL4po8OFA1DDgpEuTYZZlSfR9yBZ59NP4XIJN
	OuUTecY9AIYBpGh8rPc0RHQEzWuJWLXxJ8Y6wc5eUQz2RNS3nRFVZbFz6UL79fAmoJIghddzQw4
	Nl9TX80Yo4IKNrKrMs43naQior34Cf6kP4BYbpS+ieK4iJ85KZh/NJJsxcDmnMwWPq8TfcUNlrS
	LgZNY3g+WOMmA1LmlalxvP6ydB4kLrEI2hNdiHbt15NDgvqK+cYNdr05SZY4UhKb8L5049DWJkz
	zaQG8m0auPVqHeDMweuLUmn6U3/VVvG12knzbDuoIgxmD59cYOTXj2sFui1KobLG6wmNVyDpHOO
	M0n3RAOmsMLDoKCvMCeTG6atGtL+Uqyp4+4rXdEP0SzIpx1OioUx9o03wbaSwy+EJr72306Z2IG
	u+GpZLpRmIFxddYFnuUj67EzkgWNcoGtso6EgSLMbJYKpSMiS0aY2/4faXt9V5avIN67HZn+jKs
	vu87lM=
X-Received: by 2002:a05:600c:154c:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a02769c438mr48619875e9.15.1790939834818;
        Fri, 02 Oct 2026 04:17:14 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v10 5/5] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Fri,  2 Oct 2026 12:17:00 +0100
Message-ID: <20261002111708.234957-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
References: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
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
v9->v10:
 * No change.
v8->v9:
 * No change.
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

