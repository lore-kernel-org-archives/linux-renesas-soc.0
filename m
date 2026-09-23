Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9564A012B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160080; cv=none; b=r7uyVU6QDaFWE4bx1B6qtCeBpSFhMkDU9LQFa+USlk+jbdsu0fQ1t6n/GODesGdIvjR49XJpmZaM6CrOYM8wSwXmXi647VC1wUw45PQyfdjxUCxIXTqx7EHykrVz00LwsU00NoxtKOvmPCCJdm+Jx3EV2C1kdnNTPQMiZFwghf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160080; c=relaxed/simple;
	bh=X1jAYThF13X8I2rqIxQ8X7qe4GN151gAbYtT21h/NrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZEHILVZZ/y5o6TnubVtyB4KFP0IFvOnwqpoxcVptrFMrTOKORoaUgtY1DTVXx/Gb/jnHxM/G+mpKDNHETXq2yTj+rkZw7uyOjzGODLFHHKcBwn2lTmXIdQIbk2mlbp2Hym/62EDfh6Jud2OtJS/1UkiY8VK56p/G0sB3xd5ehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bda7NUQ1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bda7NUQ1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so3939245e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160063; x=1790764863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoGtYfI6mbncqB1kvt8xB8OWSjQJ5DXHu4pe4unlWr4=;
        b=Bda7NUQ1iqN5KGhTSPDJ35nHq7cg3MQFM4vmOXEmNkMN1FrjgQQeM50oR/kLxDRe++
         4qRnIel/u7eE5fkEVXyX4pT4w6tehntWnF54+YLWmSynAl6A5xyjImJDt5cZMvMS3QcM
         6WrCCvCfYkcWuiYi2P9RlrivSxa84LuO0XlOWK04hu0v009NoutFAzun6kr1c0WoDtfm
         aHvFXcGUAU/Bh5QqlSsenmP0ObYY16Dt7NKDYv4eWeakN5D9/ll8uMaA8hvihPEUhPf9
         oRu98h2w/Oe4ZDvS6KwwD2SLkKyRHviapJ0L54924f+KDKT6njzqCxmLZmxJDVdQiF9m
         gw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160063; x=1790764863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoGtYfI6mbncqB1kvt8xB8OWSjQJ5DXHu4pe4unlWr4=;
        b=BExvH3d57O0IE4SCdrcDIz8xy6huN9bBoaamhXSr5kF927K8/KKNj59OCNM3E4Eboh
         +zUEG7BtgnmOpIDt09ZMOWHaByJFtbn4NjUXuxe3pftI0q9SFVTfAsFUnkgayaTex2SK
         E0s1rQn80gXWW+PCSLJ7MNznvNuvdxWlPSPl88PICiCrv/l4aECbKmPXsxG09u/ldnov
         4Wq46Vpxnhx30Wl9wLrjmxONDrD8NAiSSJvj2AX5xKU4VBmtC5HDmtgoGIjF9ZzvyAIH
         eccgXfSKgo5XOjLKGuksDjEIKyrklYLUcbEP+LEcCa16oPZJ9MbeWYDSnFzrsw82emP5
         CDEg==
X-Gm-Message-State: AFuF++miUiIcbO8fYL4X0/uBAYbtwiPhNARq423xEa6SJ827FApNnjAy
	DWLV/BB2VPxfNV5saFQoaJcicKbbT0a69alx9Xxj9kSrtFD/OxXqY1ZK
X-Gm-Gg: AYBFou21iNPqVxCP5eWChrIVfZruldJGBd5c7L+jpZNLEGZZiXWOr+W7d6TSIWgajFh
	InC/PUguRTJezIKC06GSWQrvJBcrhybTG8SMY4m4wKCoWlN+8e/gC7I3+3SKjWl27xGEwqsAtGR
	Oxjdm/1O6gL9zHW18GBsGLipqeiOIlZ5QiV5+NUzNpH1XxBO503AV85LYazczqQ4ve9A+1e6VDF
	9OdiMX0GWEzoskcOZ2laoTRR9cId2mVcdAvQzrTEF+rT20kEk6p1xQ1+dbYGQNpggOiZNtvamp6
	r7tgctGDIJQogVv2VtsMYizvVMuBOnIDL6mlyV6Zm5qeN4DE9qbDlg/1RIZ041nn9oF9obL5daz
	13WeFMmukP27I5fsVoYxjYAxAm1rvC5HRrHM3lKZEoeEA+E/HiyDT79h8hMSTleJYhn6lDp5QXD
	PmX/4sSnrTciM30h38P631iTDF4tnuz8zmqacFVyxgAmVXNsrQGq/24SDOhRLQ92FSHYLvQQ6J5
	hpyJAzbHEZ7DuBzZLw7FAjtgQvL9q+/Vl+5pyMKVyvKUIeKtLoXI0/bBCwuxsmdK9Pb85UpFRkz
	fozZ5F+2
X-Received: by 2002:a05:600c:8489:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fdee0b7e7mr27113165e9.4.1790160063078;
        Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 5/8] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Wed, 23 Sep 2026 11:40:51 +0100
Message-ID: <20260923104054.3324830-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the WDTDCR register access from raw readl/writel variants over to
the regmap framework using devm_regmap_init_mmio().

This conversion serves as a preparatory refactoring step. It allows the
driver to subsequently support syscon-based system controllers natively
by passing along alternative regmap handles without forcing messy
architectural branching at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.

v2->v3:
- Dropped unwinding changes to patch#1.
- Set use_raw_spinlock to true in regmap config as certain watchdog operations
  runs in an atomic panic context.
---
 drivers/watchdog/rzv2h_wdt.c | 54 ++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a65e5d6c48ad..bf46e239751c 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -12,7 +13,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
 
@@ -65,7 +68,8 @@ struct rzv2h_of_data {
 
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	void __iomem *wdtdcr;
+	struct regmap *wdtdcr_regmap;
+	spinlock_t regmap_lock; /* Protects access to the wdtdcr_regmap */
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
@@ -89,20 +93,19 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
-
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+}
 
-	return 0;
+static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
+{
+	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
-
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
-	return 0;
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -235,8 +238,11 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr) {
-		/* best effort, ignore ret */
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		/*
+		 * Best effort, ignore return value and use the unlocked
+		 * variant of the function to avoid potential deadlocks.
+		 */
+		rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 	}
 
 	rzv2h_wdt_ping(wdev);
@@ -255,14 +261,32 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 	.restart = rzv2h_wdt_restart,
 };
 
+static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
+	.name = "wdtdcr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = WDTDCR,
+	.max_register_is_0 = true,
+	.disable_locking = true,
+};
+
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
+	void __iomem *wdtdcr;
 	int ret;
 
-	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->wdtdcr))
-		return PTR_ERR(priv->wdtdcr);
+	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(wdtdcr))
+		return PTR_ERR(wdtdcr);
+
+	spin_lock_init(&priv->regmap_lock);
+
+	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						    &rzv2h_wdtdcr_regmap_config);
+	if (IS_ERR(priv->wdtdcr_regmap))
+		return PTR_ERR(priv->wdtdcr_regmap);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.55.0

