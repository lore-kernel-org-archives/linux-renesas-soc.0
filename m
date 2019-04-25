Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BD9C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77F33218D3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfDYJ7u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:59:50 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:58892 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbfDYJ7u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:59:50 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 4Zzo200093XaVaC06Zzoro; Thu, 25 Apr 2019 11:59:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0003Xb-V7; Thu, 25 Apr 2019 11:59:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0000LD-U8; Thu, 25 Apr 2019 11:59:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] pinctrl: sh-pfc: Add SH_PFC_PIN_CFG_PULL_UP_DOWN shorthand
Date:   Thu, 25 Apr 2019 11:59:45 +0200
Message-Id: <20190425095946.1259-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095946.1259-1-geert+renesas@glider.be>
References: <20190425095946.1259-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is very common for a pin to support both pull-up and pull-down
functionality.  Hence add a shorthand SH_PFC_PIN_CFG_PULL_UP_DOWN.
This not only reduces typing, but also avoids the need for several line
breaks, and makes many overly long lines shorter, improving
readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 12 +++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 12 +++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 12 +++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 12 +++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    |  3 +--
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c         |  3 +--
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  2 ++
 10 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a73a4.c b/drivers/pinctrl/sh-pfc/pfc-r8a73a4.c
index bf12849defdb74a5..b21f5afe610fb430 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a73a4.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a73a4.c
@@ -1252,7 +1252,7 @@ static const u16 pinmux_data[] = {
 
 #define __O	(SH_PFC_PIN_CFG_OUTPUT)
 #define __IO	(SH_PFC_PIN_CFG_INPUT | SH_PFC_PIN_CFG_OUTPUT)
-#define __PUD	(SH_PFC_PIN_CFG_PULL_DOWN | SH_PFC_PIN_CFG_PULL_UP)
+#define __PUD	(SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define R8A73A4_PIN_IO_PU_PD(pin)       SH_PFC_PIN_CFG(pin, __IO | __PUD)
 #define R8A73A4_PIN_O(pin)              SH_PFC_PIN_CFG(pin, __O)
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
index 696a0f6fc1da8ff0..fdf1b0f09f57e693 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
@@ -1515,7 +1515,7 @@ static const u16 pinmux_data[] = {
 #define __IO		(SH_PFC_PIN_CFG_INPUT | SH_PFC_PIN_CFG_OUTPUT)
 #define __PD		(SH_PFC_PIN_CFG_PULL_DOWN)
 #define __PU		(SH_PFC_PIN_CFG_PULL_UP)
-#define __PUD		(SH_PFC_PIN_CFG_PULL_DOWN | SH_PFC_PIN_CFG_PULL_UP)
+#define __PUD		(SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define R8A7740_PIN_I_PD(pin)		SH_PFC_PIN_CFG(pin, __I | __PD)
 #define R8A7740_PIN_I_PU(pin)		SH_PFC_PIN_CFG(pin, __I | __PU)
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 93fb950753c2310f..69f18b640edcc5c0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -11,9 +11,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | \
-		   SH_PFC_PIN_CFG_PULL_UP | \
-		   SH_PFC_PIN_CFG_PULL_DOWN)
+#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
@@ -1497,17 +1495,17 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 28ad4bfdc74a9a9b..6bad4b98157763df 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -12,9 +12,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | \
-		   SH_PFC_PIN_CFG_PULL_UP | \
-		   SH_PFC_PIN_CFG_PULL_DOWN)
+#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
@@ -1557,17 +1555,17 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 41a12118d4b2b581..ad7369f42f5680f6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -17,9 +17,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | \
-		   SH_PFC_PIN_CFG_PULL_UP | \
-		   SH_PFC_PIN_CFG_PULL_DOWN)
+#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
@@ -1561,16 +1559,16 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN2, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 0e9d5008dda66417..4b42dfc0fc9e6722 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -18,9 +18,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | \
-		   SH_PFC_PIN_CFG_PULL_UP | \
-		   SH_PFC_PIN_CFG_PULL_DOWN)
+#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx)						\
 	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
@@ -1566,16 +1564,16 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5, QSPI0_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7, QSPI1_MOSI_IO0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 39, EXTALR, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4, QSPI1_IO2, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5, QSPI1_MISO_IO1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7, DU_DOTCLKIN0, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8, DU_DOTCLKIN1, CFG_FLAGS),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 26, TRST#, SH_PFC_PIN_CFG_PULL_UP_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 29, TDI, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, TMS, CFG_FLAGS),
-	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 27, TCK, SH_PFC_PIN_CFG_PULL_UP_DOWN),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, TDO, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, CFG_FLAGS),
 };
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 2ffa8a2cbd9f14be..4db337a6db9fa3ca 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -17,8 +17,7 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP | \
-		   SH_PFC_PIN_CFG_PULL_DOWN)
+#define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define CPU_ALL_GP(fn, sfx) \
 	PORT_GP_CFG_18(0, fn, sfx, CFG_FLAGS), \
diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index e1276d143117e62e..78c7219de764afa5 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -1147,7 +1147,7 @@ static const u16 pinmux_data[] = {
 #define __IO		(SH_PFC_PIN_CFG_INPUT | SH_PFC_PIN_CFG_OUTPUT)
 #define __PD		(SH_PFC_PIN_CFG_PULL_DOWN)
 #define __PU		(SH_PFC_PIN_CFG_PULL_UP)
-#define __PUD		(SH_PFC_PIN_CFG_PULL_DOWN | SH_PFC_PIN_CFG_PULL_UP)
+#define __PUD		(SH_PFC_PIN_CFG_PULL_UP_DOWN)
 
 #define SH73A0_PIN_I_PD(pin)		SH_PFC_PIN_CFG(pin, __I | __PD)
 #define SH73A0_PIN_I_PU(pin)		SH_PFC_PIN_CFG(pin, __I | __PU)
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index c97d2ba7677c91e9..2824be4eb887d5bb 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -569,8 +569,7 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		return pin->configs &
-			(SH_PFC_PIN_CFG_PULL_UP | SH_PFC_PIN_CFG_PULL_DOWN);
+		return pin->configs & SH_PFC_PIN_CFG_PULL_UP_DOWN;
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		return pin->configs & SH_PFC_PIN_CFG_PULL_UP;
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 9e6a83b4996e6333..9a116cc0ea0c6aee 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -25,6 +25,8 @@ enum {
 #define SH_PFC_PIN_CFG_OUTPUT		(1 << 1)
 #define SH_PFC_PIN_CFG_PULL_UP		(1 << 2)
 #define SH_PFC_PIN_CFG_PULL_DOWN	(1 << 3)
+#define SH_PFC_PIN_CFG_PULL_UP_DOWN	(SH_PFC_PIN_CFG_PULL_UP | \
+					 SH_PFC_PIN_CFG_PULL_DOWN)
 #define SH_PFC_PIN_CFG_IO_VOLTAGE	(1 << 4)
 #define SH_PFC_PIN_CFG_DRIVE_STRENGTH	(1 << 5)
 #define SH_PFC_PIN_CFG_NO_GPIO		(1 << 31)
-- 
2.17.1

