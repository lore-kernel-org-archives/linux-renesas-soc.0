Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05683C3F42
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219699; cv=none; b=bUQBenPyWMYC0MDgSDOz6TMupGU3MSQlI7Ch5C22R+dJEHB7dfN+8Eof32Lp6WQtY5Go7BojlROv+oj/rSMLZa+iRKUjDvSgPUddSw10rVkY61j/FbMjZhtQ+XauzWQyhxSrg3cLSeMOk/aEBpWpuF56nA4sKaP/ithh+XOUlNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219699; c=relaxed/simple;
	bh=hiux/Qn4TgTgVS5k/2u/A3XVpV/Xm5kCRXHxM5nr+90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDf61b3JLVUmUiFoux/rAN0FwI6eVl1kuPzLszRDSWuGIMULSfJ+YnEB/FAXxEIMEGphPBrZca43A5qvlD0Yaj16RyDMgAYt7TIaX2nTBfHZvtjIbUUZWLWR69fkuDuLa09Qr8nrGbmjex9TYae3rvtOMzFwSkjehfZ4o3iY0dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMhx1nCk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMhx1nCk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so18967965e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219695; x=1787824495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOqw3tunXuRzUv25jzPvXMhHm8m25g6fnSYlANTTWK4=;
        b=SMhx1nCkWP1x7vpnKYHnyrTAN1E5qxolf+nJq/6FJWEPS63E3FxVZ/ZY0Cb5+EV//A
         2U5MFwINK886IjHHAvzC05fyNuFzy5HV5ZmOuE8iuKODOw6aVYvL7hOeV476M2lIsyqy
         pyJuDPCNMcika4cBjyl0o9rGzwqrDPLp320xxZbAZ+8TG93BVL8y9C16IJgsc8yjGEfX
         n72JbdeIN2NPJrnHa9j9DRYc9H7ehtO5Z4JCbXQAMWk6URgbjB8fpcWcN5giB0pHUmmD
         Gu+rgbueLYNehdmLq2QuNYWEy0mOjIPmmxntOIyfYKCv0GqahnsOD/lVaol9l/bMTr5h
         tofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219695; x=1787824495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOqw3tunXuRzUv25jzPvXMhHm8m25g6fnSYlANTTWK4=;
        b=H1vt1wSaF792fyMp7v2gE5r60esJiA92mGj3DiC9oeojR8gwQys6A+lsvi7mPfsQlx
         CGXRerR3e56t6guBBKqwzZ+89F9ux4GM8INB3EkrxDTQYT7zGXrN+6W7TLVCWFYkepx8
         HXs8GEb+E42quF9JBDnJVCRW86c8WaQtF9OyTXW+N6nwgWaSP7UYEl+Sreb6mpG/uTMM
         Yg+Zt7M9JQV3snHBC1wLldco7dQ9XsykPNsulVJzfN3Z07XIulo+hdSVxWdF6LBbjjli
         dpCWA67OSJKW6kDq+QlFkOuVk1+NnokvTuUtftaJXMthqbHiPQvLtfrqztUCRL3Wc6M+
         RiiA==
X-Forwarded-Encrypted: i=1; AHgh+RpC++F3MvE2X+zWcBPNRVCjj3CPUlHBGzED1unStujXxtdDfF42p+ySe0//dC6nDN5S5ZBC1lYrI18mwHvJ32SU9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzERyeEST5TCebkDN3kz+Md7TLTStQJBSeqfdYcLzwrUAz7gGXa
	jCLHiC3aKlqfia/1d/WhZfpeP6JH6nVnbip3mAJxlUTNt3jBH+em1jMJ
X-Gm-Gg: AR+sD12aryAVsFNtQKtJMIYR6CUoWyrOKJM2JpCJX01CMKicdcfaP06zM/dEPvoioFe
	fsISCqwZsgHzQSZ6SyP6NEplOfW+CF+AGuSTIK+nCu6sZW5GMH5uz6Z5BrNjtq3neB45xx23E3z
	9CtcD/YDAE0uxJbB2K+QVR8DO8VVNsz8TxEV+y42fPoL555lkx6+E+CUKsWdoqWkmSi+S97+n8v
	+NKT9eTGlzmbZoDzFw3RYNUhIezbpcc2rfshfVpGhMQv9fyAgGWJy4T82j84aoUD74EX5yc2Gdk
	Vv4Sn7MKnZAWw5m3vev4vBG2z+V80qwsoK+9sFZE/pVAh1sosFWJkEA42emYrGy1I3XV1AHEctk
	SltZIJ0W1LEadniHuNmguwvRnfjn/R8LjStGf9yRx4MMArxX3A69XGYMNpXrbGPymPvRkaJ4NOp
	VfGwiYnRIOlp20Qwlvn6I7oVVyFO0CzewGTc53IuaRXyn0GS4Vt49z2wLdDz/+Sbi/HqdX
