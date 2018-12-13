Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ABAC67872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 083DD20811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083DD20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbeLMS1X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:23 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:46002 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbeLMS1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:21 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id BWTH1z0063XaVaC01WTHSt; Thu, 13 Dec 2018 19:27:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhd-0007fZ-1X; Thu, 13 Dec 2018 19:27:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhd-0006oY-0J; Thu, 13 Dec 2018 19:27:17 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 15/15] [RFC] pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging
Date:   Thu, 13 Dec 2018 19:27:14 +0100
Message-Id: <20181213182714.26094-16-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213182714.26094-1-geert+renesas@glider.be>
References: <20181213182714.26094-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Do some basic sanity checks on all built-in pinmux tables (for SuperH
and Renesas ARM) when DEBUG is defined.

For now this is limited to checking config register descriptors:
  - Fixed-width and variable-width field checks,
  - Number of enum_ids must match the number of possible configurations,
  - Suggestions for reducing table sizes: reserved fields of more than 3
    bits can better be split in smaller subfields, as the storage need
    is proportional to the square of the width of the (sub)field).

This helps catching bugs early.

Probably the individual pinctrl Kconfig symbols should start depending
on COMPILE_TEST, instead of always enabling all of them.

Not-yet-signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/Kconfig  |  36 -----------
 drivers/pinctrl/sh-pfc/Makefile |  13 ++++
 drivers/pinctrl/sh-pfc/core.c   | 102 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h |  28 ++++++++-
 4 files changed, 142 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index e941ba60d4b7c775..7ccece42e2fd6d9a 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -22,182 +22,146 @@ config PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_EMEV2
 	def_bool y
-	depends on ARCH_EMEV2
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A73A4
 	def_bool y
-	depends on ARCH_R8A73A4
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7740
 	def_bool y
-	depends on ARCH_R8A7740
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7743
 	def_bool y
-	depends on ARCH_R8A7743
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7744
 	def_bool y
-	depends on ARCH_R8A7744
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7745
         def_bool y
-        depends on ARCH_R8A7745
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77470
         def_bool y
-        depends on ARCH_R8A77470
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774A1
         def_bool y
-        depends on ARCH_R8A774A1
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A774C0
         def_bool y
-        depends on ARCH_R8A774C0
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7778
 	def_bool y
-	depends on ARCH_R8A7778
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7779
 	def_bool y
-	depends on ARCH_R8A7779
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7790
 	def_bool y
-	depends on ARCH_R8A7790
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7791
 	def_bool y
-	depends on ARCH_R8A7791
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7792
 	def_bool y
-	depends on ARCH_R8A7792
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7793
 	def_bool y
-	depends on ARCH_R8A7793
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7794
 	def_bool y
-	depends on ARCH_R8A7794
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7795
 	def_bool y
-	depends on ARCH_R8A7795
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7796
         def_bool y
-        depends on ARCH_R8A7796
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77965
         def_bool y
-        depends on ARCH_R8A77965
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77970
 	def_bool y
-	depends on ARCH_R8A77970
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77980
 	def_bool y
-	depends on ARCH_R8A77980
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77990
         def_bool y
-        depends on ARCH_R8A77990
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77995
         def_bool y
-        depends on ARCH_R8A77995
         select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_SH7203
 	def_bool y
-	depends on CPU_SUBTYPE_SH7203
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7264
 	def_bool y
-	depends on CPU_SUBTYPE_SH7264
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7269
 	def_bool y
-	depends on CPU_SUBTYPE_SH7269
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH73A0
 	def_bool y
-	depends on ARCH_SH73A0
 	select PINCTRL_SH_PFC_GPIO
 	select REGULATOR
 
 config PINCTRL_PFC_SH7720
 	def_bool y
-	depends on CPU_SUBTYPE_SH7720
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7722
 	def_bool y
-	depends on CPU_SUBTYPE_SH7722
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7723
 	def_bool y
-	depends on CPU_SUBTYPE_SH7723
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7724
 	def_bool y
