Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeLFV75 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:57 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/9] ARM: shmobile: Restrict SCU support to SoCs that have it
Date: Thu,  6 Dec 2018 13:59:27 -0800
Message-Id: <af3a03cded07f4d6637e5b3660b6622cf60af338.1544132474.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Currently support for the ARM Cortex-A9 Snoop Control Unit is included
unconditionally, while only Renesas multicore Cortex-A9 SoCs have this
kind of SCU.

This decreases kernel image size by ca. 300 bytes on SoCs without such
an SCU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index b100c26a858f..32f8297d993a 100644
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
2.11.0
