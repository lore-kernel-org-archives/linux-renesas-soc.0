Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D0519923
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679055; cv=none; b=bfSCBA5l08Js3cRHxKoEKFwz1XvP4R3RAzH9Synkzkm8Ff7ZydCdpTWxgNjuVfi1cwWC9HROPhgHhVSKsexHH9CpOzrlVOFSS4I2SoRq4Fqrsys2Shchee0bDS6nNbplUhryole8Wxn8gKhRfQ0SxSeYU9g5vZydMBEZUaiwiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679055; c=relaxed/simple;
	bh=7HoFWraQLe6a5qbXG/Khd8BdOa2g+dhz8geCFRVA8UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMbXyZkc6bIw6cfLegKU0xds3YYVBddmvCdJVSxGPclgWOL8FoORycK3t8RR6AYFgCoJO6AnaRnicmrlOuUdgqoslfW5wAEJLFbf0ZUa08YE7KwUr8KPUtOnaG+2jui3nPOrWHongStuvZGXU8HHmkILUqRYCH3L/Fq1PeHsnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeJC8Kqs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeJC8Kqs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so3027335f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679041; x=1791283841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5rRbd/AhhlscHaVREYShLlFQFPqfLAqKH8ieUrnby8=;
        b=KeJC8KqsvGGwmdL0lhOeNX3p5Vvl4cniM01y/hXWCrO6wkhHw2OIdnZjzhVZknhnfM
         Dj8gVik+DERGNP5PGWJoLvNKbeE3bnjqVka2K52c/1upXN/a4um8Olgauxj4LUc7/x5z
         Zb0xX+7E4d6aaxTMgZC2fCW4Lp/PkT7ib8/Iex4s98s3oB3IKYFJQZWr9I98wKMAOk6Y
         tZ4LXawDFqlAaZ6j0e+DG09v497qj9f7mF0jdq8rQiDGqORTTe9uABnEtyjpsCcAGkTV
         ZX2NQLua6jTJ7u8S1B4guE45dgq/elxdv/7x0bUoKLrtnW7sSKqs/4sNoQroOvHExS9B
         Prxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679041; x=1791283841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5rRbd/AhhlscHaVREYShLlFQFPqfLAqKH8ieUrnby8=;
        b=aGH0oxXqzIxDb7fvwA9eo7ocACtpKUyUckxwcZF/D0J7rnipqu1SQQEYoK5unWt4rF
         VDpy7ecmOtK7HJzzuolgS+g4dfYdnpuGl8wtDtxoKke0Mzf+I/T40lRJU2BO419UFQEQ
         k+Ew4qBByBI983TR3UJFvrduFZT3fe1f3nrVOjY6FHtC+4yAy8vo3C7PcMA+OkDy3IDF
         aXBlVoDd303SzEG2YGMwZp0kfRNDWlQ63yjXHPrSSxRfyRGCcHcCVRy5Oys894YnzMSl
         SQ338P5jjkZOmX4kS2zmHlhTKwElbd3ZC8tU5qCNPLaPn1gG7UGh0+pr22xNN30/oBxx
         cfZA==
X-Gm-Message-State: AFq9FYLiN0qYvRcHDwi/yD31d+ZSTJwe7OOVbF/B5bScjXp599Hle7Co
	czXAix41BXv1oAHK8xYOV9QUdYMiQ9rxGv/MgBnZK4E1vV9cV8NonzHi
X-Gm-Gg: AYBFou27ZtW1TWKUX9m4TpB/Lh2lH8eUG52JFNl5MWnq+c4M7oUwgMXoT6LkMiOPerN
	2nQ9I3pKy/fdk7+qZ0WcizbUsITeqJEFgsorJO4AFpyJLoUFqszchctqM7WPIwO31EIFPT0L1i4
	eeSaTZPD1uFNJ9YGIhSiYDHvfUhDYObQxOc0CTdpT+ubWDjGCcklu3Qo2GiCLIzAXzY4JcSZn/v
	WD7hkz1Fmxb/ryAa/DI9ZZNsiVUOIgk4OUsjqtfOJnOmFpD83eFkW+UGZ0tY6EhDH3kTS9nPmJ+
	E/veW1snpNi18LvqzxTUKapYfKacpu4dAOv0kWAqZHR7efZYzrhLe0ybcaoqzbPBAXUV0rNaLOV
	RbaQwvTAEUYzPrqYopdqC6+Wy89YPbe+wTxl1JGZTZpPgmq+DtO7ndNRzdLbQ5IWty2yJsyEwaR
	bvUoYoG6C4MHmmWmIPymETOGZ08uzLMsZ8n5xL70iuQLVtlUkW1p6YEjWWETLydIgczDNmHpB04
	PQKgwAdZXNllnRJKbcSi8h74T8f95ByJFG3pQ6niQ/sGfPY836eFeT0ygTZ792+br8RuwEuUzch
	L8jfC6BqCw1l/UYd8JkF3heBnERz
