Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234448BD57
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939837; cv=none; b=AeT52jW+xMJmoMFysVruxXrBXl3RBcGkF3q5EZ8GFKTumc0lukmg78sbJ4gqq0ngbVFoMyxja+Ozxs1CuB3wdVcqIKIluLPK7WTaNXuynqTerL5/1a1fzEEPVuLXlQgvgFN9ndrcuIvBh9Bx3+bxnOwNrh3wZ10FTAxwGTYTuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939837; c=relaxed/simple;
	bh=YswD6mRnBaySSobp9RB63Gita8gYQG+zfWBn682aFBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiItZQtodkTdE1UQEyg+0uSx7Rx/3VcXo6AHbpoRMNZdvUveIUU1AC+Vqq5Qzw2DCDVznAX2XfIjOfkDb1SEwLeNHQxtBbZ2zUJKvot9zi5zf/sY+PZFXYF4cu7mNHm+XVr6yZ3RR6w8xQV1jYpvP7NNMbj+L49rtK2E+NpfRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koh6E7D2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koh6E7D2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so57022375e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939834; x=1791544634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZhiTg/lKRZfnQjbCTYSKQ7iNvMm+FFLDnpAMBj6jHQ=;
        b=koh6E7D2Bt8Q8i54lVtD2RiTBNCqlYdYPBqIJW/BLXiplZ0Z6MlSpk9fvJ+wGVOILS
         naYJ1BBkwhBpy+E0l4pUlzpn1xh/C9L+/n0eM3BLWYgWwHQc+lJnpevfNnfzm3VBoVbt
         eZGYnUPfmA+1vo8pdqIqKmW5dDDXiwhYnwrcC8ajP82UadGWyZrazadst4WbWVvVtrlk
         2i2EXVqbxAtngC78cgM6VrCGv/DHeX6Vkdo4TyaDyq5p8e0aWvoyCRWUiLGzx3QwWkl8
         +ZzqoWaNVZBNe3SezwN4mVy5O9T0Gm3Xl5AErr0UIHJeLMacEHoTGiP2G+w/ObzzB8d0
         PkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939834; x=1791544634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZhiTg/lKRZfnQjbCTYSKQ7iNvMm+FFLDnpAMBj6jHQ=;
        b=SkFhu55rG79V8cvDwJeDfi53CKXJDLj2nzjww7fl/3OtD4ucwrdjYSRqOSOaaZJH99
         JJwr1LT81IYsMyCvNGobTC9lGAmyVDHPhyywXTteeDnlw/+7CyEq4Ko7YYwtPvRaLBD0
         HlZF1NX+dDEhyP/5ZNDt26eXqFMI4oXMyNjAjpv/95bebGFLdRe86Y66fCdA/878nKQw
         4lE5Bzwr9UkW0OT81wRqjP7Qzscr669w4gq6+FFC8OXQf6JgBs+blQnhnc3MHlsKirHv
         N8mjesYaWpJionyoc7/ysZjhV5/sz90tq1BPnr2s6ZUWkMfOLADGk6wZw30zsnT2jBs/
         d3hg==
X-Forwarded-Encrypted: i=1; AKwUvByVTCyOerqBspXTlm32JeNMCcDjWXCkLFGIZUmz6atnQru5A9LgyxM178+J8Bc3cjAF+v5ZXUwsDaoRAAsfoPFILA==@vger.kernel.org
X-Gm-Message-State: AFuF++kEWr/Ds7xZP5AqAKS1dVEChBneCrKlJNcYtsuls1UaDUR0iMJl
	/8cmIbUzNYSaNrL4TXVUrDMvHaU3dFB/7K4TrQ7wNpimT4ahUMMlF2bp
X-Gm-Gg: AYBFou38UMEqlWNRheO06uo8thM/EdiEfbGE92hiGoUPuDXP2RejwCBuJdwMU6yXzHw
	UrvQhgnIYrt4TJPR+jZ0rT6HIAQpPkSk7RRy9FMJPLk4TJhHMIJa+Ys19kRxrFqTXqCiV0MKj+6
	iQbDUj6SMCGQVlUftqUcyxLjp3eM8jaeLhZRhDNR9HLWawWyXBp0daeolfM/SrgnTTdgBbx5KLE
	j9dFZ/ti9ty94nzEQy7Kgrtk/GZZOl5kbuw9vHIhZRAHoKKUsii3v+PW+Osl3g+JvbFCKJ3uVMY
	pR9E5GiL8Hdnf1mNoLJ1LmHtlBZBuN5xtu1dFQEEqgEbyUAkviCwmril67NTfYdBbK+6jI8COLA
	PTiPCei7q9F1zQDORbu7SpkDhgtJY1kp6gagC4CX+fAss5y8TK2cu/ytB6/q+QHI9Ki2bKlWHmV
	AzfZT5HrtdIinOM2Y2OXHS+PLaIFl/qphdl93Y3NGXKJsMeS2JJh4wWr4zG4dGAZAe+venYMGEN
	a2I7bGNbIlc3xivhEU=
X-Received: by 2002:a05:600c:a00f:b0:49f:fdca:c34d with SMTP id 5b1f17b1804b1-4a02758ff68mr45050785e9.8.1790939834068;
        Fri, 02 Oct 2026 04:17:14 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Fri,  2 Oct 2026 12:16:59 +0100
Message-ID: <20261002111708.234957-5-biju.das.jz@bp.renesas.com>
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

The RZ/G3L SoC has two OTG controllers, compared to one on RZ/G3S, so
it needs a separate rzg3l-vbus-regulator driver to handle the
additional VBUSEN control for port 2. It also differs in how USB
PWRRDY is controlled: instead of the "renesas,sysc-pwrrdy" syscon
register, PWRRDY is handled by a power sequencer provider.

Add a regulator_name field to struct rzg2l_usbphy_ctrl_info and pass
it to platform_device_alloc(), so each SoC can select its VBUS
regulator driver. The name must exactly match the one registered in
the regulator driver's id_table for platform bus matching to succeed.
RZ/G2L and RZ/G3S keep "rzg2l-vbus-regulator", and RZ/G3L uses
"rzg3l-vbus-regulator".

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v9->v10:
 * Updated commit description.
 * Simplified rzg2l_usbphy_ctrl_pwrrdy_init().
v8->v9:
 * Buid dependency on patch[1] for API changes
 * Replaced pwrseq_power_on() with pwrseq_enable()
 * Replaced pwrseq_power_off() with pwrseq_disable()
 * Dropped redundant devm_add_action_or_reset() for pwrseq.
[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee
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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 62 +++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 79503f6f4b23..c5bc7c0b756d 100644
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
@@ -153,8 +165,8 @@ static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
 	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
 }
 
-static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
-					 struct rzg2l_usbphy_ctrl_priv *priv)
+static int rzg2l_usbphy_ctrl_pwrrdy_syscon_init(struct device *dev,
+						struct rzg2l_usbphy_ctrl_priv *priv)
 {
 	struct reg_field field;
 	struct regmap *regmap;
@@ -186,6 +198,36 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
 }
 
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
+	return pwrseq_enable(priv->pwrseq);
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
+}
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	const struct rzg2l_usbphy_ctrl_info *info;
@@ -245,7 +287,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
@@ -300,6 +342,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
 	if (ret)
 		goto reset_deassert;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_disable(priv->pwrseq);
+		if (ret)
+			goto reset_deassert;
+	}
+
 	return 0;
 
 reset_deassert:
@@ -314,6 +362,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_enable(priv->pwrseq);
+		if (ret)
+			return ret;
+	}
+
 	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
 	if (ret)
 		return ret;
-- 
2.43.0