-	depends on CPU_SUBTYPE_SH7724
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7734
 	def_bool y
-	depends on CPU_SUBTYPE_SH7734
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7757
 	def_bool y
-	depends on CPU_SUBTYPE_SH7757
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7785
 	def_bool y
-	depends on CPU_SUBTYPE_SH7785
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SH7786
 	def_bool y
-	depends on CPU_SUBTYPE_SH7786
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_SHX3
 	def_bool y
-	depends on CPU_SUBTYPE_SHX3
 	select PINCTRL_SH_PFC_GPIO
 endif
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 82ebb2a91ee0f998..0cba62ad8accf611 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -38,3 +38,16 @@ obj-$(CONFIG_PINCTRL_PFC_SH7757)	+= pfc-sh7757.o
 obj-$(CONFIG_PINCTRL_PFC_SH7785)	+= pfc-sh7785.o
 obj-$(CONFIG_PINCTRL_PFC_SH7786)	+= pfc-sh7786.o
 obj-$(CONFIG_PINCTRL_PFC_SHX3)		+= pfc-shx3.o
+
+CFLAGS_pfc-sh7203.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7264.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7269.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7720.o	+= -I$(srctree)/arch/sh/include/cpu-sh3
+CFLAGS_pfc-sh7722.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7723.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7724.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7734.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7757.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7785.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7786.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-shx3.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f1cfcc8c65446662..a0616992e8a6b09a 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -571,6 +571,13 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.compatible = "renesas,pfc-r8a7795",
 		.data = &r8a7795_pinmux_info,
 	},
