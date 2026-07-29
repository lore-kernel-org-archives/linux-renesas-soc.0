Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941ED47A0C4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325830; cv=none; b=n0X2I9R2OOaRUn8oUZG+PrF+n/KZmFhzYONwx95TYxN5RWlx9k85IFdKfpVmpda8FrBNAFGTreWcdb2vlEXNKyYRsgkUE6Er5OYhIOjodCXQFA+p3GY/2sz/P1dWv5JlISQZ/HUB2c8t+WtBYKE1m3fZA+OvieUAnjHytBIplUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325830; c=relaxed/simple;
	bh=EALMkIJX+FtiylFJKXqIYty50L4VW11qd2GpFjZlBJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5GdBkadEqDkncI/rFByQW9BCBYQEHnM0cGIGgN9JFg40iBjit4ih6piqvrVI32YzX9E7wxuMRf83TI4fsHPp0lQZzFTTY84oW28dOxbEKkQVzqk58CVIeQHJaOvSwenXrwXgB01YFdfv7XjWNMKbgAynFYmUal0Lf0Qg0/C+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D00YG9Fh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D00YG9Fh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so7803495e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325827; x=1785930627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgr7gNQL8mdrSoNtvu8z6IaQylCJ0U9bM4MFw5PnMyo=;
        b=D00YG9FhHgtZ7VCL6jVrIcDpHXaT/mJ2OerkD+TX3QpZJV8amOMAV6VJ7E+bbi5zus
         OEasf/T38ix8/dpvxhDcbCIEEMAkYMIWEJiOHGYcbq781yrOrbTwzCBWDX2rRkkJqiAi
         o+PnPdfEF+JfPUEa8Ce3RtIjFeIWtdUBLJO3GQKbTJjsjpWqDu1sErwwVNPHiQQao6jD
         HCQtytuX8GObcXe24jz1WTWokkkEZBsxXscZQAVICNa3ZwVU9291TA5eTVdyYAFyAiUj
         wsmwW7jio/tBBRs/lJutHTphJR8fEIhOMzNPmoiWEJAqLDN3om+7o17I2PhtOJxfLkQR
         ER5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325827; x=1785930627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgr7gNQL8mdrSoNtvu8z6IaQylCJ0U9bM4MFw5PnMyo=;
        b=bvBFC4HwsX2oSYwbbky7JKgHxNPCAedp8AhovC+gJiX+yytcITZKCO9RV59VGJCDV8
         6HRtovnxtZs1pOE3rLSw3zb8DgLrAyPPkh0v5gXEulKG3NmZCZEmam2jQMw9e0nl14P9
         uce9QXi6PAdoiicyGwhagMLL+mFVn/MVR6VFlnkh9K5eE67AUyH7ku+mqhZ9VUflEzYh
         UrLwQeMYuTe5j78B++Tcbqz/jxtvZ+9s0TRocaNUtQ9KdcoQhBKfNZ4skuhqAi+fovHx
         O+2CFS/wj0TqGcGHaBoK3nlxGKUg7BDs33AugnykxcmraFgMIOf5ztsOSmZf6UN+qEED
         XqBA==
X-Forwarded-Encrypted: i=1; AHgh+RpdMHiW9g9+fMsdhLYL3dICX6N0PqXjzV4pST7+Xgpls/965RRsbum1fbu6YqdIohdyZet1xP/J0zuxueNZyNgkRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tEhnwl4JZIf/UrWR6f/WH7pUSjzJzsSedUI0qByuiya3ilXK
	AX140BZHoWu5C1h2OO0FkLSofPqD6Mn+kCUsMB2JSEVP5Q96UBL0lQuZ
X-Gm-Gg: AR+sD11Qx5vGAfdM4HSJVl5nCycZWCJdX0Q65yPY+0uDNkfCK/CQqFf/ii/bl11nSma
	E7oinyksJjJmchD5PiWhI3GL+R+UkUNjH6k34gaPVp56J2I3y5h20PCKNv7EUX41+bbZe6ELLfo
	B90fkXHzDaU34IVkcHXsi0ADR+1u8HWAA5ue5arg1bL2TGPrJZkOrkfkfiX8Xo9AIi4nEe1gGeM
	Z/PRrOQQJ+7kbIbXe1enjbKizAs6zeUKc4eeG9+ukiK8o7ssgKFlCkaEMluatQ+fkg0/JshqBE4
	00IGTxf1ywCW5PTKCeqXGXJNTyPg6LyN1jwMCuS/FnL9ZQcwUm51xoieSyZib8XXmpJaISwKIST
	RhT1Nr4cW+BoN7t2YemEghB5DgnE/R/WqhPQv2KDuZPaLPyCV1wa5HFQ3fkiwo85UdnYwTJFGPe
	cCP6dFi2HRjHkl4NTspwhBrVWOAFg9+CDd/aE6HhOUyYoU5y2rnpE+UytKme9/szhD/7K89Fy5d
	MXcL4QPFdMfvg==
X-Received: by 2002:a05:600c:4fc3:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-496c657dcf2mr66551915e9.25.1785325826582;
        Wed, 29 Jul 2026 04:50:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:26 -0700 (PDT)
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
Subject: [PATCH v5 2/9] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Wed, 29 Jul 2026 12:50:10 +0100
Message-ID: <20260729115022.222340-3-biju.das.jz@bp.renesas.com>
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

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
The new struct currently carries a pwrrdy boolean. The probe function
now retrieves this struct via device_get_match_data() and
conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
pwrrdy flag, removing the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated the commit description.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f003b360629c..40e28d033a93 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,10 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +110,15 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +158,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +188,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +207,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
-- 
2.43.0

