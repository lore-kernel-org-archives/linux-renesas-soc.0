Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43070 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbeDMS3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 14:29:39 -0400
Received: by mail-lf0-f65.google.com with SMTP id v207-v6so13867528lfa.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Apr 2018 11:29:38 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: add pin I/O voltage control
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Message-ID: <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com>
Date: Fri, 13 Apr 2018 21:29:33 +0300
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the pin I/O voltage level control to the R8A77980 PFC driver. 

Loosely based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c |   50 +++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -19,10 +19,10 @@
 #include "sh_pfc.h"
 
 #define CPU_ALL_PORT(fn, sfx)	\
-	PORT_GP_22(0, fn, sfx),	\
+	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
 	PORT_GP_28(1, fn, sfx),	\
-	PORT_GP_30(2, fn, sfx),	\
-	PORT_GP_17(3, fn, sfx),	\
+	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE), \
 	PORT_GP_25(4, fn, sfx),	\
 	PORT_GP_15(5, fn, sfx)
 
@@ -2779,8 +2779,51 @@ static const struct pinmux_cfg_reg pinmu
 	{ },
 };
 
+enum ioctrl_regs {
+	IOCTRL30,
+	IOCTRL31,
+	IOCTRL32,
+};
+
+static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
+	[IOCTRL30] = { 0xe6060380, },
+	[IOCTRL31] = { 0xe6060384, },
+	[IOCTRL32] = { 0xe6060388, },
+	{ /* sentinel */ },
+};
+
+static int r8a77980_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
+				   u32 *pocctrl)
+{
+	int bit = pin & 0x1f;
+
+	*pocctrl = pinmux_ioctrl_regs[IOCTRL30].reg;
+	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 21))
+		return bit;
+	else if (pin >= RCAR_GP_PIN(2, 0) && pin <= RCAR_GP_PIN(2, 9))
+		return bit + 22;
+
+	*pocctrl = pinmux_ioctrl_regs[IOCTRL31].reg;
+	if (pin >= RCAR_GP_PIN(2, 10) && pin <= RCAR_GP_PIN(2, 16))
+		return bit - 10;
+	if ((pin >= RCAR_GP_PIN(2, 17) && pin <= RCAR_GP_PIN(2, 24)) ||
+	    (pin >= RCAR_GP_PIN(3,  0) && pin <= RCAR_GP_PIN(3, 16)))
+		return bit + 7;
+
+	*pocctrl = pinmux_ioctrl_regs[IOCTRL32].reg;
+	if (pin >= RCAR_GP_PIN(2, 25) && pin <= RCAR_GP_PIN(2, 29))
+		return pin - 25;
+
+	return -EINVAL;
+}
+
+static const struct sh_pfc_soc_operations pinmux_ops = {
+	.pin_to_pocctrl = r8a77980_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a77980_pinmux_info = {
 	.name = "r8a77980_pfc",
+	.ops = &pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -2793,6 +2836,7 @@ const struct sh_pfc_soc_info r8a77980_pi
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
