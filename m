Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3EFC282C7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56409218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfAYQxM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:12 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:34830 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729088AbfAYQxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:10 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Ugt61z00o3XaVaC06gt6N0; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007ZZ-Mq; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002Fb-Lr; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/10] pinctrl: sh-pfc: Allow compile-testing of all drivers
Date:   Fri, 25 Jan 2019 17:53:05 +0100
Message-Id: <20190125165305.8567-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable compile-testing of all Renesas SuperH and ARM pin control
drivers, in a similar way as was done before for clock and SoC drivers
in commits 371dd373c6edd557 ("clk: renesas: Allow compile-testing of all
(sub)drivers") and 8be381a131c29c47 ("soc: renesas: Rework Kconfig and
Makefile logic").

The SuperH pin control drivers need specific include files, hence make
sure they are always found when compile-testing.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add proper COMPILE_TEST support, instead of just enabling all
    drivers unconditionally,
  - Drop RFC state.
---
 drivers/pinctrl/sh-pfc/Kconfig  | 174 ++++++++++++++------------------
 drivers/pinctrl/sh-pfc/Makefile |  15 +++
 2 files changed, 90 insertions(+), 99 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 6a9e4334dbfa7ec0..2dd716b016a3f39b 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -3,19 +3,53 @@
 # Renesas SH and SH Mobile PINCTRL drivers
 #
 
-if ARCH_RENESAS || SUPERH
-
 config PINCTRL_SH_PFC
+	bool "Renesas SoC pin control support" if COMPILE_TEST && !(ARCH_RENESAS || SUPERH)
+	default y if ARCH_RENESAS || SUPERH
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-	def_bool y
+	select PINCTRL_PFC_EMEV2 if ARCH_EMEV2
+	select PINCTRL_PFC_R8A73A4 if ARCH_R8A73A4
+	select PINCTRL_PFC_R8A7740 if ARCH_R8A7740
+	select PINCTRL_PFC_R8A7743 if ARCH_R8A7743
+	select PINCTRL_PFC_R8A7744 if ARCH_R8A7744
+	select PINCTRL_PFC_R8A7745 if ARCH_R8A7745
+	select PINCTRL_PFC_R8A77470 if ARCH_R8A77470
+	select PINCTRL_PFC_R8A774A1 if ARCH_R8A774A1
+	select PINCTRL_PFC_R8A774C0 if ARCH_R8A774C0
+	select PINCTRL_PFC_R8A7778 if ARCH_R8A7778
+	select PINCTRL_PFC_R8A7779 if ARCH_R8A7779
+	select PINCTRL_PFC_R8A7790 if ARCH_R8A7790
+	select PINCTRL_PFC_R8A7791 if ARCH_R8A7791
+	select PINCTRL_PFC_R8A7792 if ARCH_R8A7792
+	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
+	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
+	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
+	select PINCTRL_PFC_R8A7796 if ARCH_R8A7796
+	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
+	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
+	select PINCTRL_PFC_R8A77980 if ARCH_R8A77980
+	select PINCTRL_PFC_R8A77990 if ARCH_R8A77990
+	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
+	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
+	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
+	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
+	select PINCTRL_PFC_SH73A0 if ARCH_SH73A0
+	select PINCTRL_PFC_SH7720 if CPU_SUBTYPE_SH7720
+	select PINCTRL_PFC_SH7722 if CPU_SUBTYPE_SH7722
+	select PINCTRL_PFC_SH7723 if CPU_SUBTYPE_SH7723
+	select PINCTRL_PFC_SH7724 if CPU_SUBTYPE_SH7724
+	select PINCTRL_PFC_SH7734 if CPU_SUBTYPE_SH7734
+	select PINCTRL_PFC_SH7757 if CPU_SUBTYPE_SH7757
+	select PINCTRL_PFC_SH7785 if CPU_SUBTYPE_SH7785
+	select PINCTRL_PFC_SH7786 if CPU_SUBTYPE_SH7786
+	select PINCTRL_PFC_SHX3 if CPU_SUBTYPE_SHX3
 	help
-	  This enables pin control drivers for SH and SH Mobile platforms
+	  This enables pin control drivers for Renesas SuperH and ARM platforms
 
 config PINCTRL_SH_PFC_GPIO
 	select GPIOLIB
-	select PINCTRL_SH_PFC
 	bool
 	help
 	  This enables pin control and GPIO drivers for SH/SH Mobile platforms
@@ -27,183 +61,125 @@ config PINCTRL_SH_FUNC_GPIO
 	  This enables legacy function GPIOs for SH platforms
 
 config PINCTRL_PFC_EMEV2
-	def_bool y
-	depends on ARCH_EMEV2
-	select PINCTRL_SH_PFC
+	bool "Emma Mobile AV2 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A73A4
-	def_bool y
-	depends on ARCH_R8A73A4
+	bool "R-Mobile APE6 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7740
-	def_bool y
-	depends on ARCH_R8A7740
+	bool "R-Mobile A1 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
 config PINCTRL_PFC_R8A7743
-	def_bool y
-	depends on ARCH_R8A7743
-	select PINCTRL_SH_PFC
+	bool "RZ/G1M pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7744
-	def_bool y
-	depends on ARCH_R8A7744
-	select PINCTRL_SH_PFC
+	bool "RZ/G1N pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7745
-        def_bool y
-        depends on ARCH_R8A7745
-        select PINCTRL_SH_PFC
+	bool "RZ/G1E pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77470
-        def_bool y
-        depends on ARCH_R8A77470
-        select PINCTRL_SH_PFC
+	bool "RZ/G1C pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A774A1
-        def_bool y
-        depends on ARCH_R8A774A1
-        select PINCTRL_SH_PFC
+	bool "RZ/G2M pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A774C0
-        def_bool y
-        depends on ARCH_R8A774C0
-        select PINCTRL_SH_PFC
+	bool "RZ/G2E pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7778
-	def_bool y
-	depends on ARCH_R8A7778
-	select PINCTRL_SH_PFC
+	bool "R-Car M1A pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7779
-	def_bool y
-	depends on ARCH_R8A7779
-	select PINCTRL_SH_PFC
+	bool "R-Car H1 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7790
-	def_bool y
-	depends on ARCH_R8A7790
-	select PINCTRL_SH_PFC
+	bool "R-Car H2 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7791
-	def_bool y
-	depends on ARCH_R8A7791
-	select PINCTRL_SH_PFC
+	bool "R-Car M2-W pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7792
-	def_bool y
-	depends on ARCH_R8A7792
-	select PINCTRL_SH_PFC
+	bool "R-Car V2H pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7793
-	def_bool y
-	depends on ARCH_R8A7793
-	select PINCTRL_SH_PFC
+	bool "R-Car M2-N pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7794
-	def_bool y
-	depends on ARCH_R8A7794
-	select PINCTRL_SH_PFC
+	bool "R-Car E2 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7795
-	def_bool y
-	depends on ARCH_R8A7795
-	select PINCTRL_SH_PFC
+	bool "R-Car H3 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A7796
-        def_bool y
-        depends on ARCH_R8A7796
-        select PINCTRL_SH_PFC
+	bool "R-Car M3-W pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77965
-        def_bool y
-        depends on ARCH_R8A77965
-        select PINCTRL_SH_PFC
+	bool "R-Car M3-N pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77970
-	def_bool y
-	depends on ARCH_R8A77970
-	select PINCTRL_SH_PFC
+	bool "R-Car V3M pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77980
-	def_bool y
-	depends on ARCH_R8A77980
-	select PINCTRL_SH_PFC
+	bool "R-Car V3H pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77990
-        def_bool y
-        depends on ARCH_R8A77990
-        select PINCTRL_SH_PFC
+	bool "R-Car E3 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_R8A77995
-        def_bool y
-        depends on ARCH_R8A77995
-        select PINCTRL_SH_PFC
+	bool "R-Car D3 pin control support" if COMPILE_TEST
 
 config PINCTRL_PFC_SH7203
-	def_bool y
-	depends on CPU_SUBTYPE_SH7203
+	bool "SH7203 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7264
-	def_bool y
-	depends on CPU_SUBTYPE_SH7264
+	bool "SH7264 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7269
-	def_bool y
-	depends on CPU_SUBTYPE_SH7269
+	bool "SH7269 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH73A0
-	def_bool y
-	depends on ARCH_SH73A0
+	bool "SH-Mobile AG5 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 	select REGULATOR
 
 config PINCTRL_PFC_SH7720
-	def_bool y
-	depends on CPU_SUBTYPE_SH7720
+	bool "SH7720 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7722
-	def_bool y
-	depends on CPU_SUBTYPE_SH7722
+	bool "SH7722 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7723
-	def_bool y
-	depends on CPU_SUBTYPE_SH7723
+	bool "SH-Mobile R2 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7724
-	def_bool y
-	depends on CPU_SUBTYPE_SH7724
+	bool "SH-Mobile R2R pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7734
-	def_bool y
-	depends on CPU_SUBTYPE_SH7734
+	bool "SH7734 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7757
-	def_bool y
-	depends on CPU_SUBTYPE_SH7757
+	bool "SH7757 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7785
-	def_bool y
-	depends on CPU_SUBTYPE_SH7785
+	bool "SH7785 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SH7786
-	def_bool y
-	depends on CPU_SUBTYPE_SH7786
+	bool "SH7786 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_PFC_SHX3
-	def_bool y
-	depends on CPU_SUBTYPE_SHX3
+	bool "SH-X3 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
-endif
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 82ebb2a91ee0f998..8c95abcfcc006371 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -38,3 +38,18 @@ obj-$(CONFIG_PINCTRL_PFC_SH7757)	+= pfc-sh7757.o
 obj-$(CONFIG_PINCTRL_PFC_SH7785)	+= pfc-sh7785.o
 obj-$(CONFIG_PINCTRL_PFC_SH7786)	+= pfc-sh7786.o
 obj-$(CONFIG_PINCTRL_PFC_SHX3)		+= pfc-shx3.o
+
+ifeq ($(CONFIG_COMPILE_TEST),y)
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
+endif
-- 
2.17.1

