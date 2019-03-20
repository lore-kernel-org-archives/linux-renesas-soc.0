Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9211AC10F10
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C7712146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfCTKV6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:21:58 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:46494 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfCTKVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:21:46 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id qAMj1z00T3XaVaC06AMjmn; Wed, 20 Mar 2019 11:21:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-0005FR-Kc; Wed, 20 Mar 2019 11:21:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-00052Y-JG; Wed, 20 Mar 2019 11:21:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 01/10] pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging
Date:   Wed, 20 Mar 2019 11:21:32 +0100
Message-Id: <20190320102141.19316-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320102141.19316-1-geert+renesas@glider.be>
References: <20190320102141.19316-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Perform some basic sanity checks on all built-in pinmux tables when
DEBUG is defined, to help catching bugs early.

For now the following checks are included:
  - Check register and field widths in descriptors for config registers
    with variable-width fields,
  - Check relations between pin groups and functions:
      - All pin functions must refer to existing pin groups,
      - All pin groups must be referred to by a pin function,
      - Warn if a pin group is referred to by multiple pin functions
	(which is OK for backwards-compatibility aliases),
  - Provide suggestions for reducing table sizes: reserved fields of
    more than 3 bits can better be split in smaller subfields, as the
    storage need is proportional to the square of the width of the
    (sub)field,

Note that a dummy non-matching entry is added to the DT match table for
checking r8a7795es1_pinmux_info, as R-Car H3 ES1.0 is matched using
soc_device_match() in r8a7795_pinmux_init(), instead of by the DT match
table.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3:
  - Add Reviewed-by,
  - Move initialization of func from for-condition to loop body,
  - Replace goto by break and condition check,

v2:
  - Drop RFC state,
  - Drop validation of fixed-with config register fields, as this is now
    done at build time,
  - Check relations between pin groups and functions,
  - Move compile-test support out,
  - Move checks depending on enum ID absorption out,
  - Move call to sh_pfc_check_driver() from sh_pfc_probe() to
    sh_pfc_init(), so the checks are even performed on non-native
    platforms when compile-testing.
---
 drivers/pinctrl/sh-pfc/core.c | 124 ++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f1cfcc8c65446662..2ceed2f5ac08235b 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -571,6 +571,13 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.compatible = "renesas,pfc-r8a7795",
 		.data = &r8a7795_pinmux_info,
 	},
+#ifdef DEBUG
+	{
+		/* For sanity checks only (nothing matches against this) */
+		.compatible = "renesas,pfc-r8a77950",	/* R-Car H3 ES1.0 */
+		.data = &r8a7795es1_pinmux_info,
+	},
+#endif /* DEBUG */
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7796
 	{
@@ -709,6 +716,122 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
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
+static void sh_pfc_check_cfg_reg(const char *drvname,
+				 const struct pinmux_cfg_reg *cfg_reg)
+{
+	unsigned int i, n, rw, fw;
+
+	if (cfg_reg->field_width) {
+		/* Checked at build time */
+		return;
+	}
+
+	for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]); i++) {
+		if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw)) {
+			pr_warn("%s: reg 0x%x: reserved field [%u:%u] can be split to reduce table size\n",
+				drvname, cfg_reg->reg, rw, rw + fw - 1);
+			sh_pfc_warnings++;
+		}
+		n += 1 << fw;
+		rw += fw;
+	}
+
+	if (rw != cfg_reg->reg_width) {
+		pr_err("%s: reg 0x%x: var_field_width declares %u instead of %u bits\n",
+		       drvname, cfg_reg->reg, rw, cfg_reg->reg_width);
+		sh_pfc_errors++;
+	}
+}
+
+static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
+{
+	const struct sh_pfc_function *func;
+	const char *drvname = info->name;
+	unsigned int *refcnts;
+	unsigned int i, j, k;
+
+	pr_info("Checking %s\n", drvname);
+
+	/* Check groups and functions */
+	refcnts = kcalloc(info->nr_groups, sizeof(*refcnts), GFP_KERNEL);
+	if (!refcnts)
+		return;
+
+	for (i = 0; i < info->nr_functions; i++) {
+		func = &info->functions[i];
+		for (j = 0; j < func->nr_groups; j++) {
+			for (k = 0; k < info->nr_groups; k++) {
+				if (!strcmp(func->groups[j],
+					    info->groups[k].name)) {
+					refcnts[k]++;
+					break;
+				}
+			}
+
+			if (k == info->nr_groups) {
+				pr_err("%s: function %s: group %s not found\n",
+				       drvname, func->name, func->groups[j]);
+				sh_pfc_errors++;
+			}
+		}
+	}
+
+	for (i = 0; i < info->nr_groups; i++) {
+		if (!refcnts[i]) {
+			pr_err("%s: orphan group %s\n", drvname,
+			       info->groups[i].name);
+			sh_pfc_errors++;
+		} else if (refcnts[i] > 1) {
+			pr_err("%s: group %s referred by %u functions\n",
+			       drvname, info->groups[i].name, refcnts[i]);
+			sh_pfc_warnings++;
+		}
+	}
+
+	kfree(refcnts);
+
+	/* Check config register descriptions */
+	for (i = 0; info->cfg_regs && info->cfg_regs[i].reg; i++)
+		sh_pfc_check_cfg_reg(drvname, &info->cfg_regs[i]);
+}
+
+static void sh_pfc_check_driver(const struct platform_driver *pdrv)
+{
+	unsigned int i;
+
+	pr_warn("Checking builtin pinmux tables\n");
+
+	for (i = 0; pdrv->id_table[i].name[0]; i++)
+		sh_pfc_check_info((void *)pdrv->id_table[i].driver_data);
+
+#ifdef CONFIG_OF
+	for (i = 0; pdrv->driver.of_match_table[i].compatible[0]; i++)
+		sh_pfc_check_info(pdrv->driver.of_match_table[i].data);
+#endif
+
+	pr_warn("Detected %u errors and %u warnings\n", sh_pfc_errors,
+		sh_pfc_warnings);
+}
+
+#else /* !DEBUG */
+static inline void sh_pfc_check_driver(struct platform_driver *pdrv) {}
+#endif /* !DEBUG */
+
 static int sh_pfc_probe(struct platform_device *pdev)
 {
 #ifdef CONFIG_OF
@@ -840,6 +963,7 @@ static struct platform_driver sh_pfc_driver = {
 
 static int __init sh_pfc_init(void)
 {
+	sh_pfc_check_driver(&sh_pfc_driver);
 	return platform_driver_register(&sh_pfc_driver);
 }
 postcore_initcall(sh_pfc_init);
-- 
2.17.1

