Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbeLFWAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 17:00:00 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/9] ARM: shmobile: Restrict TWD support to SoCs that have it
Date: Thu,  6 Dec 2018 13:59:28 -0800
Message-Id: <94cf946b8c19f90c39a0f01f0e2fe2ff32383b35.1544132474.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Currently support for the ARM Timer and Watchdog Unit is included
unconditionally, while only some Renesas multicore Cortex-A9 SoCs have
a TWD.

This decreases kernel image size by ca. 2 KiB on SoCs without a TWD.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 32f8297d993a..a35eb5913dfd 100644
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
2.11.0
