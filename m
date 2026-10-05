Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB924EA90
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199145; cv=none; b=BJBAD0AbHU59BPI97xbYbQ1/pu2rzR8IjGf2WoZYswEuZk+YOgw7PZ5/jb6m6pBQ4rzDpVKnVmTFgb93BYrj5QTWQ6gwo4mln7hVXcNjgY7mwCktxOivIh+YzILFgs6qW7SN4neFg4+VRkRB7i1slsfv+1BkQvz1o+T0uwKVfTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199145; c=relaxed/simple;
	bh=Xodd013biq2MKbL6kUChNNvwqCu5kE+metrYThk3sQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjgMePyyUiAQRf9b4LDPXQOtoRt9cQOcISLcIL3x2c5v7Ni1blGcrmd0F3UbsqEALDg2nc2fsgLH2zmhPMABl1wBtybu4FMwJATMwRFirvihTsfFh0gFB3BjAUNDxPOmRfjp+nR1U7zxMB0sGAUiZcZxm75B9RU/Q64q+LmJofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3he1moz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3he1moz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso14021585e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199142; x=1791803942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuELcdmeZ/Z2vaO4xtsB/FWfua8jRooRYaHxH5d0F4s=;
        b=M3he1mozgitISdLXJUB5LK2jcedIKYYgJBhZ57PmcLn7EAsBEt860hR6BFuupGFf9H
         nPwEHywiNX2CJ+KrFuKPqvbaR2oj82n+mC9tPdJNkjO+1cvr4dbBDk3uGS4BrJwqZfmY
         ToMz9QF0We8iAoOHtFFtuWaKpeVDQCtuEr7JwkVUOiVip9OoubYm0bSjXm4HvpJBwbTo
         G06Bp7R1vHxCCkZjKM5n3yo7VVvw9hl0a6LCagDeJRpS22dv93Q+HG6XvZp9PVT0Kmyn
         nz7UApBGLcgkCX6q5uRfbyBZQwFHEA0ChiEvqgx9lhy+00+MRf6hDW0+l1m6z1tSzMLV
         pMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199142; x=1791803942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuELcdmeZ/Z2vaO4xtsB/FWfua8jRooRYaHxH5d0F4s=;
        b=b2ckCLTl1zHPTYP4hisAKNc4DOUrYA16s4smKz7Skt2tbGTO4lwLrSnnZFeBDTJHtA
         m4z+/7csHXN9cy1FHMCRTBQItxh/9fl6gd8UjCvhdncL8TKETLuAGZvNBMtlEI4gwjrA
         4p/HEX42fiTrKcKtmOmVkYx2BcSR2P0ZutlCh1OPVjLnaOYehVmz6bohkemb8xuvJMHj
         ykeRlV86qHT7uP5UFtfdEGdAojk5f8G2DbMaE18mfqNPf0qz3mHvMldJ6uZNgAX2hSpv
         hQRQpq1ePz+ef8jiGe70BXBV9DtFofynuAvOFRFc816NHnADd+u+TGee0iInbmcQzXgD
         fExw==
X-Forwarded-Encrypted: i=1; AKwUvBwpmrNTr6RjLv6/T6c8n1BeihwwD77oZSSOAtsryQWgcYC6iFv7h+frHirixRfzVBoiRuaFJcGBpWGzI9bF1vGPxA==@vger.kernel.org
X-Gm-Message-State: AFuF++mUzmgdDTQ+Axy8PYYr65u7mdxNHb/WYbgp97zKsnuHRM26o+6U
	v2pF72mO1KY2/HmUuVuxhm/4yYfyBDjqIMsY/mzfDlztNtK80/NQmgHzFdjPEw==
X-Gm-Gg: AYBFou1VFa5VLWTcOScJTdC8+FdVxQsN0U8KLG9+zT+8WF5iCS3ZMsLmaq0IaPypWTI
	NAXJsNi0qM/xqZ66DO+qYafrVflAZAn2jp9XhndmAVv9xjyuN7yvSlLhSw+R78FpMrb+QJwM6BF
	93r9eeA3jBVnX1xqTPAZOFT5bQxivKiaNGQWM8z9dIoD1ZxUnZb3kfH+qHi1A7gWUH7+V22hct9
	2I10b0+ILk2Ug45L6ZCFj0ObfVDDSKMyrm7Bd242NUmlLtvnHk9UYIg695rOGa06ChyWRM0DcPT
	j/JTipfl9woVg7YfQw9Iv5QO/+oXVj1euc09MTMY1B5ysTZCRbeE2IRsmxr0dkDUsmKmPpLYsvL
	UK+zaMYGhsFqn3IAp4LTkdS0KUb7UDrAu8NzmdvAr2avkabq8EkdAizv0V4DzmC0OSLJ98vVaoL
	+2EvqzQYeNtx7xGC+UBsFSMb4B/t2/6dmre85reJPlyTMPdZbU/Dwz2SKMcjvs/RA5zPi2w+4TU
	7ueVsqQgRDEdA9bFWFO/JT4
X-Received: by 2002:a05:600c:4592:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a0276b6860mr160308985e9.34.1791199141934;
        Mon, 05 Oct 2026 04:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:19:01 -0700 (PDT)
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
Subject: [PATCH v11 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Mon,  5 Oct 2026 12:18:30 +0100
Message-ID: <20261005111854.275120-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
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
v10->v11:
 * Fixed a build issue on loongarch by adding a dependency on the
   POWER_SEQUENCING config.
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
 drivers/reset/Kconfig                   |  2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 62 +++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..d1067f2188e9 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -269,7 +269,7 @@ config RESET_RASPBERRYPI
 
 config RESET_RZG2L_USBPHY_CTRL
 	tristate "Renesas RZ/G2L USBPHY control driver"
-	depends on ARCH_RZG2L || COMPILE_TEST
+	depends on ARCH_RZG2L || (COMPILE_TEST && POWER_SEQUENCING)
 	select MFD_SYSCON
 	help
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
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