+#ifdef DEBUG
+	{
+		/* Exercise sanity checks (nothing matches against this) */
+		.compatible = "renesas,pfc-r8a77950",	/* R-Car H3 ES1.0 */
+		.data = &r8a7795es1_pinmux_info,
+	},
+#endif /* DEBUG */
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7796
 	{
@@ -709,6 +716,100 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 #define DEV_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
+#ifdef DEBUG
+static bool is0s(const u16 *enum_ids, unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		if (enum_ids[i])
+			return false;
+
+	return true;
+}
+
+static unsigned int sh_pfc_errors;
+static unsigned int sh_pfc_warnings;
+
+static void sh_pfc_validate_cfg_reg(const char *name,
+				    const struct pinmux_cfg_reg *cfg_reg)
+{
+	unsigned int rw, fw, i, n;
+
+	fw = cfg_reg->field_width;
+	if (fw) {
+		rw = cfg_reg->reg_width;
+		if (rw % fw) {
+			pr_err("%s reg 0x%x: reg_width %u is not a multiple of field_width %u\n",
+			       name, cfg_reg->reg, rw, fw);
+			sh_pfc_errors++;
+		}
+		n = rw / fw * (1 << fw);
+	} else {
+		for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]);
+		     i++) {
+			if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw)) {
+				pr_warn("%s reg %x: Reserved field [%u:%u] should be split to reduce table size\n",
+					name, cfg_reg->reg, rw, rw + fw - 1);
+				sh_pfc_warnings++;
+			}
+			n += 1 << fw;
+			rw += fw;
+		}
+
+		if (rw != cfg_reg->reg_width) {
+			pr_err("%s reg 0x%x: var_field_width declares %u instead of %u bits\n",
+			       name, cfg_reg->reg, rw, cfg_reg->reg_width);
+			sh_pfc_errors++;
+		}
+
+	}
+	if (cfg_reg->nr_enum_ids != n) {
+		pr_err("%s reg 0x%x: enum_ids[] contains %u instead of %u values\n",
+		       name, cfg_reg->reg, cfg_reg->nr_enum_ids, n);
+		sh_pfc_errors++;
+	}
+}
+
+static void sh_pfc_validate_info(const char *name,
+				 const struct sh_pfc_soc_info *info)
+{
+	const struct pinmux_cfg_reg *cfg_regs;
+	unsigned int i;
+
+	pr_info("%s: Validating %s/%s (%ps)\n", __func__, name, info->name,
+		info);
+
+	cfg_regs = info->cfg_regs;
+	for (i = 0; cfg_regs && cfg_regs[i].reg; i++)
+		sh_pfc_validate_cfg_reg(info->name, &cfg_regs[i]);
+}
+
+static void sh_pfc_validate_driver(const struct device_driver *drv)
+{
+	const struct platform_driver *pdrv = to_platform_driver(drv);
+	unsigned int i;
+
+	pr_warn("%s: Checking builtin pinmux tables\n", __func__);
+
+	for (i = 0; pdrv->id_table[i].name[0]; i++)
+		sh_pfc_validate_info(pdrv->id_table[i].name,
+				     (void *)pdrv->id_table[i].driver_data);
+
+#ifdef CONFIG_OF
+	for (i = 0; drv->of_match_table[i].compatible[0]; i++)
+		sh_pfc_validate_info(drv->of_match_table[i].compatible,
+				     drv->of_match_table[i].data);
+#endif
+
+	pr_warn("%s: Detected %u errors and %u warnings\n", __func__,
+		sh_pfc_errors, sh_pfc_warnings);
+}
+
+#else
+static inline void sh_pfc_validate_driver(struct device_driver *driver) {}
+#endif
+
 static int sh_pfc_probe(struct platform_device *pdev)
 {
 #ifdef CONFIG_OF
@@ -718,6 +819,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
 	struct sh_pfc *pfc;
 	int ret;
 
+	sh_pfc_validate_driver(pdev->dev.driver);
 #ifdef CONFIG_OF
 	if (np)
 		info = of_device_get_match_data(&pdev->dev);
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 584d58d954961018..e1310a751175f71b 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -113,6 +113,9 @@ struct pinmux_cfg_reg {
 	u8 reg_width, field_width;
 	const u16 *enum_ids;
 	const u8 *var_field_width;
+#ifdef DEBUG
+	unsigned int nr_enum_ids;
+#endif
 };
 
 #define GROUP(...)	__VA_ARGS__
@@ -128,10 +131,21 @@ struct pinmux_cfg_reg {
  *          combination of the register field bit values, wrapped using the
  *          GROUP() macro.
  */
+#ifdef DEBUG
+
+#define PINMUX_CFG_REG(name, r, r_width, f_width, ids)			\
+	.reg = r, .reg_width = r_width, .field_width = f_width,		\
+	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])	\
+		{ ids }, \
+	.nr_enum_ids = sizeof((const u16 []) { ids }) / sizeof(u16)
+
+#else
+
 #define PINMUX_CFG_REG(name, r, r_width, f_width, ids)			\
 	.reg = r, .reg_width = r_width, .field_width = f_width,		\
 	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])	\
 		{ ids }
+#endif
 
 /*
  * Describe a config register consisting of several fields of different widths
@@ -145,11 +159,23 @@ struct pinmux_cfg_reg {
  *          combination of the register field bit values, wrapped using the
  *          GROUP() macro.
  */
+#ifdef DEBUG
+
+#define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
+	.reg = r, .reg_width = r_width,					\
+	.var_field_width = (const u8 []) { f_widths, 0 },		\
+	.enum_ids = (const u16 []) { ids },				\
+	.nr_enum_ids = sizeof((const u16 []) { ids }) / sizeof(u16)
+
+#else
+
 #define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
 	.reg = r, .reg_width = r_width,					\
 	.var_field_width = (const u8 []) { f_widths, 0 },		\
 	.enum_ids = (const u16 []) { ids }
 
+#endif
+
 struct pinmux_drive_reg_field {
 	u16 pin;
 	u8 offset;
@@ -265,7 +291,7 @@ struct sh_pfc_soc_info {
 	const struct sh_pfc_function *functions;
 	unsigned int nr_functions;
 
-#ifdef CONFIG_SUPERH
+#if 1 //def CONFIG_SUPERH
 	const struct pinmux_func *func_gpios;
 	unsigned int nr_func_gpios;
 #endif
-- 
2.17.1

