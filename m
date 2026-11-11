Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395245;
	b=bF9bYab+wmTT7J6wjy7Q5trSV2gXZe3PII0VJ2Eszyp6SNosUeO5N1RoOl4pytFixeBT
	 kEFEXmYpO04SuR/GhvisBA7Vso/0752NPHdh5RN2JBu0bkbboKlvX76JlXZu0KzKBFEpq
	 b8QIlPuHGHzA+nlgnITkj554TrBCGTRN97nEUhAzgjo3aHGJ/vR53h8Kn3AZ0esmDyy0o
	 cIVe0WS7o4jsqhLSl9nrclTsRVlAzJricO9GJnC9BrBpzjv+6SU0IbVyW7evJaBqHpin6
	 FypvXuDYyZgE3eS7Bq/qZ+5QfP7ZMeq8Z0KrOy1qwXgeNugvydzwZzeaMFpZh0B10Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gTI8WAy0q1+CVS+DRTUGOER6F234ClULXsTZlYUKv28=;
	b=f3N0MtYqokdc6eT1CNo+2OYvPhl27Qe0H9AsfO/CFK8aV3n5/r2TtUowCHndWa0c3Q67
	 YQixtrU9vAQDA/Gd+IWF4Hife7r1vm6DJHiaAIjygov5rPC/2jbhJuZcMqvcx3ZJRILxj
	 Ko+JOGajP3Ad0Yj32M4uAPJDYpO9fIeUwIDCO/7GDXa9ZX48wQH3EfX9CBmKEwAeqvmik
	 OBDEAgiK4vQudR4J5bCZK1UTSVcEiFb+Zqv6NeEodbFddVk+VmArD5E4EzZiRlj4Dztwr
	 cTXh/Igwln+rjwuZlOAsUEa70yKdLgymJMadocbAGbxl9OhRELvC2z2Xy6jhPw/GHdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD0rp0Pf;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A0606A885
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4A0606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD0rp0Pf
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38583635e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395243; x=1795000043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTI8WAy0q1+CVS+DRTUGOER6F234ClULXsTZlYUKv28=;
        b=QD0rp0PfNrWAJ4Wg8B16+VDRB2fdI5THXEwcW4deMvW+vuJYAoHf8OrUukQZRcBnUN
         QUwQeGrVjS/JRAVNZgU0ZDY4WrbVu0OZmxRV8Um8JA13++uCEzjF3N/gnCPOFnxOUlRr
         DKjF/NHSAwnWC9nfFkC7KpF0nzsExj9HNSqY7COPX7ZiLLYfQRHLXQER5Ykba2lk4DNc
         Ke5G1ZlozrLY6jtLZcxW9AhxnXEGNv889A5Xt+AWbx3ECbngniLd0UTUVXrJxF2UD3Ue
         RmchQS+3MoUZ26pDpePBgRffYwx4UHOS9Zcrxp5Pa1MSiwmvM4mkQrYHrHoOek26kU7d
         iEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395243; x=1795000043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTI8WAy0q1+CVS+DRTUGOER6F234ClULXsTZlYUKv28=;
        b=Lfh3t1c6mzVK5Qvf7duXsyvnIuASv2SHLcT/S9Y9m4B7EcglgSYts/NKoGIG8WaUSt
         3xmc4rE+DaQpc8nqSOZrql+yVuCEEz32di29AqXgOaRren4tGN8XPhAfoCuLhuL71QRg
         RYpzjQKgVCqzfox5NC3CuFlDUUKMEyKlFgs/FCGutwzWzmIkqcAYzYZIAgSyKnTZLtEb
         2Z305c4tQNZ7cNFRvv4eTcOzPnbgXa3qaq2MnJCnnaqGf7+xLs2GgSfeb961QzzzjoMa
         QhPLPpU+JyuPj+vKr2rbigLJSLamXQ5vg23LUrWBrIR/82eGGU+QUZ6N/D79ADcII/MT
         Gnbg==
X-Gm-Message-State: APuU4Z+56HGNHqwjwvHP2f7PUmAY8LE2PuGipiLCM98x6n2ByGaMvsRa
	KwCUyIgR/h4YI81e6gHD/sNnKkr3Zt1gGaIiRkH1gdKrKilBZcunlXyD
X-Gm-Gg: AYBFou0CbVDoTGm+vgwGCQTRRaKURJITD+m3h1z8GSkSrhAs5DLHY0NJFKbuZrhuGP3
	U1y7buaRbPzV6gz65AFTTqUj5fxcTYuePNnLmLCNUmar7ytAc/dr81rVA7h7IAm8m5hhCMXUL6y
	lMVkHmHRnPrFlyxp1aapdtKlqlVBr4aJczLw4XYbz+m8OdJNtounhATuHRO8gtVqeW27cjZi1Wc
	bCsLj2focUMVwOUVu9y4FuBOFcb2FZ42A4ueg8bcLhBui58vVzeeBaA+PquBp/uIAK49dFQIfF3
	BsntgK90qKrwnTxFH6yEanY4wJjyYYAzRFwWE2elHs8COjmBE3sn3kGGrE65OVEBixY6oUK1YD+
	XxGFANLkyhq0FydAByOlBmaNz4RIhszl3q7PbYz2VirvE9243H3sz+MkKn5SnRMZ2FfeT1v47Hg
	lEfeTagHTbcTjSPqaPSZzBAUKfQQKPDcrEAMolnLbt3DmQ0kY5jqnmz05yuHt+ifGaJtkuvy0vj
	khrUQw/kzLahh8gPrxpCUx7dy7CfQOe4SDjljrao1h2w+96uK6g64b9kCwQpgwIWDrlR95xN6ex
	nigdSXk8qUpo7jZ0t/+tl5hA+JhKm9z1N0bdWcpfiyHMnWbQzXN7gCmJag/8OBE/H+A/6jox4Tf
	9Enpv0qEK3cgugJyAZhvqiSzxyJFAXPmtyF8AIok4B0tYSFjNzp+wZu0ABEVByLJhPAUV7orqDV
	GpQrT+s1JC
X-Received: by 2002:a05:600d:82e3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ba093953c6mr39112455e9.25.1794395243078;
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:22 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 2/4] watchdog: rzv2h_wdt: Add syscon based WDTDCR access
Date: Wed, 11 Nov 2026 11:06:58 +0000
Message-ID: <20261111110700.3331225-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v8->v9
- Added Reviewed-by tag from Guenter

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
index 67869468edd8..91bc54ccf4dd 100644
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
2.56.1

