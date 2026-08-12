Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128D45C70B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544393; cv=none; b=TaSfMtzSsiJMj7gn4i/GuNzAkuKOv+I5SLYj+lwxvMfjG6+44jW8Wjj0VoqkqgzyTEkhlovKkmMAGW53QVQIVKWSGixB5XQeVjU8s/9l9kanyvXxRBjd5cR82VFH/LP3jRbANW2WiFWYY0SyD6y9mupyO5kUJbR7FtqnDthmV7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544393; c=relaxed/simple;
	bh=74P+X3Vov6LQ6fdCeoJjB5Riw55WYPlk2WSpxF+BaNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nyn+fiXIOerm5nt4oQA9MVAXM1c1yC3M6R/XbFR0JfNKrssTLat0Ij/892rCKRWAk1Kcoc6axD+YM/ZtT09kGp6QaBlfAP6e6Ku3sgXOZa3bqTtqKKHuM9lxcV5dEdSZ2FOjnUWgjjsc9ztd18uVCxlJMPFW/hegtluqaLPPhmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEwd+ATb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEwd+ATb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48000c5d6d3so489975f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544389; x=1787149189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAPb0EGGMY8pkjZHxpW1JJ/K4QeoN7oThzfh6o3ZrhI=;
        b=BEwd+ATbuIpqQ8L0n6qCLoRYkKevaN/OgAG9CRENSqHo/CJbM13ILpwIghJztjIoPc
         5tmLtjHNOst8z/UtdDoPzD3GmVR28h/Bx6/jniHLn067WBTMyPbTocVOZf+RSck8pv3C
         Y39RITsYjqMMqSE5rkbJ3Cki+38qpkkF6qyjZfXlJG4YTTsyM6rAGY4BuDSWlEk4O+M7
         e3h37KJJlKxjpaqHeTr/LnWIb68mBxJ6n7vnr+q+iEHPQqHDIekqj1B1M8meZvz3yToO
         m4oabgOsJEZnCmB9AiC9BsFzovqXkvJznnkxwjM7i78E2o12O4nC5eQV0nFXsnxsuxKy
         KqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544389; x=1787149189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAPb0EGGMY8pkjZHxpW1JJ/K4QeoN7oThzfh6o3ZrhI=;
        b=jFthfkBZDkPFym/mLJhU3XVORGtWsWE2Tq5VhgwtmIJDX25y7+OVe3E+O5fs8iU8x9
         I+oKKK+p2RuvzrmbSVWN6fOPLRV8Jp660epru9UDWRRGdwqJvPFuVGW2YVc1H4gNEc+6
         nEMFIT+cvPXT4g/cngnIOYUiT0Q95ozErmEzq0iL3bndoLX+FTk+yNAnGh5TMSLwpsHb
         EMCLL2X+W1hmYTXoYpjD3dD7bSRKnXEKvHUtsdFn7nPBf0iVDrAJ5TIJPsVQH7+Vfb3R
         nzaHYtsI3p2xHrE1qHGBq6oteRN+1fqOW//tSo6x1i/6vqHiTE/bS+u9/4yNk2l/tWlm
         aQDw==
X-Forwarded-Encrypted: i=1; AHgh+RqIGbCYotrTNgNXZKkxqC2sSCm2h8bba/prneycMLP+HIcqjcjzLwmA0zlfXQIdN7LNTbW2THM/A+PoUdCTQFRfXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cfO+JNAWTDK8x+/g07ugf4T02nVJL8kdAvVFlo9fjmMNnKcw
	5atFyeNhqLn/IzRBPw2gHn5eHGbkdTcaPkRaKw2vQpJqXYZ2AlFxqyoj
X-Gm-Gg: AR+sD11d7EAVOdS+Da+V+rWcxLyUjwDS2zE5Ugr3Ffyb1Gx45fcJx34yNQ0EMonwWGd
	O8z9dQzaCRqh3ilc2GJ/O5Y+4V4u8VuE1++TJ34wH9E+8tEaG2O23vyixnixPKmWtVr2d/hmsqS
	qITal0PNo6D8Skr8QRKRl9Yw7jFV4Zr/AEA4Gfr/47m8mZzkfcQUlzrmVnRlz5rqZU048Xtavne
	0nbkSlnS7ti4MESaj+MevQDpXahAhcUI/GpEUnaJPf4zjarvwYdLKZqT+nYZjx/4YRf/mexTXK6
	3/nQsg2V3PRhS5txdY0ncxtZ+OPUCuWnSc/EsLtllenvAot2+YokKesVR0mjiG4bFksV3ZDcdKW
	6YANWUOZthsDbVYTOVUjXXXn8Jp2GukVn7CHJa1belgKIwfPTFe4a484Y/+wWEofk5tagoBGhHH
	S0M1t+L5bb5I0s6wMlNr7XoGe3vHBd4/hYXcw9SIX56hdl+9395cAYZZ5qxZr4L+ScyfkumLOkY
	5nO784FGEusrg==
X-Received: by 2002:a05:600c:524c:b0:499:7410:545 with SMTP id 5b1f17b1804b1-4997c145066mr65243465e9.12.1786544389276;
        Wed, 12 Aug 2026 07:19:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.48
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
Subject: [PATCH v7 4/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Wed, 12 Aug 2026 15:19:22 +0100
Message-ID: <20260812141940.246223-5-biju.das.jz@bp.renesas.com>
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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 79 +++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 79503f6f4b23..f332ef9ef3e5 100644
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
 
-	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
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