X-Received: by 2002:a05:6000:2c11:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48871879aecmr29681808f8f.47.1790679040440;
        Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 6/8] watchdog: rzv2h_wdt: Add syscon based WDTDCR access
Date: Tue, 29 Sep 2026 11:50:19 +0100
Message-ID: <20260929105021.542730-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/T2H and RZ/N2H, WDTDCR is located in the SYS block rather than the
WDT register space. Allow the WDT driver to access it through the syscon
regmap exposed by the CPG driver. Retain support for the existing second
WDT register region for compatibility with older device trees.

The syscon regmap uses locks and cannot be used from the watchdog restart
handler, which runs in atomic context. Use the CPG helper for this path so
WDTDCR can be accessed without taking a lock, while continuing to use the
syscon regmap for normal start and stop operations.

Keep the WDTDCR start and stop helpers as void and treat the regmap
operations as best effort. Propagating errors from these MMIO-backed
accesses would complicate the control flow and error handling, while
the restart path in particular should make a best effort to restart
the system.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

v5->v6:
- No change

v4->v5:
- Code changes due to regmap_lock introduction.

v3->v4:
- No change

v2->v3:
- Made use of the new "renesas,sysc" phandle-array property to access the
  WDTDCR register via the CPG/MSSR syscon node.
- Updated commit message

v1->v2:
- No change.
---
 drivers/watchdog/rzv2h_wdt.c | 77 +++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 40157e969f58..122e5f36c6cb 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -5,18 +5,23 @@
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/stringify.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
 
+MODULE_IMPORT_NS("RZT2H_CPG");
+
 #define WDTRR			0x00	/* WDT Refresh Register RW, 8  */
 #define WDTCR			0x02	/* WDT Control Register RW, 16 */
 #define WDTSR			0x04	/* WDT Status Register RW, 16 */
@@ -44,6 +49,11 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define RZT2H_WDT_MAX_INSTANCES	6
+
+#define RZT2H_SYS_BLOCK1_BASE	(BIT(16) | 0x5100)
+#define RZT2H_WDTDCR_OFFSET(n)	(RZT2H_SYS_BLOCK1_BASE + (n) * 4)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -64,6 +74,12 @@ struct rzv2h_of_data {
 	bool wdtdcr;
 };
 
+struct rzv2h_sysc_wdtdcr {
+	struct regmap *regmap;
+	unsigned int offset;
+	unsigned int wdt_index;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
 	void __iomem *wdtdcr;
@@ -72,6 +88,7 @@ struct rzv2h_wdt_priv {
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
 	const struct rzv2h_of_data *of_data;
+	struct rzv2h_sysc_wdtdcr sysc;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -90,18 +107,50 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+	u32 reg;
+
+	if (sysc->regmap) {
+		/* Ignore the theoretical regmap error */
+		regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
+		return;
+	}
 
+	reg = readl(priv->wdtdcr + WDTDCR);
 	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
 }
 
 static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+	u32 reg;
+
+	if (sysc->regmap) {
+		/* Ignore the theoretical regmap error */
+		regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
+		return;
+	}
 
+	reg = readl(priv->wdtdcr + WDTDCR);
 	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
 }
 
+/*
+ * Restart runs in atomic context, so the syscon regmap must not be used.
+ * Go through the CPG helper, which writes the register directly.
+ */
+static void rzt2h_wdt_wdtdcr_count_start_atomic(struct rzv2h_wdt_priv *priv)
+{
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	if (sysc->regmap) {
+		rzt2h_cpg_wdtdcr_count_start(sysc->wdt_index);
+		return;
+	}
+
+	rzt2h_wdt_wdtdcr_count_start(priv);
+}
+
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
 {
 	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
@@ -221,7 +270,7 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		rzt2h_wdt_wdtdcr_count_start_atomic(priv);
 
 	rzv2h_wdt_ping(wdev);
 
@@ -242,9 +291,25 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->wdtdcr))
-		return PTR_ERR(priv->wdtdcr);
+	struct device_node *np = dev_of_node(&pdev->dev);
+
+	if (of_property_present(np, "renesas,sysc")) {
+		struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
+								    1, &sysc->wdt_index);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+
+		if (sysc->wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+			return -EINVAL;
+
+		sysc->offset = RZT2H_WDTDCR_OFFSET(sysc->wdt_index);
+	} else {
+		priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(priv->wdtdcr))
+			return PTR_ERR(priv->wdtdcr);
+	}
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-- 
2.55.0

