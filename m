Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33573 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753074AbeDSSwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 14:52:31 -0400
Received: by mail-lf0-f66.google.com with SMTP id d79-v6so1677800lfd.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 11:52:30 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3] pinctrl: sh-pfc: r8a77970: fix pin I/O voltage control
 support
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Message-ID: <cdebe21a-21d8-6313-0120-50b3f68e9a40@cogentembedded.com>
Date: Thu, 19 Apr 2018 21:52:28 +0300
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I've included the pin I/O voltage control into the R8A77970 PFC driver but
it was incomplete because:
- SH_PFC_PIN_CFG_IO_VOLTAGE pin flags weren't set properly;
- sh_pfc_soc_info::ioctrl_regs wasn't set at all...

Fixes: b92ac66a1819 ("pinctrl: sh-pfc: Add R8A77970 PFC support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

Changes in version 3:
- removed IOCTRL40 from *enum* ioctrl_regs and its address from
  pinmux_ioctrl_regs[].

Changes in version 2:
- fixed the commit SHA1 in the "Fixes:" tag.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c |   32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -21,13 +21,15 @@
 #include "core.h"
 #include "sh_pfc.h"
 
+#define CFG_FLAGS SH_PFC_PIN_CFG_DRIVE_STRENGTH
+
 #define CPU_ALL_PORT(fn, sfx)						\
-	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_6(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),	\
-	PORT_GP_CFG_15(5, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH)
+	PORT_GP_CFG_22(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
+	PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),				\
+	PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
+	PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
+	PORT_GP_CFG_6(4,  fn, sfx, CFG_FLAGS),				\
+	PORT_GP_CFG_15(5, fn, sfx, CFG_FLAGS)
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
@@ -2382,18 +2384,31 @@ static const struct pinmux_cfg_reg pinmu
 	{ },
 };
 
+enum ioctrl_regs {
+	IOCTRL30,
+	IOCTRL31,
+	IOCTRL32,
+};
+
+static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
+	[IOCTRL30] = { 0xe6060380 },
+	[IOCTRL31] = { 0xe6060384 },
+	[IOCTRL32] = { 0xe6060388 },
+	{ /* sentinel */ },
+};
+
 static int r8a77970_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 				   u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
-	*pocctrl = 0xe6060380;
+	*pocctrl = pinmux_ioctrl_regs[IOCTRL30].reg;
 	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 21))
 		return bit;
 	if (pin >= RCAR_GP_PIN(2, 0) && pin <= RCAR_GP_PIN(2, 9))
 		return bit + 22;
 
-	*pocctrl += 4;
+	*pocctrl = pinmux_ioctrl_regs[IOCTRL31].reg;
 	if (pin >= RCAR_GP_PIN(2, 10) && pin <= RCAR_GP_PIN(2, 16))
 		return bit - 10;
 	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 16))
@@ -2421,6 +2436,7 @@ const struct sh_pfc_soc_info r8a77970_pi
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
