Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319941D201
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125492; cv=none; b=o1TpEwRUeIuNIJLc5lJmW3VaRf2Qzb57SyhKbyjbobxFJho4+I+VSbSA8ipjEa3tRYmE/nzrCa8K1kvN1i+9RSYv2e8WKnVoQDLkZptshZRqYe8oM/LvXllG87UT0MZJQOeLnEslOit9qVhSbDMZ8AG1q/R9arKZDOd7BqCIRdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125492; c=relaxed/simple;
	bh=M0s5qNvm6lgULK2n8QPcCEFSAsT+ro/ADdWPoCKHveU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCaDqIbbKgjvoomNlDY4f8bXuPVsQEv0iNETK6kQIThX4B5nylhFqC7nzjLRcZZt0IxZTxLr5o1LnBens95StPNvGaMnmil0huWaGTxtFaLkAy0Nh2O2YOWPyqN9t4I4SbumyJ/82mYhLmPVO5wDho48JQv6dOKzYtI5cIzc/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AarCKnUS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AarCKnUS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-486e70f2457so363885f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125469; x=1789730269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=AarCKnUSfJOClWAvJ+OrAx55BwAHtyhCbm3WDAcb40MVl5HiPbrLCCFgrSQMH0XEK2
         vUiE2Wn5KPH9bJS97Qz4Ou3U69Iku/Hvu7GHdDjjmmDba1ebtEvqEpq1r4vksdiPUptU
         XxQvdxixVZtcBO0g1y3SUXpm3g+tWMaTnreQ1P5STqXxYtm1tdmzDzDlaMlRgi+q0j68
         Lpba6uJiY/LU6YvWgElL+n09DAAyyLqdJfOujv5FOv0KoU81rHircYuppQ2d7gfEJ1Wm
         zu9hZGlV2h8lVEbuy1DuFGM2fTqVnZQHywjF0a3TjWQmUpxoEiuWJzk1Nr8OBJUxsyeW
         a7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125469; x=1789730269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=mtbW/Tt9BkGfYSpNX9MbcHJ6PhGB5FQgh8Et55NZs8dZvLoZvFaPRO89HnPyG09Q9B
         rylLFJI9qSG8JuAXrhfpXWv3fm0TPup6BfVXfnUFt+B5fOMphIenanjXGRFVGcLvqsiU
         kkDZLXdFKm5jWVILl/NH2gVV/7Ejp5/DZJAWv+wTBQSnOTOF8UTytwW6/PhYQ/KtMPwM
         y/BnYAX2LvdhJZYquEsoWxe8CZzA2qEdpNaWj2Qj7n/MsOD+25gZ0f3MCpjR9O5vbI5b
         JdqnqgWiAoC29wQhojixRcQ8+M2IE7iV3r5djgqI/enOx1wROxhndKuVN+dMGNYmUyV6
         ssNw==
X-Gm-Message-State: AFuF++m+zGSGvbtg8vqtfqfo0BLubCbgYwuTuRchpSPIPmiXgA9+G+vY
	8XUZV+ZAh82opa3PQv+Z+lcyGyHhE3DwN5g6wKp4YgWRaaOmL2/ygbxc
X-Gm-Gg: AYBFou17VRTqA8Em0OnMK2mtSKs3zuPI0/PaVL9PyEYxlGYnJijh4ANBxyVXEQyARNq
	UU/LHKiN96oBpg7A9I/IRUh48nAuRlpgFV43IRKiNJxYV54AZx0eFiITswXcgl6usEuhQtwRsuh
	vyCQDgG395nruKd9YljsT1a+jf2bJmLxXue28rimnUiMu/WmYk0DipLSJvsKW7L/mtme81e7ZSQ
	TzaEtgxxyGLiIz7AzJaQpcf7Q0tcn6+9sQg4JBKS1NhLRi5ZXVWuyy1GHoVKth+Qb6SsLZEUF7V
	fcuZv0FPy5QadsfrJT84LLdSalVfc5fxUVtyxSg4Xg+0NychPokifl3PWRxYhnIa4GVjAjeEn+H
	UYnXmXeHKPmO1afOqsvwagY36AgZH0V968rhut67Tiyy0m5ujv4Iz4f9j2Bsdz8SXIq/8Z2wj4t
	fxy8xf4YPumoYc6tmBGDwNAZ5Y+TpBEWggHi5mhVqo4c5TGlAJ1dUn5/hbRmAyBC5I4ZrOStYJD
	K41ZqmGq5/IfTBEbwXXYaaPOkFWVLhhrQLFAMecOMLUlCfali9H1fFGhQWkYCJZZa8c1l2eoFyG
	gbzVJL4J/ogaVT7MKET+ZKkAJhyfaA==
X-Received: by 2002:adf:f2c9:0:b0:482:e22f:a2b2 with SMTP id ffacd0b85a97d-486eb303657mr3242321f8f.20.1789125468686;
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/8] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Fri, 11 Sep 2026 12:17:28 +0100
Message-ID: <20260911111731.3404308-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 4a5a856060e9..550112446db4 100644
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
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+}
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
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

