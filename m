Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:11181 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726613AbeIKPfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:35:39 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: Add r8a7744 support
Date: Tue, 11 Sep 2018 11:30:05 +0100
Message-Id: <1536661805-36464-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536661805-36464-1-git-send-email-biju.das@bp.renesas.com>
References: <1536661805-36464-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas RZ/G1N (R8A7744) is pin compatible with R-Car M2-W/N (R8A7791/3)
and RZ/G1M.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/Kconfig       |  5 +++++
 drivers/pinctrl/sh-pfc/Makefile      |  1 +
 drivers/pinctrl/sh-pfc/core.c        |  6 ++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 22 ++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  1 +
 5 files changed, 35 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 6a7254c..5fad61c 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -39,6 +39,11 @@ config PINCTRL_PFC_R8A7743
 	depends on ARCH_R8A7743
 	select PINCTRL_SH_PFC
 
+config PINCTRL_PFC_R8A7744
+	def_bool y
+	depends on ARCH_R8A7744
+	select PINCTRL_SH_PFC
+
 config PINCTRL_PFC_R8A7745
         def_bool y
         depends on ARCH_R8A7745
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 9510a48..b14cf6a 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PINCTRL_PFC_EMEV2)	+= pfc-emev2.o
 obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7743)	+= pfc-r8a7791.o
+obj-$(CONFIG_PINCTRL_PFC_R8A7744)	+= pfc-r8a7791.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7745)	+= pfc-r8a7794.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77470)	+= pfc-r8a77470.o
 obj-$(CONFIG_PINCTRL_PFC_R8A774A1)	+= pfc-r8a7796.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 0122471..74c533a 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -497,6 +497,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a7743_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R8A7744
+	{
+		.compatible = "renesas,pfc-r8a7744",
+		.data = &r8a7744_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7745
 	{
 		.compatible = "renesas,pfc-r8a7745",
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 5811784..0371ef1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -6634,6 +6634,28 @@ const struct sh_pfc_soc_info r8a7743_pinmux_info = {
 };
 #endif
 
+#ifdef CONFIG_PINCTRL_PFC_R8A7744
+const struct sh_pfc_soc_info r8a7744_pinmux_info = {
+	.name = "r8a77440_pfc",
+	.ops = &r8a7791_pinmux_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
+
+	.cfg_regs = pinmux_config_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+#endif
+
 #ifdef CONFIG_PINCTRL_PFC_R8A7791
 const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 	.name = "r8a77910_pfc",
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 1d491d1..353f4af 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -273,6 +273,7 @@ extern const struct sh_pfc_soc_info emev2_pinmux_info;
 extern const struct sh_pfc_soc_info r8a73a4_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7740_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7743_pinmux_info;
+extern const struct sh_pfc_soc_info r8a7744_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7745_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77470_pinmux_info;
 extern const struct sh_pfc_soc_info r8a774a1_pinmux_info;
-- 
2.7.4
