Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:47310 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbdGQNX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 09:23:58 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Mon, 17 Jul 2017 15:23:54 +0200
Message-Id: <1500297834-7387-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The migration from ARCH_SHMOBILE_MULTI to ARCH_RENESAS has been
completed in v4.12 by commit 9ed2d4bc5c0c244d ("ARM: dts: renesas:
Switch from ARCH_SHMOBILE_MULTI to ARCH_RENESAS"), so the
ARCH_SHMOBILE_MULTI symbol can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Reference final commit.
---
 arch/arm/mach-shmobile/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index ad7d604ff0013268..280e7312a9e1b300 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -1,9 +1,6 @@
 config ARCH_SHMOBILE
 	bool
 
-config ARCH_SHMOBILE_MULTI
-	bool
-
 config PM_RMOBILE
 	bool
 	select PM
@@ -34,7 +31,6 @@ menuconfig ARCH_RENESAS
 	depends on ARCH_MULTI_V7 && MMU
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select ARCH_SHMOBILE
-	select ARCH_SHMOBILE_MULTI
 	select ARM_GIC
 	select GPIOLIB
 	select HAVE_ARM_SCU if SMP
-- 
2.7.4
