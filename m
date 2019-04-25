Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1176DC282E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBD19206BA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbfDYJ7x (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:59:53 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37474 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbfDYJ7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:59:52 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 4Zzo200033XaVaC01Zzobu; Thu, 25 Apr 2019 11:59:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0003XZ-UM; Thu, 25 Apr 2019 11:59:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0000LA-TV; Thu, 25 Apr 2019 11:59:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] pinctrl: sh-pfc: Rename 2-parameter CPU_ALL_PORT() variant
Date:   Thu, 25 Apr 2019 11:59:44 +0200
Message-Id: <20190425095946.1259-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095946.1259-1-geert+renesas@glider.be>
References: <20190425095946.1259-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are two variants of the CPU_ALL_PORT() macro in use:
  1. A three-parameter variant, to be provided for SoCs with a linear
     GPIO pin space ("PORT style"),
  2. A two-parameter variant, to be provided for SoCs with 32-port GPIO
     banks ("GP port style").

Rename the 2-parameter variant to CPU_ALL_GP(), to avoid confusion, and
to increase naming consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      | 2 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h          | 6 +++---
 17 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index c05dc14904861285..b3b116da1bb0dd35 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -10,7 +10,7 @@
 
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_4(0, fn, sfx),						\
 	PORT_GP_1(0, 4, fn, sfx),					\
 	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
index 49fe52d35f30eebf..bed067b3019892fd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
@@ -38,7 +38,7 @@
 	PORT_GP_PUP_1(bank, 24, fn, sfx), PORT_GP_PUP_1(bank, 25, fn, sfx),	\
 	PORT_GP_PUP_1(bank, 26, fn, sfx)
 
-#define CPU_ALL_PORT(fn, sfx)		\
+#define CPU_ALL_GP(fn, sfx)		\
 	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
index 0c121b28ec3fe6ff..3e47cdc1411d507f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
@@ -11,7 +11,7 @@
 
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_32(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index c41a6761cf9d4352..80d33c7398df4388 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -20,7 +20,7 @@
  * All pins assigned to GPIO bank 3 can be used for SD interfaces in
  * which case they support both 3.3V and 1.8V signalling.
  */
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_30(1, fn, sfx),						\
 	PORT_GP_30(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 1292ec8d268fc41f..bc9caf812fc1b3a3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -15,7 +15,7 @@
  * Pins 0-23 assigned to GPIO bank 6 can be used for SD interfaces in
  * which case they support both 3.3V and 1.8V signalling.
  */
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_26(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index bbace1478613f93c..258f82fb31c0ec10 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -11,7 +11,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_29(0, fn, sfx),						\
 	PORT_GP_23(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 1ff4969d8381fff4..34481b6c43280708 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -14,7 +14,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_26(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index f16dfbad3f17988c..93fb950753c2310f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -15,7 +15,7 @@
 		   SH_PFC_PIN_CFG_PULL_UP | \
 		   SH_PFC_PIN_CFG_PULL_DOWN)
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 68bcb8980b1675d3..28ad4bfdc74a9a9b 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -16,7 +16,7 @@
 		   SH_PFC_PIN_CFG_PULL_UP | \
 		   SH_PFC_PIN_CFG_PULL_DOWN)
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 38cce690db704443..41a12118d4b2b581 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -21,7 +21,7 @@
 		   SH_PFC_PIN_CFG_PULL_UP | \
 		   SH_PFC_PIN_CFG_PULL_DOWN)
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 090024355eba4307..0e9d5008dda66417 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -22,7 +22,7 @@
 		   SH_PFC_PIN_CFG_PULL_UP | \
 		   SH_PFC_PIN_CFG_PULL_DOWN)
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_29(1, fn, sfx, CFG_FLAGS),	\
 	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 2d76b548b9421378..8473a83bd4ca6570 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -19,7 +19,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
 	PORT_GP_28(1, fn, sfx),						\
 	PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),		\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 473da65890a7086c..9d7eb6aca0f4bb1e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -19,7 +19,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)	\
+#define CPU_ALL_GP(fn, sfx)	\
 	PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
 	PORT_GP_28(1, fn, sfx),	\
 	PORT_GP_CFG_30(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 91a837b02a366122..2ffa8a2cbd9f14be 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -20,7 +20,7 @@
 #define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP | \
 		   SH_PFC_PIN_CFG_PULL_DOWN)
 
-#define CPU_ALL_PORT(fn, sfx) \
+#define CPU_ALL_GP(fn, sfx) \
 	PORT_GP_CFG_18(0, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_23(1, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_26(2, fn, sfx, CFG_FLAGS), \
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index dd87085d48cb8798..c10b756476b142e6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -17,7 +17,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)			\
+#define CPU_ALL_GP(fn, sfx)			\
 		PORT_GP_9(0,  fn, sfx),		\
 		PORT_GP_32(1, fn, sfx),		\
 		PORT_GP_32(2, fn, sfx),		\
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
index fac7b4699121efde..5dfd991ffdaab6e9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
@@ -11,7 +11,7 @@
 
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)						\
+#define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_32(0, fn, sfx),						\
 	PORT_GP_32(1, fn, sfx),						\
 	PORT_GP_32(2, fn, sfx),						\
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 7db5819eea7e6e0d..9e6a83b4996e6333 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -584,7 +584,7 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 
 /* GP_ALL(suffix) - Expand to a list of GP_#_#_suffix */
 #define _GP_ALL(bank, pin, name, sfx, cfg)	name##_##sfx
-#define GP_ALL(str)			CPU_ALL_PORT(_GP_ALL, str)
+#define GP_ALL(str)			CPU_ALL_GP(_GP_ALL, str)
 
 /* PINMUX_GPIO_GP_ALL - Expand to a list of sh_pfc_pin entries */
 #define _GP_GPIO(bank, _pin, _name, sfx, cfg)				\
@@ -594,11 +594,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 		.enum_id = _name##_DATA,				\
 		.configs = cfg,						\
 	}
-#define PINMUX_GPIO_GP_ALL()		CPU_ALL_PORT(_GP_GPIO, unused)
+#define PINMUX_GPIO_GP_ALL()		CPU_ALL_GP(_GP_GPIO, unused)
 
 /* PINMUX_DATA_GP_ALL -  Expand to a list of name_DATA, name_FN marks */
 #define _GP_DATA(bank, pin, name, sfx, cfg)	PINMUX_DATA(name##_DATA, name##_FN)
-#define PINMUX_DATA_GP_ALL()		CPU_ALL_PORT(_GP_DATA, unused)
+#define PINMUX_DATA_GP_ALL()		CPU_ALL_GP(_GP_DATA, unused)
 
 /*
  * PORT style (linear pin space)
-- 
2.17.1

