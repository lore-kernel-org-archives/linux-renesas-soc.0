Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38244 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732953AbeKOVcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 16:32:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: shmobile: Restrict TWD support to SoCs that have it
Date: Thu, 15 Nov 2018 10:56:39 +0100
Message-Id: <20181115095639.17206-3-geert+renesas@glider.be>
In-Reply-To: <20181115095639.17206-1-geert+renesas@glider.be>
References: <20181115095639.17206-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently support for the ARM Timer and Watchdog Unit is included
unconditionally, while only some Renesas multicore Cortex-A9 SoCs have
a TWD.

This decreases kernel image size by ca. 2 KiB on SoCs without a TWD.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 32f8297d993ac10e..a35eb5913dfdf4ba 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -30,7 +30,6 @@ menuconfig ARCH_RENESAS
 	depends on ARCH_MULTI_V7 && MMU
 	select ARM_GIC
 	select GPIOLIB
-	select HAVE_ARM_TWD if SMP
 	select NO_IOPORT_MAP
 	select PINCTRL
 	select SOC_BUS
@@ -95,6 +94,7 @@ config ARCH_R8A7778
 config ARCH_R8A7779
 	bool "R-Car H1 (R8A77790)"
 	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
 	select ARCH_RCAR_GEN1
 
 config ARCH_R8A7790
@@ -137,5 +137,6 @@ config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
 	select ARCH_RMOBILE
 	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
 	select RENESAS_INTC_IRQPIN
 endif
-- 
2.17.1
