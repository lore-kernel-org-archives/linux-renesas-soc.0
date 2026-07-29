Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A447ACCE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325834; cv=none; b=ZdVuwcmt5rE9oSi/hL38naHOMk1V/Qk3FLG7LmLu6UIfEMYftY4fdOIgCzILtFu/iCO3hHr1fUEraIz64nHUwmYx9gh6nv6Aomf3IONvPPvcqNZ5nbvIPKeS7n+ZMfP5OilF5coZw6T8mGTfwQkQtk/dhlZIJTqBeDiyLaYvCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325834; c=relaxed/simple;
	bh=yvVikdwFbfeR0A9QsRYliuRzb9OwGykNJSKa80c+VMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=af6dgx8WlkIqaDhWvEvKrjZFHZKDoiqXtwv1fKQw5msHRjAsw996VsvZPr3xQM5TDxm7s+mPFRmD8OgLl3pfBViP6GvfIbj1n/fIxjXhUb9q3RV+P94nviJou4hW6DDUZyu62s817PJwwrSlk3HGYelmKmrFaQcE72SSOgEJK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHTQMVFf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHTQMVFf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49558ce01afso5872455e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325828; x=1785930628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=597XccJifRbCBQJSu2ISQVYoGJU9ztQp0Mr9+HIYU4A=;
        b=UHTQMVFfGNogUWNOq3MWhIW393YoqdRVqtBHSPbpjUgk17EMXJ+f0zq12ROrVPk7Zr
         ShExpbACadYIu5t370+TraminTqYlok1R502tx/qQJ0A+iMhQtZ4Zg3adzlKT82QVnVR
         YjdTDglGyYvPmCs1AaL0RV94XBg/jbiNNg1Gr5DSPOhQVvqREmrf4y+IRU22eVHGQUm7
         QzLDSbBjctNF73TLMFNGN+2J0OBBfcfQKloAx6oOJz9xdviUet/2Xe3XPBdJujAKhVYJ
         0+FwZph+GaHKFgDg2EHSyoB/Sx6cPUkXnQf3gbmkCfVkYJDQclKXmX03fBBchhza4/rJ
         flVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325828; x=1785930628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=597XccJifRbCBQJSu2ISQVYoGJU9ztQp0Mr9+HIYU4A=;
        b=PHZOQBrNbM7VFSLjvJgwrI+KKziv4LZ/Wjz+Q0RcX+sm8L1O47ZEUc+evoc9gzhSsU
         i7sib9vfBS0/bJQAsMdiVuIdWRqowMA+w75KjsajfvV6bChUOoo3VScnAWBJBrgKedGD
         n30Wi4p3VOAO9tOWm2WjSzgYSMcw67Y4/aMDQOA+OlpEtFEfmu3vL281UrlR5bh61dFG
         oCNgr2U8sS/659NixkzxNeDmXStL/EyGvY82a1xc5jbG3mEvwg2GhB74ptlgm/K/4JXM
         9o/YCcV+5uLoSv4tTM+KnULSRC70RCLH3+5tuXtXNOp5zPVGooHr8J31b/8UGe9GcOj0
         NAkw==
X-Forwarded-Encrypted: i=1; AHgh+RqBNRxRDoP7sZMDtnFTYgVotfhUNms8yQk6AxJenVhXoioF2bJv2UQkzSYtMf1vAL91MDKFO2qbLHvqO1WJfTwPNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyASZ6YwB1IHI+9VjKGxAP7NetMTUz3P6ECYwiggPGJGd/yqCLr
	gjBbNu0RMGJU+OfqpR0MLmRjhhq3iUKI/HTxqbYWYtW4G5DnFhR+BzHl
X-Gm-Gg: AR+sD12EgLfS1hQnNCXkJ7YcRIrU1Qw+kptXixjo4w7OD9Nz7mqH6jC/XLeBzRh60cq
	oG14qf6ariXfBp97JzFx7ci74jl9gRtcop+IACLY4rvTX2z2lvNpZMJ1y9FlfAoMkasT+OlxHUi
	EOMM6m7u1fqmDPThmhJL7scx5FDPf50SD8Zc2QhKYCzc99i43aBQy5UMr+8Nsxemy1WpcO7RCHm
	DEgcq0sq143LwdB94Rfyn+l53wEuFHpkYiNh6zhbQ9/SSMmmORriBb6zinLE8w4aCdoiz/CFX3f
	6+PrkUevbDb9AAEudCrPrbAXIVxQIXhCgSgFVGS63MR5u9bh6OFrwD3JySpevOkkQOCT532En2R
	LVEk1i388jCxw7NdB0SSUsPSGRchuI4g/R68QR8RBCX4qs87y5ekf6+MDGy/EwvjbEN6tSf1I+B
	ckHDo0JFcRWgqwQC/2xJKAxF3q4Z9FM9BOkTW8cAN5C5ztOFkpiq+6E2beyPzevK+OG+6gMqLmT
	e12i+6dzgyGEw==
X-Received: by 2002:a05:600c:4583:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-496c60bebd0mr65920685e9.0.1785325827756;
        Wed, 29 Jul 2026 04:50:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:27 -0700 (PDT)
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
Subject: [PATCH v5 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Wed, 29 Jul 2026 12:50:11 +0100
Message-ID: <20260729115022.222340-4-biju.das.jz@bp.renesas.com>
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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 79 +++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 40e28d033a93..f332ef9ef3e5 100644
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
@@ -150,11 +162,16 @@ static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
 
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
@@ -183,7 +200,43 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
+						  struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	int ret;
+
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
+	ret = pwrseq_power_on(priv->pwrseq);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv);
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
+	return ret;
 }
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
@@ -245,7 +298,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
@@ -300,6 +353,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
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
@@ -314,6 +373,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
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
@@ -334,6 +399,8 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
 	reset_control_assert(priv->rstc);
 pwrrdy_off:
 	rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
+	if (priv->pwrseq)
+		pwrseq_power_off(priv->pwrseq);
 	return ret;
 }
 
-- 
2.43.0

