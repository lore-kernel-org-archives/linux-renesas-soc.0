Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:46385 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751731AbcIWI2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 04:28:42 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: Sort Kconfig selections
Date: Fri, 23 Sep 2016 10:28:40 +0200
Message-Id: <1474619320-28888-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort alphabetically all symbols selected by ARCH_RENESAS

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 4a48c9f5f72537cd..b5a3cbe81dd1d1f0 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -33,15 +33,15 @@ config ARCH_RMOBILE
 menuconfig ARCH_RENESAS
 	bool "Renesas ARM SoCs"
 	depends on ARCH_MULTI_V7 && MMU
+	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select ARCH_SHMOBILE
 	select ARCH_SHMOBILE_MULTI
+	select ARM_GIC
+	select GPIOLIB
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
-	select ARM_GIC
-	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select NO_IOPORT_MAP
 	select PINCTRL
-	select GPIOLIB
 	select ZONE_DMA if ARM_LPAE
 
 if ARCH_RENESAS
-- 
1.9.1
