Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:49:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2842821924
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtkpUmOH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfBPNtb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 08:49:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36364 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfBPNtb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 08:49:31 -0500
Received: by mail-wm1-f66.google.com with SMTP id j125so12412202wmj.1;
        Sat, 16 Feb 2019 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+jTPg9LW4bsnIi0YZNaf//tLV4IoYBgV7S5ooMNUik=;
        b=RtkpUmOH7qx3VGrblhcsUZjuhP2CG3JRPhiRaMq5nKYWgnBki7ibTJY7Y7a+iyz8Ca
         SToxNR1tKxFQmfW9JOFNM67mi4LbtoQXmm4c0YNB6/xxBDszXSoxB2QPlFICpbsYuak+
         xzBsostYS9guBtcWbWzB+8RxEPC4/UYj9WPjpockw/3ggcuWgt/HbhHMjP4D3cFjkWoC
         OQV3rWMBAGUlbvHFWPn00hBdhF3h04CUlnLKmdOlWVFrB477qqtZIVJHzOHGtNDFdnvy
         Dc4YWsXYyLCSsfhOF2fLVCbQNMA2GiwKz5at0ws1D8B8HgXUp1HoMeB8o5N9OMYQuraO
         6n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+jTPg9LW4bsnIi0YZNaf//tLV4IoYBgV7S5ooMNUik=;
        b=k3lXctcBhIPWLVJ/jYw8c+OTaBtCWQt+Jjp7n7EHEQJyL3ive9MOthL08F0rHWKGtn
         kn8wGm497Mg4XEG+PNw2B8AkRdD2akiM/yAs6RZh0ccO8+rlWfnqNEsbLJgbW/f/DH/w
         CCLi+SLS8DdgkwRwMkWd018OS0cEO/cW3hqFRQPA6Qp6yxdwPSPbTEIwtOBfIbUZpW9B
         bpEi9LmwsRQUuwUtD8vFt7znzQ0Z4qfuhq9pOPfL6QpxfgI0rWPLNTOge5/21obQjAes
         hrVrgVTX1kpX2N47y/Co8F+Qvc6KTM/iV3vc5fsp2RT1lkxLeZYjvzsbKCy6MbllXuYI
         Se4A==
X-Gm-Message-State: AHQUAuY5y99XqesrkbnvxQkLtkv8sYANdaCrtFVnu/YAJTA3InNtgGjZ
        LIiCgStrJOtaU0UjW3RY/sacPKqd
X-Google-Smtp-Source: AHgI3IZjuPH9Bv+p+JR96okgaCxf3TPT653RdQoLjb1sU9IayOsuA6/jjsH8Q8IJt/dHZTS1O3KA0w==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr9994456wmg.101.1550324968087;
        Sat, 16 Feb 2019 05:49:28 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 2sm19015901wrg.89.2019.02.16.05.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 05:49:27 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
Date:   Sat, 16 Feb 2019 14:49:23 +0100
Message-Id: <20190216134923.7277-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The TDSELCTRL register is responsible for configuring the SDHI clock
return path delay and may be adjusted by the bootloader. Retain the
value across suspend/resume to prevent hardware instability after
resume.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/sh-pfc/core.c            |  4 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 10 ++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 10 ++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 11 +++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 10 ++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  9 +++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |  9 +++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 11 +++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  5 +++++
 9 files changed, 79 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f1cfcc8c6544..d23cedbd58d4 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -657,6 +657,10 @@ static unsigned int sh_pfc_walk_regs(struct sh_pfc *pfc,
 		for (i = 0; pfc->info->ioctrl_regs[i].reg; i++)
 			do_reg(pfc, pfc->info->ioctrl_regs[i].reg, n++);
 
+	if (pfc->info->tdsel_regs)
+		for (i = 0; pfc->info->tdsel_regs[i].reg; i++)
+			do_reg(pfc, pfc->info->tdsel_regs[i].reg, n++);
+
 	return n;
 }
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 287cfbb7e992..d5aa18705b6c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -5570,6 +5570,15 @@ static int r8a7795es1_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return bit;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
 		[ 0] = PIN_NUMBER('W', 3),	/* QSPI0_SPCLK */
@@ -5877,6 +5886,7 @@ const struct sh_pfc_soc_info r8a7795es1_pinmux_info = {
 	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index db9add1405c5..7c21186cf624 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5919,6 +5919,15 @@ static int r8a7795_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return bit;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
 		[ 0] = PIN_NUMBER('W', 3),	/* QSPI0_SPCLK */
@@ -6240,6 +6249,7 @@ const struct sh_pfc_soc_info r8a7795_pinmux_info = {
 	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 72348a4f2ece..1e4854ae2262 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -5877,6 +5877,15 @@ static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return bit;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
 		[ 0] = PIN_NUMBER('W', 3),	/* QSPI0_SPCLK */
@@ -6185,6 +6194,7 @@ const struct sh_pfc_soc_info r8a774a1_pinmux_info = {
 	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
@@ -6212,6 +6222,7 @@ const struct sh_pfc_soc_info r8a7796_pinmux_info = {
 	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 14c4b671cddf..e3447fe7b7ae 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -6034,6 +6034,15 @@ static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *po
 	return bit;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
 		[ 0] = PIN_NUMBER('W', 3),	/* QSPI0_SPCLK */
@@ -6341,6 +6350,7 @@ const struct sh_pfc_soc_info r8a77965_pinmux_info = {
 	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index c5e67ba29f7c..55f68e53caae 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -2438,6 +2438,15 @@ static int r8a77970_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return -EINVAL;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct sh_pfc_soc_operations pinmux_ops = {
 	.pin_to_pocctrl = r8a77970_pin_to_pocctrl,
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index b807b67ae143..e892c0eeb203 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -2867,6 +2867,15 @@ static int r8a77980_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return -EINVAL;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct sh_pfc_soc_operations pinmux_ops = {
 	.pin_to_pocctrl = r8a77980_pin_to_pocctrl,
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 151640c30e9d..2a3f05c6b365 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -5019,6 +5019,15 @@ static int r8a77990_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 	return bit;
 }
 
+enum tdsel_regs {
+	TDSELCTRL0,
+};
+
+static const struct pinmux_tdsel_reg pinmux_tdsel_regs[] = {
+	[TDSELCTRL0] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
 		 [0] = RCAR_GP_PIN(2, 23),	/* RD# */
@@ -5292,6 +5301,7 @@ const struct sh_pfc_soc_info r8a774c0_pinmux_info = {
 	.cfg_regs = pinmux_config_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
@@ -5318,6 +5328,7 @@ const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 	.cfg_regs = pinmux_config_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
+	.tdsel_regs = pinmux_tdsel_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 56016cb76769..56e08f2c5cbf 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -176,6 +176,10 @@ struct pinmux_ioctrl_reg {
 	u32 reg;
 };
 
+struct pinmux_tdsel_reg {
+	u32 reg;
+};
+
 struct pinmux_data_reg {
 	u32 reg;
 	u8 reg_width;
@@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
 	const struct pinmux_drive_reg *drive_regs;
 	const struct pinmux_bias_reg *bias_regs;
 	const struct pinmux_ioctrl_reg *ioctrl_regs;
+	const struct pinmux_tdsel_reg *tdsel_regs;
 	const struct pinmux_data_reg *data_regs;
 
 	const u16 *pinmux_data;
-- 
2.19.2