X-Received: by 2002:a05:600c:4e01:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-499aa1d0747mr208237845e9.11.1787219694748;
        Thu, 20 Aug 2026 02:54:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:54 -0700 (PDT)
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
Subject: [PATCH v8 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Thu, 20 Aug 2026 10:54:42 +0100
Message-ID: <20260820095448.20930-5-biju.das.jz@bp.renesas.com>
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

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwrrdy set, similar to RZ/G3S.

The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it
uses a separate rzg3l-vbus-regulator driver to handle the additional
VBUSEN control for port 2. The regulator_name field is used as
the platform device name passed to platform_device_alloc(), and must
exactly match the name the corresponding regulator driver registers
via its id_table for platform bus matching to succeed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description.
v3->v4:
 * Updated the commit description.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 75 ++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 79503f6f4b23..da98776da648 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
@@ -37,11 +38,13 @@ struct rzg2l_usbphy_ctrl_priv {
 	void __iomem *base;
 	struct platform_device *vdev;
 	struct regmap_field *pwrrdy;
+	struct pwrseq_desc *pwrseq;
 
 	spinlock_t lock;
 };
 
 struct rzg2l_usbphy_ctrl_info {
+	const char *regulator_name;
 	bool pwrrdy;
 };
 
@@ -110,15 +113,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {
+	.regulator_name = "rzg2l-vbus-regulator",
+};
 
 static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.regulator_name = "rzg2l-vbus-regulator",
+	.pwrrdy = true,
+};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_name = "rzg3l-vbus-regulator",
 	.pwrrdy = true,
 };
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -150,16 +162,20 @@ static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
 
 static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
 {
-	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
+	struct rzg2l_usbphy_ctrl_priv *priv = data;
+
+	if (priv->pwrrdy)
+		rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
+	else
+		pwrseq_power_off(priv->pwrseq);
 }
 
-static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
-					 struct rzg2l_usbphy_ctrl_priv *priv)
+static int rzg2l_usbphy_ctrl_pwrrdy_syscon_init(struct device *dev,
+						struct rzg2l_usbphy_ctrl_priv *priv)
 {
 	struct reg_field field;
 	struct regmap *regmap;
 	u32 args[2];
-	int ret;
 
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
@@ -179,11 +195,40 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 	if (IS_ERR(priv->pwrrdy))
 		return PTR_ERR(priv->pwrrdy);
 
-	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+	return rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
+						  struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	priv->pwrseq = devm_pwrseq_get(dev, "usb-pwrrdy");
+	if (IS_ERR(priv->pwrseq)) {
+		/*
+		 * This platform requires a sequencer. If we can't get it, we
+		 * must return the error (including -EPROBE_DEFER to wait for
+		 * the provider to appear)
+		 */
+		return dev_err_probe(dev, PTR_ERR(priv->pwrseq),
+				     "Failed to get required power sequencer\n");
+	}
+
+	return pwrseq_power_on(priv->pwrseq);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
+					 struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	int ret;
+
+	if (of_property_present(dev->of_node, "renesas,sysc-pwrrdy"))
+		ret = rzg2l_usbphy_ctrl_pwrrdy_syscon_init(dev, priv);
+	else
+		ret = rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(dev, priv);
+
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv);
 }
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
@@ -245,7 +290,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
@@ -300,6 +345,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
 	if (ret)
 		goto reset_deassert;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_power_off(priv->pwrseq);
+		if (ret)
+			goto reset_deassert;
+	}
+
 	return 0;
 
 reset_deassert:
@@ -314,6 +365,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_power_on(priv->pwrseq);
+		if (ret)
+			return ret;
+	}
+
 	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
 	if (ret)
 		return ret;
@@ -334,6 +391,8 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
 	reset_control_assert(priv->rstc);
 pwrrdy_off:
 	rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
+	if (priv->pwrseq)
+		pwrseq_power_off(priv->pwrseq);
 	return ret;
 }
 
-- 
2.43.0

