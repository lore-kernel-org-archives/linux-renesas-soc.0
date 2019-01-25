Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB6AC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A7A6218F0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:34816 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Ugt61z00e3XaVaC06gt6Mx; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007ZT-KZ; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002FV-JQ; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 08/10] pinctrl: sh-pfc: Introduce PINCTRL_SH_FUNC_GPIO helper symbol
Date:   Fri, 25 Jan 2019 17:53:03 +0100
Message-Id: <20190125165305.8567-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Pinctrl drivers for SuperH platforms use legacy function GPIOs.
Currently this support is compiled in based on the SUPERH platform
dependency, which hinders the introduction of compile-testing support
for the affected pinctrl drivers.

Introduce a new Kconfig symbol PINCTRL_SH_FUNC_GPIO, which is
auto-selected when needed.  This symbol in turn selects
PINCTRL_SH_PFC_GPIO, to reduce the number of per-driver selects.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/pinctrl/sh-pfc/Kconfig  | 30 ++++++++++++++++++------------
 drivers/pinctrl/sh-pfc/gpio.c   |  8 ++++----
 drivers/pinctrl/sh-pfc/sh_pfc.h |  2 +-
 3 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index e941ba60d4b7c775..6a9e4334dbfa7ec0 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -20,6 +20,12 @@ config PINCTRL_SH_PFC_GPIO
 	help
 	  This enables pin control and GPIO drivers for SH/SH Mobile platforms
 
+config PINCTRL_SH_FUNC_GPIO
+	select PINCTRL_SH_PFC_GPIO
+	bool
+	help
+	  This enables legacy function GPIOs for SH platforms
+
 config PINCTRL_PFC_EMEV2
 	def_bool y
 	depends on ARCH_EMEV2
@@ -138,17 +144,17 @@ config PINCTRL_PFC_R8A77995
 config PINCTRL_PFC_SH7203
 	def_bool y
 	depends on CPU_SUBTYPE_SH7203
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7264
 	def_bool y
 	depends on CPU_SUBTYPE_SH7264
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7269
 	def_bool y
 	depends on CPU_SUBTYPE_SH7269
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH73A0
 	def_bool y
@@ -159,45 +165,45 @@ config PINCTRL_PFC_SH73A0
 config PINCTRL_PFC_SH7720
 	def_bool y
 	depends on CPU_SUBTYPE_SH7720
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7722
 	def_bool y
 	depends on CPU_SUBTYPE_SH7722
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7723
 	def_bool y
 	depends on CPU_SUBTYPE_SH7723
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7724
 	def_bool y
 	depends on CPU_SUBTYPE_SH7724
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7734
 	def_bool y
 	depends on CPU_SUBTYPE_SH7734
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7757
 	def_bool y
 	depends on CPU_SUBTYPE_SH7757
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7785
 	def_bool y
 	depends on CPU_SUBTYPE_SH7785
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7786
 	def_bool y
 	depends on CPU_SUBTYPE_SH7786
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SHX3
 	def_bool y
 	depends on CPU_SUBTYPE_SHX3
-	select PINCTRL_SH_PFC_GPIO
+	select PINCTRL_SH_FUNC_GPIO
 endif
diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 4f3a34ee1cd454b8..97c1332c1045739a 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -252,7 +252,7 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
  * Function GPIOs
  */
 
-#ifdef CONFIG_SUPERH
+#ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
 static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 {
 	static bool __print_once;
@@ -292,7 +292,7 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
 
 	return 0;
 }
-#endif
+#endif /* CONFIG_PINCTRL_SH_FUNC_GPIO */
 
 /* -----------------------------------------------------------------------------
  * Register/unregister
@@ -369,7 +369,7 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 	if (IS_ENABLED(CONFIG_OF) && pfc->dev->of_node)
 		return 0;
 
-#ifdef CONFIG_SUPERH
+#ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
 	/*
 	 * Register the GPIO to pin mappings. As pins with GPIO ports
 	 * must come first in the ranges, skip the pins without GPIO
@@ -397,7 +397,7 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 	chip = sh_pfc_add_gpiochip(pfc, gpio_function_setup, NULL);
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
-#endif /* CONFIG_SUPERH */
+#endif /* CONFIG_PINCTRL_SH_FUNC_GPIO */
 
 	return 0;
 }
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 9f5d54b851b14ac9..9ca43e7b2eff155f 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -285,7 +285,7 @@ struct sh_pfc_soc_info {
 	const struct sh_pfc_function *functions;
 	unsigned int nr_functions;
 
-#ifdef CONFIG_SUPERH
+#ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
 	const struct pinmux_func *func_gpios;
 	unsigned int nr_func_gpios;
 #endif
-- 
2.17.1

