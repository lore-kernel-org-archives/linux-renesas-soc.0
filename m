Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:50522 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387987AbeKOVcY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 16:32:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: shmobile: Restrict SCU support to SoCs that have it
Date: Thu, 15 Nov 2018 10:56:38 +0100
Message-Id: <20181115095639.17206-2-geert+renesas@glider.be>
In-Reply-To: <20181115095639.17206-1-geert+renesas@glider.be>
References: <20181115095639.17206-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently support for the ARM Cortex-A9 Snoop Control Unit is included
unconditionally, while only Renesas multicore Cortex-A9 SoCs have this
kind of SCU.

This decreases kernel image size by ca. 300 bytes on SoCs without such
an SCU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index b100c26a858f9015..32f8297d993ac10e 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -30,7 +30,6 @@ menuconfig ARCH_RENESAS
 	depends on ARCH_MULTI_V7 && MMU
 	select ARM_GIC
 	select GPIOLIB
-	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select NO_IOPORT_MAP
 	select PINCTRL
@@ -43,6 +42,7 @@ if ARCH_RENESAS
 
 config ARCH_EMEV2
 	bool "Emma Mobile EV2"
+	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
 config ARCH_R7S72100
@@ -94,6 +94,7 @@ config ARCH_R8A7778
 
 config ARCH_R8A7779
 	bool "R-Car H1 (R8A77790)"
+	select HAVE_ARM_SCU if SMP
 	select ARCH_RCAR_GEN1
 
 config ARCH_R8A7790
@@ -135,5 +136,6 @@ config ARCH_RZN1
 config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
 	select ARCH_RMOBILE
+	select HAVE_ARM_SCU if SMP
 	select RENESAS_INTC_IRQPIN
 endif
-- 
2.17.1
