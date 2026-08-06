Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851A8442B3B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011766; cv=none; b=Q7HGarwelDJgKo0gHzcohUpmepMJE60cuIsYps8ZmjOU6cFKuOgj+NbN9AqHe3bS/nV1UYov6AU3c6ffr434GDJEctvjFoGm7rmeZ1gY80oOhL6r9/fUaMrCcXgvTLeBe7Fypulf0tTxpVQVB7MqLReBXjypDolE+k4MzFeMGr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011766; c=relaxed/simple;
	bh=z/YMcMYuV5a2DllsZHNjEmvPSRflpHz3geSXkfUhMjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAphXlmOFV5saNq4n5O6z7BQKcvKYrwZgqlB76oFnmjCo1xQzBJ0njd6FHaW7r0euk221GifnuX9W6fV669Dqx2XWrdam23qkgJpXDCSw3LPe5lg5KJJDCbV3DH5NjPPFoxpNXR5sqdHXuhk4GCqoGAUy8bcgcBXgkwc56XfI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MX2ZVlpR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX2ZVlpR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1860219f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011763; x=1786616563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbWQdQgoPQ0sn93sBFd3E0PgrjGQ75Vah+rrgfumLy4=;
        b=MX2ZVlpRQ8a60lkGSTDBTodl+RegGiqyADFIh9/5dCQL/zq3cp+vq/AaAPn5Lhc037
         +O+G4Mmwv78fIJyyJoSK0aj419TrfmLp1WvvEZtaQiiVFNEUn3bcCCKew3RlTlHslTBD
         A+Wzgf3DB20iElJ9Z5GmvM8SZk+4qWa/MZNWiteLt7Lm6VEgLkQdG6fQ6Yh0HekDztz3
         zt1M4RLwQm2YftkfnaBHUlR9B7uM+Sx4abXxGfGWZTbPcqCLL/UKx/a1cEMzpTfJ8OlP
         SBn5ljr5EOR4bqktQ4i4ofPFmAEfxYRHA9ol+rvUBTGbne2e6awWZzlgwJmAiG8X44uZ
         wzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011763; x=1786616563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbWQdQgoPQ0sn93sBFd3E0PgrjGQ75Vah+rrgfumLy4=;
        b=d/fEFp1/E3lF5wIBTi8BT//+DT29qdirroaW4hH8wjbus1EwcziH61kie0gvPOWjDS
         mQbXOB42Hk1L9PUBbJfhKZxQ9HfbDlaY3RkBOWmhpttcwGl7fUqfSDs3vqvqZFmvHjHd
         PzRVkfDAXLA+5GgiVUNMq+ERVM7CQm8H7dVBdHIZFn9BdkgW4g1N+IVNe6u0tnfIuvZV
         7q0rABGW5254nDmK/dDA5cwZ/r76lNVmQBkQ9ddVpztJ4OkZNbaP9KUes5SUpkrjMXQq
         vg2qGVNBmOnFDjbAym7uwdesoBacnlnv3lYrh53XtEfnn8Mae5fd3iF4/E9zaY1/3V/x
         IGVg==
X-Forwarded-Encrypted: i=1; AHgh+RqXKX9lglE7+Gh67YgoZO6ATPunIsLt1R/7/WLND5MArvG9Bhsq95wYKY2G/cB4lsFkGch39bQE659zUJ6Xmo0toQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAUIthD/OG0J++nMfHE4IbdM8zzTSGIgaf/VSqb6rlnSojPpw
	7aps/48Itv/Jg7qwfApvE+ZXWvo7cOpaimFH/2U6oSNaRwgrAAjaxSsF
X-Gm-Gg: AR+sD1051BzxdN2zsq5GnaLEpEm5xhuyrzeTbklPRKS3414UeeLx0nAnm73eWdd4eYA
	amyqmxo9YoLMIy0ZV5ccXrHmyz0WAlFG3IEjAYOt5mUxOb7c6WdCsOQ1UXlfEo9c6ErVgZkw6N/
	zvgetCPdHqssrKPDUBbqzYMR2/Pv8QL2s44+AI23FDKsD7uF7ab4D+A0Ftws42SKPr0h83dtjFr
	IQmIuDnw0o+6TzfIIWhDLsxBGBuSa90FrbF7jwQrYfDUhdtAzzuWnb+IKYJ9ngJVHNRaGSmf+AT
	ewrpozZl8dhoQngaX0WiQR12F0PoT43CIRHyoWT2XnjU2PK4jG7cg2FUaZGOJLrikiG5fi5dvvb
	1a7Q+SNhuGrdh4Yfs8GacYTSejoVKW6sKvhJGMy76rHPfP/qaw1ZrvBfBXg/hSFkFyhoISYgPkk
	QHmFjNgQgm6KVCQmZoLQQHenqdzXbdnIeKycUSmYb9/UHIVcIqvWY8n1eK67VKl4zXGRkWaethx
	AmCz1Tk2009
X-Received: by 2002:a05:6000:2212:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-47ffd9185a0mr220795f8f.16.1786011762589;
        Thu, 06 Aug 2026 03:22:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:42 -0700 (PDT)
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
Subject: [PATCH v6 04/10] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Thu,  6 Aug 2026 11:22:23 +0100
Message-ID: <20260806102236.149159-5-biju.das.jz@bp.renesas.com>
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

