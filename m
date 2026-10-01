Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BB4F054E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=pEHPDj4VVlhttIodQohDlg4a8DrfjjgvPUvvysASFCnv+fNYHMVaz1Z+3nYOszssYs1E46KUwupaOlBC2uxo6tUBJu7Jq/lSlZ0gkQVCKOPBaQznoRsUUshWp/WgrlHJ0DxO7xqboiyUHCNbRgbqdTgkmTVa2OKJVCB+p87skdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=4uH9MM7usvt64yOrcmZSvWKC31H/vkrRQ3Ubo8osYkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLKhIvS9896cpSxc8QNNJMT8tX7RTmCvn3XlMfbL3CoNQzvKNhs4d3bUxIIHzvxuhYzGntVkZbcQLSfYCrfZh2/KK8PD5vCGW7pP72/xic4wqg6lqbDM44vxFZC38UCp+Vv63imbvevgMveplCxaTvmFGkLw7RYeYXktYWrDlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7SmWCAA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7SmWCAA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso35487425e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873531; x=1791478331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTgwwi0R/Wg2SbzFo0q90CbHoVV4UJSuDU2pQfnOv3g=;
        b=a7SmWCAA59XdJp2GN1YEdxn77dmiTECn9o4egSC9BNbjqb4J30wUP49dmO/9rmWS5d
         jAYJUfE1AzMC1/5kvbxvzuY/8ki8mA/x3lVCvtpm4c5eDFbJyso+haCDe2rs1Ao0rhh/
         GJPwSMU6gn7TNCBPpGFwSIBAvpX2/gmTv01S82kBnIbwk2iShBrLfZ3S4Wm86Kypsn91
         Ha7sCaRcKI9JIMlSlln2lIg0uozdiz5rpkUvpmzFZvWu9xWDgCZxpXb6G766RUcLcT7k
         RqmDjnS6Q4dzH80rfIuehLScrWb3rU5vyRObtoU4Yxuw+4r5wBMzIEN5hDT9oCq9NLPb
         33vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873531; x=1791478331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTgwwi0R/Wg2SbzFo0q90CbHoVV4UJSuDU2pQfnOv3g=;
        b=U7cDMJM7LgDJtnDDuwFK4SDmtPWurPdEMHjBV/cWStPhoiLodWiYqjBh4LtCscl3ly
         5v0FFonBRmXJb/HnPdIPXxqRCN/fV9eD5PMyE28MPmXj1oH05upyEIsA9j+WikE2SRyK
         FmN3OwAH3wHSSDIJ1UZXL1JFTQlLzX6B68H+5T2T5KjHqe9CcLre7mHYVQH70NHWuwc9
         F1gBu+qTMyO0gDRf5Q1hbIoSpoX9Lj+5UFtGJJVMkgc3XsbKeePa+ug/aFVamp2fPAsj
         VQAqATVfo2/wWDZEaATUHdCa2UrAUYNxL1hAi7jrahrTg99C1nCUUxRv2ApfhE0yL50v
         N+JQ==
X-Gm-Message-State: AFuF++km9VGAnAk+UAAS1u8m9VVj9ktc6cw1ZQiMxKmlRhzwpd769Zzm
	p+ATbm64MPvFDosOpODrIkLnXmETIlbCbAvZmpr+uzJGn33JPsTO+rHI
X-Gm-Gg: AYBFou3MKb3xE+uGvdbhNELmoSpOm+hYkuycBa7M6Iti+OAAf+gImo5lbAHi+Ph/aY2
	VhOa+yRDJ45ytI7wuXfLs6nhJxcjKiqfUNzL8t3th6pD3GaTy9srpMSbYqQysqSyLIezhxBow+B
	mRPOeIWvrD3kqkguBxmW9nyk2Tq726ex2gn5/Pz9+2XzQYPr6BWRIF5XEFoRp5ZgfEUhzR/JLWg
	GsiwbTZmV8sldTPsRDM+LK01rCy3F4LUKhjavjS2qycnPRqHlapwAKvoVBbTDiHrIRDISom4AWP
	TfBcxarhnSxsCh2oNageB+IsjUx3L5+HftPgkhv0s6xNpQSc43OAEbbqX1IU1QGC468SxBYY12g
	klZwScMUAP08qFUS+pMMxgE7zwwFkouuGBxwkOpr6y71Im76/8J+GmXH+GIve1ENZsXH7r5lmpO
	XscydPkx8XJe2cz+iSNLdZBQ1vZWF2J6V+54wm+/9tHtSFStvr0Bfv1pAseGtBTfgIftyt6rhsJ
	g/W7zrW6O/9tOVgmIPo9Ex7fVVnazfRktvkjIVxAtA4p7sgnSfBaXR25g4fEJuytihSacGBb3wT
	+NgnFo+i
X-Received: by 2002:a05:600c:b85:b0:4a0:313:3a12 with SMTP id 5b1f17b1804b1-4a02759b47amr3639985e9.20.1790873531110;
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:10 -0700 (PDT)
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
Subject: [PATCH v8 5/7] watchdog: rzv2h_wdt: Add syscon based WDTDCR access
Date: Thu,  1 Oct 2026 17:51:59 +0100
Message-ID: <20261001165201.763882-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v7->v8:
- No change

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
index e8a40482d580..70d2b133c5aa 100644
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
@@ -234,7 +283,7 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		rzt2h_wdt_wdtdcr_count_start_atomic(priv);
 
 	rzv2h_wdt_ping(wdev);
 
@@ -255,9 +304,25 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
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

